# 📦 libcvnss  
**Lossless semantic compression for Vietnamese**  
Unicode (CQN) ↔ ultra‑compact ASCII (CVNSS) • 100% reversible  

---

## 🚀 Quick start (one file, no install)

```bat
curl -fL -o cvnss.js https://raw.githubusercontent.com/CVNSS/libcvnss/main/js/src/cvnss4.0-converter.js ^
&& node -e "const C=require('./cvnss.js'); console.log(C.convert('tiếng Việt','cqn').cvn)"
# → tizb Vidf
```

---

## 📦 CLI (from source)

```bash
git clone https://github.com/CVNSS/libcvnss.git
cd libcvnss/js
npm install
npm link                 # now 'cvnss' is available globally
```

**Usage**  
```bash
echo "tiếng Việt" | cvnss cqn      # compress → tizb Vidf
echo "tizb Vidf" | cvnss cvn       # decompress → tiếng Việt
type in.txt | cvnss cqn > out.txt  # file to file
```

---

## 🔧 JavaScript API

```js
const cvnss = require('libcvnss');  // or './src'
const result = cvnss.convert('tiếng Việt', 'cqn');
console.log(result.cvn);            // "tizb Vidf"
```

---

## ✅ Test

```bash
cd js
npm test
```

---

## 📄 License

MIT © 2020 CVNSS4.0, Long Ngo  

---

**📌 Note:** The core converter `cvnss4.0-converter.js` is the only essential file. All other files provide CLI, testing, and packaging.
