import fs from "fs";

const files = fs.readdirSync("./followers");
const names: string[] = [];
for (const file of files) {
    const content = fs.readFileSync(`./followers/${file}`);
    const data = JSON.parse(content.toString());
    for (const d of data) {
        if (names.includes(d.screen_name.toLowerCase()) !== true) {
            names.push(d.screen_name.toLowerCase());
        }
    }
}
console.log(names.length);
fs.writeFileSync("./names.json", JSON.stringify(names));