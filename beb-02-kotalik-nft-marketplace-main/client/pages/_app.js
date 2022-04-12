import Footer from "../src/components/Footer";
import Header from "../src/components/Header";
import Notlogin from "../src/components/Notlogin";
import "../styles/globals.css";
import "semantic-ui-css/semantic.min.css";
import { useState, useEffect } from "react";
import Web3 from "web3";
import erc721Abi from "../src/erc721Abi";
import kip17Abi from "../src/kip17Abi";
import { useRouter } from "next/router";
import Caver from "caver-js";

function MyApp({ Component, pageProps }) {
  const [web3, setWeb3] = useState();
  const [account, setAccount] = useState("");
  const [tokenContract, setTokenContract] = useState();
  const [newErc721addr, setNewErc721Addr] = useState("0x787b226eA9B0c0b8f3558EA4b9aE088fDE7B7b3B");
  const [newKip17addr, setNewKip17Addr] = useState("0x5D5232969dAb1134c25b2847A0490686A425561A");
  const [totalToken, setTotalToken] = useState([]);
  const [myToken, setMyToken] = useState([]);
  const [isLogin, setIsLogin] = useState(false);
  const [walletType, setWalletType] = useState("");
  const [caver, setCaver] = useState();
  const router = useRouter();
  let accounts;
  useEffect(() => {
    if (typeof window.ethereum !== "undefined") {
      try {
        const web = new Web3(window.ethereum);
        setWeb3(web);
      } catch (err) {
        console.log(err);
      }
    }
    if (typeof klaytn !== "undefined") {
      try {
        const caver = new Caver(klaytn);
        setCaver(caver);
      } catch (err) {
        console.log(err);
      }
    }
  }, []);

  useEffect(() => {
    if (!isLogin) {
      setMyToken([]);
      setTotalToken([]);
      if (document.location.href !== "http://localhost:3000/") {
        document.location.href = "/";
      }
    }
  }, [isLogin]);

  const connectWallet = async () => {
    accounts = await window.ethereum.request({
      method: "eth_requestAccounts",
    });
    setAccount(accounts[0]);
    setWalletType("eth");
  };
  const connectKaikas = async () => {
    accounts = await klaytn.enable();
    setAccount(accounts[0]);
    setWalletType("klay");
  };

  const tokenSave = async (account) => {
    const tokenContract = "";
    if (walletType === "eth") {
      tokenContract = await new web3.eth.Contract(erc721Abi, newErc721addr);
    } else {
      tokenContract = await new caver.klay.Contract(kip17Abi, newKip17addr);
    }
    setTokenContract(tokenContract);
    const owner = await tokenContract.methods.owner().call();
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
        setMyToken((prevState) => {
          return [...prevState, { name, symbol, tokenId, tokenURI, owner }];
        });
      }
    }
    for (let tokenId of arr) {
      let tokenURI = await tokenContract.methods.tokenURI(tokenId).call();
      setTotalToken((prevState) => {
        return [...prevState, { name, symbol, tokenId, tokenURI, owner }];
      });
    }
  };

  return (
    <>
      <Header
        connectKaikas={connectKaikas}
        connectWallet={connectWallet}
        web3={web3}
        account={account}
        tokenSave={tokenSave}
        isLogin={isLogin}
        setIsLogin={setIsLogin}
        setWalletType={setWalletType}
        setAccount={setAccount}
        walletType={walletType}
      />
      {(!isLogin && router.route === "/") || isLogin ? (
        <Component
          newErc721addr={newErc721addr}
          newKip17addr={newKip17addr}
          caver={caver}
          web3={web3}
          account={account}
          totalToken={totalToken}
          myToken={myToken}
          tokenContract={tokenContract}
          isLogin={isLogin}
          setIsLogin={setIsLogin}
          connectWallet={connectWallet}
          connectKaikas={connectKaikas}
          walletType={walletType}
        />
      ) : (
        <Notlogin isLogin={isLogin} setIsLogin={setIsLogin} connectWallet={connectWallet} connectKaikas={connectKaikas} />
      )}

      <Footer />
    </>
  );
}

export default MyApp;
