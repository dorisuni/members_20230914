package com.idea.board.repository;

import com.idea.board.dto.CommentLikeDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentLikeRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void save(CommentLikeDTO commentLikeDTO) {
        sql.insert("CommentLike.insertLike", commentLikeDTO);
    }

    public void delete(CommentLikeDTO commentLikeDTO){
        sql.delete("CommentLike.deleteLike",commentLikeDTO);
    }

    public List<CommentLikeDTO> findAll(Long commentId) {
        return sql.selectList("CommentLike.findAll",commentId);
    }

    public CommentLikeDTO find(CommentLikeDTO commentLikeDTO){
        return sql.selectOne("CommentLike.find",commentLikeDTO);
    }

    public int findLike(CommentLikeDTO commentLikeDTO) {
        return sql.selectOne("CommentLike.findLike",commentLikeDTO);
    }
}
