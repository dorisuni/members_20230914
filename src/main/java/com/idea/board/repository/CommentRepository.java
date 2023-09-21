package com.idea.board.repository;

import com.idea.board.dto.CommentDTO;
import com.idea.board.dto.CommentLikeDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void save(CommentDTO commentDTO) {
        sql.insert("Comment.save", commentDTO);
    }

    public List<CommentDTO> findAll(Long boardId) {
        return sql.selectList("Comment.findAll", boardId);
    }

    public CommentDTO findById(Long id) {
        return sql.selectOne("Comment.findById",id);
    }

    public void updateLikeAmount(Long commentId) {
        sql.update("Comment.updateLikeAmount", commentId);
    }

    public void deleteLikeAmount(Long commentId) {
        sql.update("Comment.deleteLikeAmount", commentId);
    }

    public void updateLikeMemberJson(CommentDTO commentDTO) {
        sql.update("Comment.updateLikeMemberJson",commentDTO);
    }
    //개어려웠는데 어떻게 했냐면, 인덱스값을 알아내서 해당인덱스값을 다시넣은거임.
//    여기서 문제가 뭐였냐면 result값이 string도 아니고 뭐지 object인것같은거임.
//    그래서 result1은 양옆에 따옴표를 제거하고 인덱스를 보냈더니 작동함....하..
    public void deleteLikeMemberJson(CommentDTO commentDTO) {
        System.out.println("hereisworking for delete = " + commentDTO);
        try{
            String result = sql.selectOne("Comment.searchJson",commentDTO);
            System.out.println("Result: " + result);
            String result1 = result.replace("\"", "");
            System.out.println("result1 = " + result1);
            Map<String, String> searchParams = new HashMap<>();
            searchParams.put("index",result1);
            searchParams.put("id",commentDTO.getId().toString());
            System.out.println("searchParams = " + searchParams);
            sql.update("Comment.deleteLikeMemberJson",searchParams);
        }catch(Exception e){
            System.out.println("problem:"+e.toString());
        }

//        sql.update("Comment.deleteLikeMemberJson",commentDTO);
    }

    public void update(CommentDTO commentDTO) {
        sql.update("Comment.update",commentDTO);
    }

    public void delete(Long id) {
        sql.delete("Comment.delete",id);
    }
}
