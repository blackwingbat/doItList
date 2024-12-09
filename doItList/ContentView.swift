//
//  ContentView.swift
//  doItList
//
//  Created by Ahmad Fadel on 12/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = []
    @State private var isPresentingAddTaskView = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach($tasks) { $task in
                    TaskRow(task: $task)
                }
                .onDelete(perform: deleteTask)
            }
            .navigationBarTitle("Do-It List")
            .navigationBarItems(trailing:
                                    Button(action: addTask){
                Image(systemName:"plus")
            }
            )
            .sheet(isPresented: $isPresentingAddTaskView){
                AddTaskView(tasks: $tasks)
            }
        }
        
    }
    func deleteTask(at offsets: IndexSet){
        tasks.remove(atOffsets: offsets)
    }
    
    func addTask(){
        isPresentingAddTaskView = true
    }
    
}

struct Task: Identifiable{
    let id = UUID()
    var title: String
    var description: String
    var priority: String
    var isCompleted: Bool
}

struct TaskRow: View {
    @State private var isPresentingDetailedView = false
    @Binding var task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                Text(task.priority)
                    .font(.subheadline)
            }
            Spacer()
            Button(action: {
                isPresentingDetailedView = true
            }) {
                Image(systemName: "info.circle")
            }
            .sheet(isPresented: $isPresentingDetailedView) {
                TaskDetailView(task: $task)
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
