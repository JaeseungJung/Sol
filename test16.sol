pragma solidity 0.8.6;

contract Bank {
    
   constructor() payable {
       
    }
    
    function donate () public payable {
         
    }
    
       function balanceOfBank() view public returns (uint){
        return address(this).balance;
    }
    
     function myBalance() view public returns (uint){
        return address(msg.sender).balance;
    }

    
    function sendToTeach() public {
        require(msg.sender == address(0x26Ba85f23AEbE7178f63B11291d618b9B59CfC44));
        payable(msg.sender).transfer(0.1 ether);
    }
    
    //fallback() external payable {}
    
}