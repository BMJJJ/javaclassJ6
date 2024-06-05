package random;

public class PlaceVO {
	private int idx;
	private String jiyok;
	private String jangso;
	private String img;
	private String story;
	private String nickName;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getJiyok() {
		return jiyok;
	}
	public void setJiyok(String jiyok) {
		this.jiyok = jiyok;
	}
	public String getJangso() {
		return jangso;
	}
	public void setJangso(String jangso) {
		this.jangso = jangso;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	@Override
	public String toString() {
		return "PlaceVO [idx=" + idx + ", jiyok=" + jiyok + ", jangso=" + jangso + ", img=" + img + ", story=" + story
				+ ", nickName=" + nickName + "]";
	}
}
