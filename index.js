const fs = require("fs");

function createScript(name) {
    const content = common.replace(
        replaceMarker,
        fs.readFileSync(`${insertsPath}/${name}`)
    );

    fs.writeFileSync(`${outDir}/${name}`, content);
}

const replaceMarker = "# $$-> insert";
const insertsPath = "./scripts/inserts";
const outDir = "./out";

const common = fs.readFileSync("./scripts/common.sh").toString();

const inserts = fs.readdirSync(insertsPath);

if (!fs.existsSync("./out")) {
    fs.mkdirSync("./out");
}

inserts.forEach((insert) => {
    createScript(insert);
});
