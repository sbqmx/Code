package com.wrox;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionIdListener;
import javax.servlet.http.HttpSessionListener;

import sun.print.resources.serviceui;

@WebListener
public class SessionListener implements HttpSessionListener, HttpSessionIdListener {
	
	private SimpleDateFormat formatter = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss");

	@Override
	public void sessionIdChanged(HttpSessionEvent event, String oldSessionId) {
		// TODO Auto-generated method stub
		System.out.println(this.date() + " : Session ID " + oldSessionId + " changed to " + event.getSession().getId());
		SessionRegistry.updateSessionId(event.getSession(), oldSessionId);
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		System.out.println(this.date() + ": Session " + se.getSession().getId() + " created.");
		SessionRegistry.addSession(se.getSession());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		System.out.println(this.date() + " :Session " + se.getSession().getId() + " destroyed.");
		SessionRegistry.removeSession(se.getSession());
	}
	
	
	private String date(){
		return this.formatter.format(new Date());
	}

}
