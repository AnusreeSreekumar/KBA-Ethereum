// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract MyBook {
    struct Book {
        string title; //state variables => wat is the state of the blockchain
        uint8 price;
        address owner;
        bool sold;
    }

    Book myBook;

    function getBookTitle() public view returns (string memory, uint8) {
        return (myBook.title, myBook.price);
    }

    function setBookTitle(string memory _title, uint8 _price) public {
        myBook.title = _title;
        myBook.price = _price;
        myBook.owner = msg.sender;
        myBook.sold = false;
    }

    function ethToWei(uint256 eval) public pure returns (uint256) {
        return (eval * 1000000000000000000);
    }

    function buyBook() public payable {
        if (msg.value >= ethToWei(myBook.price)) {
            uint256 bal = msg.value - ethToWei(myBook.price);
            if (bal > 0) payable(msg.sender).transfer(bal);
            myBook.owner = msg.sender;
            myBook.sold = true;
        }
    }
}

//ABI is a template of a Smart Contract

