//
//  EventFilters.swift
//  HelpNear
//
//  Created by Садык Мусаев on 12.06.2022.
//

import UIKit

class EventFilters: UIViewController{
    
    var viewModel: EventCollectionViewModel!
    unowned let collection: UICollectionView
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, collection: UICollectionView) {
        
        self.collection = collection
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func formatSegmentChangedValue(_ sender: UISegmentedControl) {
        
        var newFilter = viewModel.getCurrentFilters()
        
        newFilter.format = EventCollectionFilterModel.Format(rawValue: sender.selectedSegmentIndex) ?? .all
        
        viewModel.updateFilters(newFilter: newFilter, handler: {})
    }
    
    @IBAction func startDatePickerChangedValue(_ sender: UIDatePicker) {
        
        var newFilter = viewModel.getCurrentFilters()
        
        newFilter.startDate = sender.date
        
        viewModel.updateFilters(newFilter: newFilter, handler: {})
    }
    
    @IBAction func endDatePickerChangedValue(_ sender: UIDatePicker) {
        
        var newFilter = viewModel.getCurrentFilters()
        
        newFilter.endDate = sender.date
        
        viewModel.updateFilters(newFilter: newFilter, handler: {})
    }
    
    @IBAction func difficultSegmentChangedValue(_ sender: UISegmentedControl) {
        
        var newFilter = viewModel.getCurrentFilters()
        
        newFilter.difficult = EventCollectionFilterModel.Difficult(rawValue: sender.selectedSegmentIndex) ?? .all
        
        viewModel.updateFilters(newFilter: newFilter, handler: {})
    }
    
    
    @IBAction func salarySegmentChangedValue(_ sender: UISegmentedControl) {
        
        var newFilter = viewModel.getCurrentFilters()
        
        newFilter.salary = EventCollectionFilterModel.Salary(rawValue: sender.selectedSegmentIndex) ?? .all
        
        viewModel.updateFilters(newFilter: newFilter, handler: { })
    }
    
    
    @IBAction func fastSegmentChangedValue(_ sender: UISegmentedControl) {
        
        var newFilter = viewModel.getCurrentFilters()
        
        newFilter.howFast = EventCollectionFilterModel.HowFast(rawValue: sender.selectedSegmentIndex) ?? .all
        
        viewModel.updateFilters(newFilter: newFilter, handler: { })
    }
    @IBAction func dismiss(_ sender: Any) {}
}
