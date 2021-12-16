package logic.dto;

import java.util.Date;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public class Review {
	private int num;
	private String itemid;
	private String writer;
	private int score;
	private String content;
	private String imgPath;
	private MultipartFile imgFile;
	private Date regDate;
	private Date update;
	private int views;
	private Map<String, Integer> surveyMap;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public MultipartFile getImgFile() {
		return imgFile;
	}
	public void setImgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdate() {
		return update;
	}
	public void setUpdate(Date update) {
		this.update = update;
	}
	public Map<String, Integer> getSurveyMap() {
		return surveyMap;
	}
	public void setSurveyMap(Map<String, Integer> surveyMap) {
		this.surveyMap = surveyMap;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	@Override
	public String toString() {
		return "Review [num=" + num + ", itemid=" + itemid + ", writer=" + writer + ", score=" + score + ", content="
				+ content + ", imgPath=" + imgPath + ", imgFile=" + imgFile + ", regDate=" + regDate + ", update="
				+ update + ", views=" + views + ", surveyMap=" + surveyMap + "]";
	}
}
