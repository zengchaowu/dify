#!/bin/bash

# Dify 前置网关管理脚本
# 监听8080端口，转发/dify/*请求到localhost:80

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.."

case "${1:-help}" in
    start)
        echo "启动 Dify 前置网关..."
        docker-compose -f docker-compose.gateway.yaml up -d
        echo "✅ 网关已启动"
        echo "🌐 访问地址: http://localhost:8080/dify/"
        echo "💓 健康检查: http://localhost:8080/health"
        ;;
    
    stop)
        echo "停止 Dify 前置网关..."
        docker-compose -f docker-compose.gateway.yaml down
        echo "✅ 网关已停止"
        ;;
    
    restart)
        echo "重启 Dify 前置网关..."
        docker-compose -f docker-compose.gateway.yaml down
        sleep 2
        docker-compose -f docker-compose.gateway.yaml up -d
        echo "✅ 网关已重启"
        ;;
    
    status)
        echo "=== Dify 前置网关状态 ==="
        docker-compose -f docker-compose.gateway.yaml ps
        ;;
    
    logs)
        docker-compose -f docker-compose.gateway.yaml logs -f
        ;;
    
    test)
        echo "测试网关连接..."
        curl -s http://localhost:8080/health && echo " ✅ 网关运行正常" || echo " ❌ 网关连接失败"
        ;;
    
    *)
        echo "Dify 前置网关管理"
        echo ""
        echo "用法: $0 {start|stop|restart|status|logs|test}"
        echo ""
        echo "命令说明:"
        echo "  start   - 启动网关服务"
        echo "  stop    - 停止网关服务"  
        echo "  restart - 重启网关服务"
        echo "  status  - 查看服务状态"
        echo "  logs    - 查看服务日志"
        echo "  test    - 测试网关连接"
        echo ""
        echo "网关配置:"
        echo "  监听端口: 8080"
        echo "  转发规则: /dify/* -> localhost:80/*"
        ;;
esac 