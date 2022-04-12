import { useEffect, useState } from "react";
import Erc721 from "./Erc721";
import erc721Abi from "../erc721Abi";

function TokenList({ caver, web3, account, nftlist, newErc721addr, newKip17addr, mine }) {
  return (
    <div className="tokenlist">
      <Erc721 caver={caver} web3={web3} account={account} nftlist={nftlist} newKip17addr={newKip17addr} newErc721addr={newErc721addr} mine={mine} />
    </div>
  );
}

export default TokenList;
