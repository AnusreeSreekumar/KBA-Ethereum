// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract MyContract {
    string message;  //state variables => wat is the state of the blockchain

    function getMessage() public view returns (string memory){

        return message;
    }

    function setMessage(string memory _message) public {
       message = _message;
    }
    
}

//ABI is a template of a Smart Contract