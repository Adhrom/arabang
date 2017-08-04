package com.mainWeb.searchBang.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mainWeb.searchBang.admin.model.AdminVO;
import com.mainWeb.searchBang.admin.service.AdminService;

@Controller
public class AdminController {

	@Inject
	AdminService adminService;

	// index
	@RequestMapping("/index.admin")
	public String index() {
		return "index";
	}

	// adminManagement
	@RequestMapping("/adminManagement.admin")
	public ModelAndView adminManagement() {
		List<AdminVO> list = adminService.adminList();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminManagement");
		mv.addObject("list", list);
		return mv;
	}

	// regAdmin
	@RequestMapping("/regAdmin.admin")
	public String regAdmin(@ModelAttribute AdminVO vo) {
		adminService.insertAdmin(vo);
		return "redirect:adminManagement.admin";
	}

	// delAdmin
	@RequestMapping("/delAdmin.admin")
	public String delAdmin(String adminId) {
		adminService.deleteAdmin(adminId);
		return "redirect:adminManagement.admin";
	}

	// companyApprove
	@RequestMapping("/companyApprove.admin")
	public String companyApprove() {
		return "companyApprove";
	}

	// companyList
	@RequestMapping("/companyList.admin")
	public String companyList() {
		return "companyList";
	}

	// companyNoticeList
	@RequestMapping("/companyNoticeList.admin")
	public String companyNoticeList() {
		return "companyNoticeList";
	}

	// companyStats
	@RequestMapping("/companyStats.admin")
	public String companyStats() {
		return "companyStats";
	}

	// customerList
	@RequestMapping("/customerList.admin")
	public String customerList() {
		return "customerList";
	}

	// customerNoticeList
	@RequestMapping("/customerNoticeList.admin")
	public String customerNoticeList() {
		return "customerNoticeList";
	}

	// customerStats
	@RequestMapping("/customerStats.admin")
	public String customerStats() {
		return "customerStats";
	}

	// noticeWrite
	@RequestMapping("/noticeWrite.admin")
	public String noticeWrite() {
		return "noticeWrite";
	}

	// salesStats
	@RequestMapping("/salesStats.admin")
	public String salesStats() {
		return "salesStats";
	}

	// login

	@RequestMapping("/login.admin")
	public ModelAndView login(@ModelAttribute AdminVO vo, HttpSession session) {
		boolean result = adminService.loginCheck(vo, session);
		ModelAndView mv = new ModelAndView();
		if (result == true) {
			mv.setViewName("index");
			mv.addObject("msg", "success");
		} else {
			mv.setViewName("index");
			mv.addObject("msg", "failure");
		}
		return mv;
	}

	// logout
	@RequestMapping("/logout.admin")
	public String logout(HttpSession session) {
		adminService.logout(session);
		return "index";
	}
}
