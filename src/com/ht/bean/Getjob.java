package com.ht.bean;

import java.util.Date;

/**
 * Getjob entity. @author MyEclipse Persistence Tools
 */

public class Getjob implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;

	private Integer jobid;
	private String jobname;
	private Date jobtime;
	private Double jobmoney;
	private String jobdesc;

	private Student student;

	// Constructors

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	/** default constructor */
	public Getjob() {
	}

	/** full constructor */
	public Getjob(String jobname, String jobdesc) {
		this.jobname = jobname;
		this.jobdesc = jobdesc;
	}

	// Property accessors

	public Integer getJobid() {
		return this.jobid;
	}

	public void setJobid(Integer jobid) {
		this.jobid = jobid;
	}

	public String getJobname() {
		return this.jobname;
	}

	public void setJobname(String jobname) {
		this.jobname = jobname;
	}

	public Date getJobtime() {
		return jobtime;
	}

	public void setJobtime(Date jobtime) {
		this.jobtime = jobtime;
	}

	public Double getJobmoney() {
		return jobmoney;
	}

	public void setJobmoney(Double jobmoney) {
		this.jobmoney = jobmoney;
	}

	public String getJobdesc() {
		return this.jobdesc;
	}

	public void setJobdesc(String jobdesc) {
		this.jobdesc = jobdesc;
	}

}