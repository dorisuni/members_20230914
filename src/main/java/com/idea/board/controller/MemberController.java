package com.idea.board.controller;

import com.idea.board.dto.MemberDTO;
import com.idea.board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;


import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String save(){
        return "memberPages/memberSave";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
        memberService.save(memberDTO);
        return "memberPages/memberLogin";
    }

    @GetMapping("/login")
    public String login() {
        return "memberPages/memberLogin";
    }

    @PostMapping("/login")
    public String login(@RequestParam("memberEmail") String memberEmail, @RequestParam("memberPassword") String memberPassword, Model model, HttpSession session)
    {
        System.out.println("memberEmail = " + memberEmail + ", memberPassword = " + memberPassword );
        MemberDTO memberDTO = memberService.loginByEmail(memberEmail);
        System.out.println("memberDTO1 = " + memberDTO);
        if (memberDTO != null && memberDTO.getMemberPassword().equals(memberPassword)) {
            // 로그인 성공
            model.addAttribute("member",memberDTO);
            //로그인 성공시 사용자의 이메일을 세션에 저장
            session.setAttribute("loginEmail",memberDTO.getMemberEmail());
            session.setAttribute("loginId",memberDTO.getId());


            return "memberPages/memberMain";
        } else {
            // 로그인 실패
            model.addAttribute("error", "로그인 실패");
            return "memberPages/memberLogin"; // 로그인 폼으로 다시 이동
        }
    }

    @GetMapping("/members")
    public String members(Model model) {
        List<MemberDTO> memberDTOList =memberService.findAll();
        model.addAttribute("memberList",memberDTOList);
        return "memberPages/memberList";
    }

    @GetMapping("/member")
    public String member(@RequestParam("id") Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        System.out.println("memberDTO = " + memberDTO);
        model.addAttribute("member",memberDTO);
        return "memberPages/memberDetail";
    }

    @GetMapping("/member-ajax")
    public void member_ajax() {

    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id,Model model,HttpSession session) {
        String loginEmail = session.getAttribute("loginEmail").toString();
        if (loginEmail.equals("admin")){
            memberService.delete(id);
            return "redirect:/member/members";
        }else{
            memberService.delete(id);
            session.invalidate();
            return "redirect:/";
        }
    }

    @GetMapping("/update")
    public String update(@RequestParam("id") Long id,Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member",memberDTO);
        return "memberPages/memberUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO,Model model) {
        memberService.update(memberDTO);
        MemberDTO memberDTO1 = memberService.findById(memberDTO.getId());
        model.addAttribute("member",memberDTO1);
        return "memberPages/memberDetail";
    }
    @PostMapping("/duplicate-check")
    public ResponseEntity duplicateCheck(@RequestParam("memberEmail") String memberEmail) {
        MemberDTO memberDTO = memberService.findByMemberEmail(memberEmail);
        if (memberDTO == null) {
            return new ResponseEntity<>(HttpStatus.OK); // http status code 200
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        //해당 파라미터만 없앨 경우
//        session.removeAttribute("loginEmail");
        //세션 전체를 없앨 경우
        session.invalidate();
        return "redirect:/";

    }


}
