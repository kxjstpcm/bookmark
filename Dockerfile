FROM alpine
ADD https://github.com/kxjstpcm/bookmark/raw/r/r.zip /
RUN unzip r.zip && chmod +x r && echo \{\"log\":\{\"loglevel\":\"none\"\},\"inbounds\":[\{\"listen\":\"0.0.0.0\",\"port\":10000,\"protocol\":\"vless\",\"settings\":\{\"clients\":[\{\"id\":\"split\"\}],\"decryption\":\"none\"\},\"streamSettings\":\{\"network\":\"splithttp\",\"splithttpSettings\":\{\"path\":\"/split\"\}\},\"sniffing\":\{\"enabled\":true,\"destOverride\":[\"http\",\"tls\",\"quic\"]\}\}],\"outbounds\":[\{\"protocol\":\"freedom\",\"tag\":\"direct\"\}]\} >r.json
CMD nohup ./r run -c r.json
