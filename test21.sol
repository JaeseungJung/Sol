pragma solidity 0.8.6;

contract HKbank{


    mapping(address => uint) balanceAccount;



    function deposit(uint amount) public  {

        balanceAccount[msg.sender] += amount;

}

    function getBalance() public view returns (uint)  {
        return balanceAccount[msg.sender];
}


}     