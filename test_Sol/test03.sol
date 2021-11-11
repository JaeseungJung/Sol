// 0x70036dc3Cb3c36a1CdCFbf8765cC00B94a12a450

pragma solidity 0.8.6;

contract Test3 {
    
    constructor() payable {
    }
    
    fallback() external {
        payable(msg.sender).transfer(address(this).balance);   
    }
    
}

// 트랜잭션 호출 (가스비만 지불)하면 지급 받을 수 있음.
// 폴백 함수에 아무것도 넣지 않으면 실행됨.