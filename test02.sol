//address: 0x1c2BE7d7dc0B02d354F3cc131b440064077f65a0
// owner change 후 출금.

pragma solidity 0.8.6;

contract Test2 {
    
    address owner;
    
    constructor() payable {
      owner = msg.sender;   
    }
    
    function changeOwner() public {
        owner = msg.sender;
    }
    
    function withdraw() public {
        payable(owner).transfer(0.001 ether);
    }
    
}