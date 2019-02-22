package com.yang.fw.controller;

import com.yang.fw.bean.Config;
import com.yang.fw.bean.Rule;
import com.yang.fw.service.ConfigService;
import com.yang.fw.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Description:防火墙配置
 * @Auther: HO1050
 * @Date: 2019/2/15 06:15
 */
@Controller
@RequestMapping("/Config")
public class ConfigController {

    @Autowired
    ConfigService configService;
    /**
     * 查询配置
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/getConfig")
    public Msg getRules(){

        Config cf=null;
        cf=configService.getConfigs();
        if(cf!=null)
            return Msg.success().add("config",cf);
        else
            return Msg.failed();

    }

    /**
     * 设置日志开关
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/logPauseSwitch")
    public Msg logPauseSwitch(Integer pn){
        if(configService.logPauseSwitch(pn)==0)
            return Msg.success();
        else
            return  Msg.failed();

    }

    /**
     * 设置防火墙开关
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/invalidSwitch")
    public Msg  invalidSwitch(Integer pn){
        if(configService.invalidSwitch(pn)==0)
            return Msg.success();
        else
            return  Msg.failed();

    }
    /**
     * 设置默认动作开关
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/defaultActionSwitch")
    public Msg  defaultActionSwitch(Integer pn){
        if(configService.defaultActionSwitch(pn)==0)
            return Msg.success();
        else
            return  Msg.failed();

    }


}
