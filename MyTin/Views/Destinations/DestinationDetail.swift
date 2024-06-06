//
//  DestinationDetail.swift
//  MyTin
//
//  Created by Marshanda Gwie on 05/06/24.
//

import SwiftUI

struct DestinationDetail: View {
    var destination: Destination

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "cup.and.saucer")
                Text(destination.name) // destination name
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                
            }
            Divider()
            
            HStack {
                VStack {
                    Image(systemName: "pin")
                    Image(systemName: "checkmark.square")
                }
                .foregroundColor(.gray)
                .padding(.leading, 12)
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("Address")
                    Text("Visited")
                }
                .foregroundColor(.gray)
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text(destination.address)
                    Image(systemName: destination.isVisited ? "checkmark.square.fill" : "square")
                }
                .padding(.horizontal, 18)
                .padding(.bottom)
            }
            
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
            
            ForEach(destination.toDoList) { todo in
                HStack {
                    VStack {
                        Image(systemName: todo.isDone ? "checkmark.square.fill" : "square")
                    }
                    
                    VStack {
                        Text(todo.task)
                    }
                    
                    Spacer()
                }
                .padding(.leading, 40)
                .padding(.trailing, 50)
                .padding(.top, 2)
            }
        }
        
        Spacer()
    }
}

#Preview {
    DestinationDetail(destination: Destination(
        name: "Four Barrel Coffee",
        address: "375 Valencia St, San Francisco, CA 94103",
        toDoList: [
            ToDo(task: "Try the latte", isDone: true),
            ToDo(task: "Buy a bag of beans", isDone: false)
        ],
        isVisited: true
    ))
}
