//SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
// tells which solidity version are you using
// solifity contract
// can add admins and only admins can add admins
contract AdminControl{
    constructor(address[]  memory _admins){
        admins = _admins;
        admins.push(msg.sender);
    }
    // storage/state/ persistent db
    address[] private admins; // put in permenant memory of contract

    modifier onlyAdmins() { // checks if part of admin list
        bool isAdmin = false;
        for (uint256 i = 0; i < admins.length; i++) {
            if (admins[i] == msg.sender) {
                isAdmin = true;
                break;
            }
        }
        require(isAdmin, "Caller is not an admin");// assert statement
        _;
    }
    // add admin
    function addAdmin(address _admin) public onlyAdmins {
        admins.push(_admin);
    }

    function getAdmins() external view returns (address[] memory) {
        return admins;
    }

}

