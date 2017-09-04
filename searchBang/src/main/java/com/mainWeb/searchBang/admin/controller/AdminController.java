package com.mainWeb.searchBang.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mainWeb.searchBang.admin.model.AdminNoticeVO;
import com.mainWeb.searchBang.admin.model.AdminVO;
import com.mainWeb.searchBang.admin.model.OwnerCountVO;
import com.mainWeb.searchBang.admin.model.ReservationChartVO;
import com.mainWeb.searchBang.admin.service.AdminService;
import com.mainWeb.searchBang.owner.model.OwnerVO;
import com.mainWeb.searchBang.owner.model.QnAVO;
import com.mainWeb.searchBang.owner.model.ReviewCountVO;
import com.mainWeb.searchBang.owner.model.SalesVO;
import com.mainWeb.searchBang.user.model.ReviewVO;
import com.mainWeb.searchBang.user.model.UserInfoVO;
import com.mainWeb.searchBang.utils.SHA256;

@Controller
public class AdminController {

	@Inject
	AdminService adminService;
	SHA256 sha = SHA256.getInsatnce(); // sha 객체 할당

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

		String cryptStr = sha.getSha256(vo.getAdminPw().getBytes()); // 비밀번호
		// 세팅과정
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
		mv.addObject("size", list.size());
		mv.addObject("list", list);
		mv.setViewName("companyApprove");
		return mv;
	}

	@RequestMapping("/approve.admin")
	public String approve(@RequestParam(value = "approve", required = true) String approve,
			@ModelAttribute OwnerVO ownerVO) {
		adminService.approve(approve, ownerVO);
		return "redirect:companyApprove.admin";
	}

	// companyList
	@RequestMapping("/companyList.admin")
	public ModelAndView companyList() {
		List<OwnerVO> list = adminService.companyList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
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
		mv.addObject("noticeList", noticeList);
		return mv;
	}

	// customerList
	@RequestMapping("/customerList.admin")
	public ModelAndView customerList() {
		List<UserInfoVO> list = adminService.userList();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customerList");
		mv.addObject("list", list);
		return mv;
	}

	// customerNoticeList
	@RequestMapping("/customerNoticeList.admin")
	public ModelAndView customerNoticeList() {
		String noticeType = "customer";
		List<AdminNoticeVO> noticeList = adminService.NoticeList(noticeType);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customerNoticeList");
		mv.addObject("noticeList", noticeList);
		return mv;
	}

	// noticeWrite
	@RequestMapping(value = "/noticeWrite.admin", method = RequestMethod.GET)
	public String noticeWrite() {
		return "noticeWrite";
	}

	@RequestMapping(value = "/noticeWrite.admin", method = RequestMethod.POST)
	public ModelAndView noticeModify(@ModelAttribute AdminNoticeVO noticeVO) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("noticeVO", noticeVO);
		mv.setViewName("noticeWrite");
		return mv;
	}

	@RequestMapping("/insertNotice.admin")
	public String insertNotice(@ModelAttribute AdminNoticeVO noticeVO) {
		System.out.println(noticeVO);
		adminService.insertNotice(noticeVO);
		return "redirect:" + noticeVO.getNoticeType() + "NoticeList.admin";
	}

	// noticeRead
	@RequestMapping("/noticeRead.admin")
	public ModelAndView noticeRead(@RequestParam(value = "notice_no", required = true) String notice_no) {
		AdminNoticeVO noticeVO = adminService.noticeRead(notice_no);
		ModelAndView mv = new ModelAndView();
		mv.addObject("noticeVO", noticeVO);
		mv.setViewName("noticeRead");
		return mv;
	}

	// noticeDel
	@RequestMapping("/noticeDel.admin")
	public String noticeDel(@ModelAttribute AdminNoticeVO noticeVO) {
		String notice_no = String.valueOf(noticeVO.getNotice_no());
		adminService.noticeDel(notice_no);
		return "redirect:" + noticeVO.getNoticeType() + "NoticeList.admin";
	}

	// noticeUpdate
	@RequestMapping(value = "/noticeUpdate.admin", method = RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute AdminNoticeVO noticeVO) {
		adminService.noticeUpdate(noticeVO);
		return "redirect:" + noticeVO.getNoticeType() + "NoticeList.admin";
	}

	// Stats
	@RequestMapping("/Stats.admin")
	public ModelAndView salesStats() {
		ModelAndView mv = new ModelAndView();
		int totalAccom = adminService.totalAccom();
		mv.addObject("size", totalAccom);
		mv.setViewName("Stats");
		return mv;
	}

	// login
	@RequestMapping("/login.admin")
	public ModelAndView login(@ModelAttribute AdminVO vo, HttpSession session) throws Exception {

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

	// QnA 리스트
	@RequestMapping("/QnAReply.admin")
	public ModelAndView QnAReply() {
		ModelAndView mv = new ModelAndView();
		List<QnAVO> list = adminService.QnAList();
		mv.addObject("size", list.size());
		mv.addObject("list", list);
		mv.setViewName("QnAReply");
		return mv;
	}

	// QnA 리플
	@RequestMapping("/insertReply.admin")
	public String insertReply(@ModelAttribute QnAVO vo) {
		adminService.insertReply(vo);
		return "redirect:QnAReply.admin";
	}

	// 리뷰리스트
	@RequestMapping("/review.admin")
	public ModelAndView reviewList(@RequestParam(value = "declration") String declration) {
		ModelAndView mv = new ModelAndView();
		List<ReviewVO> list;
		if (declration.equals('y'))
			list = adminService.declrationReviewList();
		else
			list = adminService.reviewList();
		mv.setViewName("review");
		mv.addObject("list", list);
		return mv;
	}

	// 리뷰삭제
	@RequestMapping("/deleteReview.admin")
	public String deleteReview(@RequestParam(value = "review_no") String review_no,
			@RequestParam(value = "declration") String declration) {
		adminService.deleteReview(review_no);
		if (declration.equals('y'))
			return "redirect:review.admin?declration=y";
		else
			return "redirect:review.admin?declration=n";
	}

	// 리뷰신고취소
	@RequestMapping("/cancelReview.admin")
	public String cancelReview(@RequestParam(value = "review_no") String review_no,
			@RequestParam(value = "declration") String declration) {
		adminService.cancelReview(review_no);
		if (declration.equals('y'))
			return "redirect:review.admin?declration=y";
		else
			return "redirect:review.admin?declration=n";
	}

	// 매출수수료통계
	@RequestMapping("/sales_fees.admin")
	public @ResponseBody Object sales_fees() {
		List<SalesVO> list = new ArrayList<SalesVO>();
		list = adminService.sales_fees();
		return list;
	}

	// 오너카운트
	@RequestMapping("/ownerCount.admin")
	public @ResponseBody Object ownerCount() {
		List<OwnerCountVO> list = new ArrayList<OwnerCountVO>();
		list = adminService.ownerCount();
		return list;
	}

	//예약 일자별 차트
	@RequestMapping("/reservationChart.admin")
	public @ResponseBody Object reservationChart() {
		List<ReservationChartVO> list = new ArrayList<ReservationChartVO>();
		list = adminService.reservationChart();
		return list;
	}

	// 오너 등록 숙소 그래이드 차트
	@RequestMapping("/ownerGradeChart.admin")
	public @ResponseBody Object ownerGradeChart(){
		List<ReviewCountVO> list = new ArrayList<ReviewCountVO>();
		list = adminService.ownerGradeChart();
		return list;
	}


}
