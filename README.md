# README

#### Prerequisites

 * Rails 5.2.0
 * ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-linux]
 * Sqilte3 3.16.2 for development/PostgreSQL for Production(Heroku)
 * Ubuntu 17.10(artful)(Used as development machine)

#### Considerations

1. A User can create shortened URL for any URL. stats could be accessible via Open Stats API.
2. A Registered User can create shortened URL for any URL. API stats and Analytics will be available to specific 
Registered user only. stats could be accessible via authenticated Stats API call and  Analytics will be available via 
Web application  

#### API-Requests (Token needs to be change.)

API requests requires an HTTP Token authentication. Authentication Token will be available to User as a `auth_token`
 attribute. 

###### Open Stats API
```CURL
curl --request GET \
  --url http://localhost:3000/web_addresses/1/stats
```
###### Authenticated Stats API

```CURL
curl --request GET \
  --url http://localhost:3000/web_addresses/2/stats \
  --header 'authorization: Token token=ZQhAWkjy1hD5vXrRWkFCa7Lq'
```  

#### Tests 

To run tests `rspec .`  
