package com.helper;

public class Message {
	
	private String messageString;
	private String messageType;
	public String getMessageString() {
		return messageString;
	}
	public void setMessageString(String messageString) {
		this.messageString = messageString;
	}
	public String getMessageType() {
		return messageType;
	}
	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}
	public Message(String messageString, String messageType) {
		super();
		this.messageString = messageString;
		this.messageType = messageType;
	}
	
	
	
	public Message() {
		// TODO Auto-generated constructor stub
	}
}
