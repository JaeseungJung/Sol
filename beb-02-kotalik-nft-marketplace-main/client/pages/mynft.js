import TokenList from "../src/components/TokenList";
import { useState, useEffect } from "react";
import erc721Abi from "../src/erc721Abi";
import { Button, Dimmer, Divider, Icon, Label, Loader, Segment } from "semantic-ui-react";
import styles from "../styles/mynft.module.css";
import kip17Abi from "../src/kip17Abi";

export default function mynft({ caver, web3, account, tokenContract, walletType, newErc721addr, newKip17addr }) {
  const [nftlist, setNftlist] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const klayImageProps = {
    avatar: true,
    spaced: "right",
    src: "/images/icon_kaikas.png",
  };
  useEffect(async () => {
    saveMyToken();
  }, []);

  const saveMyToken = async () => {
    const tokenContract = "";
    if (walletType === "eth") {
      tokenContract = await new web3.eth.Contract(erc721Abi, newErc721addr);
    } else {
      tokenContract = await new caver.klay.Contract(kip17Abi, newKip17addr);
    }
    const name = await tokenContract.methods.name().call();
    const symbol = await tokenContract.methods.symbol().call();
    const totalSupply = await tokenContract.methods.totalSupply().call();
    let arr = [];
    for (let i = 1; i <= totalSupply; i++) {
      arr.push(i);
    }

    for (let tokenId of arr) {
      let tokenOwner = await tokenContract.methods.ownerOf(tokenId).call();
      if (String(tokenOwner).toLowerCase() === account) {
        let tokenURI = await tokenContract.methods.tokenURI(tokenId).call();
        setNftlist((prevState) => {
          return [...prevState, { name, symbol, tokenId, tokenURI }];
        });
      }
    }
    setIsLoading(false);
  };

  return (
    <div>
      <div style={{ paddingTop: "120px", backgroundColor: "#E5E8EB" }}>
        <div className={styles.profileContainer}>
          <div className={styles.topContainer}></div>
          <div className={styles.middleContainer}>
            <div className={styles.profile}>
              <Icon name="user outline" size="huge" color="grey" />
            </div>
          </div>
          <div className={styles.bottomContainer}>
            <div className={styles.useContainer}>
              <p className={styles.nameFont}>Unnamed</p>
              {walletType == "eth" ? (
                <Button color="grey">
                  <Icon name="ethereum" /> {account}
                </Button>
              ) : (
                <Label as="a" color="gray" content={account} image={klayImageProps} />
              )}
            </div>
          </div>
        </div>
      </div>
      <Divider />
      <div className={styles.contentContainer}>
        <div className={styles.tokenContainer}>
          <p className={styles.tokenFont}>My Collections</p>
          {isLoading && (
            <Segment basic>
              <div style={{ height: "140px" }}>
                <Dimmer active inverted>
                  <Loader size="large" inverted content="Loading" />
                </Dimmer>
              </div>
            </Segment>
          )}
          {!isLoading && (
            <TokenList web3={web3} account={account} nftlist={nftlist} newKip17addr={newKip17addr} walletType={walletType} newErc721addr={newErc721addr} mine={true} />
          )}
        </div>
      </div>
    </div>
  );
}
