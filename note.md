## 智能合约

### 文件结构
* contracts solidity智能合约文件
* migrations 部署脚本
* test 测试文件
* truffle-config.js 配置文件

### solidity

#### 说明
// SPDX-License-Identifier: GPL-3.0 -> 遵循的协议（GPL-3.0协议）
pragma solidity >=0.4.15 < 0.9.0; -> 限定solidity编译器版本


#### 状态变量可以有三种作用域类型

* public: 公共状态变量可以在内部访问，也可以通过消息访问，对于公共状态变量，将生成一个自动getter函数。
* external: 
* internal: 内部变量只能从当前合约或其派生合约内访问；
* private: 私有状态变量只能从当前合约内容访问，派生合约不能访问；

#### 数据存储的位置

* memory: 函数的参数和临时变量一般用memory，存储在内存中，不上链，gas低；
* calldata: 和memory类似，存储在内存中，不上链，与memory不同点在于它是不能修改的；
* storage: 状态变量都是storage类型，存在链上；需要消耗gas，memory和calldata消耗gas少；

函数参数中基本类型不用设置数组存储位置（uint），引用类型需要设置比如：struct，动态数组，映射，string...

#### 函数可以标记为view还是pure

* view: 视图函数，只访问不修改（状态变量）
* pure: 不访问，不修改（utils函数）

比如StudentStorages中的setData函数，因为操作状态变量都是需要消耗gas的

view函数或者pure函数调用不消耗gas；

#### 作用域

变量的作用域在solidity中分成三种：
* 状态变量: 状态变量是数据存储在链上的变量，所有合约内函数都可以访问，gas消耗高，状态变量在合约内，函数外声明，可以在函数内更改状态变量的值；
* 局部变量: 局部变量是仅在函数执行过程中有效的变量，函数退出后，变量无效；局部变量的数据存在内存中，不上链，gas低；局部变量在函数内声明；
* 全局变量: 全局变量是全局范围工作的变量，都是solidity预留关键字，他们可以在函数内不声明直接使用，比如：msg.sender, block, number;

### 编译

truffle compile 编译只能合约，仅编译还未部署到区块链上；

### 部署

truffle migrate (它会先编译后部署，它会把所有的智能合约编译一遍，然后全部部署到区块链上)

truffle migrate --reset 从头开始运行所有部署，而不是从上次完成的部署中运行。（我也不知道有啥用！）

在migrations中编写部署脚本，文件名一定要是数字开头: 1_deploy.js

### 控制台测试

truffle console（进入控制台）

const obj = await StudentStorage.deployed() （实例化合约）

obj.seData('kerwinliu', 100)

obj.getData()

### 注意

1. 状态变量设置public后会自动生成一个get方法

```js
    string public name

    const obj = await StudentStorage.deployed()

    obk.name()
```

2. 将结构体数组设置为public后也会自动生成一个get方法，但是直接调用是会报错的，需要传入数组的index，表示获取第几个结构体

```js
    await stduentListStorage.StudentList(1) 
```




