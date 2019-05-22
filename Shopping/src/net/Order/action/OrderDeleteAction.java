package net.Order.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.Action;
import net.action.ActionForward;
import net.Delivery.db.DeliveryDAO;
import net.Order.db.*;

public class OrderDeleteAction implements Action{
   public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
      request.setCharacterEncoding("UTF-8");
      OrderDAO orderdao = new OrderDAO();
      DeliveryDAO deliverydao=new DeliveryDAO();
      
      int num=Integer.parseInt(request.getParameter("num"));
      String id=request.getParameter("id");
      System.out.println(id);
      System.out.println(orderdao.getListOrder(id));
      
      System.out.println("지울값의 번호는"+num);
      
      if(!deliverydao.deleteDelivery(num)) {
         PrintWriter out = response.getWriter();
         out.println("<script>");
         out.println("alert('Deletion is failed try again')");
         out.print("</script>");
         out.close();
         return null;
      }
      System.out.println("Delivery삭제완료");
      
      if(!orderdao.deleteOrder(num)) {
         PrintWriter out = response.getWriter();
         out.println("<script>");
         out.println("alert('Deletion is failed try again')");
         out.print("</script>");
         out.close();
         return null;
   }
      System.out.println("Order삭제완료");
      
      
      
      
      ActionForward forward = new ActionForward();
      forward.setRedirect(false);

      forward.setPath("/OrderListAction.oo");
      orderdao.conClose();
      return forward;
      
   }
}