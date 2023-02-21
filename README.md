# NewsApp-MVVM
NewsApp is an iOS App based on MVVM + Clean Architecture written in Swift Language. 

Flow of the App: 
On the launch of the App, We're fetching News data from the public api https://newsapi.org

MVVM + Clean Architecture consists of following layers: 

# 1. View (View Controllers)
Whatever actions user takes will be taken care by View. 

# 2. ViewModel 
This action will reach to the View Model where we've written our Businiss Logic. 

# 3. Repository Layer 
In Clean Architecture, we have this extra layer of Repository which is reponsible for making all the Data and API Calls on behalf of ViewModel. (Earlier we were writting this code in ViewModels only.) Repository layer will get data back from the Network layer and this will be observed by ViewModel with of help of either RxSwift, delegate, closures or Combine. 

# 4. Coordinator 
Coordinator will maintain the complete flow of navigation. It will manage the navigation for every screen you'll be having a dedicated Coordinator.

# 5. Assembler/ Factory  
Dependency supplier in MVVM between all the different layers. 
