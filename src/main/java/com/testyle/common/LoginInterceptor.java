package com.testyle.common;

import com.alibaba.fastjson.JSON;
import com.testyle.model.Report;
import org.springframework.http.HttpHeaders;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        response.setCharacterEncoding("UTF-8");
        Object user = request.getSession().getAttribute("userID");
//        if (user == null) {
//            System.out.println("尚未登录，调到登录页面");
//            ResContent resContent=new ResContent();
//            resContent.setCode(5004);
//            resContent.setMessage("尚未登录，返回登录页面");
//            response.getWriter().write(JSON.toJSONString(resContent));
//            response.getWriter().close();
//            return false;
//        }
        return true;
    }
}
