# 📦 libcvnss – Cấu trúc thư mục chuẩn & toàn bộ mã nguồn (sẵn sàng copy vào Notepad)

Dưới đây là **cây thư mục hoàn chỉnh** của dự án `libcvnss` kèm **nội dung từng file**.  
Bạn chỉ cần copy từng khối, dán vào Notepad và lưu đúng tên file, đúng thư mục.

---

## 🌳 Cấu trúc thư mục

```
C:\Users\Admin\libcvnss\
│
├── README.md
├── LICENSE
├── CHANGELOG.md
├── .gitignore
│
└── js\
    ├── package.json
    ├── bin\
    │   └── cvnss.js
    ├── src\
    │   ├── cvnss4.0-converter.js   ← (file lõi, giữ nguyên – không thay đổi)
    │   ├── index.js
    │   └── banner.js
    └── test\
        ├── vectors.json
        └── test.js
```

---

## 📄 Nội dung từng file

### 1. `C:\Users\Admin\libcvnss\README.md` – **Giới thiệu dự án**

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

### 2. `C:\Users\Admin\libcvnss\LICENSE` – MIT License

```text
MIT License

Copyright (c) 2026 CVNSS

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
```

---

### 3. `C:\Users\Admin\libcvnss\CHANGELOG.md`

```markdown
# Changelog

## v4.0.0
- Initial public release
- JS converter + CLI
- Basic test vectors
```

---

### 4. `C:\Users\Admin\libcvnss\.gitignore`

```gitignore
node_modules/
*.log
.DS_Store
cvnss.js
```

---

### 5. `C:\Users\Admin\libcvnss\js\package.json`

```json
{
  "name": "libcvnss",
  "version": "4.0.0",
  "description": "Lossless semantic compression for Vietnamese: Unicode (CQN) <-> ultra-compact ASCII (CVNSS)",
  "license": "MIT",
  "main": "src/index.js",
  "bin": {
    "cvnss": "bin/cvnss.js"
  },
  "files": [
    "src",
    "bin",
    "test"
  ],
  "scripts": {
    "test": "node test/test.js"
  },
  "engines": {
    "node": ">=18"
  }
}
```

---

### 6. `C:\Users\Admin\libcvnss\js\bin\cvnss.js`

```javascript
#!/usr/bin/env node
"use strict";

const fs = require("fs");
const path = require("path");

const CVNSS = require(path.join(__dirname, "..", "src"));

function usage() {
  console.error(CVNSS.banner());
  console.error("Usage:");
  console.error("  cvnss <mode> [--no-banner]");
  console.error("");
  console.error("Modes:");
  console.error("  cqn   Compress: Unicode (CQN) -> CVN/CVNSS");
  console.error("  cvn   Decompress: CVNSS -> Unicode (CQN)");
  console.error("  cvss  Decompress: CVNSS -> Unicode (CQN)");
  console.error("");
  console.error("Examples:");
  console.error('  echo tiếng Việt | cvnss cqn');
  console.error('  echo tizb Vidf | cvnss cvn');
  process.exit(2);
}

function main() {
  const args = process.argv.slice(2);
  const mode = (args[0] || "").toLowerCase();
  const noBanner = args.includes("--no-banner");

  if (!mode || (mode !== "cqn" && mode !== "cvn" && mode !== "cvss")) {
    usage();
  }

  const input = fs.readFileSync(0, "utf8"); // stdin
  const out = CVNSS.convert(input, mode);

  if (!noBanner) {
    console.error(CVNSS.banner().trimEnd());
  }

  if (mode === "cqn") {
    if (!out || typeof out.cvn !== "string") {
      throw new Error("Core.convert() must return { cvn: string } for mode=cqn");
    }
    process.stdout.write(out.cvn);
  } else {
    if (!out || typeof out.cqn !== "string") {
      throw new Error("Core.convert() must return { cqn: string } for mode=cvn|cvss");
    }
    process.stdout.write(out.cqn);
  }
}

try {
  main();
} catch (err) {
  console.error("\n[cvnss] Error:", err && err.message ? err.message : err);
  process.exit(1);
}
```

---

### 7. `C:\Users\Admin\libcvnss\js\src\banner.js`

```javascript
"use strict";

function banner() {
  return [
    "CVNSS 4.0  |  libcvnss",
    "Lossless semantic compression for Vietnamese",
    "Unicode (CQN) <-> ASCII (CVNSS)",
    ""
  ].join("\n");
}

module.exports = { banner };
```

---

### 8. `C:\Users\Admin\libcvnss\js\src\index.js`

```javascript
"use strict";

// Core converter (your existing file)
const Core = require("./cvnss4.0-converter");
const { banner } = require("./banner");

/**
 * convert(text, mode)
 * mode: "cqn" | "cvn" | "cvss"
 *
 * NOTE: Core.convert() should return an object like:
 * { cqn: "...", cvn: "...", cvss: "..." } (depending on your implementation)
 */
function convert(text, mode = "cqn") {
  return Core.convert(text, mode);
}

module.exports = {
  banner,
  convert,
  Core
};
```

---

### 9. `C:\Users\Admin\libcvnss\js\test\vectors.json`

```json
[
  { "cqn": "tiếng Việt", "cvn": "tizb Vidf" }
]
```

*(Bạn có thể bổ sung thêm vector sau)*

---

### 10. `C:\Users\Admin\libcvnss\js\test\test.js`

```javascript
"use strict";

const fs = require("fs");
const path = require("path");
const CVNSS = require(path.join(__dirname, "..", "src"));

const vectorsPath = path.join(__dirname, "vectors.json");
const vectors = JSON.parse(fs.readFileSync(vectorsPath, "utf8"));

let ok = 0;
let fail = 0;

for (const v of vectors) {
  const c1 = CVNSS.convert(v.cqn, "cqn");
  const gotCvn = c1.cvn;

  if (gotCvn !== v.cvn) {
    console.error("[FAIL] compress", { in: v.cqn, expected: v.cvn, got: gotCvn });
    fail++;
    continue;
  }

  const c2 = CVNSS.convert(v.cvn, "cvn");
  const gotCqn = c2.cqn;

  if (gotCqn !== v.cqn) {
    console.error("[FAIL] decompress", { in: v.cvn, expected: v.cqn, got: gotCqn });
    fail++;
    continue;
  }

  ok++;
}

console.log(`[TEST] ok=${ok} fail=${fail}`);
process.exit(fail ? 1 : 0);
```

---

## 🚀 Chạy thử ngay

Sau khi đã tạo xong tất cả file:

```cmd
cd C:\Users\Admin\libcvnss\js
npm i
npm link
```

Dùng CLI:

```cmd
echo tiếng Việt | cvnss cqn
echo tizb Vidf | cvnss cvn
```

Chạy test:

```cmd
npm test
```

---

## 📌 Ghi chú

- File `cvnss4.0-converter.js` là **bộ lõi chuyển đổi** – bạn đã có sẵn, không cần tạo lại.  
- Các file còn lại được viết để dự án trở nên **chuyên nghiệp**, sẵn sàng đưa lên GitHub, npm.

Chỉ với Notepad và các khối mã trên, bạn đã có ngay một dự án hoàn chỉnh! 🎉
