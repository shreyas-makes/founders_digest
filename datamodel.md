## Users (aka Founders)
IF a user exists, it has a pair to a UserSubmission with status 'approved'

email
password
first_name
last_name
job_role
user_submission_id (MAYBE)
rails g migration Add

`rails g migrationDoSomethingAwesomeWithUsers`

`rails g migration AddFirstNameToUsers first_name`

`rails g migration AddMoreAttrsToUsers`

`rails g migration RemoveAdminFromUsers`

## UserSubmissions
IF a submission is approved, we will map (copy/paste) the fields to a User record.

- email
- first_name
- last_name
- website
- job_role
- text
- status (pending, approved, rejected)
- user_id # MAYBE

`rails g migration CreateUserSubmissions email first_name last_name website job_role text status`

## Projects (aka Newsletters, Stakeholder Updates)
title (example: Fomo.com)
website
description (example: Monthly updates from a bootstrapped solo founder.)
avatar_url (example: https://fomo.com/favicon.ico)
user_id (ex: 5)
rails g model Project title website description avatar_url user:references

## StakeholderUpdates
title
content (example: "This month we...")
digest_id (which Digest does this update belong to?)
`rails g model StakeholderUpdate title content project:references`

## Subscriptions
digest_id (example: 4)
user_id (example: 2)

`rails g model Subscription project:references user:references`

