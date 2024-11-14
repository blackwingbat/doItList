//
//  ContentView.swift
//  doItList
//
//  Created by Ahmad Fadel on 12/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task]=[]
    
    var body: some View {
        NavigationView{
            List{
                ForEach(tasks) { task in
                    TaskRow(task: task)
                }
                .onDelete(perform: deleteTask)
            }
            .navigationBarTitle("Do-It List")
            .navigationBarItems(trailing:
                                    Button(action: addTask){
                Image(systemName:"plus")
            }
            )
        }
        
    }
    func deleteTask(at offsets: IndexSet){
        tasks.remove(atOffsets: offsets)
    }
    
    func addTask(){
        
    }
    
}

struct Task: Identifiable{
    let id = UUID()
    var title: String
    var description: String
    var priority: String
    var isCompleted: Bool
}

struct TaskRow: View{
    var task: Task
    
    var body: some View{
        HStack{
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle").onTapGesture {
                
            }
            VStack(alignment: .leading){
                Text(task.title)
                    .font(.headline)
                Text(task.priority)
                    .font(.subheadline)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
