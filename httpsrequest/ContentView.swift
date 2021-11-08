//
//  ContentView.swift
//  httpsrequest
//
//  Created by Ritik Sinha on 08/11/21.
//

import SwiftUI



var name:String?



struct MyUrlModel: Decodable {

    let name:String

    let email:String

}







struct ContentView: View {

    

    

    @State var msg = ""

    

    var body: some View {

        VStack {

            Text("\(msg)")

                .padding()

            

            Button(action: {

                GetDataFromServer()

                print("start")

            }, label: {

                Text("Get Data")

                    .frame(width: UIScreen.main.bounds.width-20, height: 50, alignment: .center)

                    .background(Color.blue)

                    .foregroundColor(Color.white)

                    .cornerRadius(5)

            })

        }

    }

    

    func GetDataFromServer(){

        

        guard let myurl = URL(string: "") else{

            

            print("invalid URL")

            

            return

        }

        

        print("Process atrted")

        

        

        URLSession.shared.dataTask(with: myurl){ (data, res, err) in

            print("session stsrted")

            

            do{

            

                    if let mydata = data{

                        

                        let result = try JSONDecoder().decode([MyUrlModel].self, from: mydata)

                        

                        msg = "  \(result)"

                        

                        print(result)

                        

                    } else{

                        print("some error")

                    }

            } catch(let error){

                

                print("\(error.localizedDescription)")

                

            }

            

        }.resume()

        

        

    }

    

    func MyData()->String{

        

        

        //name = "Shafiq"

        

        guard let mydata = name else{

            

            return "no value"

        }

        

        return mydata

    }

    

    func MyData2()->String{

        

        

        name = "Shafiq"

        

        if let mydata = name {

            return mydata

        } else{

            return "no data here"

        }

       

    }

}



struct ContentView_Previews: PreviewProvider {

    static var previews: some View {

        ContentView()
            .previewDevice("iPhone 13")

    }

}

