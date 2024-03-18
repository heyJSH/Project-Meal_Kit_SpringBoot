package org.mealkitspringboot.domain;


import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class NoticeVO {
    private int noNum;
    private String empNm;
    private String title;
    private String content;
    private int hit;
    private Date Regdate;
    private String file1Path;
    private String file2Path;
}
