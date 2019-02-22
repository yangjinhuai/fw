package com.yang.fw.bean;

/**
 * @Description:防火墙配置信息
 * @Auther: HO1050
 * @Date: 2019/2/15 06:04
 */
public class Config {
    private String defaultAction;       /*默认动作*/
    private String rulesFile;           /*规则文件路径*/
    private String logfile;             /*日志路径*/
    private String hitNumber;          /*规则命中数*/
    private String invalid;             /*防火墙是否有效，0为有效*/
    private String logpause;            /*日志是否开启，0为开启*/

    public Config() {
    }

    public Config(String defaultAction, String rulesFile, String logfile,String hitNumber, String invalid, String logpause) {
        this.defaultAction = defaultAction;
        this.rulesFile = rulesFile;
        this.logfile = logfile;
        this.hitNumber = hitNumber;
        this.invalid = invalid;
        this.logpause = logpause;
    }

    public String getDefaultAction() {
        return defaultAction;
    }

    public void setDefaultAction(String defaultAction) {
        this.defaultAction = defaultAction;
    }

    public String getRulesFile() {
        return rulesFile;
    }

    public void setRulesFile(String rulesFile) {
        this.rulesFile = rulesFile;
    }

    public String getLogfile() {
        return logfile;
    }

    public void setLogfile(String logfile) {
        this.logfile = logfile;
    }

    public String getHitNumber() {
        return hitNumber;
    }

    public void setHitNumber(String hitNumber) {
        this.hitNumber = hitNumber;
    }

    public String getInvalid() {
        return invalid;
    }

    public void setInvalid(String invalid) {
        this.invalid = invalid;
    }

    public String getLogpause() {
        return logpause;
    }

    public void setLogpause(String logpause) {
        this.logpause = logpause;
    }

    @Override
    public String toString() {
        return "Config{" +
                "defaultAction='" + defaultAction + '\'' +
                ", rulesFile='" + rulesFile + '\'' +
                ", logfile='" + logfile + '\'' +
                ", hitNumber=" + hitNumber +
                ", invalid='" + invalid + '\'' +
                ", logpause='" + logpause + '\'' +
                '}';
    }
}