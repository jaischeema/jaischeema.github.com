---
layout: post
title: Updating records with similar fields in Elm
tags: [programming, elm]
---

While working in Elm, I came across the problem of updating records that had
similar fields but I had to write a function for each type due to lack of type
classes.

Lets say we have the following two records defined in our app and we want to
update the error field in both these records with a `String` type.

{% highlight haskell %}
type alias UserForm =
  { name: String
  , error: Maybe String
  }

type alias VehicleForm =
  { registration: String
  , error: Maybe String
  }
{% endhighlight %}

Before I found this trick, I had to write two functions, one for each record.

{% highlight haskell %}
addErrorToUserForm: UserForm -> String -> UserForm
addErrorToVehicleForm: VehicleForm -> String -> VehicleForm
{% endhighlight %}

The solution was hidden in [Richard Feldman's amazing open
source](https://github.com/rtfeldman/elm-spa-example/blob/d0d7a64d6a52f81ecbd4f0b9e09266ea1e30f787/src/Util.elm#L48)
application.

{% highlight haskell %}
addError: { model | error: Maybe String } -> String -> { model | error: Maybe String }
addError record message =
  { record | error = Just message}
{% endhighlight %}

Great, isn't it. I just love Elm, even with all its shortcomings :)
