#!/usr/bin/env node
const fs = require("fs");
const CVNSS = require("../src/cvnss4.0-converter");

const mode = (process.argv[2] || "cqn").toLowerCase();
const input = fs.readFileSync(0, "utf8");

const out = CVNSS.convert(input, mode);

if (mode === "cqn") process.stdout.write(out.cvn);
else process.stdout.write(out.cqn);
