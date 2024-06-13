# ActiveCampaign gem targeting v3 of their API

This is a very simple gem targeting API v3.  So far it only has contact actions.


### Configure

Set env vars for AC_URL and AC_KEY, both found in your activecampaign settings.

```Ruby
## Use
irb(main):002:0> client = ActiveCampaign::Client.new
irb(main):001:0> client.contact(1)
=>
{"contactAutomations"=>[],
 "contactData"=>
  [{"contact"=>"1",
    "tstamp"=>"2023-10-09T11:48:48-05:00",
...

```

## Doc

[https://developers.activecampaign.com/reference/overview](https://developers.activecampaign.com/reference/overview)


## Tests

bundle install && bundle exec rake test

## notes

