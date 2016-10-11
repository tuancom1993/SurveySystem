package com.surveysystem.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the template database table.
 * 
 */
@Entity
@Table(name="template")
@NamedQuery(name="Template.findAll", query="SELECT t FROM Template t")
public class Template implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idtemplate;

	private String cover;

	@Temporal(TemporalType.DATE)
	private Date createdate;

	private int indexselect;

	private String maincolor;

	private String title;

	//bi-directional many-to-one association to Tag
	@ManyToOne
	@JoinColumn(name="idtag")
	private Tag tag;

	public Template() {
	}

	public int getIdtemplate() {
		return this.idtemplate;
	}

	public void setIdtemplate(int idtemplate) {
		this.idtemplate = idtemplate;
	}

	public String getCover() {
		return this.cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public Date getCreatedate() {
		return this.createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public int getIndexselect() {
		return this.indexselect;
	}

	public void setIndexselect(int indexselect) {
		this.indexselect = indexselect;
	}

	public String getMaincolor() {
		return this.maincolor;
	}

	public void setMaincolor(String maincolor) {
		this.maincolor = maincolor;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Tag getTag() {
		return this.tag;
	}

	public void setTag(Tag tag) {
		this.tag = tag;
	}

}