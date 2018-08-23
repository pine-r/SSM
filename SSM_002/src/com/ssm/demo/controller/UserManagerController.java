package com.ssm.demo.controller;

import java.io.PrintWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.jasper.tagplugins.jstl.core.Redirect;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssm.demo.pojo.User;
import com.ssm.demo.service.UserManagerService;
import com.ssm.demo.vo.Page;

/**
 * @Controller注解用于定义本类是个控制器类
 * @author hwadee
 *
 */
@Controller
public class UserManagerController {

	@Resource
	private UserManagerService userManagerService;

	/**
	 * 根据帐号，密码查询用户是否可以登录
	 * @param username
	 * @param password
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/UserLogin.do")
	public String UserLogin(String account, String password, HttpServletRequest request, Model mode) throws Exception {

		User user = null;
		if (account != null && !"".equals(account) && password != null && !"".equals(password)
				&& (user = userManagerService.UserLogin(account, password)) != null) {
			request.getSession().setAttribute("currentUser", user);
			return "UserQuery";
		}
		return "UserLogin";
	}

	/**
	 * 用户查询，根据输入条件查询用户详细
	 * @param user
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/UserQuery")
	public String UserQuery(User user, Page<User> page, Model model) throws Exception {
		if(page.getCurrentPage()==null||page.getCurrentPage()==0){
			page.setCurrentPage(1);
			page.setPageRowNum(2);
		}
		
		page = userManagerService.QueryUser(user,page);
		
		model.addAttribute("userPage", page);
		return "UserQuery";
	}
	
	/**
	 * 用户查询，根据输入条件查询用户详细，ajax调用模式
	 * @param user
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/UserQuery_Ajax")
	public Page<User> UserQuery_Ajax(User user, Page<User> page) throws Exception {
		if(page.getCurrentPage()==null||page.getCurrentPage()==0){
			page.setCurrentPage(1);
			page.setPageRowNum(2);
		}
		
		page = userManagerService.QueryUser(user,page);
		System.out.println(page);
		return page;
	}
	
	@RequestMapping("/UserQuery_Ajax2")
	public void UserQuery_Ajax2(User user, Page<User> page,HttpServletResponse response, Writer out) throws Exception {
		if(page.getCurrentPage()==null||page.getCurrentPage()==0){
			page.setCurrentPage(1);
			page.setPageRowNum(2);
		}
		
		page = userManagerService.QueryUser(user,page);
		System.out.println(page);
		
		ObjectMapper mapper = new ObjectMapper();
		String Json =  mapper.writeValueAsString(page); 
		System.out.println(Json);
		
		//out.write(Json);
		
		PrintWriter out2 = response.getWriter();
		out2.write(Json);
		
	}

	/**
	 * 显示修改用户信息页面
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/UserInfoUpdatePage")
	public String ShowUpdateUser(int userid, Model model) throws Exception{
		User user = userManagerService.QueryUserById(userid);
		model.addAttribute("user", user);
		return "UserInfoUpdate";
	}
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/UserInfoUpdate")
	public String UserInfoUpdate(User user, @RequestParam(required = false) CommonsMultipartFile file,
			HttpServletRequest request, Model model) throws Exception{
		
//		if (file.getSize() > 0) {
//			String path = request.getSession().getServletContext().getRealPath("upload\\head\\");
//			System.out.println(path);
//			String filePath = FileUtil.uploadFile(file, path);
//			user.getUserDetaile().setHead_img(filePath);		
//		}
//		
//		userManagerService.UpdateUserInfo(user);
		return "redirect:UserQuery.do";
	}
	
	/**
	 * 页面跳转
	 * @return
	 */
	@RequestMapping("/UserLoginPage.do")
	public String UserLoginPage() {
		return "UserLogin";
	}
	
	/**
	 * 页面跳转
	 * @return
	 */	
	@RequestMapping("/UserRegPage.do")
	public String UserRegPage() {
		return "UserReg";
	}

	/**
	 * desc：controller内部重定向，redirect:加上同一个controller中的requestMapping的值
	 * @return
	 */
	@RequestMapping("/redirectToForm.do")
	public String redirectToForm() {
		return "redirect:UserLoginPage.do";
	}

	/**
	 * desc：controller之间的重定向：必须要指定好controller的命名空间再指定requestMapping的值，
	 * redirect：后必须要加/,是从根目录开始
	 * @return
	 */
	@RequestMapping("/redirectToForm1.do")
	public String redirectToForm1(RedirectAttributes rab) {
		//重定向：
		return "redirect:/test/toForm.do";
		//转发:
//        return "forward:index";
	}

	@RequestMapping("/index.do")
	public String index(){
		
		return "index";
	}
	
	
	/**
	 * 注册一个时间格式转换方法，当请求的url参数中有时间时，可以自动转换时间格式
	 * 
	 * @param binder
	 */
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}

}
