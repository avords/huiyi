package com.mvc.member.web;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.mvc.HYConstants;
import com.mvc.base.model.Country;
import com.mvc.base.service.CountryManager;
import com.mvc.component.mail.MailConfig;
import com.mvc.component.mail.service.EmailManagerImpl;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.BusinessType;
import com.mvc.member.model.Company;
import com.mvc.member.model.CompanyMedia;
import com.mvc.member.model.Member;
import com.mvc.member.model.ValidateCode;
import com.mvc.member.service.BusinessTypeManager;
import com.mvc.member.service.CompanyManager;
import com.mvc.member.service.CompanyMediaManager;
import com.mvc.member.service.MemberManager;
import com.mvc.member.service.ValidateCodeManager;
import com.mvc.security.util.SecurityUtils;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController extends PageController<Member> {
	private static final String BASE_DIR = "member/";

	@Autowired
	private MemberManager memberManager;
	@Autowired
	private EmailManagerImpl emailManager;
	@Autowired
	private ValidateCodeManager validateCodeManager;
	@Autowired
	private CompanyManager companyManager;
	@Autowired
	private CountryManager countryManager;
	@Autowired
	private BusinessTypeManager businessTypeManager;
	@Autowired
	private CompanyMediaManager companyMediaManager;

	
	@Override
	public PageManager<Member> getEntityManager() {
		return this.memberManager;
	}

	@Override
	public String getFileBasePath() {
		return BASE_DIR;
	}
	
	@Override
	public String edit(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId)
			throws Exception {
		if (null != objectId) {
			Member entity = getManager().getByObjectId(objectId);
			request.setAttribute("entity", entity);

			if (entity.getCompanyId() != null) {
				String companyName = (companyManager.getByObjectId(entity.getCompanyId())).getNameZh();
				// if (companyName == null) Todo 考虑companyName 为空的情况？
				request.setAttribute("companyName", companyName);
			} else {
				request.setAttribute("companyName", "");
			}

		}
		return getFileBasePath() + "edit" + getActualArgumentType().getSimpleName();
	}

	/**
	 * 修改密码
	 */
	@RequestMapping("/resetPassword/{objectId}")
	public String resetPassword(HttpServletRequest request, @PathVariable Long objectId) {
		request.setAttribute("entity", memberManager.getByObjectId(objectId));
		return BASE_DIR + "resetPassword";
	}

	@RequestMapping(value = "/saveReset", method = RequestMethod.POST)
	public String saveReset(HttpServletRequest request, Member member) {
		String newPlainPassword = request.getParameter("newPassword");
		String message;
		if (StringUtils.isNotBlank(newPlainPassword)) {
			member.setPassword(SecurityUtils.generatePassword(newPlainPassword));
			memberManager.updatePassword(member);
			message = "user.password.reset.success";
		} else {
			message = "user.password.reset.blank";
		}
		return "redirect:resetPassword/" + member.getObjectId() + getMessage(message, request) + "&"
				+ appendAjaxParameter(request);
	}
	
	/**
	 * 修改前台账户密码
	 */
	@RequestMapping("/modifyPassword")
	public String modifyPassword(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute(HYConstants.MEMBER_ID)==null){
			return "home/login";
		}
		else{
		Long objectId = Long.parseLong(session.getAttribute(HYConstants.MEMBER_ID).toString());
		request.setAttribute("entity", memberManager.getByObjectId(objectId));
		return "member/modifyPassword";
		}
	}
	
	/**
	 * 保存修改的密码
	 */
	@RequestMapping("/savePassword")
	public String savePassword(HttpServletRequest request, ModelMap modelMap) {
		HttpSession session = request.getSession();
		Long objectId = Long.parseLong(session.getAttribute(HYConstants.MEMBER_ID).toString());
		String newPassword = request.getParameter("newPassword");
		Member member = memberManager.getByObjectId(objectId);
		member.setPassword(SecurityUtils.generatePassword(newPassword));
		memberManager.updatePassword(member);
		return "home/login";
	}
	/**
	 * 修改邮箱
	 */
	@RequestMapping("/modifyEmail")
	public String modifyEmail(HttpServletRequest request) {
		return "member/modifyEmail";
	}
	
	/**
	 * 校验新输入邮箱的唯一性
	 */
	@RequestMapping("/checkEmail")
	@ResponseBody
	public ModelMap checkEmail(HttpServletRequest request, HttpServletResponse response) {
		String loginName = request.getParameter("email");
		ModelMap modelMap = new ModelMap();
		boolean flag=memberManager.checkMemberName(loginName);
		if (flag == true) {
			modelMap.put("flag", true);
		} else {
			modelMap.put("flag", false);
		}
		return modelMap;
	}
	
	/**
	 * 保存修改的邮箱号
	 */
	@RequestMapping("/saveEmail")
	public String saveEmail(HttpServletRequest request, ModelMap modelMap) {
		Member member = (Member) request.getSession().getAttribute(HYConstants.SESSION_MEMBER);
		if(member==null){
			return "redirect:/home/login";
		}else{
			String email = request.getParameter("email");
			member.setLoginName(email);
			memberManager.save(member);
			request.setAttribute("entity", member);
			return "redirect:modifyEmail?ajax=1";//跳转有问题
		}
	}
	
	@RequestMapping("/sendEmailTo")
	@ResponseBody
	public ModelMap sendEmailTo(HttpServletRequest request,HttpServletResponse response) {
			String email =request.getParameter("email");
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
			ModelMap modelMap=new ModelMap();
			if(flag==0){
				modelMap.put("message", "验证码已发送");
				modelMap.put("tempCode", code);
				modelMap.put("flag", true);
			}else{
				modelMap.put("message", "发送失败，请重试！");
				modelMap.put("flag", false);
			}
			return  modelMap;
	   }
		private String getValidateCode() {
			String pattern = "000000";
			DecimalFormat df = new DecimalFormat(pattern);
			Random r = new Random();
			return df.format(r.nextInt(1000000));
		}
}
