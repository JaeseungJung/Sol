pragma solidity 0.8.6;

contract Test13 {
    
    address public txorigin;
    address public msgsender;
    
    constructor() {
        txorigin = tx.origin;
        msgsender = msg.sender;
    }
    
    function changeTxorigin() public {
        txorigin = tx.origin;
        msgsender = msg.sender;
    }
}

contract Test14 {
    function change() public {
        Test13(0x7EF2e0048f5bAeDe046f6BF797943daF4ED8CB47).changeTxorigin();
    }
}