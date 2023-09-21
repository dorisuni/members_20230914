package com.idea.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;
import java.util.Map;

@Getter
@Setter
@ToString
public class CommentDTO {
    private Long id;
    private String commentWriter;
    private String commentContents;
    private String createdAt;
    private Long boardId;
    private Long likeAmount;
    private String likeMemberJson; // 사용자 정보를 JSON 문자열로 포함
}
