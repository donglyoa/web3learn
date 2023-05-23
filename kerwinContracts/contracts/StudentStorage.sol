// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

// 合约名字需要和文件名保持一致
contract StudentStorage {
    // 创建两个变量username, age
    uint age; // 无符号整型uint8 uint16 uint32 (uint 等于uint256)
    string name;

    function setData (string memory _name, uint _age) public {
        name = _name;
        age = _age;
    }

    // 使用returns 标记返回值的类型
    function getData () public view returns (string memory, uint) {
        return (name, age);
    }
}