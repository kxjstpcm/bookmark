FROM alpine
ADD https://github.com/kxjstpcm/bookmark/raw/r/r.zip /
ADD https://github.com/kxjstpcm/bookmark/raw/gs/s.zip /
RUN unzip r.zip && chmod +x r && unzip s.zip && chmod +x s && echo \{\"log\":\{\"loglevel\":\"none\"\},\"inbounds\":[\{\"listen\":\"0.0.0.0\",\"port\":10000,\"protocol\":\"vless\",\"settings\":\{\"clients\":[\{\"id\":\"split\"\}],\"decryption\":\"none\"\},\"streamSettings\":\{\"network\":\"splithttp\",\"splithttpSettings\":\{\"path\":\"/split\"\}\},\"sniffing\":\{\"enabled\":true,\"destOverride\":[\"http\",\"tls\",\"quic\"]\}\}],\"outbounds\":[\{\"tag\":\"http\",\"protocol\":\"http\",\"settings\":\{\"servers\":[\{\"address\":\"127.0.0.1\",\"port\":55555\}]\},\"streamSettings\":\{\"network\":\"tcp\"\}\}]\} >r.json && echo \{\"log\":\{\"disabled\":true\},\"dns\":\{\"servers\":[\{\"tag\":\"dns\",\"address\":\"1.0.0.1\",\"strategy\":\"prefer_ipv6\",\"detour\":\"wg\"\}]\},\"inbounds\":[\{\"listen\":\"127.0.0.1\",\"listen_port\":55555,\"type\":\"http\"\}],\"outbounds\":[\{\"tag\":\"wg\",\"type\":\"wireguard\",\"server\":\"162.159.195.81\",\"server_port\":7559,\"local_address\":[\"172.16.0.2/32\",\"2606:4700:110:8406:59ae:6bc1:a364:3455/128\"],\"private_key\":\"UP/cEzM/AnCSRmJV7TEHw5K23jQwR62X+2O+XkkFL2M=\",\"peer_public_key\":\"bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=\",\"mtu\":1420\}]\} >s.json
CMD nohup ./s run -c s.json & ./r run -c r.json
