# omniplay
A simple web app that allows you to play audio by uploading a file


## Running omniplay
VLC and Ruby 2.3.1 are prerequisites for running omniplay. If you're on macOS, you should define these aliases in your `.bash_profile` or similar (see the [vlc-client gem](https://github.com/mguinada/vlc-client)):

```bash
echo "alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'" >> ~/.bash_profile
echo "alias cvlc='/Applications/VLC.app/Contents/MacOS/VLC'" >> ~/.bash_profile
```

Run `gem install bundler` and `bundle install` in the project root to install the necessary gems. Run omniplay with `bin/run_development`. Omniplay will then be accessible on [http://localhost:4567](http://localhost:4567).

If you want a more permanent installation, consider running omniplay with unicorn and nginx: [Nginx proxied to unicorn](http://recipes.sinatrarb.com/p/deployment/nginx_proxied_to_unicorn). Then start and stop omniplay with:

```bash
bin/start_unicorn_daemon
bin/stop_unicorn_daemon
```
