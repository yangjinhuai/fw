package com.yang.fw.utils;

import java.io.IOException;

/**
 * @Description:ip网络字节序与主机字节序转换
 * @Auther: HO1050
 * @Date: 2019/2/15 06:41
 */

public class IpUtils {

    /**
     * 把字符串ip转成网络字节序
     * @param ip
     * @return
     */
    @SuppressWarnings("Duplicates")
    public static Long iphtonl(String ip) {
        if (ip == null || ip.length() == 0)
            return null;
        else if (ip.equals("0"))
            return 0L;
        long ip10 = 0;

        String[] ss = ip.trim().split("\\.");
        if (ss.length != 4)
            return 0L;

        for (int i = 0; i < 4; i++) {
            ip10 |= Long.parseLong(ss[i]) << ((i) * 8);
        }

        return ip10;
    }


    /**
     * 把字符串ip转成主机序
     * @param ip
     * @return
     */
    @SuppressWarnings("Duplicates")
    public static Long iphtonl2(String ip) {
        if (ip == null || ip.length() == 0)
            return null;
        else if (ip.equals("0"))
            return 0L;

        long ip10 = 0;
        String[] ss = ip.trim().split("\\.");

        if (ss.length != 4)
            return 0L;

        ip10 |= Long.parseLong(ss[0]) << 24;
        ip10 |= Long.parseLong(ss[1]) << 16;
        ip10 |= Long.parseLong(ss[2]) << 8;
        ip10 |= Long.parseLong(ss[3]) << 0;

        return ip10;
    }


    /**
     * 把网络字节序的IP转成字符串IP
     * @param ip
     * @return
     */
    public static String htonlip(Long ip) {
        if (ip == null)
            return "";

        return ((ip >> 0) & 0x0ff) + "." + ((ip >> 8) & 0x0ff) + "." + ((ip >> 16) & 0x0ff) + "." + ((ip >> 24) & 0x0ff);
    }


    /**
     * 把主机字节序的ip转换为字符串ip
     * @param ip
     * @return
     */
    public static String htonlip2(Long ip) {
        if (ip == null)
            return "";

        return ((ip >> 24) & 0x0ff) + "." + ((ip >> 16) & 0x0ff) + "." + ((ip >> 8) & 0x0ff) + "." + ((ip >> 0) & 0x0ff);
    }

    /*public static void main(String[] args) {

        System.out.println("字符串IP->主机字节序：" + iphtonl2("1.0.0.0"));

        System.out.println("字符串IP->网络字节序：" + iphtonl("1.0.0.0"));

        System.out.println("网络字节序->字符串IP：" + htonlip(1L));

        System.out.println("主机字节序->字符串IP：" + htonlip(16777216L));

    }*/

    /**
     * 发送消息并返回结果
     * @param send
     * @return
     */
    public static String sendAndRecvMsg(SocketHelper socketHelper,String send) {
        String recvMsg = null;
        try{
            socketHelper = new SocketHelper();
            socketHelper.createConnection();
            socketHelper.sendMessage(send);
            recvMsg = socketHelper.getMessage(1024);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            socketHelper.shutDownConnection();
        }

        return recvMsg;
    }
}

