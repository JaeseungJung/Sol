
pragma solidity 0.8.6;

contract attendingCheck {

struct Student {
    string name;
    bool state;
}

Student[] students;

mapping(address => uint) count;
mapping(address => string) name;

address owner;


constructor() {
    count[msg.sender] = 1;
    name[msg.sender] = "HanSooYoung";
    owner = msg.sender;
}


function addName(string memory _name) public {
name[msg.sender] = _name;
bool _state = false;
students.push(Student(_name, _state));
}

function attending() public {
    require( count[msg.sender] == 0);
    count[msg.sender] = 1;
    string memory selectName = name[msg.sender];
    for(uint i=0; i<students.length;i++) {
     if(keccak256(abi.encodePacked(students[i].name)) == keccak256(abi.encodePacked(selectName))) {
         students[i].state = true;
      }
    }
}

function getCount() view public returns (uint){
    return count[msg.sender];
}

function getName() view public returns (string memory){
    return name[msg.sender];
}

function LookUp() public view returns(Student[] memory) {
return students;
}
}