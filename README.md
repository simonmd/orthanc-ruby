# Orthanc-ruby

##### A Ruby implementation of the [Orthanc](http://orthanc-server.com) DICOM server v0.8.6 REST API

##### Extremely Alpha!! Not ready for production. Anything may change, including resource nesting and naming schemes.

(This is my first API client gem, experienced help or advice would be most appreciated) :)

## Installation

**NOTE:** If you need an instance of Orthanc to test against, you can build a ready-to-use Orthanc server VM with the [orthanc-vagrant](https://github.com/chafey/orthanc-vagrant) project.

Add this line to your application's Gemfile:

```ruby
gem 'orthanc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install orthanc

## Usage
The gem tries to follow the Orthanc API naming scheme as closely as possible, converting methods and response items to snake case to make the experience more ruby-like.

    api=Orthanc::Client.new("localhost", "8042")
    api.all_patients
    api.all_patients.first
    api.system.database_version => 5
    api.statistics.count_studies => 14

You get the picture. 

All implemented resources (for now) can be found in [here](http://www.rubydoc.info/github/simonmd/orthanc-ruby/master/Orthanc/Client)


## Contributing

1. Fork it ( https://github.com/[my-github-username]/orthanc/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

MIT License
