# traefik-vs-nginx-docker

Examples showing how to use Traefik and Nginx for Reverse Proxy.

This repository is to complement my blog post on this topic, [Traefik vs Nginx for Reverse Proxy with Docker on a Raspberry Pi](https://www.alexhyett.com/traefik-vs-nginx-docker-raspberry-pi).

## NGINX Example

```
docker-compose -f docker-compose.nginx.yml up
```

You will then be able to access whoami from http://localhost/whoami (or replace localhost with the IP address of your Raspberry Pi if accessing it remotely)

## Traefik Example

For traefik I have included 2 version, one insecure version for local use and a SSL password protected version.

### Insecure version

```
docker-compose -f docker-compose.traefik.yml up
```

You will then be able to access whoami from http://localhost/whoami and the Traefik dashboard from http://localhost:8080 (or replace localhost with the IP address of your Raspberry Pi if accessing it remotely)

### Secure version

You need to replace `youremailhere` in `traefik.toml` and `yourdomain.com` in `traefik_dynamic.toml` for this to work.

```
docker-compose -f docker-compose.traefik-ssl.yml up
```

You will then be able to access whoami from https://localhost/whoami and the Traefik dashboard from https://localhost/dashboard (or replace localhost with the IP address of your Raspberry Pi or `yourdomain.com` if accessing it remotely).

The username is `admin` and the password is `admin`. Read my blog post on how to set this up, [Traefik vs Nginx for Reverse Proxy with Docker on a Raspberry Pi](https://www.alexhyett.com/traefik-vs-nginx-docker-raspberry-pi)
