package com.mainWeb.searchBang.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mainWeb.searchBang.admin.model.AdminNoticeVO;
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
	public ModelAndView companyNoticeList() {
		String noticeType = "company";
		List<AdminNoticeVO> noticeList = adminService.NoticeList(noticeType);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("companyNoticeList");
		mv.addObject("noticeList",noticeList);
		return mv;
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
	public ModelAndView customerNoticeList() {
		String noticeType = "customer";
		List<AdminNoticeVO> noticeList = adminService.NoticeList(noticeType);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customerNoticeList");
		mv.addObject("noticeList",noticeList);
		return mv;
	}

	// customerStats
	@RequestMapping("/customerStats.admin")
	public String customerStats() {
		return "customerStats";
	}

	// noticeWrite
	@RequestMapping(value="/noticeWrite.admin" , method=RequestMethod.GET)
	public String noticeWrite() {
		return "noticeWrite";
	}
	@RequestMapping(value="/noticeWrite.admin" , method=RequestMethod.POST)
	public ModelAndView noticeModify(@ModelAttribute AdminNoticeVO noticeVO) {
		ModelAndView mv = new ModelAndView();
		 mv.addObject("noticeVO",noticeVO);
		 mv.setViewName("noticeWrite");
		return mv;
	}

	@RequestMapping("/insertNotice.admin")
	public String insertNotice(@ModelAttribute AdminNoticeVO noticeVO){
		adminService.insertNotice(noticeVO);
		return noticeVO.getNoticeType()+"NoticeList";
	}
	// noticeRead
	@RequestMapping("/noticeRead.admin")
	public ModelAndView noticeRead(@RequestParam(value="notice_no", required=true)String notice_no){
		AdminNoticeVO noticeVO = adminService.noticeRead(notice_no);
		ModelAndView mv = new ModelAndView();
		mv.addObject("noticeVO",noticeVO);
		mv.setViewName("noticeRead");
		return mv;
	}
	// noticeDel
	@RequestMapping("/noticeDel.admin")
	public String noticeDel(@ModelAttribute AdminNoticeVO noticeVO){
		String notice_no = String.valueOf(noticeVO.getNotice_no());
		adminService.noticeDel(notice_no);
		return noticeVO.getNoticeType()+"NoticeList";
	}
	// noticeUpdate
	@RequestMapping("/noticeUpdate.admin")
	public String noticeUpdate(@ModelAttribute AdminNoticeVO noticeVO){
		adminService.noticeUpdate(noticeVO);
		return noticeVO.getNoticeType()+"NoticeList";
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
