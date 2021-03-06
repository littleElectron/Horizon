package cn.edu.zhk.jsj144.liao.ctrl.category.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhk.jsj144.liao.entity.category.product.Category;
import cn.edu.zhk.jsj144.liao.service.category.product.CategoryService;

public class EditChildCategoryCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public EditChildCategoryCtrl() {
		super();
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

		CategoryService categoryService = new CategoryService();
		Category child = new Category();
		child.setCid(request.getParameter("id"));
		child.setCname(request.getParameter("caName"));
		child.setDesc(request.getParameter("desc"));
		Category parent = new Category();
		parent.setCid(request.getParameter("pid"));
		child.setParent(parent);
		categoryService.edit(child);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
