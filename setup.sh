apt update && apt upgrade -y && apt install curl -y && \
curl https://install.zerotier.com/ | bash && \
/usr/sbin/zerotier-one -d && \
echo "Please run \n /usr/sbin/zerotier-cli join YOUR_ZEROTIER_NETWORK"
