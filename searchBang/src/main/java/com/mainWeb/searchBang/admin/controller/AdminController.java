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
import com.mainWeb.searchBang.owner.model.OwnerVO;
import com.mainWeb.searchBang.utils.SHA256;

@Controller
public class AdminController {

	@Inject
	AdminService adminService;
	SHA256 sha = SHA256.getInsatnce();

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
	public String regAdmin(@ModelAttribute AdminVO vo) throws Exception {

		String cryptStr = sha.getSha256(vo.getAdminPw().getBytes());
		vo.setAdminPw(cryptStr);

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
	public ModelAndView companyApprove() {
		List<OwnerVO> list = adminService.companyApprove();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("companyApprove");
		return mv;
	}
	@RequestMapping("/approve.admin")
	public String approve(@RequestParam(value="approve", required=true)String approve , @ModelAttribute OwnerVO ownerVO){
		adminService.approve(approve, ownerVO);
		return "redirect:companyApprove.admin";
	}

	// companyList
	@RequestMapping("/companyList.admin")
	public ModelAndView companyList() {
		List<OwnerVO> list = adminService.companyList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("companyList");
		return mv;
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
		System.out.println(noticeVO);
		adminService.insertNotice(noticeVO);
		return "redirect:"+noticeVO.getNoticeType()+"NoticeList.admin";
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
		return "redirect:"+noticeVO.getNoticeType()+"NoticeList.admin";
	}
	// noticeUpdate
	@RequestMapping(value="/noticeUpdate.admin" , method=RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute AdminNoticeVO noticeVO){
		adminService.noticeUpdate(noticeVO);
		return "redirect:"+noticeVO.getNoticeType()+"NoticeList.admin";
	}
	// salesStats
	@RequestMapping("/salesStats.admin")
	public String salesStats() {
		return "salesStats";
	}

	// login

	@RequestMapping("/login.admin")
	public ModelAndView login(@ModelAttribute AdminVO vo,
			HttpSession session) throws Exception {

		// 로그인시 암호화해서 vo모델링
		String cryptPw = sha.getSha256(vo.getAdminPw().getBytes());
		vo.setAdminPw(cryptPw);

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
