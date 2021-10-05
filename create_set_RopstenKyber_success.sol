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
    
    address public SetTokenCreatorRopstenAddress = 0x0BE45e0c58A1202e0d26458DbA0711329F758bd2;
    address public ControllerRopstenAddress = 0xbd69a021a74e942505FE0C908DeDFee102BF78BE ;
    address public IntegrationRegistryRopstenAddress = 0x83E6Db0A619e8BF4A8e370E456a50A7ae01Bdf75 ;

    address public SetValuerRopstenAddress = 0x84de8EBB3f43B38E875a651104d2F70Fc9DCBBE5 ;
    
    
    address public BasicIssuanceModuleRopstenAddress = 0xE0E22d8bdC10F69982BdBD84327f3602a163A18E ;
    address public NavIssuanceModuleRopstenAddress = 0x41076F5b0582B07C741af90019B02DC7ED00A87b ;
    address public StreamingFeeModuleRopstenAddress = 0x8811e751C566152eA829cF173DdDe25916F487D7 ;
    
    
 
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
     
  Test Indirect Issuance On Ropsten (Kyber)
	
	
	
 address: 

   1) Controller.sol : 0xbd69a021a74e942505FE0C908DeDFee102BF78BE
      Fee Receipent Address : 0x3793f758a36c04B51a520a59520e4d845f94F9F2
      https://ropsten.etherscan.io/address/0xbd69a021a74e942505FE0C908DeDFee102BF78BE


   2) SetTokenCreator.sol :  0x0BE45e0c58A1202e0d26458DbA0711329F758bd2
      https://ropsten.etherscan.io/address/0x0BE45e0c58A1202e0d26458DbA0711329F758bd2
   
	
   3) SetValuer.sol : 0x84de8EBB3f43B38E875a651104d2F70Fc9DCBBE5
      https://ropsten.etherscan.io/address/0x84de8EBB3f43B38E875a651104d2F70Fc9DCBBE5

   4) IntegrationRegistry.sol : 0x83E6Db0A619e8BF4A8e370E456a50A7ae01Bdf75
      https://ropsten.etherscan.io/address/0x83E6Db0A619e8BF4A8e370E456a50A7ae01Bdf75
 
	
   5) BasicIssuanceModule.sol : 0xE0E22d8bdC10F69982BdBD84327f3602a163A18E
	  https://ropsten.etherscan.io/address/0xE0E22d8bdC10F69982BdBD84327f3602a163A18E
	
	
   6) StreamingFeeModule.sol : 0x8811e751C566152eA829cF173DdDe25916F487D7
	   https://ropsten.etherscan.io/address/0x8811e751C566152eA829cF173DdDe25916F487D7
	
   7)  NAVIssuanceModule.sol : 0x41076F5b0582B07C741af90019B02DC7ED00A87b
	   https://ropsten.etherscan.io/address/0x41076F5b0582B07C741af90019B02DC7ED00A87b
	 

   8)  
   
       KyberExchangeAdapter.sol  :  0xa385c3Cfd44C1E4b77a6c9e4DE8DAC9345E43ff3      KyberNetworkProxy :      0xd719c34261e099Fdb33030ac8909d5788D3039C4
   
   
        PriceOracle.sol  : 0x9d642b9537Ac201f35A066fE4830Bc835a4e3115
        https://ropsten.etherscan.io/address/0x9d642b9537Ac201f35A066fE4830Bc835a4e3115
	

   Price Orcale Deploy Parameter:


  _controller :  0xbd69a021a74e942505FE0C908DeDFee102BF78BE
  
  _masterQuoteAsset : 0x068b43f7f2f2c6a662c36e201144ae45f7a1c040
  
   _adapters : ["0xa385c3Cfd44C1E4b77a6c9e4DE8DAC9345E43ff3"]
  
   _assetOnes :  ["0xdb0040451f373949a4be60dcd7b6b8d6e42658b6","0x068b43f7f2f2c6a662c36e201144ae45f7a1c040"]       [Mock_Bat,Mock_USDC]

   _assetTwos :  ["0xb4f7332ed719eb4839f091eddb2a3ba309739521","0x068b43f7f2f2c6a662c36e201144ae45f7a1c040"]        [Mock_LINK,Mock_USDC]

   _oracles : ["0x0000000000000000000000000000000000000000" , "0x0000000000000000000000000000000000000000"]


 
   0x9d642b9537Ac201f35A066fE4830Bc835a4e3115


 









	SET Token : RBATLINK Set: 0xb845572ED6225898Fa8c695bE0e7B363bbCdC0fC
      https://ropsten.etherscan.io/token/0xb845572ed6225898fa8c695be0e7b363bbcdc0fc
	
	
	 Token Addresses:

     1) Mock_WETH : 0xc778417e063141139fce010982780140aa0cd5ab
	 2) Mock_USDC : 0x068b43f7f2f2c6a662c36e201144ae45f7a1c040

     3) Mock_Bat : 0xdb0040451f373949a4be60dcd7b6b8d6e42658b6
     4) Mock_LINK : 0xb4f7332ed719eb4839f091eddb2a3ba309739521



       // To put in comment of SetTokenCreator File

  To Put In Comment
	
     Create SET with following underlying Component:
     
     
     Underlying Component 1 : Mock_Bat = 0xdb0040451f373949a4be60dcd7b6b8d6e42658b6  ,  Allocation % = 50%
     Underlying Component 2 : Mock_LINK = 0xb4f7332ed719eb4839f091eddb2a3ba309739521  ,  Allocation % = 50%
     
     ["0xdb0040451f373949a4be60dcd7b6b8d6e42658b6" , "0xb4f7332ed719eb4839f091eddb2a3ba309739521"]    [Mock_Bat,Mock_LINK]
     
	 ["2000000000000000000" ,"500000000000000000"]    [ 2 Mock_Bat , 0.5 Mock_LINK]
    
	 ["0xE0E22d8bdC10F69982BdBD84327f3602a163A18E" , "0x41076F5b0582B07C741af90019B02DC7ED00A87b" , "0x8811e751C566152eA829cF173DdDe25916F487D7" ]    [Modules To Be Added]
                [BasicIssuanceModuleRopstenAddress ,NAVIssuanceRopstenAddress , StreamingFeeModuleRopstenAddress]
   
 0x3793f758a36c04B51a520a59520e4d845f94F9F2   [Manager Address]
  
  Symbol : RBATLINK
  Ropsten-BAT-LINK       [Name]
    
     -------------------------------------------------------------

	  
	controller init
	//factory
	["0x0BE45e0c58A1202e0d26458DbA0711329F758bd2"]
	//modules
	["0xE0E22d8bdC10F69982BdBD84327f3602a163A18E" , "0x41076F5b0582B07C741af90019B02DC7ED00A87b" , "0x8811e751C566152eA829cF173DdDe25916F487D7" ]
	//resource - integration registry
	["0x83E6Db0A619e8BF4A8e370E456a50A7ae01Bdf75"]
	// resourceID
	["0"]
	


    ------------------------------------------------------------------ 
     Data provided to Intialize NAVIssuance:
     
     ["0x0000000000000000000000000000000000000000", "0x0000000000000000000000000000000000000000", ["0x068b43f7f2f2c6a662c36e201144ae45f7a1c040"], "0x3793f758a36c04B51a520a59520e4d845f94F9F2", ["100000000000000" , "10000000000000000"], "800000000000000000" , "10000000000000000" , "100000000000000000" , "1000000000000000000"]
managerIssuanceHook = '0x0000000000000000000000000000000000000000',
managerRedemptionHook = '0x0000000000000000000000000000000000000000',
	
address[] reserveAssets = ['0x068b43f7f2f2c6a662c36e201144ae45f7a1c040']  // USDC  On Ropsten
address feeRecipient = '0x3793f758a36c04B51a520a59520e4d845f94F9F2'
uint256[2] managerFees = [100000000000000 , 10000000000000000]   // [0.01% , 1%]  //        0.01% -> 100000000000000(10^14)      1% -> 10000000000000000 (10^16)
uint maxManagerFee = 800000000000000000                // 80%  ->  800000000000000000
uint premiumPercentage  = 10000000000000000                     // 1% ->  10000000000000000  
	
uint maxPremiumPercentage = 100000000000000000	               // 10% -> 100000000000000000
		
uint minSetTokenSupply     = 	1000000000000000000	            // 1 Token   ->   1000000000000000000
Reserve USDC Asset Quanity to supply  Set: 100 USDC    100000000000000000000
		





  StreamingFeeModule Intialize
  
   _setToken : 0xb845572ED6225898Fa8c695bE0e7B363bbCdC0fC
   
   _settings : ["0x3793f758a36c04B51a520a59520e4d845f94F9F2","800000000000000000" ,"200000000000000000","0"]       [feeRecipient , maxStreamingFeePercentage , streamingFeePercentage , lastStreamingFeeTimestamp]


    maxStreamingFeePercentage  = 800000000000000000      80%
	streamingFeePercentage  = 200000000000000000       20%
		
	lastStreamingFeeTimestamp =  1633414127







   To issue 1 RBATLINK Set : 

   Bat = 50%
   LINK = 50%
	   
	   Set Strating Price of SET = 10$
	   
	    So, req BAT  = (50% * 10)/0.72 = 7 BAT  =  7* 10^18 = 7000000000000000000  BAT
			req LINK = (50% * 10)/27.12 = 0.184 LINK  =  0.184 * 10^18 =  184000000000000000 LINK

    Current BAT Price : $ 0.72

    Current LINK Price : $27.12


    
----------------------------------------------------------


  EXAMPLE AND FORMULA TO CALCULATE BASELINE QTY OF UNTERLYING COMPONENTS OF A GIVEN SET 

 1) Suppose you want to create SET Token name (DAI - BAT) SET. 

 2) DAI current market price = $1 (assume) ----> fetch rom 1 inch API 

 3) BAT current market price = $2 (assume) ----> fetch rom 1 inch API 

 4) Suppose your input% allocation for : 

                                 DAI = 60%  (input)  BAT = 40% (input) 

 5) Suppose your starting price(face value) of your (DAI-BAT) set (which you will set in metadata) = $200 (Input) 

 6)Then,BASELINEAQTY of DAI Token REQ to ISSUE 1 (DAI-BAT) SET 

                              =  (Allocation% of DAI * STARTING PRICE OF (DAI-BAT) SET TOKEN)/ price of DAI token 

                       = ( 60% *200)/1$ = 120 QTY OF DAI TOKEN 

 

7)Then, BASELINEAQTY of BAT Token REQ to ISSUE 1 (DAI-BAT) SET  

                                 =(Allocation% of BAT * STARTING PRICE OF (DAI-BAT) SET TOKEN)/ price of BAT token 

                         =  ( 40% *200)/2$ = 40 QTY OF BAT TOKEN 

 

       ( 120(DAI) * 1$) + (40(BAT) * 2$) = 200$ (100% colltarized) 

  

This point 6 and 7 will go into QTY parameter while creating the set. 

     
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
        
        
        
