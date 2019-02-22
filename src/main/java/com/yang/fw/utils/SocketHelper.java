package com.yang.fw.utils;

import java.io.*;
import java.net.Socket;

/**
 * @Description:与服务器通信Socke
 * @Auther: HO1050
 * @Date: 2019/2/15 06:53
 */

public class SocketHelper {

    private String ip = null;                       /*服务器ip*/
    private int port = 0;                           /*服务器端口*/
    private Socket socket = null;
    private OutputStream outputStream = null;       /*输出流*/
    private InputStream inputStream = null;         /*输入流*/

    /**
     * 初始化
     * @param
     * @param
     */
    public SocketHelper() {
        this.ip = "192.168.0.106";
        this.port = 9856;
    }

    /**
     * 创建连接
     * @throws Exception
     */
    public void createConnection(){
        try {
            socket = new Socket(ip, port);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 发送消息
     * @param sendMessage
     * @throws Exception
     */
    public synchronized void sendMessage(String sendMessage){

            if (outputStream == null) {
                try {
                    outputStream = socket.getOutputStream();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            byte[] b=sendMessage.getBytes();
        try {
            outputStream.write(b);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 接收消息
     * @return
     * @throws Exception
     */
    public synchronized String getMessage(int readSize) throws IOException {
        String str="";

            if (inputStream == null) {
                try {
                    inputStream = socket.getInputStream();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            byte[] a=new byte[256];

            while(inputStream.read(a)>0)
            {
                String s=new String(a).trim();
                str=str+s;

                if(s.indexOf('*')!=-1)
                   break;

            }
            str=str.substring(0,str.indexOf('*'));

        return str;
    }


    /**
     * 关闭连接
     */
    public void shutDownConnection() {
        try {
            if (outputStream != null) {
                outputStream.close();
            }

            if (inputStream != null) {
                inputStream.close();
            }

            if (socket != null) {
                socket.shutdownInput();
                socket.shutdownOutput();
                socket.close();
            }
        } catch (Exception e) {
        }
    }
    /*
    public static void main(String[] args) throws Exception {
        String ip = "127.0.0.1";
        int port = 8080;
        String send = "待发送的信息";

        SocketHelper socketHelper = null;
        String recvMsg = null;

        try{
            socketHelper = new SocketHelper(ip, port);
            socketHelper.createConnection();
            socketHelper.sendMessage(send);
            recvMsg = socketHelper.getMessage();
        } finally {
            socketHelper.shutDownConnection();
        }
        System.out.println("服务器返回信息：" + recvMsg);
    }*/
}
