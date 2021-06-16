package com.springbook.view.convidence;

import java.util.List;

import org.json.JSONArray;
<<<<<<< HEAD
import org.json.JSONException;
import org.json.JSONObject;
=======
>>>>>>> branch 'master' of https://github.com/minjae712/FINAL_PROJECT.git
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbook.biz.convidence.BillVO;
import com.springbook.biz.convidence.CartVO;
import com.springbook.biz.convidence.ConvidenceService;
import com.springbook.biz.convidence.ProductVO;
import com.springbook.biz.convidence.ReservationVO;
import com.springbook.biz.convidence.ReviewVO;
import com.springbook.biz.user.UserVO;

import oracle.net.aso.b;

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
	

	@RequestMapping(value = "/checkProduct.do")
	public @ResponseBody String checkProduct(CartVO vo) {
		convidenceService.checkProduct(vo);
		return "success";
	}

	@RequestMapping(value = "/myCartPage.do")
	public String myCartPage(CartVO vo,Model model) {
		List<CartVO> result = convidenceService.getCartList(vo);
		Integer result2 = convidenceService.getCartCount(vo);
		model.addAttribute("cartList", result);
		model.addAttribute("cartCount", result2);
		return "myCart.jsp";
	}
	
	@RequestMapping(value = "/insertOrder.do",produces = "application/text; charset=utf8")
	public @ResponseBody String insertOrder(BillVO vo) {
		convidenceService.insertOrder(vo);
		return "success";
	}
	@RequestMapping(value = "/insertOrderList.do",produces = "application/text; charset=utf8")
	public @ResponseBody String insertOrderList(CartVO cvo,BillVO bvo,@ModelAttribute("payRange") String payRange) {
		if(payRange == "all" || payRange.equals("all")) {
			System.out.println("all진입");
			convidenceService.insertOrderAll(cvo,bvo);
		}else if(payRange == "selected" || payRange.equals("selected")){
			System.out.println("sel진입");
			convidenceService.insertOrderSel(cvo,bvo);
		}
		return "success";
	}

	@RequestMapping(value = "/insertCart.do")
	public @ResponseBody String insertCart(CartVO vo) {
		convidenceService.insertCart(vo);
		return "success";
	}

	@RequestMapping(value = "/updateCart.do")
	public @ResponseBody String updateCart(CartVO vo) {
		convidenceService.updateCart(vo);
		return "success";
	}

	@RequestMapping(value = "/getProduct.do")
	public String getProduct(BillVO bvo, ProductVO pvo,Model model) {
		ProductVO result = convidenceService.getProduct(pvo);
		Integer result1 = convidenceService.getReviewCount(bvo);
		List<BillVO> result2 = convidenceService.getOrderList(bvo);
		model.addAttribute("product", result);
<<<<<<< HEAD
		model.addAttribute("reCount",result1);
		model.addAttribute("billList", result2);
=======
		System.out.println(result.getImage_detail());
>>>>>>> branch 'master' of https://github.com/minjae712/FINAL_PROJECT.git
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
	
	@RequestMapping(value = "/getOrderSelected.do")
	public String getOrderSelected(CartVO vo,Model model) {
		List<CartVO> result = convidenceService.getSelectedCartList(vo);
		Integer totalPrice = result.stream().mapToInt(r -> r.getCount() * r.getPrice()).sum();
		String selected = "selected";
		model.addAttribute("cartList", result);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("payRange", selected);
		return "orderPage_Cart.jsp";
	}
	@RequestMapping(value = "/getOrderAll.do")
	public String getOrderAll(CartVO vo,Model model) {
		List<CartVO> result = convidenceService.getCartList(vo);
		Integer totalPrice = result.stream().mapToInt(r -> r.getCount() * r.getPrice()).sum();
		String all = "all";
		model.addAttribute("cartList", result);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("payRange", all);
		return "orderPage_Cart.jsp";
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
	
	@RequestMapping(value = "/totalCheck.do")
	public @ResponseBody String totalCheck(CartVO vo) {
		Integer result = convidenceService.totalCheck(vo);
		return Integer.toString(result);
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
	
<<<<<<< HEAD
	@RequestMapping(value = "/insertReviewList.do")
	public String insertReviewList(ReviewVO vo) {
		convidenceService.insertReviewList(vo);
		return "redirect:getProduct.do?pro_code=" + vo.getPro_code() + "&mem_code=" + vo.getMem_code();
	}
	
	@RequestMapping(value = "/getReviewList.do")
	public @ResponseBody String getReviewList(ReviewVO vo) throws JSONException {
		List<ReviewVO> result = convidenceService.getReview(vo);
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < result.size(); i++) {
			JSONObject json = new JSONObject();
			
			json.put("review_code", result.get(i).getReview_code());
			json.put("pro_code", result.get(i).getPro_code());
			json.put("pro_name", result.get(i).getPro_name());
			json.put("mem_code", result.get(i).getMem_code());
			json.put("price", result.get(i).getPrice());
			json.put("review_date", result.get(i).getReview_date());
			json.put("name", result.get(i).getName());
			json.put("content", result.get(i).getContent());
		
			jsonArray.put(json);
			System.out.println(jsonArray.toString());
		}
		return jsonArray.toString();
=======
	@RequestMapping(value = "/deleteCart.do")
	public String deleteCart(CartVO vo) {
		convidenceService.deleteCart(vo);
		return "redirect:myCartPage.do?mem_code=" + vo.getMem_code();
>>>>>>> branch 'master' of https://github.com/minjae712/FINAL_PROJECT.git
	}

}
