# purpose-platform-queued-client

Ruby interface for the queued API service fronting the Purpose Platform which Fight for the Future uses.

## Usage

```ruby
pp = PurposePlatformQueuedClient.new(host: 'your.queued.purposeplatform.org')
pp.action.create(member: {first_name: 'George', last_name: 'Washington', email: 'george@washington.com', postcode: '11238', country: 'US'}, tag: 'bar', org: 'foo')
pp.unsubscribe.create(email: 'foo@bar.com')
```

## Copyright

Copyright (c) 2015 ChangeSprout, Inc. See LICENSE for
further details.

