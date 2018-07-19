package cn.zrr.ssh.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "HW_user")
public class UserModel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int number;
	private String username;
	private String name;
	private String password;
	private String email;
	private String phone;
	//一对多
	@OneToMany(mappedBy = "userModel")
	private Set<BlogModel> blogs;

	//一对一
	@OneToOne(mappedBy="user",cascade=CascadeType.ALL)
	private AddressModel address=null;
	
	public AddressModel getAddress() {
		return address;
	}

	public void setAddress(AddressModel address) {
		this.address = address;
	}

	//多对多
	@ManyToMany
	@JoinTable(name="oa_employeebehave",
		joinColumns =@JoinColumn(name="EMPID"),
		inverseJoinColumns=@JoinColumn(name="BNO")
	)
	private Set<BehaveModel> behaves=null;
	public Set<BehaveModel> getBehaves() {
		return behaves;
	}

	public void setBehaves(Set<BehaveModel> behaves) {
		this.behaves = behaves;
	}

	
	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Set<BlogModel> getBlogs() {
		return blogs;
	}

	public void setBlogs(Set<BlogModel> blogs) {
		this.blogs = blogs;
	}
}
