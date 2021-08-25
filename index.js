const fs = require("fs");

const replaceMarker = "# $$-> insert";
const insertsPath = "./scripts/inserts";
const outDir = "./out";

function createScript(name) {
    const content = common.replace(
        replaceMarker,
        fs.readFileSync(`${insertsPath}/${name}`)
    );

    fs.writeFileSync(`${outDir}/${name}`, content);
}

const common = fs.readFileSync("./scripts/common.sh").toString();

const inserts = fs.readdirSync(insertsPath);

if (!fs.existsSync("./out")) {
    fs.mkdirSync("./out");
}

inserts.forEach((insert) => {
    createScript(insert);
});

const variantsPath = "./scripts/variants";

const variants = fs.readdirSync(variantsPath);

variants.forEach((variant) => {
    fs.copyFileSync(variantsPath + `/${variant}`, `./out/${variant}`);
});
