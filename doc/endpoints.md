<snippet>
  <content><![CDATA[
# ${1:Project Name}
API document for the rails server for our FMSC app.

## User endpoints

### Create User
	http://servername/user

	Json data to provide:

	```JavaScript
	{	
		"user": 
		{
	    	"email": "email@domain.com",
	    	"password": "password",
	    	"password_confirmation": "password"
		}
	}
	```
	Response
		```JavaScript
	{	
		"user": 
		{
		//Fill this in
 		}
	}
	```

## Session endpoints

### Login
	http://servername/sessions

></content>
  <tabTrigger>readme</tabTrigger>
</snippet>
