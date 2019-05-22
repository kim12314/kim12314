package net.member.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberNILoginAction implements Action{	
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		MemberDAO memberdao = new MemberDAO();
		MemberBean memberbean = new MemberBean();
		request.setCharacterEncoding("utf-8");
		
		String token = "AAAAOEYFoktWBb58BB4MUENkoHrDbvPwSl3-yfq6WedDE4HIxRfW8GCDhFDTkVdi0mPCR0u9nPecw8TcCJB0Ci97WJE";// 네이버 로그인 접근 토큰; 여기에 복사한 토큰값을 넣어줍니다.
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer responses = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                responses.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
        } catch (Exception e) {
            System.out.println(e);
        }
		
		System.out.println("hi");
		session.setAttribute("id", memberbean.getMember_id());
		ActionForward forward= new ActionForward();
		forward.setRedirect(true);
	   	forward.setPath("main.po");
	   	memberdao.connClose();
		return forward;		
	 }
}
