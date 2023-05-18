####################################### 
##############  Header   ##############
#######################################
# Use a proper Token as BearerID. Check your Whatsapp App 'First Steps' in Meta for developers.
$BearerID = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
$headers=@{}
$headers.Add("content-type", "application/json;charset=UTF-8")
$headers.Add("Authorization", "Bearer $BearerID")

####################################### 
#############  Funcion   ##############
#######################################
function Send-WhatsappMessage {
    param(
        [string]$numberto,
        [string]$template,
        [string]$language,
        [string]$vbody,
        [string]$var1,
        [string]$var2,
        [string]$var3
    )

# JSON Body for message template with 1 variables
$jsonfor_1v ='{
	"messaging_product": "whatsapp",
	"recipient_type": "individual",
	"to": "34' + "$($numberto)" + '",
	"type": "template",
	"template": {
		"name": "' + "$($template)" + '",
		"language": {
			"code": "' + "$($language)" + '"
		},
		"components": [
			{
				"type": "body",
				"for message template with 1 parameter": [
					{
						"type": "text",
						"text": "' + "$($var1)" + '"
					}
				]
			}
		]
	}
}
'
# JSON Body for message template with 2 variables
$jsonfor_2v ='{
	"messaging_product": "whatsapp",
	"recipient_type": "individual",
	"to": "34' + "$($numberto)" + '",
	"type": "template",
	"template": {
		"name": "' + "$($template)" + '",
		"language": {
			"code": "' + "$($language)" + '"
		},
		"components": [
			{
				"type": "body",
				"for message template with 2 parameters": [
					{
						"type": "text",
						"text": "' + "$($var1)" + '"
					},
					{
						"type": "text",
						"text": "' + "$($var2)" + '"
					}
				]
			}
		]
	}
}
'
# JSON Body for message template with 3 variables
$jsonfor_3v ='{
	"messaging_product": "whatsapp",
	"recipient_type": "individual",
	"to": "34' + "$($numberto)" + '",
	"type": "template",
	"template": {
		"name": "' + "$($template)" + '",
		"language": {
			"code": "' + "$($language)" + '"
		},
		"components": [
			{
				"type": "body",
				"for message template with 3 parameters": [
					{
						"type": "text",
						"text": "' + "$($var1)" + '"
					},
					{
						"type": "text",
						"text": "' + "$($var2)" + '"
					},
					{
						"type": "text",
						"text": "' + "$($var3)" + '"
					}
				]
			}
		]
	}
}
'

    # Outputs for some checking
    Write-Host $numberto -B Cyan -F DarkBlue
    Write-Host $template -B Cyan -F DarkBlue
    Write-Host $language -B Cyan -F DarkBlue
    Write-Host $var1 -B Cyan -F DarkBlue
    Write-Host $var2 -B Cyan -F DarkBlue
    Write-Host $var3 -B Cyan -F DarkBlue
    Write-Host $vbody -B Cyan -F DarkBlue
	if($vbody -eq "1"){
	$ElBody = $jsonfor_1v
	}elseif($vbody -eq "2"){
	$ElBody = $jsonfor_2v
	}elseif($vbody -eq "3"){
	$ElBody = $jsonfor_3v
	}
    Write-Host $ElBody -F Cyan

	# Change '<xxxxxxxxxxxxxxx>' and use your telephone number identifier. Again check your Whatsapp App 'First Steps' in Meta for developers.
    $response = Invoke-WebRequest -Uri https://graph.facebook.com/v16.0/<xxxxxxxxxxxxxxx>/messages -UseBasicParsing -Method POST -Headers $headers  -Body  ([System.Text.Encoding]::UTF8.GetBytes($ElBody))
    Write-Host $response -B Red -F DarkBlue
}

####################################### 
#############  Sending   ##############
#######################################
# User one of the following lines for calling the function from this same script. 
# Send-WhatsappMessage -numberto <mobilenumberhere>  -template "<TemplateName_v1>" -language "ca" -vbody 1 -var1 "Ben Linus"
# Send-WhatsappMessage -numberto <mobilenumberhere>  -template "<TemplateName_v2>" -language "ca" -vbody 2 -var1 "Ben Linus" -var2 "The Orchid"
# Send-WhatsappMessage -numberto <mobilenumberhere>  -template "<TemplateName_v3>" -language "ca" -vbody 3 -var1 "Ben Linus" -var2 "The Orchid" -var3 "The Dharma Initiative"

# In the example below we send a whatsapp message to mobile number 555555555  using <TemplateName_v3> which is in catalan language, and with a body built from an specific JSON for a template with 3 variables
Send-WhatsappMessage -numberto <mobilenumberhere>  -template "<TemplateName_v3>" -language "ca" -vbody 3 -var1 "Ben Linus" -var2 "The Orchid" -var3 "The Dharma Initiative"
