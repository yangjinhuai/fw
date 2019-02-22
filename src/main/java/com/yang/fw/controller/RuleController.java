package com.yang.fw.controller;

import com.yang.fw.bean.Rule;
import com.yang.fw.service.RuleService;
import com.yang.fw.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Description:防火墙规则
 * @Auther: HO1050
 * @Date: 2019/2/15 06:14
 */
@Controller
@RequestMapping("/Rule")
public class RuleController {
    @Autowired
    RuleService ruleService;

    /**
     * 查询规则
     * @param pn
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/getRules")
    public Msg getRules(Integer pn){

        List<Rule> ruleList=null;
        ruleList=ruleService.getRules(pn);

        if(ruleList.size()!=0)
            return Msg.success().add("rules",ruleList);
        else
            return Msg.failed();

    }

    /**
     * 执行处理规则的命令
     * @param cmd
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/executeRuleCommands")
    public Msg executeRuleCommands(String cmd){
        System.out.println(cmd);
        if(ruleService.executeRuleCommands(cmd)==0)
            return Msg.success();
        else
            return Msg.failed();
    }

}
