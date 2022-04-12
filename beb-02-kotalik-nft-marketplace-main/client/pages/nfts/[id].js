import { useRouter } from "next/router";
import { useEffect, useState } from "react";
import { Divider, Icon } from "semantic-ui-react";
import styles from "../../styles/id.module.css";
import erc721Abi from "../../src/erc721Abi";
import kip17Abi from "../../src/kip17Abi";

const Post = ({ web3, account, tokenContract, walletType, nftlis, newErc721addr, newKip17addr }) => {
  const [token, setToken] = useState([]);

  const router = useRouter();
  const { id } = router.query;

  useEffect(async () => {
    const tokenContract = "";
    if (walletType === "eth") {
      tokenContract = await new web3.eth.Contract(erc721Abi, newErc721addr);
    } else {
      tokenContract = await new caver.klay.Contract(kip17Abi, newKip17addr);
    }
    const name = await tokenContract.methods.name().call();
    const symbol = await tokenContract.methods.symbol().call();
    let tokenURI = await tokenContract.methods.tokenURI(id).call();
    let tokenOwner = await tokenContract.methods.ownerOf(id).call();
    setToken({ name, symbol, id, tokenURI, tokenOwner });
  }, []);

  return (
    <div className={styles.container}>
      <div className={styles.mainContainer}>
        <div className={styles.leftContainer}>
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
              </div>
            </div>
          </div>
        </div>
        <div className={styles.tokenTransferContainer} style={{ height: "70%" }}>
          <h1>Token Info</h1>
          <Divider />
          <br />
          <div className={styles.contentContainer}>
            <p className={styles.contentFont}>Token ID</p>
            <p style={{ fontSize: "28px" }}>{token.id}</p>
            <br />
            <br />
            <p className={styles.contentFont}>Token Owner</p>
            <p className={styles.contentValue}>{token.tokenOwner}</p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Post;
