---
layout: post
title: 'WebApi with Credentials CORS Solved'
date: 2016-05-12 06:00
categories: ['webapi','cors']
published: true
excerpt: |
    
---


**global.asax.cs**

	protected void Application_BeginRequest()
    {
        string origin = Request.Headers.Get("ORIGIN");
        if (origin != null)
        {
            Request.Headers.Add("Access-Control-Allow-Origin", origin);

        }

        if (Request.HttpMethod == "OPTIONS")
        {
            HttpContext.Current.Response.StatusCode = 200;
            CompleteRequest();
        }
    }


**web.config**

	<system.webServer>
		<security>
			<authentication>
				<windowsAuthentication enabled="true" />
				<anonymousAuthentication enabled="false" />
			</authentication>
		</security>
	</system.webServer>


**nuget package**

Microsoft.AspNet.Cors

**WebApiConfig.cs**

    //CORS
    EnableCorsAttribute cors = new EnableCorsAttribute(
        "*",
        "*",
        "GET,POST,PUT,DELETE,OPTIONS"
        )
    {
        SupportsCredentials = true
    };

    config.EnableCors(cors);

## Further Reading


[http://www.asp.net/web-api/overview/security/enabling-cross-origin-requests-in-web-api](http://www.asp.net/web-api/overview/security/enabling-cross-origin-requests-in-web-api)