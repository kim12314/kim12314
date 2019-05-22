package net.Delivery.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.Delivery.db.*;


public class DeliveryListAction implements Action{
   public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
      request.setCharacterEncoding("UTF-8");
      HttpSession session = request.getSession();
      DeliveryDAO deliverydao = new DeliveryDAO();
      
      String a=request.getParameter("num");
      int num=Integer.parseInt(a);
      
      System.out.println("go??");
      System.out.println(num);
      if(deliverydao.getListDelivery(num) == null) {
         PrintWriter out = response.getWriter();
         out.println("<script>");
         out.println("alert('There is no data please try again')");
         out.print("</script>");
         out.close();
         return null;
      }
      
      session.setAttribute("deliveryListbean", deliverydao.getListDelivery(num));
      
      ActionForward forward = new ActionForward();
      forward.setRedirect(true);
      forward.setPath("../delivery/delivery_List.jsp");
      deliverydao.conClose();
      return forward;
      
   }
}