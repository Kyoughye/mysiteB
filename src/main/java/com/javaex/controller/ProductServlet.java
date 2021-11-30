package com.javaex.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.output.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javaex.dao.ProductDao;
import com.javaex.dao.ProductDaoImpl;
import com.javaex.dao.QuestionDao;
import com.javaex.dao.QuestionDaoImpl;
import com.javaex.dao.ReviewDao;
import com.javaex.dao.ReviewDaoImpl;
import com.javaex.util.WebUtil;
import com.javaex.vo.ProductVo;
import com.javaex.vo.QuestionVo;
import com.javaex.vo.ReviewVo;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ATTACHES_DIR = "C:/Users/yeji/eclipse-workspace/mysiteB/src/main/webapp/upload";
	private static final int LIMIT_SIZE_BYTES = 5 * 1024 * 1024;
	private static final String CHARSET = "utf-8";
	private static final int LISTCOUNT = 3;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		System.out.println("ProductServlet.doGet() 호출");

		String actionName = request.getParameter("a");

		System.out.println("a -> " + actionName);

		// 등록하기
		if ("insertProduct".equals(actionName)) {
			
			String proName = "";
			String proCateg = "";
			int proStock = 0;
			int proPrice = 0;
			String proDesc = "";
			int proOnSale = 0;
			String proFileName = "";
			String a ="";
			
			response.setContentType("text/html; charset=UTF-8");
			
			File attachesDir = new File(ATTACHES_DIR);
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
			fileItemFactory.setRepository(attachesDir);
			fileItemFactory.setSizeThreshold(LIMIT_SIZE_BYTES);
			ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);

			try {
				List<FileItem> items = fileUpload.parseRequest(request);
				for (FileItem item : items) {
					if (item.isFormField()) {
						System.out.printf("파라미터 명 : %s, 파라미터 값 :  %s \n", item.getFieldName(), item.getString(CHARSET));
						if ("proName".equals(item.getFieldName())) {
							proName = item.getString(CHARSET);
						} else if ("proCateg".equals(item.getFieldName())) {
							proCateg = item.getString(CHARSET);
						    System.out.println(proCateg + "으어어어어ㅓ어어");
						} else if ("proStock".equals(item.getFieldName())) {
							proStock = Integer.parseInt(item.getString(CHARSET));
						} else if ("proPrice".equals(item.getFieldName())) {
							proPrice = Integer.parseInt(item.getString(CHARSET));
						} else if ("proDesc".equals(item.getFieldName())) {
							proDesc = item.getString(CHARSET);
						} else if ("proOnSale".equals(item.getFieldName())) {
							proOnSale = Integer.parseInt(item.getString(CHARSET));
						}
					} else {
						System.out.printf("파라미터 명 : %s, 파일 명 : %s,  파일 크기 : %s bytes \n", item.getFieldName(),
								item.getName(), item.getSize());
						if (item.getSize() > 0) {
							String separator = File.separator;
							int index = item.getName().lastIndexOf(separator);
							proFileName = item.getName().substring(index + 1);
							File uploadFile = new File(ATTACHES_DIR + separator + proFileName);
							if (uploadFile.exists()) {
								int index2 = proFileName.lastIndexOf('.');
								proFileName = proFileName.substring(0, index2) + "(1)"
										+ proFileName.substring(index2, proFileName.length());
								uploadFile = new File(ATTACHES_DIR + separator + proFileName);
								
							}
							item.write(uploadFile);
							a = uploadFile.getName();
							System.out.println(uploadFile.getName() + "로 파일 업로드 완료");

						}
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			ProductVo vo = new ProductVo(proName, proCateg, proStock, proPrice, proDesc, proOnSale, a);

			ProductDao dao = new ProductDaoImpl();
			dao.insert(vo);
			WebUtil.forward(request, response, "/WEB-INF/views/main/index.jsp");

		} else if ("insertform".equals(actionName)) {
			WebUtil.forward(request, response, "/WEB-INF/views/product/insertform.jsp");

		}
		// 조회, 검색
		else if ("productList".equals(actionName)) {
			requestProductList(request);

			WebUtil.forward(request, response, "/WEB-INF/views/product/category.jsp");
		}
		// 삭제
		else if ("deleteProduct".equals(actionName)) {

			int num = Integer.parseInt(request.getParameter("proNo"));

			ProductDao dao = new ProductDaoImpl();
			dao.delete(num);
			WebUtil.forward(request, response, "/WEB-INF/views/includes/index.jsp");
		}
		// 상세보기
		else if ("readProduct".equals(actionName)) {
			int num = Integer.parseInt(request.getParameter("proNo"));

			ProductDao dao = new ProductDaoImpl();
			ProductVo vo = dao.getProduct(num);
			
			// 게시물 화면에 보내기
			request.setAttribute("ProductVo", vo);
			requestReviewList(request);
			WebUtil.forward(request, response, "/WEB-INF/views/product/productReview.jsp");
		}
		// 수정
		else if ("updateProduct".equals(actionName)) {

			String proName = request.getParameter("proName");
			String proCateg = request.getParameter("proCateg");
			int proStock = Integer.parseInt(request.getParameter("proStock"));
			int proPrice = Integer.parseInt(request.getParameter("proPrice"));
			String proDesc = request.getParameter("proDesc");
			int proOnSale = Integer.parseInt(request.getParameter("proOnSale"));
			String proFileName = request.getParameter("proFileName");

			ProductVo vo = new ProductVo(proName, proCateg, proStock, proPrice, proDesc, proOnSale, proFileName);
			ProductDao dao = new ProductDaoImpl();

			dao.update(vo);
			WebUtil.forward(request, response, "/WEB-INF/views/board/read.jsp");

		}

		//리뷰
		else if ("reviewList".equals(actionName)) {
			requestReviewList(request);

			WebUtil.forward(request, response, "/WEB-INF/views/product/productReview.jsp");
		}
		
		//문의 팝업창
		else if ("inquiryBox".equals(actionName)) {
			WebUtil.forward(request, response, "/WEB-INF/views/product/productInquirybox.jsp");
		}
		
		//문의 리스트
		else if ("questionList".equals(actionName)) {
			requestQnaList(request);
			WebUtil.forward(request, response, "/WEB-INF/views/product/productReview.jsp");
		}
	}

	// 관리자인지 확인하기위해 로그인 되어 있는 정보를 가져온다.
//	protected MemberVo getRegMem(HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		MemberVo regMem = (MemberVo) session.getAttribute("regMem");
//
//		return regMem;
//	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public void requestProductList(HttpServletRequest request) {
		ProductDao dao = ProductDaoImpl.getInstance();
		List<ProductVo> productList = new ArrayList<ProductVo>();

		
		int pageNum = 1;
		int limit = LISTCOUNT;
		
		if(request.getParameter("pageNum") != null)
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		String searchForm = request.getParameter("searchForm");
		String kwd = request.getParameter("kwd");
		String orderBy = request.getParameter("orderBy");
		
				
		int total_record = dao.getListCount(searchForm, kwd);
		productList = dao.getList(pageNum, limit, searchForm, kwd, orderBy);
		
		int total_page;
		
		if(total_record % limit == 0) {
			total_page = total_record / limit;
			Math.floor(total_page);
		}
		else {
			total_page = total_record / limit;
			Math.floor(total_page);
			total_page = total_page + 1;
		}

		request.setAttribute("list", productList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("orderBy", orderBy);
		request.setAttribute("kwd", kwd);
		
	}
	public void requestReviewList(HttpServletRequest request) {
		ReviewDao dao = ReviewDaoImpl.getInstance();
		List<ReviewVo> reviewList = new ArrayList<ReviewVo>();

		
		int pageNum = 1;
		int limit = LISTCOUNT;
		
		if(request.getParameter("pageNum") != null)
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		int proNo =Integer.parseInt(request.getParameter("proNo"));
		String orderBy = request.getParameter("revOrder");
				
		int total_record = dao.getListCount(proNo);
		reviewList = dao.getList(pageNum, limit, proNo, orderBy);
		
		int total_page;
		
		if(total_record % limit == 0) {
			total_page = total_record / limit;
			Math.floor(total_page);
		}
		else {
			total_page = total_record / limit;
			Math.floor(total_page);
			total_page = total_page + 1;
		}

		request.setAttribute("revlist", reviewList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("revOrder", orderBy);
		
		
	}
	
	public void requestQnaList(HttpServletRequest request) {
		QuestionDao qdao = QuestionDaoImpl.getInstance();
		List<QuestionVo> questionList = new ArrayList<QuestionVo>();

		
		int pageNum = 1;
		int limit = LISTCOUNT;
		
		if(request.getParameter("pageNum") != null)
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		int proNo =Integer.parseInt(request.getParameter("proNo"));
		
		int total_record = qdao.getListCount(proNo);
		questionList = qdao.getList(pageNum, limit, proNo);
		
		int total_page;
		
		if(total_record % limit == 0) {
			total_page = total_record / limit;
			Math.floor(total_page);
		}
		else {
			total_page = total_record / limit;
			Math.floor(total_page);
			total_page = total_page + 1;
		}

		request.setAttribute("questionList", questionList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		
		
		
	}
}
