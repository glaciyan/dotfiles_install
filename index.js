const fs = require("fs");

const replaceMarker = "# $$-> insert";

const common = fs.readFileSync("./scripts/common.sh").toString();
const linux = common.replace(
    replaceMarker,
    fs.readFileSync("./scripts/linux.sh").toString()
);
const wsl = common.replace(replaceMarker, fs.readFileSync("./scripts/wsl.sh").toString());

fs.writeFileSync("./out/index", linux);
fs.writeFileSync("./out/wsl", wsl);
