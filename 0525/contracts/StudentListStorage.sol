// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract StudentListStorage {
    struct Student {
        uint id;
        string name;
        uint age;
        address account;
    }

    Student[] public StduentList;

    function addList (string memory _name, uint _age) public returns (uint) {
        uint index = StduentList.length + 1;

        StduentList.push(Student(index, _name, _age, msg.sender));

        return StduentList.length;
    }

    function getList () public view returns (Student[] memory){
        return StduentList;
    }
}