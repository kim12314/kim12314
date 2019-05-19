 package net.news.action;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.news.db.NewsDAO;

 public class NewsListAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session  =request.getSession();
		NewsDAO newsdao=new NewsDAO();//DB ����
		request.setCharacterEncoding("utf-8");
		
		List newslist=new ArrayList();
		
		String id = (String)session.getAttribute("id");
		
		if(id ==null) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('There is no data please try again')");
			out.print("</script>");
			ActionForward forward= new ActionForward();
			forward.setRedirect(false);
	   		forward.setPath("./Sagyou/loginForm.jsp");
	   		return forward;
		}
		
	  	int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount=newsdao.getListCount(); 
		newslist = newsdao.getNewsList(page,limit);
		
		
   		int maxpage=(int)((double)listcount/limit+0.95); 
   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		
   		int endpage = maxpage;
   		
   		if (endpage>startpage+10-1) endpage=startpage+10-1;
   		
   		request.setAttribute("page", page);		  
   		request.setAttribute("maxpage", maxpage); 
   		request.setAttribute("startpage", startpage); 
   		request.setAttribute("endpage", endpage);     
		request.setAttribute("listcount",listcount); 
		request.setAttribute("newslist", newslist);
		
		ActionForward forward= new ActionForward();
	   	forward.setRedirect(false);
   		forward.setPath("./news/news_list.jsp");
   		newsdao.conClose();
   		return forward;
	 }
 }