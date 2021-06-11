package com.springbook.view.convidence;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.convidence.ConvidenceService;
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
	public String petShopPage() {
//		convidenceService.getShopList();
		return "petShop.jsp";
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
	
	

}
