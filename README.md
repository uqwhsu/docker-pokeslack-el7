# PokeSlack CentOS 7 Docker image

## Introduction

This is used to run a local [timwah/pokeslack](https://github.com/timwah/pokeslack) notification bot because it can no longer be run on Heroku.  See [Unexpected HTTP server response - needs 200 got 403](https://github.com/timwah/pokeslack/issues/28) .  Additional included features:

* **centos:7** base image
* timezone environment setting
* auto restart bot after 15 minutes

References:
- [PokeSlack - Slackbot notifications about Pokemon near you](https://www.reddit.com/r/pokemongodev/comments/4ul2r1/pokeslack_slackbot_notifications_about_pokemon/)

## Usage notes

Edit the `.env` configuration file, then update the systemd `docker-pokeslack.service` script to mount the configuration file as volume as well as define the timezone settting, or run it all from command line.

## Variables

- **LOCALTIMEZONE** : Time zone name used in value of TZ environment variable (Default: UTC)

## Volumes

- /opt

## Complete Example

```bash
docker build -t uqwhsu/pokeslack --rm=true --force-rm=true .

docker run -h pokeslack \
  -e LOCALTIMEZONE=Australia/Brisbane \
  -v ~/dev/docker/pokeslack/data/opt/.env:/opt/.env \
  uqwhsu/pokeslack
```
Check your #pokealert Slack channel after starting the container.

***

## Additional Information

Please see: [PokeSlack README](https://github.com/timwah/pokeslack/blob/master/README.md)

