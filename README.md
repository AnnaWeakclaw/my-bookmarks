# Bookmark Manager

The website will have the following specification:

- Show a list of bookmarks
- Add new bookmarks
- Delete bookmarks
- Update bookmarks
- Comment on bookmarks
- Tag bookmarks into categories
- Filter bookmarks by tag
- Users are restricted to manage only their own bookmarks

```
As an internet user
So that I can find useful websites
I want to be able to see a list of bookmarks
```

| Object                | Message                 |
| --------------------- | ----------------------- |
| website = bookmark    | Being displayed         |
| list of bookmarks     | Show bookmarks          |

Client sends a request to the Controller to get Bookmarks.
Controller calls Model to get data and View to display it and send the view back to the Client as a response.

```
As an internet user
So that I can save a website
I would like to add the site's address and title to bookmark manager
```

## Instructions
1. Run _bundle install_
2. Run _rackup -p 4567_
3. Go to [here](url (http://localhost:4567))
4. install server to run the database _brew install postgresql_ and run _pg\_ctl -D /usr/local/var/postgres start_
5. Allow Homebrew to start and stop Postgres service with: "ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents", 
"launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
6. `psql postgres` gives us access to postgres database
7. Create database inside psql: `CREATE DATABASE "name";` or `CREATE TABLE name;` in this case `CREATE DATABASW bookmark_manager;`
8. Connect to the database inside psql by writing `\c bookmark_manager;`
9. Run the query from migrations file `db/migrations`
10. Install TablePlus and connect to bookmark_manager database
11. Create a test database called `bookmark_manager_test`

```
As an internet user
So that I can save a link to a new and intereting website
I would like to add the site's address and title to bookmark manager
```