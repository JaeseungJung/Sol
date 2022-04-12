import styles from "./Erc721.module.css";
import { Icon } from "semantic-ui-react";
import Link from "next/link";

function Erc721({ nftlist, mine }) {
  return (
    <div className={styles.mainContainer}>
      {nftlist.map((token) => {
        return (
          <Link href={mine ? `/mynft/${token.tokenId}` : `/nfts/${token.tokenId}`}>
            <div key={token.tokenId} className={styles.tokenContainer}>
              <img
                src={token.tokenURI}
                alt={token.id}
                style={{ width: "100%", height: "80%", objectFit: "cover", borderTopLeftRadius: "inherit", borderTopRightRadius: "inherit", margin: "0.1px" }}
              />
              <div className={styles.desc}>
                <div className={styles.user}>
                  <Icon name="user circle" size="big" />
                  <div className={styles.userText}>
                    <span>{token.name}</span>
                    <div>{token.symbol}</div>
                  </div>
                </div>
                <div style={{ marginRight: "20px" }}>
                  <Icon name="info circle" size="large" />
                  <p>{token.owner}</p>
                </div>
              </div>
            </div>
          </Link>
        );
      })}
    </div>
  );
}
export default Erc721;
