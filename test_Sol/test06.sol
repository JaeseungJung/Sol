
pragma solidity 0.8.6;

contract Test6 {
    
    address owner;
    
    constructor() payable {
        msg.sender == owner;
        
    }
    
 modifier onlyOwner () {
  require(msg.sender == owner);
    _;
    }

    function destroy() public onlyOwner {
        selfdestruct(payable(msg.sender));
    }
    
}