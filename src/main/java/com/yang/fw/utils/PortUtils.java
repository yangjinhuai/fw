package com.yang.fw.utils;

import java.util.Collections;

/**
 * @Description:
 * @Auther: HO1050
 * @Date: 2019/2/17 19:04
 */
public class PortUtils {

    /**
     * 反转字符串
     * @param str
     * @return
     */
    public static String reverse1(String str) {
        return new StringBuilder(str).reverse().toString();
    }
    /**
     * 把网络字节序的端口转成字符串端口
     * @param port
     * @return
     */
    public static String htonlport(Long port) {
        if (port == null)
            return "";

        port=((port>>8)&0x0ffff)+((port<<8)&0x0ffff);


        return port.toString();
    }

}
