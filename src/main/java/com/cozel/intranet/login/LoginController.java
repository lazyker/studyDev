package com.cozel.intranet.login;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cozel.intranet.admin.service.ConsultantService;
import com.cozel.intranet.common.security.Sha256;
import com.cozel.intranet.common.utils.CommonUtil;
import com.cozel.intranet.common.utils.DateUtil;

@Controller
public class LoginController {
	
	@Autowired
	ConsultantService consultantService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value = "/login", method = {RequestMethod.GET})
	public ModelAndView login(@RequestParam Map<String, Object> param) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("blank/login/login");
		return mv;
	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST) 
    public @ResponseBody boolean loginCheck(HttpServletRequest request, 
    															@RequestParam Map<String, Object> param
    															, HttpSession session) throws Exception {
		param.put("password", Sha256.encrypt(param.get("password").toString()));
		boolean user = consultantService.loginCheck(param);
		String loginTime = DateUtil.getCurrentTime(new Date(), "yyyy-MM-dd HH:mm:ss");
		
		if (user) {
			session = request.getSession(true);
			Map<String, Object> userInfo = consultantService.getConsultant(param);
			userInfo.put("loginTime", loginTime);
			
			session.setAttribute("userInfo", userInfo);
			
			String ip = CommonUtil.getRealIP(request);
			param.put("conId", userInfo.get("CON_ID"));
			param.put("ip", ip);
			param.put("passYn", "Y");
			param.put("regDate", loginTime);
			consultantService.setLoginInfo(param);
		} else {
			param.put("passYn", "N");
			consultantService.setLoginInfo(param);
		}
		
		return user;
    }
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logoutProcess(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(true);
		session.invalidate();
		response.setStatus(HttpServletResponse.SC_OK);
		
		mv.setViewName("blank/login/login");
		return mv;
	}
	
}
