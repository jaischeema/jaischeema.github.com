---
layout: post
title: Adding Custom Fonts to your iOS App
description: ""
tags: [ios]
---

This is a guide to a pretty basic, yet not so straight-foward step in designing your iOS app - adding custom fonts to your elements.

I am sucker for well designed apps and websites so I had to get rid of the System font and replace it with something subtle. I like Open Sans font family, so why not try it in my first app.

In order to get the custom font to work in your app, you have to have the `ttf` file for that font. Once you have got that file, just drag and drop it into your iOS project.

Once this is done, we can proceed ahead.

* First of all we need to tell the application about the available custom fonts. This is done by using the `YourApp-Info.plist` file in your project.
  * Add a new line to the info-plist
  * Modify the line to the custom font ttf file name
* Now to use the custom font, we need to understand the difference between two font names properties.
  * *FontName* : This the name of the font as the iOS sees. It includes the font style as well. For example for Open Sans Light, it could be "OpenSans-Light".
  * *FontFamilyName*: This is the family name for the font. For example for Open Sans it would be "Open Sans".
  * We need to use the method <code>+ (UIFont *) fontWithName:size:18</code> to get the UIFont to be used in our application. This name is *FontName*.
  * We can use the method <code>+ (NSArray *) fontNamesForFamilyName:</code> to get the all the available font names for a font family.
* That is all the work done. Now you can use it to modify the look of your app.
