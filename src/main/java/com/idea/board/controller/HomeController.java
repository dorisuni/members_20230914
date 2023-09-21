package com.idea.board.controller;
import com.idea.board.service.BoardService;
import com.idea.board.service.CommentService;
import com.idea.board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @Autowired
    BoardService boardService;
    @Autowired
    MemberService memberService;
    @Autowired
    CommentService commentService;
    @GetMapping("/")
    public String index(){
        return "index";
    }
}
