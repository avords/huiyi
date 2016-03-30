package com.mvc.home.web;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.mvc.component.mail.MailConfig;
import com.mvc.component.mail.service.EmailManagerImpl;
import com.mvc.member.model.Member;
import com.mvc.member.model.ValidateCode;
import com.mvc.member.service.MemberManager;
import com.mvc.member.service.ValidateCodeManager;
import com.mvc.security.util.SecurityUtils;

@Controller
@RequestMapping("/home/register")
public class RegisterController {
	
	private static final String BASE_DIR = "home/";

	@Autowired
	private EmailManagerImpl emailManager;

	@Autowired
	private ValidateCodeManager validateCodeManager;

	@Autowired
	private MemberManager memberManager;

	/**
	 * 链接到注册页面
	 */
	@RequestMapping("")
	public String register(HttpServletRequest request, HttpServletResponse response) {
		return BASE_DIR + "register";
	}

	/**
	 * 验证登录邮箱唯一性
	 */
	@RequestMapping("/checkMemberName")
	@ResponseBody
	public boolean checkMemberName(HttpServletRequest request, HttpServletResponse response) {
		boolean result = true;
		String loginName = request.getParameter("loginName");
		result = memberManager.checkMemberName(loginName);
		return result;
	}

	/**
	 * 发送邮箱验证码
	 */
	@RequestMapping("/sendEmail")
	@ResponseBody
	public ModelMap sendEmail(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("loginName");
		ModelMap modelMap = new ModelMap();
		boolean checkFlag = memberManager.checkMemberName(email);
		if (checkFlag==false) {
			modelMap.put("flag", false);
			modelMap.put("message", "邮箱已注册");
		}
		else{
			ValidateCode validateCode = new ValidateCode();
			validateCode.setAccount(email);
			String code = getValidateCode();
			validateCode.setCode(code);
			validateCode.setValidateTime(new Date(System.currentTimeMillis() + 10 * 60 * 1000));
			validateCode.setType(ValidateCode.VALIDATE_TYPE_REGISTER);
			validateCodeManager.clearValidateRecords(email, ValidateCode.VALIDATE_TYPE_REGISTER);
			validateCodeManager.save(validateCode);

			MailConfig mailConifg = new MailConfig();
			mailConifg.setTo(email);
			mailConifg.setSubject("汇医网注册帐户验证码！");
			String emailContent = "您的账户注册验证码：<br/>" + code + "<br/>有效期10分钟";
			mailConifg.setContent(emailContent);
			int flag = emailManager.sendEmail(mailConifg);
			
			if (flag == 0) {
				modelMap.put("message", "注册验证码邮件已发送");
				modelMap.put("flag", true);
			} else {
				modelMap.put("message", "注册验证码邮件发送失败，请联系管理员！");
				modelMap.put("flag", false);
			}
		}
		
		return modelMap;
	}

	private String getValidateCode() {
		String pattern = "000000";
		DecimalFormat df = new DecimalFormat(pattern);
		Random r = new Random();
		return df.format(r.nextInt(1000000));
	}

	/**
	 * 验证验证码
	 */
	@RequestMapping("/checkValidateCode")
	@ResponseBody
	public boolean checkValidateCode(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		String validateCode = request.getParameter("s_randomCode");
		String email = request.getParameter("loginName");
		if (validateCode == null || email == null) {
			return false;
		}
		boolean result = validateCodeManager.checkValidateCode(email, ValidateCode.VALIDATE_TYPE_REGISTER, validateCode);
		return result;
	}

	/**
	 * 注册信息
	 */
	@RequestMapping("/save")
	public String register(HttpServletRequest request, HttpServletResponse response, @Valid Member member,
			BindingResult result) {
		member.setStatus(Member.STATUS_NORMAL);
		memberManager.save(member);
		validateCodeManager.clearValidateRecords(member.getLoginName(), ValidateCode.VALIDATE_TYPE_REGISTER);
		return "redirect:/home/login";
	}
	
	/**
	 * 账户管理暂时放这里
	 */
	@RequestMapping("/member/{objectId}")
	public String member(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId) {
		if (null != objectId) {
			Member member = memberManager.getByObjectId(objectId);
			memberManager.save(member);
			request.setAttribute("member", member);
		}
		return "/home/updateMember";
	}
	
	@RequestMapping("/sendEmailTo")
	@ResponseBody
	public ModelMap sendEmailTo(HttpServletRequest request,HttpServletResponse response) {
			ModelMap modelMap = new ModelMap();
			String email =request.getParameter("email");
			boolean checkFlag = memberManager.checkMemberName(email);
			if (checkFlag==false) {
				modelMap.put("flag", false);
				modelMap.put("message", "邮箱已注册");
			} else {
				MailConfig mailConifg=new MailConfig();
				mailConifg.setTo(email);
				mailConifg.setSubject("亲爱的"+email+"用户，这是您的邮箱验证码!");
				String code=getValidateCode();
				ValidateCode validateCode=new ValidateCode();
				validateCode.setAccount(email);
				validateCode.setCode(code);
				validateCode.setValidateTime(new Date(System.currentTimeMillis()+10*60*1000));
				validateCode.setType(ValidateCode.VALIDATE_TYPE_REGISTER);
				validateCodeManager.save(validateCode);
				//Long validateId=validateCodeManager.getValidateId(validateCode.getValidateTime());
			   	String emailContent = "您的验证码为:"+code+",请妥善保管!";
				mailConifg.setContent(emailContent);
				int flag=emailManager.sendEmail(mailConifg);
				if(flag==0){
					modelMap.put("tempCode", code);
					modelMap.put("flag", true);
					modelMap.put("message", "验证码邮件已发送!");
				}else{
					modelMap.put("flag", false);
					modelMap.put("message", "验证码邮件发送失败，请重试！");
				}
			}
			return  modelMap;
	   }
	
	@RequestMapping("/update/{objectId}/{type}/{param1}/{param2}")
	public String updateMember(HttpServletRequest request, @PathVariable Long objectId, @PathVariable int type,
			@PathVariable String param1, @PathVariable String param2) {
		Member member = new Member();
//		Long objectId = Long.parseLong(request.getParameter("objectId"));
		member.setObjectId(objectId);
		String[] updatedFileds = null;
		if (type == 1) {
//			String loginName = request.getParameter("loginName");
			member.setLoginName(param1);
			updatedFileds = new String[] { "loginName" };
		} else if (type == 2) {
//			String password = request.getParameter("password");
			member.setPassword(SecurityUtils.generatePassword(param1));
			updatedFileds = new String[] { "password" };
		} else if (type == 3) {
//			String userName = request.getParameter("userName");
//			String mobile = request.getParameter("mobile");
			member.setUserName(param1);
			member.setMobile(param2);
			updatedFileds = new String[] { "userName", "mobile" };
		}
		memberManager.update(member, updatedFileds);
		request.setAttribute("message", "信息更新成功");
		// Todo 暂时跳到首页吧
		return "redirect:/home";
	}

}