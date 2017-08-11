package com.mainWeb.searchBang.owner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mainWeb.searchBang.owner.model.OwnerVO;

@Controller
public class OwnerController {

	@RequestMapping("/ownerReg.owner")
	public String onwer_join(){
		return "ownerReg";
	}

	@RequestMapping("/insertOwner.owner")
	public String insertOwner(@ModelAttribute OwnerVO ownerVO){

		return "index.owner";
	}
}
