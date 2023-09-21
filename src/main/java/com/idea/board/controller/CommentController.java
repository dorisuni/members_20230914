package com.idea.board.controller;

import com.idea.board.dto.*;
import com.idea.board.service.BoardService;
import com.idea.board.service.CommentLikeService;
import com.idea.board.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.xml.stream.events.Comment;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    CommentLikeService commentLikeService;
    @Autowired
    BoardService boardService;
    @PostMapping("/save")
    public ResponseEntity save(@ModelAttribute CommentDTO commentDTO) {
        commentService.save(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        return new ResponseEntity<>(commentDTOList, HttpStatus.OK);
    }

    @PostMapping("/like")
    public ResponseEntity save(@ModelAttribute CommentLikeDTO commentLikeDTO, Model model){
        System.out.println("commentLikeDTO = " + commentLikeDTO);
        int check = commentLikeService.findLike(commentLikeDTO);
        if(check == 0) {
            commentLikeService.save(commentLikeDTO);
            commentService.updateLikeAmount(commentLikeDTO.getCommentId());
            CommentDTO commentDTO = new CommentDTO();
            commentDTO.setId(commentLikeDTO.getCommentId());
            commentDTO.setBoardId(commentLikeDTO.getBoardId());
            commentDTO.setLikeMemberJson(String.valueOf(commentLikeDTO.getMemberId()));
            System.out.println("commentDTO = " + commentDTO);
            commentService.updateLikeMemberJson(commentDTO);
        }else{
            CommentDTO commentDTO = new CommentDTO();
            commentDTO.setId(commentLikeDTO.getCommentId());
            commentDTO.setBoardId(commentLikeDTO.getBoardId());
            commentDTO.setLikeMemberJson(String.valueOf(commentLikeDTO.getMemberId()));
            commentLikeService.delete(commentLikeDTO);
            commentService.deleteLikeAmount(commentLikeDTO.getCommentId());
            commentService.deleteLikeMemberJson(commentDTO);
        }

        List<CommentDTO> commentDTOList = commentService.findAll(commentLikeDTO.getBoardId()); // 댓글 리스트 가져오는 예시
        List<CommentLikeDTO> commentLikeDTOList = commentLikeService.findAll(commentLikeDTO.getCommentId());
        CommentResponseDTO responseDTO = new CommentResponseDTO();

        CommentDTO commentDTO = commentService.findById(commentLikeDTO.getCommentId());
        return new ResponseEntity<>(commentDTO, HttpStatus.OK);
    }

    @PostMapping("/update")
    public String update(@ModelAttribute CommentDTO commentDTO, Model model) {
        commentService.update(commentDTO);
        BoardDTO dto = boardService.findById(commentDTO.getBoardId());
        Long boardId = commentDTO.getBoardId();
        model.addAttribute("board", dto);
        // 첨부된 파일이 있다면 파일을 가져옴
        if (dto.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTOList = boardService.findFile(boardId);
            model.addAttribute("boardFileList", boardFileDTOList);
        }
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getId());
        System.out.println("listofcomment = " + commentDTOList);
        if (commentDTOList.size() == 0) {
            model.addAttribute("commentList", null);
        } else {
            model.addAttribute("commentList", commentDTOList);
        }

        return "boardPages/boardDetail";
//        return "redirect:/board?id=" + boardDTO.getId();
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long commentId,@RequestParam("boardId") Long boardId,Model model) {
        System.out.println("will delete this comment:=>"+commentId);
        commentService.delete(commentId);
        BoardDTO dto = boardService.findById(boardId);
        model.addAttribute("board", dto);
        // 첨부된 파일이 있다면 파일을 가져옴
        if (dto.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTOList = boardService.findFile(boardId);
            model.addAttribute("boardFileList", boardFileDTOList);
        }
        List<CommentDTO> commentDTOList = commentService.findAll(boardId);
        System.out.println("listofcomment = " + commentDTOList);
        if (commentDTOList.size() == 0) {
            model.addAttribute("commentList", null);
        } else {
            model.addAttribute("commentList", commentDTOList);
        }
        return "boardPages/boardDetail";
    }



}