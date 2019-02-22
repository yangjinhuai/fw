package com.yang.fw.service;

import com.yang.fw.bean.Rule;
import com.yang.fw.utils.IpUtils;
import com.yang.fw.utils.SocketHelper;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.yang.fw.utils.IpUtils.htonlip;
import static com.yang.fw.utils.PortUtils.htonlport;

/**
 * @Description:防火墙规则
 * @Auther: HO1050
 * @Date: 2019/2/15 06:24
 */
@Service
public class RuleService {


    private String send = null;

    private SocketHelper socketHelper = null;
    private String recvMsg = null;

    /**
     * 执行规则命令
     * @param cmd
     * @return 成功返回0，失败返回-1
     */
    public int executeRuleCommands(String cmd){

        recvMsg= IpUtils.sendAndRecvMsg(socketHelper,cmd);

        if(recvMsg!=null&&"TRUE".equals(recvMsg))
            return 0;
        else if(recvMsg!=null&&"FALSE".equals(recvMsg))
            return -1;
        else
            return -1;
    }
    /**
     * 根据value获取规则
     * @param value 0:输入链，1：输出链，2：转发链
     * @return
     */
    public List<Rule> getRules(Integer value){
        List<Rule> ruleList=new ArrayList<Rule>();
        String v=value.toString();
        send = "../user/fw -L";

        recvMsg= IpUtils.sendAndRecvMsg(socketHelper,send);
        //System.out.println("yyy="+recvMsg);

        if(recvMsg.indexOf("TRUE")!=-1){
            if(recvMsg.length()>4){
                recvMsg=recvMsg.substring(0,recvMsg.length()-5);
                String[] str=recvMsg.split("#");

                for(int i=0;i<str.length;i++){
                    String[] s=str[i].split(" ");
                    if(v.equals(s[0])){
                        Rule rule=new Rule();
                        rule.setChain(getRuleNameByValue(s[0]));
                        rule.setSource(htonlip(Long.valueOf(s[1])));
                        rule.setDest(htonlip(Long.valueOf(s[2])));
                        rule.setSport(htonlport(Long.valueOf(s[3])));
                        rule.setDport(htonlport(Long.valueOf(s[4])));
                        rule.setProtocol(getProtocolNameByValue(s[5]));
                        rule.setAction(getActionNameByValue(s[6]));
                        if(s.length==9)
                            rule.setIfname(s[8]);
                        else
                            rule.setIfname("-");

                        ruleList.add(rule);
                    }
                }
            }

        }


        return ruleList;
    }


    /**
     * 根据vlaue获取链的名称
     * @param value
     * @return
     */
    private String getRuleNameByValue( String value){
        String ruleName=null;

        if("0".equals(value))
            ruleName="INPUT";
        else if("1".equals(value))
            ruleName="OUTPUT";
        else
            ruleName="FORWARD";

        return ruleName;
    }

    /**
     * 根据vlaue获取动作的名称
     * @param value
     * @return
     */
    private String getActionNameByValue( String value){
        String actionName=null;

        if("0".equals(value))
            actionName="DROP";
        else
            actionName="ACCEPT";

        return actionName;
    }


    /**
     * 根据vlaue获取协议的名称
     * @param value
     * @return
     */
    private String getProtocolNameByValue( String value){
        String protocolName=null;

        if("0".equals(value))
            protocolName="-";
        else if("1".equals(value))
            protocolName="icmp";
        else if("2".equals(value))
            protocolName="igmp";
        else if("6".equals(value))
            protocolName="tcp";
        else
            protocolName="udp";

        return protocolName;
    }


}
