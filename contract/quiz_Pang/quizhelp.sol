// Contract
pragma solidity 0.8.6;

contract Quiz01 {
    
    string rightAnswer;
    bytes32 public hashedAnswer;
    
    constructor(string memory _rightAnswer) payable {
        rightAnswer =  _rightAnswer;
    }
    
    function getAnswer() public view returns (string memory) {
       return rightAnswer;
    }
    
     function getHashedAnswer() public returns (bytes32) {
        hashedAnswer = keccak256(abi.encodePacked(msg.sender, rightAnswer));
        return hashedAnswer;
       
    }
    
      function balanceOf() view public returns (uint){
        return address(this).balance;
    }

    
    function answer(bytes32 _hash) public {
        hashedAnswer = keccak256(abi.encodePacked(msg.sender, rightAnswer));
        require ( hashedAnswer == _hash);
        payable(msg.sender).transfer(address(this).balance);
    }
    
    
}



// Web3.js
 function submit_Answer(){
	console.log("정답제출");
    let input01 = document.getElementById("answer--input--01").value;

	console.log(input01);


    let hash01 = web3.utils.soliditySha3({t: 'address', v: account},{t: 'string', v:input01})

	console.log(hash01);
    

	contract.methods.answer(hash01).send(
      {from: account}
    ).then(function(receipt){
    document.getElementById("eventResult").innerText = "제출 완료"
    }).on('error', function(){
      
    })