Memberships
√* User should see link for basic plan on home page
√* User should see link for pro plan on home page
√* Basic plan link should point to regular devise sign up form
√* Pro plan link should point to a custom sign up form.


Stripe Integration
√* Users shouls have a stripe customer token in the user table
√* JS should prevent Pro form from submitting , when user fills out
√* JS Should send card info to stripe.
√* Stripe will return a card token (a one time use token).

* JS will take the card token and user fields (omitting card fields) and submit that to our rails app for validation.
* Rails app should validate the user fields including note whether plan 1 or plan 2
* Once validated, Rails should send user info (email, plan ID) and card token to stripe server and stripe
will create a subscription and send back customer token.
* Now rails should save Rails customer token and user information to our database.

USER PROFILES
√ *Each user should have one profile
*User should see a link to the new profile form upon signup
*User should be able to create, view, and edit their user profile.
*User profile should have a profile picture
*User should be able to view all user profiles
