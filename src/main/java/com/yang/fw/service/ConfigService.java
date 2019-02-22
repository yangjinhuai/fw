package com.yang.fw.service;



import com.yang.fw.bean.Config;
import com.yang.fw.bean.Rule;
import com.yang.fw.utils.IpUtils;
import com.yang.fw.utils.SocketHelper;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.yang.fw.utils.IpUtils.htonlip;

/**
 * @Description:防火墙配置
 * @Auther: HO1050
 * @Date: 2019/2/15 06:24
 */
@Service
public class ConfigService {
    private String send = null;
    private SocketHelper socketHelper = null;
    private String recvMsg = null;


    /**
     * 获取配置信息
     * @return
     */
    public Config getConfigs(){

        send = "../user/fw -Z";
        Config cf=null;
        recvMsg= IpUtils.sendAndRecvMsg(socketHelper,send);
        //System.out.println(recvMsg);
        if(recvMsg.indexOf("TRUE")!=-1&&recvMsg.length()>4){
            cf=new Config();
            recvMsg=recvMsg.substring(0,recvMsg.length()-5);
            String[] s=recvMsg.split("#");

            cf.setDefaultAction(s[0].substring(s[0].indexOf('=')));
            cf.setRulesFile(s[1].substring(10));
            cf.setLogfile(s[2].substring(8));
            cf.setHitNumber(s[3].substring(10));
            cf.setInvalid(s[4].substring(8));
            cf.setLogpause(s[5].substring(9));
        }

        return cf;
    }

    /**
     * 发送与接收配置消息
     * @param socketHelper
     * @param
     * @param
     * @param send
     * @return 成功返回0，失败返回-1
     */
    private int sendRuleMsg(SocketHelper socketHelper,String send) {
        int ret=-1;
        recvMsg= IpUtils.sendAndRecvMsg(socketHelper,send);

        if("TRUE".equals(recvMsg))
            ret=0;
        else if("FALSE".equals(recvMsg))
            ret=-1;

        return ret;
    }

    /**
     * 日志开关
     * @param value 0：开启，1：关闭
     * @return  成功返回0，失败返回-1
     */
    public int logPauseSwitch(Integer value){

        if(value==0) {
            send="echo \"0\">/proc/net/fw/logpause";
        } else {
            send="echo \"1\">/proc/net/fw/logpause";
        }

        return sendRuleMsg(socketHelper,send);
    }

    /**
     * 防火墙开关
     * @param value 0：开启，1：关闭
     * @return  成功返回0，失败返回-1
     */
    public int invalidSwitch(Integer value){
        if(value==0) {
            send="echo \"0\">/proc/net/fw/invalid";
        } else {
            send="echo \"1\">/proc/net/fw/invalid";
        }

        return sendRuleMsg(socketHelper,send);
    }


    /**
     * 默认动作
     * @param value 0：DROP，1：ACCEPT
     * @return  成功返回0，失败返回-1
     */
    public int defaultActionSwitch(Integer value){

        if(value==0) {
            send="echo \"DROP\">/proc/net/fw/defaultaction";
        } else {
            send="echo \"ACCEPT\">/proc/net/fw/defaultaction";
        }

        return sendRuleMsg(socketHelper,send);
    }

}
