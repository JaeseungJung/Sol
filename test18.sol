
pragma solidity 0.8.6;

contract Test18 {
    
    address owner;
    
    constructor() payable {
      owner = msg.sender;   
    }
    
      modifier onlyOwner () {
      require(msg.sender == owner);
     _;
    }
    
    
      function balanceOf() view public returns (uint){
        return address(this).balance;
    }
    
    
    function withdraw(address _to) public onlyOwner {
        payable(_to).transfer(address(this).balance);
    }
    
    }
    
