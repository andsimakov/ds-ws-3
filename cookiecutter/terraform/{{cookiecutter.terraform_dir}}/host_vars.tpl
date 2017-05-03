letsencrypt_certs:
  - domains:
      - '${domain}'

haproxy_domains:
  - { name: '${domain}', host: '127.0.0.1', port: 8001 }
