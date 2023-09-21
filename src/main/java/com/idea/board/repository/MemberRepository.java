package com.idea.board.repository;
import com.idea.board.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void save(MemberDTO memberDTO) {
        sql.insert("Member.save", memberDTO);

    }

    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login",memberDTO);
    }

    public MemberDTO findById(Long id) {
        return sql.selectOne("Member.findById", id);
    }

    public void update(MemberDTO memberDTO) {
        sql.update("Member.update",memberDTO);
    }

    public void delete(Long id) {
        sql.delete("Member.delete",id);
    }

    public MemberDTO loginByEmail(String memberEmail) {
//        MemberDTO memberDTO1 = sql.selectOne("Member.findByEmail",memberEmail);
//        System.out.println("memberDTO1레포지토리 = " + memberDTO1);
        return sql.selectOne("Member.findByEmail",memberEmail);
    }

    public MemberDTO findByMemberEmail(String memberEmail) {
        return sql.selectOne("Member.findByEmail", memberEmail);
    }
}
