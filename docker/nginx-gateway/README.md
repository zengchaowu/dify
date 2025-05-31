# Dify 前置网关

这是一个基于 Nginx 的前置网关，用于处理带有 `/dify/` 前缀的请求并转发到后端服务。

## 功能特性

- **端口监听**: 8080
- **路径转发**: `/dify/*` → `localhost:80/*`
- **前缀处理**: 自动去掉 `/dify` 前缀
- **健康检查**: `/health` 端点
- **日志记录**: 完整的访问和错误日志

## 快速开始

### 启动网关
```bash
cd docker/nginx-gateway
./gateway.sh start
```

### 停止网关  
```bash
./gateway.sh stop
```

### 查看状态
```bash
./gateway.sh status
```

### 查看日志
```bash
./gateway.sh logs
```

### 测试连接
```bash
./gateway.sh test
```

## 使用方式

网关启动后，可以通过以下方式访问：

- **主要访问地址**: http://localhost:8080/dify/
- **健康检查**: http://localhost:8080/health
- **根路径**: http://localhost:8080/ (自动重定向到 `/dify/`)

## 配置文件说明

- `nginx.conf`: 主配置文件
- `conf.d/default.conf`: 服务器配置
- `proxy.conf`: 代理设置
- `gateway.sh`: 网关管理脚本

## 注意事项

1. 确保本地 80 端口有服务在运行
2. 确保 Docker 已安装并正在运行
3. 网关会自动处理重定向以保持 `/dify/` 前缀

## 目录结构

```
nginx-gateway/
├── nginx.conf              # 主配置文件
├── proxy.conf             # 代理设置
├── conf.d/
│   └── default.conf       # 服务器配置
├── gateway.sh             # 管理脚本
└── README.md              # 使用说明
``` 