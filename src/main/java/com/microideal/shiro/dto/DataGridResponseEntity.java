package com.microideal.shiro.dto;

import java.io.Serializable;
import java.util.List;

public class DataGridResponseEntity<T> implements Serializable {

	private static final long serialVersionUID = -4231114947776691257L;

	private int sEcho;

	private int recordsTotal;

	private int recordsFiltered;

	private List<T> data;

	public int getsEcho() {
		return sEcho;
	}

	public void setsEcho(int sEcho) {
		this.sEcho = sEcho;
	}

	public int getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
	}

	public int getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public DataGridResponseEntity() {
	}

	public DataGridResponseEntity(int sEcho, int recordsTotal, int recordsFiltered, List<T> data) {
		this.sEcho = sEcho;
		this.recordsTotal = recordsTotal;
		this.recordsFiltered = recordsFiltered;
		this.data = data;
	}
}
