

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.proxy import *
import urllib2 , urllib

def get_token (user_name, pass_word):
	myProxy = 'https://127.0.0.1:8580'
	proxy = Proxy({'proxyType': ProxyType.MANUAL,'httpProxy': myProxy,'ftpProxy': myProxy,'sslProxy': myProxy,'noProxy':''})
	brows = webdriver.Firefox(proxy=proxy)
	brows.get('https://twitter.com')
	element = browser.find_element_by_id('signin-email')
	element.send_keys(user_name)
	element = browser.find_element_by_id('signin-password')
	element.send_keys(pass_word)
	element.send_keys(Keys.ENTER)
	cookies = browser.get_cookies()
	for i in cookies :
		if i['name'] == 'auth_token' :
			token = "auth_token=" + str(i['value'])
			break
	
	return token
'''
	saveFile = open(token.tkn,'w')
	saveFile.write("auth_token=" + token)
	saveFile.close()
'''
