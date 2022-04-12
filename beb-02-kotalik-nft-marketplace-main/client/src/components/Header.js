import React, { useState, useEffect } from "react";
import { Input, Icon, Label } from "semantic-ui-react";
import styles from "./Header.module.css";
import Link from "next/link";

export default function Header({ connectKaikas, connectWallet, account, tokenSave, isLogin, setIsLogin, setAccount, walletType }) {
  const metaImageProps = {
    avatar: true,
    spaced: "right",
    src: "/images/icon_metamask.jpg",
  };
  const klayImageProps = {
    avatar: true,
    spaced: "right",
    src: "/images/icon_kaikas.png",
  };
  const loginButton = () => {
    if (!isLogin) {
      connectWallet();
    }
    if (isLogin) {
      setAccount("");
    }
    setIsLogin(!isLogin);
    tokenSave(account);
  };
  const kaikasLoginButton = (e) => {
    if (!isLogin) {
      connectKaikas();
    }
    if (isLogin) {
      setAccount("");
    }
    setIsLogin(!isLogin);
    tokenSave(account);
  };
  return (
    <div className={styles.header}>
      <div className={styles.Container}>
        <Link href="/">
          <a className={styles.logo}>
            <img src="/images/opensea.png" alt="logo" style={{ display: "flex", width: "40px", margin: "25px" }} />
            <span>OpenSea</span>
          </a>
        </Link>
        <Input icon="search" placeholder="Search items, collections, and accounts" style={{ width: "50rem", height: "45px" }} />
        <ul className={styles.nav}>
          <li>
            <div>
              {!isLogin ? (
                <Label color="red"> Unconnected Accout</Label>
              ) : walletType === "eth" ? (
                <Label as="a" color="orange" content="MetaMask" image={metaImageProps} />
              ) : walletType === "klay" ? (
                <Label as="a" color="gray" content="Kaikas" image={klayImageProps} />
              ) : (
                <Label color="red"> Unconnected Accout</Label>
              )}
            </div>
          </li>
          <li>
            <Link href="/explore">
              <a>Explore</a>
            </Link>
          </li>
          <li>
            <Link href="/create">
              <a>Create</a>
            </Link>
          </li>
          <li>
            <Link href="/mynft">
              <Icon name="user circle outline" size="large" />
            </Link>
          </li>
          <li>
            <div onClick={loginButton}>
              <img className={styles.icon} src="/images/icon_metamask.jpg" />
            </div>
          </li>
          <li>
            <div onClick={kaikasLoginButton}>
              <img className={styles.icon} src="/images/icon_kaikas.png" />
            </div>
          </li>
          {/* <li>
            {isLogin ? (
              <div onClick={loginButton}>
                <Icon name="sign-out" size="large" />
              </div>
            ) : (
              <div onClick={loginButton}>
                <Icon name="sign-in" size="large" />
              </div>
            )}
          </li> */}
        </ul>
      </div>
    </div>
  );
}
