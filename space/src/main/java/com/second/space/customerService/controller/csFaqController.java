package com.second.space.customerService.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.second.space.customerService.service.CSService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/customerService")
public class csFaqController {
	
	@Autowired
	CSService cs_service;
	
	@RequestMapping("/101")
	public String faq101(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/102")
	public String faq102(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/103")
	public String faq103(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/104")
	public String faq104(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}

	@RequestMapping("/105")
	public String faq105(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
	
	@RequestMapping("/201")
	public String faq201(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/202")
	public String faq202(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/203")
	public String faq203(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/204")
	public String faq204(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}
	
	@RequestMapping("/205")
	public String faq205(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
	
	@RequestMapping("/206")
	public String faq206(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/207")
	public String faq207(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/208")
	public String faq208(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/209")
	public String faq209(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}
	
	@RequestMapping("/210")
	public String faq210(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
	
	@RequestMapping("/301")
	public String faq301(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/302")
	public String faq302(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/303")
	public String faq303(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/304")
	public String faq304(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}

	@RequestMapping("/305")
	public String faq305(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
	@RequestMapping("/306")
	public String faq306(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/307")
	public String faq307(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/308")
	public String faq308(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/309")
	public String faq309(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}

	@RequestMapping("/310")
	public String faq310(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
	
	@RequestMapping("/401")
	public String faq401(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/402")
	public String faq402(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/403")
	public String faq403(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/404")
	public String faq404(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}

	@RequestMapping("/405")
	public String faq405(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
	
	@RequestMapping("/406")
	public String faq406(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/407")
	public String faq407(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/408")
	public String faq408(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/409")
	public String faq409(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}

	@RequestMapping("/410")
	public String faq410(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
	
	@RequestMapping("/501")
	public String faq501(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/502")
	public String faq502(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/503")
	public String faq503(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/504")
	public String faq504(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}

	@RequestMapping("/505")
	public String faq505(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
	
	@RequestMapping("/601")
	public String faq601(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/602")
	public String faq602(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/603")
	public String faq603(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/604")
	public String faq604(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}

	@RequestMapping("/605")
	public String faq605(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
	
	@RequestMapping("/606")
	public String faq606(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/607")
	public String faq607(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/608")
	public String faq608(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/609")
	public String faq609(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}

	@RequestMapping("/610")
	public String faq610(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
	
	@RequestMapping("/701")
	public String faq701(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/702")
	public String faq702(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/703")
	public String faq703(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/704")
	public String faq704(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}

	@RequestMapping("/705")
	public String faq705(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
	
	@RequestMapping("/706")
	public String faq706(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/707")
	public String faq707(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/708")
	public String faq708(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/709")
	public String faq709(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}

	@RequestMapping("/710")
	public String faq710(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
	
	@RequestMapping("/801")
	public String faq801(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/802")
	public String faq802(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/803")
	public String faq803(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/804")
	public String faq804(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}

	@RequestMapping("/805")
	public String faq805(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
	
	@RequestMapping("/806")
	public String faq806(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/901")
	public String faq901(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/902")
	public String faq902(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/903")
	public String faq903(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/904")
	public String faq904(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}
	
	@RequestMapping("/905")
	public String faq905(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
	
	@RequestMapping("/906")
	public String faq906(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/907")
	public String faq907(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/908")
	public String faq908(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/909")
	public String faq909(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}
	
	@RequestMapping("/910")
	public String faq910(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
	
	@RequestMapping("/1001")
	public String faq1001(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/1002")
	public String faq1002(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/1003")
	public String faq1003(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/1004")
	public String faq1004(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}
	
	@RequestMapping("/1005")
	public String faq1005(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
	
	@RequestMapping("/1006")
	public String faq1006(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/101";
	}
	
	@RequestMapping("/1007")
	public String faq1007(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/102";
	}
	
	@RequestMapping("/1008")
	public String faq1008(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/103";
	}
	
	@RequestMapping("/1009")
	public String faq1009(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/104";
	}
	
	@RequestMapping("/1010")
	public String faq1010(HttpServletRequest request, Model model) {
		System.out.println("자주 묻는 질문 cs_category_id : "+request.getParameter("id")+"(으)로 이동");
		request.setAttribute("category_id", request.getParameter("id"));
		try {
			model.addAttribute("cs_category_list", cs_service.getCSCategoryList());
		} catch (Exception e) {
			log.info("Error");
			e.printStackTrace();
		}
		return "/customerService/faq/105";
	}
}
