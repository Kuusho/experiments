// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18 <0.9.0; // Stating sol version uWu

contract SimpleStorage {
    uint256 myFavoriteNumber; // default favoriteNumber = 0

    // uint256[] listOfFavoriteNumbers;
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // Array of people
    Person[] public listOfPeople;

    //Mapping name-Number to assist in searching through arrays
    mapping(string => uint256) public nameToFavoriteNumber;

    // store function to keep favorite number (costs gas because it updates the state of the blockchain)
    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    //retrieve function used to view what is stored in myFavoriteNumber (view functions do not cost gas)
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    //addPerson function used to commit a new _name and _favoriteNumber to memory(store on blockchain)
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
