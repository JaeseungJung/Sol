// 0x527016C44fA198399EF983192aA1D2FA0018c8d7

pragma solidity 0.8.6;

contract Test3 {
    
    address owner;
    
    constructor() payable {
        owner = msg.sender;
    }
    
    function withdraw() public {
        payable(owner).transfer(0.001 ether);
    }
    
    fallback() external {
        payable(msg.sender).transfer(address(this).balance);   
    }
    
}