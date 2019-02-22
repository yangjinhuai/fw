package com.yang.fw.bean;

/**
 * @Description:防火墙规则
 * @Auther: HO1050
 * @Date: 2019/2/15 05:57
 */
public class Rule {
    private String	chain;					/*链*/
    private String	source;					/*源地址*/
    private String	dest;					/*目的地址*/
    private String	sport;					/*源端口*/
    private String	dport;					/*目的端口*/
    private String	protocol;				/*协议类型*/
    private String	action;					/*动作*/
    private String	ifname;				    /*网络接口*/

    public Rule() {
    }

    public Rule(String chain, String source, String dest, String sport, String dport, String protocol, String action, String ifname) {
        this.chain = chain;
        this.source = source;
        this.dest = dest;
        this.sport = sport;
        this.dport = dport;
        this.protocol = protocol;
        this.action = action;
        this.ifname = ifname;
    }

    public String getChain() {
        return chain;
    }

    public void setChain(String chain) {
        this.chain = chain;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getDest() {
        return dest;
    }

    public void setDest(String dest) {
        this.dest = dest;
    }

    public String getSport() {
        return sport;
    }

    public void setSport(String sport) {
        this.sport = sport;
    }

    public String getDport() {
        return dport;
    }

    public void setDport(String dport) {
        this.dport = dport;
    }

    public String getProtocol() {
        return protocol;
    }

    public void setProtocol(String protocol) {
        this.protocol = protocol;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getIfname() {
        return ifname;
    }

    public void setIfname(String ifname) {
        this.ifname = ifname;
    }

    @Override
    public String toString() {
        return "Rule{" +
                "chain='" + chain + '\'' +
                ", source='" + source + '\'' +
                ", dest='" + dest + '\'' +
                ", sport='" + sport + '\'' +
                ", dport='" + dport + '\'' +
                ", protocol='" + protocol + '\'' +
                ", action='" + action + '\'' +
                ", ifname='" + ifname + '\'' +
                '}';
    }
}
