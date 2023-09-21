package com.idea.board.service;

import com.idea.board.dto.CommentDTO;
import com.idea.board.dto.CommentLikeDTO;
import com.idea.board.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);
    }

    public List<CommentDTO> findAll(Long boardId) {
        return commentRepository.findAll(boardId);
    }

    public CommentDTO findById(Long id) {
        return commentRepository.findById(id);
    }


    public void updateLikeAmount(Long commentId) {
        commentRepository.updateLikeAmount(commentId);
    }

    public void deleteLikeAmount(Long commentId) {
        commentRepository.deleteLikeAmount(commentId);
    }

    public void updateLikeMemberJson(CommentDTO commentDTO) {
        commentRepository.updateLikeMemberJson(commentDTO);
    }
    public void deleteLikeMemberJson(CommentDTO commentDTO) {
        commentRepository.deleteLikeMemberJson(commentDTO);
    }

    public void update(CommentDTO commentDTO) {
        commentRepository.update(commentDTO);
    }

    public void delete(Long id) {
        try{
            commentRepository.delete(id);
        }catch (Exception e){
            System.out.println("deletecomment = " + e.toString());
        }

    }
}
