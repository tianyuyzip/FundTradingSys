/**
 * 
 */
package edu.fjut.fundsys.config;

/**
 * @author joeyang ong
 *
 */
public class VersionInfo {
	
    //application info
	public final static String APP_NAME="基金管理系统";
    public final static String APP_VERSION="1.0";
    public final static String APP_STATUS="Beta";
    public final static String APP_BUILDATE="2017-6-26";
    public final static String APP_BUILDVER="#2";
    	
    //application author
    public final static String APP_AUTHOR="J2EE C3-208";
    public final static String APP_WORKSTUDIO="福建工程学院";
    
    public final static String buildFooterStr()
    {
    	StringBuffer sb=new StringBuffer();

    	sb.append(APP_NAME);
    	sb.append(" "+"(版本:"+APP_STATUS+APP_VERSION);
    	sb.append(" &nbsp;&nbsp;Build:"+APP_BUILDVER);
    	sb.append(" "+APP_BUILDATE+")");
    	sb.append("&nbsp;&nbsp;&nbsp;&nbsp;开发团队:&nbsp;<a href=\"mailto:tianyu_yzip@yahoo.com\">"+APP_AUTHOR+"</a><br/>");
    	sb.append("(C)&nbsp;"+APP_WORKSTUDIO+"&nbsp;&nbsp;");

    	return sb.toString();	
    }

}
