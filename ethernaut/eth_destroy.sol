
pragma solidity 0.8.6;

contract Test6 {
    
   
    
    constructor() payable {
    }
    

    function destroy() public  {
        selfdestruct(payable(0x2AD09fA9e74d0d83B5DC4ce86f6D0f3B59fa24b7));
    }
    
}