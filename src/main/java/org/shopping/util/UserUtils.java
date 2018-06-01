package org.shopping.util;


import org.shopping.entity.User;

import javax.servlet.http.HttpSession;

public class UserUtils {
    private final static String USER_SESSION_KEY = "key_user";

    public final static String ROLE_CLIENT = "client";
    public final static String ROLE_ADMINISTRATEUR = "administrateur";

    public static void saveUserSession(User user, HttpSession session){
        session.setAttribute(USER_SESSION_KEY, user);
    }

    public static User getUserSession(HttpSession session){
        Object sValue = session.getAttribute(USER_SESSION_KEY);
        return sValue == null ? null : (User)sValue;
    }

}
