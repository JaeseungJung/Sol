import superagent from "superagent";
import fs from "fs";

(async () => {
    let cursor = -1;
    while (true) {
        const result = await superagent.get(`http://api.twitter.com/1.1/followers/list.json?cursor=${cursor}&screen_name=ricecakemill&count=200`)
            .set('Authorization', 'Bearer ')
            .accept('application/json');
        cursor = result.body.next_cursor;
        fs.writeFileSync(`./followers/${cursor}.json`, JSON.stringify(result.body.users));
    }
})();