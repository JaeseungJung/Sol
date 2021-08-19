// Contract
pragma solidity 0.8.6;

  contract Test {
      
      bytes32 public hash;
      
      //msg.sender + pw + target
      function commit(bytes32 _hash) public {
          hash = _hash;
      }
      
      function reveal(string memory _pw, uint _target) public view returns (bool){
          return keccak256(abi.encodePacked(msg.sender, _pw, _target)) == hash;
      }
      
  }


// Web3.js
function commit() {
    let secret = document.getElementById("secretNumber").value
    let target = document.getElementById("targetInput").value

    let hash = web3.utils.soliditySha3({t: 'address', v: account}, {t: 'string', v:secret},{t: 'uint', v:target})

    contract.methods.commit(hash).send(
      {from: account}
    )
    .then(function(receipt){
        console.log('receipt')
        console.log(receipt)

    });
  }

  function reveal() {
    let secret = document.getElementById("secretNumber").value
    let target = document.getElementById("targetInput").value

    contract.methods.reveal(secret, target).call({from: account})
    .then(function(result){
      console.log(result)
    });
  }