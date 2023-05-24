// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract StudentListStorage {
    // 定义结构体
    struct Student {
        uint id;
        string name;
        uint age;
    }

    // 创建动态数组，不定义数组长度叫动态数组，定义数组长度叫静态数组;
    // 静态数组：Student[10] public StudentList
    // 动态数组：Student[] public StudentList
    Student[] public StudentList;

    function addList (string memory _name, uint _age) public returns(uint) {
        uint index = StudentList.length + 1;

        StudentList.push(Student(index, _name, _age));

        return StudentList.length;
    }

    function getList () public view returns (Student[] memory) {
        return StudentList;
    }
}