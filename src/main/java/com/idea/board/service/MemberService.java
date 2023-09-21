package com.idea.board.service;
import com.idea.board.dto.MemberDTO;
import com.idea.board.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    public void save(MemberDTO memberDTO) {
        memberRepository.save(memberDTO);
    }

    public List<MemberDTO> findAll(){
        return memberRepository.findAll();
    }

    public MemberDTO login(String memberEmail, String memberPassword) {
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setMemberEmail(memberEmail);
        memberDTO.setMemberPassword(memberPassword);
        System.out.println("memberDTO = " + memberDTO);
        return memberRepository.login(memberDTO);
    }

    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }

    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }

    public void delete(Long id) {
        memberRepository.delete(id);
    }

    public MemberDTO loginByEmail(String memberEmail) {
        return memberRepository.loginByEmail(memberEmail);
    }

    public MemberDTO findByMemberEmail(String memberEmail) {
        return memberRepository.findByMemberEmail(memberEmail);
    }

}
