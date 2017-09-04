package com.mainWeb.searchBang.utils;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class MyScheduler {
	//@Scheduled(cron = "0 0 12 1 * ?")
	@Scheduled(cron = "0/5 * * * * ?")
	public void updateGrade() {
		System.out.println("1234");
	}
}
