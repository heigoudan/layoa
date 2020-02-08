package com.situ.layoa.layResult.domain;

import java.io.Serializable;
//layui的返回对象
public class LayResult implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer code;//结果状态 0为成功
	private String msg; //结果信息，如果不成功请书写原因
	private Integer count; //数据总数
	private Object data; //返回的结果，可以是任意的类型
	
	public LayResult() { //无参构造函数
		
	}

	public LayResult(Integer code, String msg, Object data) {
		super();   //三参构造函数
		this.code = code;
		this.msg = msg;
		this.data = data;
	}
	
	
	

	public LayResult(Integer code, String msg, Integer count, Object data) {
		super(); //四参构造方法
		this.code = code;
		this.msg = msg;
		this.count = count;
		this.data = data;
	}
	

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
	
}
