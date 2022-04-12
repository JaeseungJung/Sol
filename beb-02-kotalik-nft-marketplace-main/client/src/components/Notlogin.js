import { Button, Icon, Label } from "semantic-ui-react";
import styles from "./notlogin.module.css";
import { useState, useEffect } from "react";
import { useRouter } from "next/router";

export default function notlogin({ isLogin, setIsLogin, connectWallet, connectKaikas }) {
  const router = useRouter();
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
  const loginMeta = () => {
    setIsLogin(!isLogin);
    connectWallet();
  };
  const loginKaikas = () => {
    setIsLogin(!isLogin);
    connectKaikas();
  };

  useEffect(() => {
    if (isLogin) {
      moveToHome();
    }
  }, [isLogin]);
  const moveToHome = () => {
    router.push("/");
  };
  return (
    <div className={styles.container}>
      <div className={styles.mainContainer}>
        <p className={styles.errorFont}>Please Connect Account Address First!</p>
        <div className={styles.btnContainer}>
          <Label as="a" color="orange" content="MetaMask" image={metaImageProps} size="big" onClick={loginMeta} />
          <Label as="a" color="gray" content="Kaikas" image={klayImageProps} size="big" onClick={loginKaikas} />
        </div>
      </div>
    </div>
  );
}
