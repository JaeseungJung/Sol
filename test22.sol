pragma solidity 0.8.6;

contract EventContract{

string fNmame;
uint age;

event Instrunctor(string name, uint age);


    function SetInstructor(string memory _fname, uint _age) public {
        fName = _fName;
        age = _age;
        emit Instrunctor(_fName, _age)

}

 function getInstructor() view public returns (string memory, uint) {
     return (fName, age);

}


}     