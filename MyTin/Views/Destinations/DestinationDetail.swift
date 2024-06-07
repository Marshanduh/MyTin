//
//  DestinationDetail.swift
//  MyTin
//
//  Created by Marshanda Gwie on 05/06/24.
//

import SwiftUI

struct DestinationDetail: View {
    @Binding var destination: Destination
    @Binding var todoList: [ToDo]
    
    let columns = [
        GridItem(.flexible())
    ]
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "pin")
                Text(destination.name) // destination name
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                
            }
            Divider()
            
            Grid {
                GridRow {
                    Image(systemName: "pin")
                        .foregroundColor(.gray)
                        .padding(.leading, 12)
                    Text("Address")
                        .foregroundColor(.gray)
                    Text(destination.address)
                        .padding(.horizontal, 18)
                }
                .padding(.bottom,12)
                GridRow {
                    Image(systemName: "checkmark.square")
                        .foregroundColor(.gray)
                        .padding(.leading, 12)
                    Text("Visited")
                        .foregroundColor(.gray)
                    Image(systemName: destination.isVisited ? "checkmark.square.fill" : "square")
                        .padding(.horizontal, 18)
                }
            }
            .padding(.bottom)
            
            
            
            HStack {
                Image(systemName: "list.bullet")
                Text("To-do List")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "plus")
            }
            .padding(.leading, 16)
            .padding(.trailing, 50)
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(todoList.indices, id: \.self) { index in
                    Button {
                        todoList[index].isDone.toggle()
                    } label: {
                        HStack {
                            Image(systemName: todoList[index].isDone ? "checkmark.square.fill" : "square")
                                .foregroundColor(todoList[index].isDone ? .black : .gray)
                            Text(todoList[index].task)
                                .foregroundColor(todoList[index].isDone ? .gray : .black)
                                    .strikethrough(todoList[index].isDone, color: .gray)
                        }
                    }
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity, alignment: .leading) // align the content to leading
                    
                }
            }
            .padding(.leading, 50)
            .padding(.trailing, 16)
            .padding(.top, 10)
            
        }
        
        Spacer()
    }
}

//#Preview {
//    DestinationDetail(
//        destination: .constant(Destination(
//            name: "Four Barrel Coffee",
//            address: "375 Valencia St, San Francisco, CA 94103",
//            toDoList: [
//                ToDo(task: "Try the latte", isDone: true),
//                ToDo(task: "Buy a bag of beans", isDone: false)
//            ],
//            isVisited: true
//        )),
//        todoList: .constant([
//            ToDo(task: "Try the latte", isDone: true),
//            ToDo(task: "Buy a bag of beans", isDone: false)
//        ])
//    )
//}


struct DestinationDetail_Previews: PreviewProvider {
    static var previews: some View {
        DestinationDetail(
            destination: .constant(Destination(
                name: "Four Barrel Coffee",
                address: "375 Valencia St, San Francisco, CA 94103",
                toDoList: [
                    ToDo(task: "Try the latte", isDone: true),
                    ToDo(task: "Buy a bag of beans", isDone: false)
                ],
                isVisited: true
            )),
            todoList: .constant([
                ToDo(task: "Try the latte", isDone: true),
                ToDo(task: "Buy a bag of beans", isDone: false)
            ])
        )
    }
}
