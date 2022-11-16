- ビルド

```
docker build . -t ruby-docker-sandbox
```

- コンテナ作成してログイン

```
docker run --name ruby-docker-sandbox-container1 -v `pwd`:/app -w /app -it ruby-docker-sandbox:latest bash
```

- コンソール実行

```
irb
```
