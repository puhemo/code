---
layout: post
title: 'Blogging On Github - Part 3 Adding Commenting to Post'
date: 2015-02-09
categories: ['Blogging', 'Github', 'How-To', 'Jekyll']
published: true
---
Welcome to part 3 of our series on blogging with github.  In this lesson you will learn how to add the ability for users to comment on your blog post.

**Lesson Length:** 20 minutes

**Other Lessons in the Series**

* [View Part 1 Getting Started]({{site.url}}/blogging-on-github-part-1/)
* [View Part 2 Creating your first blog post]({{site.url}}/blogging-on-github-part-2-your-first-post/)
* [View Part 4 Creating additional pages]({{ site.url }}/blogging-on-github-part-4-creating-additional-pages/)

### Overview

You may be thinking that commenting isn't really that important but it is a key feature for you to be able to interact with your readers.  Users want to have conversations about your blog post with you and to feel connected to you.   It is also a good way for you to learn from them as well.  

Unfortunately, out of the box Jekyll does not have this  ability.   Luckily, it is really easy to add this ability, thanks to a wonderful tool called Disqus.  Disqus is free but still full featured.

 We will go through the process of getting a Disqus account, configuring  the account,  configuring your blog and testing it all out.

### Section 1:  Configuring Disqus

1. Open another browser window and navigate to [https://disqus.com/admin/signup/?utm_source=New-Site](https://disqus.com/admin/signup/?utm_source=New-Site)

2. Fill out the information request and click the Finish button.  Note: That you can not change the short name value once it is created.  You can have multiple sites under the same account though with different short name values.
![DisqusRegisterSite.png]({{site.url}}/images/DisqusRegisterSite.png)

3. You will be greeted with a "Choose Your Platform" screen like the follow.  Don't worry about any of these options as we are not going to use them.
![DisqusChooseAPlatform.png]({{site.url}}/images/DisqusChooseAPlatform.png)

4. Click on the General link on the left side of the links above the "Choose Your Platform" title.
![DisqusGeneralSettingMenuHighlight.png]({{site.url}}/images/DisqusGeneralSettingMenuHighlight.png)

5. Scroll down to the Site Identity and make sure that the values are correct.  The WebSite Name will appear on your blog when the comments show, so make sure it is what you want it to say.  Take note of your shortname as you will need it in the next section when we config your blog to show Disqus.
![DisqusGeneralSettingSiteIdentity.png]({{site.url}}/images/DisqusGeneralSettingSiteIdentity.png)

6. Scroll down to the next section which should be Community Rules and match the settings to the image below.  To prevent comment spam I always set comments to have to be approved before showing on the site.  The volume on the site will be low enough for now that you will be able to easily manage approving the comments.
![DisqusGeneralSettingCommunityRules.png]({{site.url}}/images/DisqusGeneralSettingCommunityRules.png)

7. Scroll down to the next section which should be Social Platform Intergration and add your twitter account if you have one.  This will ensure that when people share comments on your blog that it includes you in the post.
![DisqusGeneralSettingSocialIntegration.png]({{site.url}}/images/DisqusGeneralSettingSocialIntegration.png)

8.  Click the Save Button

### Section 2: Configuring Your Blog

1. Open a web browser and navigate to your [username].github.io repository. 
2. Click on the _config.yml file to navigate to it 
3. Click on the ![github_edit_button.png]({{site.url}}/images/github_edit_button.png) icon to edit the file
4. Look for the text disqus: and put in your disqus shortname name like below.

	disqus: digitaldrummerj
	
5. Scroll to the bottom of the screen and click on the commit button.  You should put in a comment as well so that you know what changed with the file.

![Github_Save_Changes.png]({{site.url}}/images/Github_Save_Changes.png)


###  Section 3: Testing it out

Open up a web browser and navigate to your blog and click on the title for the blog post that we published in our last lesson.

Scroll to the bottom of the post and you should see a section to add a comment like this:

![DisqusCommentInBlog.png]({{site.url}}/images/DisqusCommentInBlog.png)

### Conclusion

Having comments is an essential part of any blog to open up the communication with your readers.  As you can see Disqus is very easy to add to your blog.


In the next lesson, where you will learn how to create additional pages that are not blog post such as portfolio or about pages.

### Other Lessons

* [Part 1 Getting Started]({{site.url}}/blogging-on-github-part-1/)
* [Part 2 Creating your first blog post]({{site.url}}/blogging-on-github-part-2-your-first-post/)
* Part 3 Adding the ability for readers to comment on your post (this lesson)
* [Part 4 Creating additional pages]({{ site.url }}/blogging-on-github-part-4-creating-additional-pages/)
* Part 5 Adding a page that list post by category
* Part 6 Adding a page that list post by month
* Part 7 Customizing the theme
* Part 8 Adding a custom Google search
* Part 9 Using your own domain name
* Part 10 How to make change locally and push them to Github
* Part 11 Pro Tips