# gh_contrib

GitHub has a nice feature of [contributions](https://help.github.com/articles/viewing-contributions-on-your-profile-page/).
But unfortunately they don't offer an official API.
Now somehow we can get only from here (`https://github.com/users/<username>/contributions`). It returns HTML :cry:.
This is just parsing HTML to JSON or returns as Ruby's object.

## Usage

### CLI

```zsh
$ gem install gh_contrib

$ gh_contrib username

$ echo 'GITHUB_USERNAME=username
$ GITHUB_PASSWORD=password' > .env

# or you can define on shell
# export GITHUB_USERNAME=username
# export GITHUB_PASSWORD=password

$ gh_contrib username
$ gh_contrib username -d month
```

### API

```ruby
require 'gh_contrib'

agent = GhContrib::Agent.new
puts agent.contributions 'username'

agent.login 'username', 'password'

puts agent.contributions 'username'
puts agent.contributions_by_month 'username'
```

## Tips

* Sum all the contributions with [jq](http://stedolan.github.io/jq/).

```zsh
$ gh_contrib banyan | jq 'reduce .[].count as $item (0; . + $item)'
4698
```

## Limitations

* You can't enable two factor authentication for this user if you want to get the data as logged in :cry:.
