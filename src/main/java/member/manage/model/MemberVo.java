package member.manage.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.xml.bind.annotation.XmlRootElement;

import org.hibernate.validator.constraints.NotEmpty;
@XmlRootElement(name = "memberVo")
public class MemberVo {
	@NotEmpty
	private String userid;
	@NotEmpty
	private String pass;
	@NotEmpty
	private String usernm;
	private Date reg_dt;
	private String alias;
	private String addr1;
	private String addr2;
	private String zipcode;
	private String filename;
	private String realFilename;
	
	public MemberVo() {
		
	}
	
	public MemberVo(String userid, String pass, String usernm, String alias, String addr1, String addr2,
			String zipcode, String filename, String realFilename) {
		
		//super(); 부모 클래스는 Object. 따라서 필요없다.
		this.userid = userid;
		this.pass = pass;
		this.usernm = usernm;
		this.reg_dt = reg_dt;
		this.alias = alias;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.zipcode = zipcode;
		this.filename = filename;
		this.realFilename = realFilename;
	}

	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRealFilename() {
		return realFilename;
	}
	public void setRealFilename(String realFilename) {
		this.realFilename = realFilename;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getUsernm() {
		return usernm;
	}
	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public String getFmt_reg_dt() {
		return reg_dt == null?"" : new SimpleDateFormat("yyyy-MM-dd").format(reg_dt);
	}
	
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	@Override
	public String toString() {
		return "MemberVo [userid=" + userid + ", pass=" + pass + ", usernm=" + usernm + ", reg_dt=" + reg_dt
				+ ", alias=" + alias + ", addr1=" + addr1 + ", addr2=" + addr2 + ", zipcode=" + zipcode + ", filename="
				+ filename + ", realFilename=" + realFilename + "]";
	}
	
	
}
