
pragma solidity 0.8.6;

contract Test5 {
    
    uint balance;
    
    constructor() payable {
    }
    
    fallback add()  public {
        require(msg.value >= balance);
        payable(msg.sender).transfer(address(this).balance);   
    }
    
}