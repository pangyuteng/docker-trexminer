### ubuntu mining with docker-trexminer

+ clone repo
```
git clone git@github.com:pangyuteng/docker-trexminer.git
cd docker-trexminer
```

+ make sure to check trexminer and CUDA versions in `Dockerfile`.

+ updated `.env` and `docker-compose.yml` to switch coin, pool and wallet address!

+ run below to start mining.

```
bash up.sh

# or with the pill for gtx 1080/ti
bash up.sh pill
```
