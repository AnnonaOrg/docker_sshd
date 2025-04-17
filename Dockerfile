FROM alpine:latest

# 安装 OpenSSH 服务器
RUN apk update && apk add --no-cache bash git openssh && ssh-keygen -A

## 创建 SSH 运行目录
#RUN mkdir -p /run/sshd /root/.ssh && chmod 700 /root/.ssh
#
## 允许 SSH 密钥认证并禁用密码登录
#RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
#    echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
#    echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config && \
#    echo "AuthorizedKeysFile .ssh/authorized_keys" >> /etc/ssh/sshd_config
#
## 复制 SSH 公钥（在构建时替换 id_rsa.pub）
#COPY id_rsa.pub /root/.ssh/authorized_keys
#RUN chmod 600 /root/.ssh/authorized_keys
## 生成 SSH 主机密钥
#RUN ssh-keygen -A
# 启动 SSH 服务
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
