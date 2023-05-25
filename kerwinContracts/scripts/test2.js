const Contracts = artifacts.require('StudentListStorage.sol')

module.exports = async (calldata) => {
    const stduentListStorage = await Contracts.deployed()

    await stduentListStorage.addList('kerwinliu', 8888)

    const list = await stduentListStorage.getList()

    console.log(list)

    // console.log('StudentList ----', await stduentListStorage.StudentList(0))

    calldata()
}