package com.idea.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentLikeDTO {
    private Long id;
    private int checkLike;
    private Long memberId;
    private Long commentId;
    private Long boardId;
}
