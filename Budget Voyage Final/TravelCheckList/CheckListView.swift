//
//  CheckListView.swift
//  Budget Voyage Final
//
//  Created by Min Thu Khine on 6/3/24.
//
struct TaskItem: Identifiable {
    let id = UUID()
    var name: String
    var isCompleted: Bool = false
}

import SwiftUI

struct CheckListView: View {
    @State private var isAddCheckListSheetVisible = false
    @State private var tasks = [TaskItem]()
    @State private var isCompleteTaskAlert = false
    @State private var isAllTasksCompleted = false
    
    var completedTasks: Int {
        tasks.filter{$0.isCompleted}.count
    }
    
    var totalTasks: Int {
        tasks.count
    }
    
    var percentComplete : CGFloat {
        
        if tasks.isEmpty{
            return 0
        } else {
            return Double(completedTasks) / Double(totalTasks)
        }
    }

    
    var body: some View {
        
        VStack {
            VStack {
                HStack {
                    Image("checklisticon")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .background(Color.purple)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text("Travel Checklist")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Make a checklist for your trip")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }
            
            List {
                
                ForEach(tasks) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Button(action: {
                            print(completedTasks)
                            print("___")
                            print(totalTasks)
                            toggleCompletion(for: item)
                            if completedTasks  == totalTasks {
                                isCompleteTaskAlert = true
                                //                                    tasks = []
                            }
                            
                            
                        }, label: {
                            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                        })
                        
                    }
                }
              
             
                .onMove(perform: move)
                .onDelete(perform: deleteTask)
               
             
                
            }
            
            HStack {
                Spacer()
                Button(action: {
                    isAddCheckListSheetVisible = true
                }, label: {
                    AddNewTripButton(icon: "plus", text: "Add New List")
                })
                .sheet(isPresented: $isAddCheckListSheetVisible, content: {
                    AddCheckListView(tasks: $tasks, sheetVisible: $isAddCheckListSheetVisible)
                })
            }
            .padding()
        }
        
    }
    
    func toggleCompletion(for task: TaskItem) {
        isAllTasksCompleted = false
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
        
    }
    
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
}


#Preview {
    CheckListView()
}
