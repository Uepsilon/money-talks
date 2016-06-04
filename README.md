# money-talks
Secure Messaging through bank transactions


# API Calls
- POST https://hackathon.postbank.de:443/bank-api/blau/postbankid/token?username=Funk1&password=Abc12345

(using Postman: in Settings check "Retain headers when clicking on links" -> on)

copy the token in the header of the next GET request-> key: x-auth value: token
change Content-Type to application/json
- GET https://hackathon.postbank.de:443/bank-api/blau/postbankid/passwordchange
copy the response
click the link "href": "https://hackathon.postbank.de:443/bank-api/blau/postbankid/passwordchange"
Set req to POST
paste the responce in to the body. Set type to raw and application/json
set a new password -> "newPassword": "newpass12345"
- POST https://hackathon.postbank.de:443/bank-api/blau/postbankid/passwordchange
your new password is set.

Now:
use your new password with empty body and header
- POST https://hackathon.postbank.de:443/bank-api/blau/postbankid/token?username=Funk1&password=newpass12345
you get as responce:
{
  "messages": [],
  "token": "000001551b99ad12b6100289e5f400c271ac1ff2f3584da4_blau_ls00627y",
  "userId": "0059460540",
  "links": [
    {
      "rel": "self",
      "href": "https://hackathon.postbank.de:443/bank-api/blau/postbankid/token/000001551b99ad12b6100289e5f400c271ac1ff2f3584da4_blau_ls00627y"
    },
    {
      "rel": "customers",
      "href": "https://hackathon.postbank.de:443/bank-api/blau/postbankid/"
    },
    {
      "rel": "status",
      "href": "https://hackathon.postbank.de:443/bank-api/blau/postbankid/status"
    },
    {
      "rel": "mobilecharging/providers",
      "href": "https://hackathon.postbank.de:443/bank-api/blau/postbankid/mobilecharging/providers"
    }
  ]
}
Browse your files:
you need to set header x-auth to your new token: (works for about 30 min.)
- GET https://hackathon.postbank.de:443/bank-api/blau/postbankid/
than go to
- GET https://hackathon.postbank.de:443/bank-api/blau/postbankid/credittransfer
copy the responce
- GET https://hackathon.postbank.de:443/bank-api/blau/postbankid/authorizationdevices
copy the bestSign device:
{
  "messages": [],
  "identifier": "403217",
  "method": "bestSign",
  "numberOfFailedAttempts": 0,
  "methodState": "GUELTIG",
  "limitOfFailedAttempts": 9,
  "preferredDevice": false,
  "name": "Belledin",
  "sealOneId": "S504G-1G05G-1E8D7",
  "links": []
}
put it in the "authorizationDevice" from credittransfer and fill in sender IBAN (as String) and purpose and recipient IBAN, amount and accountHolder

- POST https://hackathon.postbank.de:443/bank-api/blau/postbankid/credittransfer
