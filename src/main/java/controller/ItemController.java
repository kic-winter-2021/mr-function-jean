package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import logic.service.ItemService;

@Controller
@RequestMapping("item")
public class ItemController {
	@Autowired
	ItemService itemService;

	@RequestMapping("detail")
	public String detail() {
		return null;
	}
	@RequestMapping("movecart")
	public String movecart() {
		return "item/movecart";
	}
}

