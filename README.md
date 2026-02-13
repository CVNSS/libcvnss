# libcvnss

**Lossless semantic compression for Vietnamese**  
Unicode (CQN) ↔ ultra‑compact ASCII (CVNSS)

`libcvnss` là thư viện “nén ngữ nghĩa” tiếng Việt (không phải nén nhị phân).  
Nó chuyển Unicode tiếng Việt sang ASCII siêu gọn (CVNSS) và giải nén ngược lại **100% đúng**.

---

## Quick start (HTTP one‑shot)

### Windows CMD
```bat
curl -fL -o cvnss.js https://raw.githubusercontent.com/CVNSS/libcvnss/main/js/src/cvnss4.0-converter.js ^
&& node -e "const C=require('./cvnss.js'); console.log(C.convert('tiếng Việt','cqn').cvn)"
