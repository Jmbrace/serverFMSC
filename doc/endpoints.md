
# FMSC Server
API document for the rails server for our FMSC app.

## User endpoints

### Create User
    POST to http://servername/api/users

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
	  "id": 2,
	  "email": "email@domain.com",
	  "created_at": "2016-04-09T03:32:27.843Z",
	  "updated_at": "2016-04-09T03:32:27.843Z",
	  "auth_token": "eTS5Q1X8e-SxuguM-8S9"
	}
	```

### Update User

### Show User

### Delete User

## Session endpoints

### Login
	POST to http://servername/api/sessions

	Json data to provide:

	```JavaScript
	{	
		"session": 
		{
	    	"email": "email@domain.com",
	    	"password": "password",
		}
	}
	```
	Response
		```JavaScript
	{
	  "id": 2,
	  "email": "email@domain.com",
	  "created_at": "2016-04-09T03:32:27.843Z",
	  "updated_at": "2016-04-09T03:32:27.843Z",
	  "auth_token": "eTS5Q1X8e-SxuguM-8S9"
	}
	```

### Logout
	DELETE to https://fmsc-server.herokuapp.com/api/sessions/:authToken
	Where :authToken is the literal token concatanated at the end of the URL


	Json data to provide:

	```JavaScript
	None
	```
	Response
		```JavaScript
	Nothing, a 204 in the header though.
	```

