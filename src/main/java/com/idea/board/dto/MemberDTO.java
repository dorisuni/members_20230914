package com.idea.board.dto;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@ToString
public class MemberDTO {
    private Long id;
    private String memberEmail;
    private String memberPassword;
    private String memberName;
    private Date memberBirth;
    private String memberMobile;
    private String memberBasicAddress;
    private String memberDetailAddress;
}
