#!/bin/bash

echo "🚀 执行 Postman 接口测试中..."

newman run ./postman/collection.json \
  -e ./postman/environment.json \
  -r cli,html \
  --reporter-html-export ./postman-report.html

echo "✅ 测试完成，报告已生成：postman-report.html"
