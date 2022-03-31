package com.second.space.message.service;




import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.second.space.message.model.MessagesDTO;
import com.second.space.message.model.SmsRequest;
import com.second.space.message.model.SmsResponse;

import lombok.extern.log4j.Log4j;


@PropertySource("classpath:sms.properties")
@Log4j
@Transactional
@Service
public class SmsService {
	
	
	 @Value("${sms.serviceId}") private String serviceId;
	 
	 @Value("${sms.accessKey}") private String accessKey;
	 
	 @Value("${sms.secretKey}") private String secretKey;
	
	
	public SmsResponse sendSms(String recipientPhoneNumber, String content) 
			throws JsonProcessingException, UnsupportedEncodingException, NoSuchAlgorithmException, 
			InvalidKeyException, URISyntaxException {
			log.info(serviceId);
			Long time = System.currentTimeMillis();
	        List<MessagesDTO> messages = new ArrayList<>();
	        messages.add(new MessagesDTO(recipientPhoneNumber, content));

	        SmsRequest smsRequest = new SmsRequest("SMS", "COMM", "82", "01047266975", "테스트", messages);
	        ObjectMapper objectMapper = new ObjectMapper();
	        String jsonBody = objectMapper.writeValueAsString(smsRequest);

	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);
	        headers.set("x-ncp-apigw-timestamp", time.toString());
	        headers.set("x-ncp-iam-access-key", this.accessKey);
	        String sig = makeSignature(time); //암호화
	        headers.set("x-ncp-apigw-signature-v2", sig);

	        HttpEntity<String> body = new HttpEntity<>(jsonBody,headers);

	        RestTemplate restTemplate = new RestTemplate();
	        restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
	        SmsResponse smsResponse = restTemplate.postForObject(new URI("https://sens.apigw.ntruss.com/sms/v2/services/"+this.serviceId+"/messages"), body, SmsResponse.class);

	        return smsResponse;
		
	}
	
	public String makeSignature(Long time) throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException {

        String space = " ";
        String newLine = "\n";
        String method = "POST";
        String url = "/sms/v2/services/"+ this.serviceId+"/messages";
        String timestamp = time.toString();
        String accessKey = this.accessKey;
        String secretKey = this.secretKey;

        String message = new StringBuilder()
                .append(method)
                .append(space)
                .append(url)
                .append(newLine)
                .append(timestamp)
                .append(newLine)
                .append(accessKey)
                .toString();

        SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(signingKey);

        byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
        String encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);

        return encodeBase64String;
    }
	
}
