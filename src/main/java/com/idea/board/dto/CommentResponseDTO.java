package com.idea.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class CommentResponseDTO {
    private List<CommentDTO> commentDTOList;
    private List<CommentLikeDTO> commentLikeDTOList;
}
