# Clone OpenSea

### OpenSea clone Coding by Team Kotalik

## **Stack**

> <img src="https://img.shields.io/badge/Next.js-000000?style=for-the-badge&logo=Next.js&logoColor=white"> <img src="https://img.shields.io/badge/Solidity-363636?style=for-the-badge&logo=Solidity&logoColor=white"> <img src="https://img.shields.io/badge/React-61DAFB?style=for-the-badge&logo=React&logoColor=white"> <img src="https://img.shields.io/badge/IPFS-65C2CB?style=for-the-badge&logo=IPFS&logoColor=white"> <img src="https://img.shields.io/badge/Web3.js-F16822?style=for-the-badge&logo=Web3.js&logoColor=white"> <img src="https://img.shields.io/badge/Semantic UI React-35BDB2?style=for-the-badge&logo=Semantic UI React&logoColor=white">

### Description

---

현재 최대의 **NFT** 마켓플레이스인 **OpenSea** 클론 코딩 프로젝트

## Get Started

### Prerequisites

> **_실행전 수정해야 하는 부분_**

```
/client/pages/_app.js

function MyApp({ Component, pageProps }) {
  ...
  const [newErc721addr, setNewErc721Addr] = useState("자신이 발행한 이더리움 컨트랙트 주소");
  const [newKip17addr, setNewKip17Addr] = useState("자신이 발행한 클레이튼 컨트랙트 주소");
  ...
}
```

> **_설치된 modules_**

```
npm i semantic-ui-react semantic-ui-css
```

```
npm i caver-js
```

```
npm i web3
```

```
npm i ipfs-http-client
```

```
npm i assert
```

### Installation

```
cd client/
```

```
npm install
```

### Run Start

---

```
cd client/
```

```
npm run dev
```

## Built With

- [이민기](https://github.com/mingi3442)
- [장정훈](https://github.com/jangjoocool)
- [이재열](https://github.com/Kawasaki-JY)
