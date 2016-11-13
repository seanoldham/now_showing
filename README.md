# Now Showing

![Poster](https://s3.amazonaws.com/f.cl.ly/items/0x142i233J361c442o2p/Now%20Showing512.png?v=70bb4dec)

### What I want this app to do:

  1. Allow user to search for a movie or TV show.

  2. Return results from [The Movie Database](https://www.themoviedb.org).

  3. Allow user to choose one.

  4. Give user a choice:
    * Watch Later

    * Watch Now
      * Grab info (title, poster art, Rotten Tomatoes score, release date).
      * Send info to Raspberry Pi-powered monitor that will display artwork and relevant data in a Now Showing frame.

### What this app currently does:

  * Searches TMDb

  * Returns TMDb results in a pretty bitchin' grid

### Setup

  You'll want to run `bundle exec figaro install` and add these keys to `config/application.yml`: `tmdb_key`
