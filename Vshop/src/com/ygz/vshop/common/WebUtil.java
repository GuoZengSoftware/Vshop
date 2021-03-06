package com.ygz.vshop.common;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Ygz on 3/28/2017.
 */
public class WebUtil {

    public static String getURI(HttpServletRequest request) {
        String uri = request.getRequestURI();
        return uri.substring(uri.lastIndexOf("/") + 1);
    }

    public static String getWebRootPath(HttpServletRequest request) {
        return request.getServletContext().getRealPath("/");
    }

}
