import { useRouter } from "next/router";
import { useEffect, useState } from "react";
import styles from "../../styles/id.module.css";
import { Button, Divider, Icon, Input } from "semantic-ui-react";
import erc721Abi from "../../src/erc721Abi";
import kip17Abi from "../../src/kip17Abi";

const Post = ({ web3, account, walletType, nftlist, newErc721addr, newKip17addr }) => {
  const [token, setToken] = useState([]);
  const [to, setTo] = useState("");
  const router = useRouter();
  const { id } = router.query;

  useEffect(async () => {
    const tokenContract = "";
    if (walletType === "eth") {
      tokenContract = await new web3.eth.Contract(erc721Abi, newErc721addr);
    } else {
      tokenContract = await new caver.klay.Contract(kip17Abi, newKip17addr);
    }
    console.log(tokenContract);
    const name = await tokenContract.methods.name().call();
    const symbol = await tokenContract.methods.symbol().call();
    let tokenURI = await tokenContract.methods.tokenURI(id).call();
    setToken({ name, symbol, id, tokenURI });
  }, []);

  const sendToken = async (tokenId) => {
    const tokenContract = "";
    if (walletType === "eth") {
      tokenContract = await new web3.eth.Contract(erc721Abi, newErc721addr, {
        from: account,
      });
      tokenContract.options.address = newErc721addr;
      tokenContract.methods
        .transferFrom(account, to, token.id)
        .send({
          from: account,
        })
        .on("receipt", (receipt) => {
          setTo("");
          router.push("/");
        });
    } else {
      tokenContract = await new caver.klay.Contract(kip17Abi, newKip17addr, {
        from: account,
      });
      tokenContract.options.address = newKip17addr;
      tokenContract.methods
        .transferFrom(account, to, token.id)
        .send({
          from: account,
          gas: 0xf4240, //왜 이가격인지는 모르겠습니다....
        })
        .on("receipt", (receipt) => {
          setTo("");
          router.push("/");
        });
    }
  };

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
        <div className={styles.tokenTransferContainer}>
          <h1>Send</h1>
          <Divider />
          <div className={styles.contentContainer}>
            <p className={styles.contentFont}>Token ID</p>
            <p style={{ fontSize: "24px" }}>{token.id}</p>
            <p className={styles.contentFont}>
              From{" "}
              <span style={{ fontSize: "16px" }} className={styles.require}>
                *
              </span>
            </p>
            <p className={styles.contentValue}>{account ? account : <p style={{ color: "#b91528", fontWeight: "600" }}>Please connect Account first!!</p>}</p>
          </div>
          <div className="tokenTransfer">
            <p className={styles.contentFont}>To</p>{" "}
            <Input
              placeholder="Account Address"
              fluid
              size="large"
              value={to}
              onChange={(e) => {
                setTo(e.target.value);
              }}
            />
          </div>
          <div className={styles.btnContainer}>
            <Button content="Send Token" icon="right arrow" size="big" labelPosition="right" onClick={sendToken.bind(this, token.tokenId)} />
          </div>
        </div>
      </div>
    </div>
  );
};

export default Post;
