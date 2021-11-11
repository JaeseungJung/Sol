// 0x488499d64Ea06E6A7192946e43fF9097F772fCE2

pragma solidity 0.8.6;

contract Test4 {
    
    uint balance;
    
    constructor() payable {
        balance = msg.value;
    }
    
    fallback() external payable {
        require(msg.value >= balance);
        payable(msg.sender).transfer(address(this).balance);   
    }
    
}