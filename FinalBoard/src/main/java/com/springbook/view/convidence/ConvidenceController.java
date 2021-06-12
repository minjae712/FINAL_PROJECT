package com.springbook.view.convidence;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbook.biz.convidence.BillVO;
import com.springbook.biz.convidence.ConvidenceService;
import com.springbook.biz.convidence.ProductVO;
import com.springbook.biz.convidence.ReservationVO;
import com.springbook.biz.user.UserVO;

@Controller
public class ConvidenceController {
	
	@Autowired
	private ConvidenceService convidenceService;
	
		
	@RequestMapping(value = "/reservationPage.do")
	public String reservationPage() {
		return "reservation.jsp";
	}

	@RequestMapping(value = "/petShopPage.do")
	public String petShopPage(Model model) {
		List<ProductVO> result = convidenceService.getShopList();
		model.addAttribute("pro_list", result);
		return "petShop.jsp";
	}

	@RequestMapping(value = "/getOrder.do")
	public String getOrder(ProductVO vo,@ModelAttribute("count") Integer count,Model model) {
		model.addAttribute("product", vo);
		return "orderPage.jsp";
	}
	
	
	@RequestMapping(value = "/insertOrder.do",produces = "application/text; charset=utf8")
	public @ResponseBody String insertOrder(BillVO vo,Model model) {
		convidenceService.insertOrder(vo);
		return "success";
	}

	@RequestMapping(value = "/getProduct.do")
	public String getProduct(ProductVO vo,Model model) {
		ProductVO result = convidenceService.getProduct(vo);
		model.addAttribute("product", result);
		return "getProduct.jsp";
	}
	
	@RequestMapping(value = "/getOrderList.do")
	public String getOrderList(BillVO vo,Model model) {
		List<BillVO> result = convidenceService.getOrderList(vo);
		Integer result2 = convidenceService.getOrderCount(vo);
		model.addAttribute("orderList", result);
		model.addAttribute("orderCount", result2);
		return "myOrderList.jsp";
	}
	
	@RequestMapping(value = "/getReservation.do")
	public String getReservation(UserVO vo,Model model) {
		List<ReservationVO> result = convidenceService.getReservation(vo);
		Integer result2 = convidenceService.getReserCount(vo);
		model.addAttribute("reservationList", result);
		model.addAttribute("resCount", result2);
		return "myReservation.jsp";
	}

	@RequestMapping(value = "/reservation.do")
	public String reservation(ReservationVO vo) {
		convidenceService.reservation(vo);
		return "reservationSuccess.jsp";
	}
	
	@RequestMapping(value = "/deleteReser.do")
	public String deleteReser(ReservationVO vo) {
		convidenceService.deleteReser(vo);
		return "redirect:getReservation.do?id=" + vo.getUser_id();
	}
	
	@RequestMapping(value = "/deleteOrder.do")
	public String deleteOrder(BillVO vo) {
		convidenceService.deleteOrder(vo);
		return "redirect:getOrderList.do?mem_code=" + vo.getMem_code();
	}
	

}
