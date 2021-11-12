import fs from "fs";
import papaparse from "papaparse";
import names from "./names.json";

(async () => {
    const users = fs.readFileSync("./users.csv");
    const result = papaparse.parse(users.toString());
    const named: string[] = [];
    const addresses: string[] = [];
    for (const [index, data] of result.data.entries()) {
        if (index > 0) {
            const username = (data as any)[0].trim().toLowerCase();
            const address = (data as any)[1].trim();
            if (
                named.includes(username) !== true &&
                names.includes(username) &&
                address.length === 42 &&
                addresses.includes(address) !== true
            ) {
                named.push(username);
                addresses.push(address);
            }
        }
    }
    console.log(addresses.length);
    for (let i = 0; i < addresses.length / 500; i += 1) {
        const addrs: string[] = [];
        for (let j = 0; j < 500; j += 1) {
            if (addresses[i * 500 + j] !== undefined) {
                addrs.push(addresses[i * 500 + j]);
            }
        }
        fs.writeFileSync(`./addresses/addresses${i}.txt`, JSON.stringify(addrs));
    }
})();