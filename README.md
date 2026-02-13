# 📦 libcvnss 

---
## 📄 Nội dung 

### **Giới thiệu**

```markdown
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
```

## Install as CLI (từ repo)

```bash
git clone https://github.com/CVNSS/libcvnss.git
cd libcvnss\js
npm i
npm link
```

## CLI usage

**Compress (CQN → CVNSS)**  
```bash
echo tiếng Việt | cvnss cqn
```

**Decompress (CVNSS → CQN)**  
```bash
echo tizb Vidf | cvnss cvn
```

**File in / out**  
```bash
type input.txt | cvnss cqn > out.txt
type out.txt | cvnss cvn > back.txt
```

## JavaScript API

```js
const CVNSS = require("./src"); // js/src/index.js
const out = CVNSS.convert("tiếng Việt", "cqn");
console.log(out.cvn);  // "tizb Vidf"
```

## Tests

```bash
npm test
```

## License

MIT
```

---

### – MIT License – 

```text
MIT License

Copyright (c) 2020 CVNSS4.0, Long Ngo

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
## 📌 Ghi chú

- File `cvnss4.0-converter.js` là **bộ lõi chuyển đổi** – bạn đã có sẵn, không cần tạo lại.  
- Các file còn lại được viết để dự án trở nên **chuyên nghiệp**, sẵn sàng đưa lên GitHub, npm.

Chỉ với Notepad và các khối mã trên, bạn đã có ngay một dự án hoàn chỉnh! 🎉
