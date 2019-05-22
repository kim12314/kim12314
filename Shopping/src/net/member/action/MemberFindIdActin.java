package net.member.action;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberFindIdActin implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		MemberDAO memberdao = new MemberDAO();
		
		String name = request.getParameter("name");
		String jumin = request.getParameter("jumin");
		
		String result = memberdao.findId(name, jumin);
		
		if(result == null) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('찾으시는 아이디가 없습니다.')");
			out.println("location.href='findId.jsp'");
			out.println("<script>");
			out.close();
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("foundid.mo?id="+result);
		memberdao.connClose();
		return forward;		
	}
}
