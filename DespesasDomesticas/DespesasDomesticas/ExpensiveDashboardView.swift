//
//  ExpensiveDashboardView.swift
//  DespesasDomesticas
//
//  Created by Barros, Thiego Italo Santos on 21/05/26.
//

import SwiftUI

struct ExpenseDashboardView: View {
    @StateObject private var viewModel = ExpenseViewModel()
    
    // Estados do formulário de entrada
    @State private var selectedCategory = "Energia"
    @State private var amountText = ""
    @State private var inputMonth = "Janeiro"
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // 1. Seletor de Mês no Topo (Filtro)
                Picker("Mês", selection: $viewModel.selectedMonth) {
                    ForEach(viewModel.months, id: \.self) { month in
                        Text(month).tag(month)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .onChange(of: viewModel.selectedMonth) { _ in
                    viewModel.fetchExpenses()
                }
                
                // 2. Quadro de Resumo Financeiro
                VStack {
                    Text("Total gasto em \(viewModel.selectedMonth)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("R$ \(viewModel.totalMonthlyExpenses, specifier: "%.2f")")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundColor(viewModel.totalMonthlyExpenses > 0 ? .red : .primary)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                // 3. Formulário de Inserção Rápida
                VStack(alignment: .leading, spacing: 10) {
                    Text("Novo Gasto")
                        .font(.headline)
                    
                    HStack {
                        Picker("Categoria", selection: $selectedCategory) {
                            ForEach(viewModel.categories, id: \.self) { cat in
                                Text(cat).tag(cat)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        TextField("Valor (R$)", text: $amountText)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(.roundedBorder)
                        
                        Button(action: saveNewExpense) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                                .foregroundColor(.blue)
                        }
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
                .padding(.horizontal)
                
                // 4. Lista de Despesas Cadastradas
                List {
                    Section(header: Text("Histórico do Mês")) {
                        if $viewModel.filteredExpenses.isEmpty {
                            Text("Nenhuma despesa para este mês.")
                                .foregroundColor(.secondary)
                                .font(.subheadline)
                        } else {
                            ForEach(viewModel.filteredExpenses, id: \.id) { expense in
                                QHStackExpenseRow(expense: expense)
                            }
                            .onDelete(perform: viewModel.deleteExpense)
                        }
                    }
                }
            }
            .navigationTitle("Finanças Domésticas")
            .background(Color(.systemGroupedBackground))
        }
    }
    
    private func saveNewExpense() {
        guard let amount = Double(amountText.replacingOccurrences(of: ",", with: ".")), amount > 0 else { return }
        
        // Adiciona no mês que está sendo visualizado no seletor do app
        viewModel.addExpense(name: selectedCategory, amount: amount, month: viewModel.selectedMonth)
        
        // Reseta o campo de texto
        amountText = ""
        hideKeyboard()
    }
}

// Linha personalizada para a lista de despesas
struct QHStackExpenseRow: View {
    let expense: Expense
    
    var body: some View {
        HStack {
            Text(expense.category ?? "Outros")
                .font(.body)
            Spacer()
            Text("- R$ \((expense.amount), specifier: "%.2f")")
                .foregroundColor(.red)
                .bold()
        }
    }
}

// Extensão utilitária para fechar o teclado numérico
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ExpenseDashboardView()
}
