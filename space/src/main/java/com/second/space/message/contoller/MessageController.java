package com.second.space.message.contoller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.second.space.message.model.Request;
import com.second.space.message.model.SmsResponse;
import com.second.space.message.service.SmsService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequiredArgsConstructor
public class MessageController {

	
	private final SmsService smsService;
	
	@PostMapping("/msg/sms")
	public String test(@RequestBody Request request) throws NoSuchAlgorithmException, URISyntaxException, UnsupportedEncodingException, InvalidKeyException, JsonProcessingException {
		log.info(request);
		
		//인증번호
		int randomint = (int)(Math.random() * 90000) + 10000; 
		String randomString = Integer.toString(randomint);
		log.info(randomString);
		request.setContent("인증번호는["+randomint+"]입니다.");
		SmsResponse data = smsService.sendSms(request.getRecipientPhoneNumber(), request.getContent());
		ResponseEntity.ok().body(data);
        return randomString;
    }
}
