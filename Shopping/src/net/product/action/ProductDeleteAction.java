package net.product.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.Action;
import net.action.ActionForward;
import net.product.db.ProductDAO;

/**
 * Servlet implementation class ProductDeleteAction
 */
@WebServlet("/ProductDeleteAction")
public class ProductDeleteAction extends HttpServlet implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductDAO productdao = new ProductDAO();
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		String code = request.getParameter("code");
		String[] fcode = code.split(",");
		
		for(int i =0;i<fcode.length;i++) {
			
			System.out.println(fcode[i]);
		}
		
		int[] scode = new int[fcode.length];

		for(int i =0;i<fcode.length;i++) {
			scode[i] = Integer.parseInt(fcode[i]);
		}
		
		if(!productdao.deleteProduct(scode)) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('Deletion is not work Please try again')");
			out.print("<script>");
			out.close();
		}
		
		forward.setResult(true);
		forward.setPath("ProductListAction.po");
		productdao.conClose();
		return forward; 
		
	}
}
