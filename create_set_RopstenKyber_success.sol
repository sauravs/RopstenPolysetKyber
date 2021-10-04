// SPDX-License-Identifier: MIT

pragma solidity 0.6.10;

interface ICreateSet {
    function create(
        address[] memory _components,
        int256[] memory _units,
        address[] memory _modules,
        address _manager,
        string memory _name,
        string memory _symbol
      
    )
        external
        returns (address);
}



contract CREATESET {
    
    address public SetTokenCreatorRopstenAddress = 0x720ddAa73C16B12b5AB6362BacCB504cFd907121;
    address public ControllerRopstenAddress = 0x0f471ab1210e2f1704D82E48f9D442A874486749 ;
    address public IntegrationRegistryRopstenAddress = 0x8cA2366e388DDe7E3910956B84DD3De4D5277616 ;

    address public SetValuerRopstenAddress = 0x425783dE6E1C57903eD5eb457208eCB9D224965C ;
    
    
    address public BasicIssuanceModuleRopstenAddress = 0x3407055c354fFc5f9943Fafab128a10e9b7bF1Fe ;
    address public NavIssuanceModuleRopstenAddress = 0x670Dc454CeEBE576bE85370bdd5351Db3389b4ca ;
    address public StreamingFeeModuleRopstenAddress = 0xF64C661F03ac1a0f322780101fF47E83cBD522d9 ;
    
    
 
    address public MockUSDC = 0x068B43f7F2f2c6a662C36E201144aE45f7a1C040 ;
    address public Mock_LINK =  0xb4f7332ed719Eb4839f091EDDB2A3bA309739521 ;
    address public MockWETH =  0xc778417E063141139Fce010982780140Aa0cD5Ab ;
    address public MockBat =  0xDb0040451F373949A4Be60dcd7b6B8D6E42658B6 ;

    
    //address public sushiSWAPExchangeAdapterKovan = 0xbFAD1987608a38bfA0FE4c5510c1aF834aE21379 ;
    
 

    
        
    modifier onlyManager {
        require (msg.sender == 0x3793f758a36c04B51a520a59520e4d845f94F9F2 , 'Only Manager has right to execute this function');
        _;
        
    }
    

    
     /*
     
     Create SET with following underlying Component:
     
     
     Underlying Component 1 : MockBAT = 0x482dC9bB08111CB875109B075A40881E48aE02Cd  ,  Allocation % = 30%
     Underlying Component 2 : MockZRX = 0x162c44e53097e7B5aaE939b297ffFD6Bf90D1EE3  ,  Allocation % = 70%
     
     ["0x482dC9bB08111CB875109B075A40881E48aE02Cd" , "0x162c44e53097e7B5aaE939b297ffFD6Bf90D1EE3"]    [MockBAT,MockZRX]
     ["20000000000000000000" ,"30000000000000000000"]    [20 MockBAT , 30 MockZRX]
    ["0x8a070235a4B9b477655Bf4Eb65a1dB81051B3cC1" , "0x5dB52450a8C0eb5e0B777D4e08d7A93dA5a9c848" , "0xE038E59DEEC8657d105B6a3Fb5040b3a6189Dd51" ]    [Modules To Be Added]
                [BasicIssuanceModuleKovanAddress ,0x5dB52450a8C0eb5e0B777D4e08d7A93dA5a9c848 , StreamingFeeModuleKovanAddress]
    0x3793f758a36c04B51a520a59520e4d845f94F9F2   [Manager Address]
    KOVAN-BAT-ZRX       [Name]
    
    KBATZRX           [Symbol]
     
     
     SET CREATED  
     
     https://kovan.etherscan.io/token/0x1b21742a271ee85f837d208c5e9b99be6cdea6ce#readContract
     
     SET KOVAN-BAT-ZRX Address  = 0x1b21742a271ee85f837d208c5e9b99be6cdea6ce;
     
     
     Data provided to Intialize NAVIssuance:
     
     ["0x0000000000000000000000000000000000000000", "0x0000000000000000000000000000000000000000", ["0xb7a4F3E9097C08dA09517b5aB877F7a917224ede"], "0x3793f758a36c04B51a520a59520e4d845f94F9F2", ["100000000000000" , "10000000000000000"], "800000000000000000" , "10000000000000000" , "100000000000000000" , "1000000000000000000"]
managerIssuanceHook = '0x0000000000000000000000000000000000000000',
managerRedemptionHook = '0x0000000000000000000000000000000000000000',
	
address[] reserveAssets = ['0xb7a4F3E9097C08dA09517b5aB877F7a917224ede']  // USDC  On Kovan
address feeRecipient = '0x3793f758a36c04B51a520a59520e4d845f94F9F2'
uint256[2] managerFees = [100000000000000 , 10000000000000000]   // [0.01% , 1%]  //        0.01% -> 100000000000000(10^14)      1% -> 10000000000000000 (10^16)
uint maxManagerFee = 800000000000000000                // 80%  ->  800000000000000000
uint premiumPercentage  = 10000000000000000                     // 1% ->  10000000000000000  
	
uint maxPremiumPercentage = 100000000000000000	               // 10% -> 100000000000000000
		
uint minSetTokenSupply     = 	1000000000000000000	            // 1 Token   ->   1000000000000000000
Reserve USDC Asset Quanity to supply  Set: 100 USDC    100000000000000000000
		
     
     
     */






    function createMySet(
        address[] memory _components,
        int256[] memory _units,
        address[] memory _modules,
        address _manager,
        string memory _name,
        string memory _symbol 
         ) external returns (address) {
        
          ICreateSet createSet = ICreateSet(SetTokenCreatorRopstenAddress) ;
          address[] memory components = _components;
          int256[] memory uints = _units;
          address[] memory modules = _modules;
          address manager = _manager;
          string memory name = _name;
          string memory symbol = _symbol;
      
         
        return createSet.create(components, uints ,modules ,manager , name , symbol  );
        
        

        }
        
        
      
        
        
        
        }
        
        
        