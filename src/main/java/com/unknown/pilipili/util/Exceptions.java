package com.unknown.pilipili.util;

import java.io.PrintWriter;
import java.io.StringWriter;

public class Exceptions {
    public Exceptions() {
    }

    public static RuntimeException unchecked(Throwable ex) {
        return ex instanceof RuntimeException ? (RuntimeException) ex : new RuntimeException(ex);
    }

    public static String getStackTraceAsString(Throwable ex) {
        StringWriter stringWriter = new StringWriter();
        ex.printStackTrace(new PrintWriter(stringWriter));
        return stringWriter.toString();
    }

    public static String getErrorMessageWithNestedException(Throwable ex) {
        Throwable nestedException = ex.getCause();
        return ex.getMessage() + " nested exception is " + nestedException.getClass().getName() + ":" + nestedException.getMessage();
    }

    public static Throwable getRootCause(Throwable ex) {
        Throwable cause;
        while ((cause = ex.getCause()) != null) {
            ex = cause;
        }

        return ex;
    }

    public static boolean isCausedBy(Exception ex, Class... causeExceptionClasses) {
        for (Object cause = ex; cause != null; cause = ((Throwable) cause).getCause()) {
            Class[] arr$ = causeExceptionClasses;
            int len$ = causeExceptionClasses.length;

            for (int i$ = 0; i$ < len$; ++i$) {
                Class<? extends Exception> causeClass = arr$[i$];
                if (causeClass.isInstance(cause)) {
                    return true;
                }
            }
        }

        return false;
    }
}
