package logic;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public class Item {
	private String itemid;
	private String sellerid;
	private String title;
	private String imgPath;
	private MultipartFile imgFile;
	private String description;
	private int price;
	private String brandcode;
	private String brandname;
	private String content;
	private String color;
	private String fit;
	private String style;
	private Date regDate;
	private Date update;
	private Map<String, String> sizeMap;
	private List<String> imgPathList;
	private int views;

	private List<MultipartFile> imgFileList;
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public String getSellerid() {
		return sellerid;
	}
	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getBrandcode() {
		return brandcode;
	}
	public void setBrandcode(String brandcode) {
		this.brandcode = brandcode;
	}
	public String getBrandname() {
		return brandname;
	}
	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getFit() {
		return fit;
	}
	public void setFit(String fit) {
		this.fit = fit;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
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
	public Map<String, String> getSizeMap() {
		return sizeMap;
	}
	public void setSizeMap(Map<String, String> sizeMap) {
		this.sizeMap = sizeMap;
	}
	public List<String> getImgPathList() {
		return imgPathList;
	}
	public void setImgPathList(List<String> imgPathList) {
		this.imgPathList = imgPathList;
	}
	public List<MultipartFile> getImgFileList() {
		return imgFileList;
	}
	public void setImgFileList(List<MultipartFile> imgFileList) {
		this.imgFileList = imgFileList;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	@Override
	public String toString() {
		return "Item [itemid=" + itemid + ", sellerid=" + sellerid + ", title=" + title + ", imgPath=" + imgPath
				+ ", imgFile=" + imgFile + ", description=" + description + ", price=" + price + ", brandcode="
				+ brandcode + ", brandname=" + brandname + ", content=" + content + ", color=" + color + ", fit=" + fit
				+ ", style=" + style + ", regDate=" + regDate + ", update=" + update + ", sizeMap=" + sizeMap
				+ ", imgPathList=" + imgPathList + ", views=" + views + ", imgFileList=" + imgFileList + "]";
	}
}
