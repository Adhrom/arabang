package com.mainWeb.searchBang.utils;

public class CharMix {
	
	private static CharMix instance = null;
	private CharMix() { }
	public static CharMix getInstance(){
		if(instance == null){
			synchronized (CharMix.class) {
				instance = new CharMix();
			}
		}
		return instance;
	}

	private char [] basket = {'A','B','C','D','E','F','G','F','I','J','K','L'
			,'M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
			,'1','2','3','4','5','6','7','8','9'};

	public String makeMessage(){
		String message = "";

		for(int i = 0 ; i < 7 ; i++){
			int index = (int)(Math.random() * basket.length);
			message += basket[index];
		}
		return message;
	}
}