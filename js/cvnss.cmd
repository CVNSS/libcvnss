@echo off 
set MODE=%%1 
if "%%MODE%%"=="" set MODE=cqn 
node -e "const fs=require('fs'); const C=require('./src/cvnss4.0-converter'); const input=fs.readFileSync(0,'utf8'); const out=C.convert(input,process.env.MODE||'%MODE%'); process.stdout.write((('%MODE%'.toLowerCase()==='cqn')?out.cvn:out.cqn));"
