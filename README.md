# libcvnss

Lossless semantic compression for Vietnamese: Unicode (CQN) ↔ ultra-compact ASCII (CVNSS).

## Run locally
```bat
cd js
node -e "const C=require('./src/cvnss4.0-converter'); console.log(C.convert('tiếng Việt','cqn').cvn)"
