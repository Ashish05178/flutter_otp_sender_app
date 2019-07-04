

<?php
//post
$otp = $_POST['otp'];
$number = $_POST['number'];
$intnumber=(int)$number;
$url="http://www.way2sms.com/api/v1/sendCampaign";
$messtext="Your otp is ";
$message = urlencode($messtext.$otp);// urlencode your message
$curl = curl_init();
curl_setopt($curl, CURLOPT_POST, 1);// set post data to true
curl_setopt($curl, CURLOPT_POSTFIELDS, "apikey="Enter your api key"&secret="Enter your scret key"&usetype=stage&phone=$intnumber&senderid="Email Id"&message=$message");// post data
// query parameter values must be given without squarebrackets.
 // Optional Authentication:
curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($curl, CURLOPT_URL, $url);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
$result = curl_exec($curl);
curl_close($curl);
echo $result;
?>
