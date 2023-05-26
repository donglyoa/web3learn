// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract KerwinToken {
    using SafeMath for uint256; // 导入uint256后面使用的sub add 方法
    string public name = 'KerwinToken';
    string public symbol = 'KWT';
    uint8 public decimals = 18;
    uint256 public totalSupply;
    
    // mapping (类似js的对象{key: value})
    mapping (address => uint256) public balanceOf;

    // 构造函数，部署智能合约的时候构造函数就会自动执行
    constructor () {
        totalSupply = 100000 * (10 ** decimals); // ** 等于 Math.pow(x, y)
        // 此时的msg.sender是部署智能合约的账户
        balanceOf[msg.sender] = totalSupply;
    }
    // 事件是一种新的数据结构，一旦触发事件，它会把我们传进去的参数存储在我们交易的日志中，这些日志与我们合约地址关联，并且会合并到我们的区块链中；
    // 作用：公开，透明，不可篡改，让每次交易都可以被追踪；前端可以订阅Transfer事件（视频13 41分）
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    function transfer (address _to, uint256 _value) public returns (bool success) {
        // require将要做的事情传入，如果是false就会报错，如果为true才会往下走；相当于if吧
        require(_to!=address(0)); // 要求传过来的地址是不为空的地址，可以用address(0)判断
         // 此时的msg.sender是方法调用者
         _transfer(msg.sender, _to, _value);
        return true;
    }

    // 封装交易
    function _transfer (address _from, address _to, uint256 _value) internal {
        require(balanceOf[_from] >= _value);
        balanceOf[_from] = balanceOf[_from].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        // 触发事件
        emit Transfer(_from, _to, _value);
    }

    视频42:20


}