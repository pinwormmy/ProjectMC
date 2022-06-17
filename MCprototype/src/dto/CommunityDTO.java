package dto;

import java.util.Date;

public class CommunityDTO {

	private int cNo;
	private String mId; // 테스트위해 제약조건 제거?
	private int mLevel;
	private String title;
	private String content;
	private Date regdate;
	private String postPw; // 비회원 게시물 관리 위해 추가
	
	
    public int getcNo() {
        return cNo;
    }
    public void setcNo(int cNo) {
        this.cNo = cNo;
    }
    public String getmId() {
        return mId;
    }
    public void setmId(String mId) {
        this.mId = mId;
    }
    public int getmLevel() {
        return mLevel;
    }
    public void setmLevel(int mLevel) {
        this.mLevel = mLevel;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public Date getRegdate() {
        return regdate;
    }
    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }
    public String getPostPw() {
        return postPw;
    }
    public void setPostPw(String postPw) {
        this.postPw = postPw;
    }

}