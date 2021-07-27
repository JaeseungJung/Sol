
pragma solidity 0.8.6;

contract Test6 {
    
    constructor() payable {
        
    }
    
    function destroy() public {
        selfdestruct(payable(msg.sender));
    }
    
}