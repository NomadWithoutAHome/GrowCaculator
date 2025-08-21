/**
 * Main JavaScript functionality for GrowCalculator
 */

// Global state
let selectedMutations = [];
let currentVariant = 'Normal';
let currentPlant = 'Carrot';
let allMutations = [];
let allPlants = [];
let allVariants = [];

// API endpoints
const API_BASE = '/api';

/**
 * Initialize the calculator form
 */
function initializeCalculatorForm() {
    console.log('Initializing calculator form...');
    
    // Initialize variant selection
    const variantRadios = document.querySelectorAll('input[name="variant"]');
    variantRadios.forEach(radio => {
        radio.addEventListener('change', function() {
            currentVariant = this.value;
            updateCalculationIfReady();
        });
    });

    // Auto-calculate on input changes
    const weightInput = document.getElementById('plant-weight');
    const amountInput = document.getElementById('plant-amount');
    
    if (weightInput) {
        weightInput.addEventListener('input', debounce(updateCalculationIfReady, 500));
    }
    
    if (amountInput) {
        amountInput.addEventListener('input', debounce(updateCalculationIfReady, 500));
    }
    
    // Initialize plant grid functionality
    initializePlantGrid();
    
    // Initialize weight range for default plant
    updateWeightRange();
    
    // Initialize action buttons
    initializeActionButtons();
    
    // Initialize mutation selection
    initializeMutationSelection();
    
    // Trigger initial calculation
    setTimeout(() => {
        updateCalculationIfReady();
    }, 100);
}

/**
 * Initialize plant grid functionality
 */
function initializePlantGrid() {
    const plantGrid = document.getElementById('plant-grid');
    const searchInput = document.getElementById('plant-search');
    
    if (!plantGrid) {
        console.warn('Plant grid not found');
        return;
    }
    
    console.log('Initializing plant grid...');
    
    // Add click handlers to plant buttons
    plantGrid.addEventListener('click', function(e) {
        const plantButton = e.target.closest('[data-plant]');
        if (!plantButton) return;
        
        console.log('Plant clicked:', plantButton.dataset.plant);
        
        // Remove previous selection - look for any selected plant
        const previousSelected = plantGrid.querySelector('[aria-pressed="true"]');
        if (previousSelected) {
            previousSelected.classList.remove('bg-green-800', 'border-green-600', 'ring-2', 'ring-green-400');
            previousSelected.classList.add('bg-gray-700', 'border-gray-600');
            previousSelected.setAttribute('aria-pressed', 'false');
        }
        
        // Add selection to clicked plant
        plantButton.classList.remove('bg-gray-700', 'border-gray-600');
        plantButton.classList.add('bg-green-800', 'border-green-600', 'ring-2', 'ring-green-400');
        plantButton.setAttribute('aria-pressed', 'true');
        
        // Update current plant
        currentPlant = plantButton.dataset.plant;
        console.log('Selected plant:', currentPlant);
        
        // Update weight range first, then trigger calculation when complete
        updateWeightRange().then(() => {
            console.log('Weight range update complete, now triggering calculation...');
            // Now that weight range is updated, trigger calculation
            updateCalculationIfReady();
        }).catch(error => {
            console.error('Error updating weight range:', error);
            // Still try to calculate even if weight range fails
            updateCalculationIfReady();
        });
    });
    
    // Search functionality
    if (searchInput) {
        searchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            console.log('Searching for:', searchTerm);
            
            const plantButtons = plantGrid.querySelectorAll('[data-plant]');
            
            plantButtons.forEach(button => {
                const plantName = button.dataset.plant.toLowerCase();
                if (plantName.includes(searchTerm)) {
                    button.style.display = '';
                } else {
                    button.style.display = 'none';
                }
            });
        });
    } else {
        console.warn('Search input not found');
    }
    
    // Select default plant (Carrot)
    const defaultPlant = plantGrid.querySelector('[data-plant="Carrot"]');
    if (defaultPlant) {
        console.log('Setting default plant: Carrot');
        defaultPlant.classList.remove('bg-gray-700', 'border-gray-600');
        defaultPlant.classList.add('bg-green-800', 'border-green-600', 'ring-2', 'ring-green-400');
        defaultPlant.setAttribute('aria-pressed', 'true');
        currentPlant = 'Carrot';
    } else {
        console.warn('Default plant (Carrot) not found');
    }
}

/**
 * Initialize action buttons
 */
function initializeActionButtons() {
    console.log('Initializing action buttons...');
    
    // Max mutations button
    const maxButton = document.getElementById('max-mutations');
    if (maxButton) {
        maxButton.addEventListener('click', function() {
            console.log('Max mutations button clicked');
            
            // Clear all mutations first
            selectedMutations = [];
            const mutationCheckboxes = document.querySelectorAll('input[type="checkbox"][data-mutation]');
            mutationCheckboxes.forEach(checkbox => {
                checkbox.checked = false;
                const label = checkbox.closest('label');
                if (label) {
                    label.classList.remove('bg-green-700/50', 'border-green-500', 'text-white');
                    label.classList.add('bg-gray-700/30', 'text-gray-300');
                }
            });
            
            // Add max mutations
            const maxMutations = ['Shocked', 'Celestial', 'Paradisal'];
            maxMutations.forEach(mutationName => {
                const checkbox = document.querySelector(`input[data-mutation="${mutationName}"]`);
                if (checkbox) {
                    checkbox.checked = true;
                    const label = checkbox.closest('label');
                    if (label) {
                        label.classList.remove('bg-gray-700/30', 'text-gray-300');
                        label.classList.add('bg-green-700/50', 'border-green-500', 'text-white');
                    }
                    selectedMutations.push(mutationName);
                }
            });
            
            console.log('Applied max mutations:', selectedMutations);
            updateCalculationIfReady();
        });
    } else {
        console.warn('Max mutations button not found');
    }
    
    // Clear all button
    const clearAllButton = document.getElementById('clear-all');
    if (clearAllButton) {
        clearAllButton.addEventListener('click', function() {
            console.log('Clear all button clicked');
            
            // Clear mutations
            selectedMutations = [];
            const mutationCheckboxes = document.querySelectorAll('input[type="checkbox"][data-mutation]');
            mutationCheckboxes.forEach(checkbox => {
                checkbox.checked = false;
                const label = checkbox.closest('label');
                if (label) {
                    label.classList.remove('bg-green-700/50', 'border-green-500', 'text-white');
                    label.classList.add('bg-gray-700/30', 'text-gray-300');
                }
            });
            
            // Reset variant to Normal
            currentVariant = 'Normal';
            const normalRadio = document.querySelector('input[value="Normal"]');
            if (normalRadio) {
                normalRadio.checked = true;
                // Update variant visual state
                const variantRadios = document.querySelectorAll('input[name="variant"]');
                variantRadios.forEach(radio => {
                    const label = radio.closest('label');
                    if (label) {
                        if (radio.checked) {
                            label.classList.remove('bg-gray-700/30', 'text-gray-300');
                            label.classList.add('bg-green-700/50', 'border-green-500', 'text-white');
                        } else {
                            label.classList.remove('bg-green-700/50', 'border-green-500', 'text-white');
                            label.classList.add('bg-gray-700/30', 'text-gray-300');
                        }
                    }
                });
            }
            
            // Reset plant selection back to Carrot
            currentPlant = 'Carrot';
            const plantGrid = document.getElementById('plant-grid');
            if (plantGrid) {
                // Remove selection from all plants
                const allPlantButtons = plantGrid.querySelectorAll('[data-plant]');
                allPlantButtons.forEach(button => {
                    button.classList.remove('bg-green-800', 'border-green-600', 'ring-2', 'ring-green-400');
                    button.classList.add('bg-gray-700', 'border-gray-600');
                    button.setAttribute('aria-pressed', 'false');
                });
                
                // Select Carrot
                const carrotButton = plantGrid.querySelector('[data-plant="Carrot"]');
                if (carrotButton) {
                    carrotButton.classList.remove('bg-gray-700', 'border-gray-600');
                    carrotButton.classList.add('bg-green-800', 'border-green-600', 'ring-2', 'ring-green-400');
                    carrotButton.setAttribute('aria-pressed', 'true');
                }
            }
            
            // Reset weight to Carrot's base weight
            const weightInput = document.getElementById('plant-weight');
            if (weightInput) {
                weightInput.value = '0.24';
            }
            
            // Reset plant amount to 1
            const amountInput = document.getElementById('plant-amount');
            if (amountInput) {
                amountInput.value = '1';
            }
            
            console.log('Cleared all selections, reset to Carrot');
            
            // Update weight range and trigger calculation
            updateWeightRange().then(() => {
                updateCalculationIfReady();
            });
        });
    } else {
        console.warn('Clear all button not found');
    }
}

/**
 * Update variant selection styling
 */
function updateVariantSelection(selectedVariant) {
    const variantLabels = document.querySelectorAll('input[name="variant"]');
    variantLabels.forEach(radio => {
        const label = radio.closest('label');
        if (label) {
            if (radio.value === selectedVariant) {
                label.classList.remove('bg-gray-700/30', 'text-gray-300');
                label.classList.add('bg-green-700/50', 'border-green-500', 'text-white');
            } else {
                label.classList.remove('bg-green-700/50', 'border-green-500', 'text-white');
                label.classList.add('bg-gray-700/30', 'text-gray-300');
            }
        }
    });
}



/**
 * Initialize mutation selection functionality
 */
function initializeMutationSelection() {
    const mutationCheckboxes = document.querySelectorAll('input[type="checkbox"][data-mutation]');
    const variantRadios = document.querySelectorAll('input[name="variant"]');
    
    console.log('Initializing mutation selection...');
    console.log('Found mutation checkboxes:', mutationCheckboxes.length);
    console.log('Found variant radios:', variantRadios.length);
    
    // Handle mutation checkboxes
    mutationCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const label = this.closest('label');
            if (this.checked) {
                label.classList.remove('bg-gray-700/30', 'text-gray-300');
                label.classList.add('bg-green-700/50', 'border-green-500', 'text-white');
                selectedMutations.push(this.dataset.mutation);
                console.log('Added mutation:', this.dataset.mutation);
            } else {
                label.classList.remove('bg-green-700/50', 'border-green-500', 'text-white');
                label.classList.add('bg-gray-700/30', 'text-gray-300');
                const index = selectedMutations.indexOf(this.dataset.mutation);
                if (index > -1) {
                    selectedMutations.splice(index, 1);
                    console.log('Removed mutation:', this.dataset.mutation);
                }
            }
            console.log('Current mutations:', selectedMutations);
            updateCalculationIfReady();
        });
    });
    
    // Handle variant radios
    variantRadios.forEach(radio => {
        radio.addEventListener('change', function() {
            console.log('Variant changed to:', this.value);
            
            // Update visual state for all variant labels
            variantRadios.forEach(r => {
                const label = r.closest('label');
                if (r.checked) {
                    label.classList.remove('bg-gray-700/30', 'text-gray-300');
                    label.classList.add('bg-green-700/50', 'border-green-500', 'text-white');
                } else {
                    label.classList.remove('bg-green-700/50', 'border-green-500', 'text-white');
                    label.classList.add('bg-gray-700/30', 'text-gray-300');
                }
            });
            
            currentVariant = this.value;
            updateCalculationIfReady();
        });
    });
}



/**
 * Toggle mutation selection
 */
function toggleMutation(mutationName) {
    const index = selectedMutations.indexOf(mutationName);
    
    if (index > -1) {
        selectedMutations.splice(index, 1);
    } else {
        selectedMutations.push(mutationName);
    }
    
    updateMutationDisplay();
    updateCalculationIfReady();
}

/**
 * Update mutation display
 */
function updateMutationDisplay() {
    // Update button states
    const mutationButtons = document.querySelectorAll('.mutation-chip');
    mutationButtons.forEach(button => {
        const mutation = button.getAttribute('data-mutation');
        if (selectedMutations.includes(mutation)) {
            button.classList.add('selected');
        } else {
            button.classList.remove('selected');
        }
    });

    // Update selected mutations list
    const selectedDiv = document.getElementById('selected-mutations');
    const mutationList = document.getElementById('mutation-list');
    
    if (selectedDiv && mutationList) {
        if (selectedMutations.length > 0) {
            selectedDiv.classList.remove('hidden');
            mutationList.innerHTML = selectedMutations.map(mutation => 
                `<span class="bg-purple-100 text-purple-800 px-2 py-1 rounded-full text-sm">${mutation}</span>`
            ).join('');
        } else {
            selectedDiv.classList.add('hidden');
        }
    }
}



/**
 * Calculate plant value
 */
async function calculatePlantValue() {
    const weightInput = document.getElementById('plant-weight');
    const amountInput = document.getElementById('plant-amount');
    
    if (!weightInput || !amountInput) return;

    const plantName = currentPlant;
    const weight = parseFloat(weightInput.value);
    const amount = parseInt(amountInput.value);

    console.log('Calculating for:', plantName, weight, amount, selectedMutations);

    if (!plantName || !weight || weight <= 0 || !amount || amount <= 0) {
        console.log('Invalid inputs, hiding results');
        hideResults();
        return;
    }

    try {
        const response = await fetch(`${API_BASE}/calculate`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                plant_name: plantName,
                variant: currentVariant,
                weight: weight,
                mutations: selectedMutations,
                plant_amount: amount
            })
        });

        if (!response.ok) {
            throw new Error('Calculation failed');
        }

        const result = await response.json();
        displayResults(result);
    } catch (error) {
        console.error('Calculation error:', error);
        hideResults();
    }
}

/**
 * Display calculation results
 */
function displayResults(result) {
    // The results are always visible in our new layout, just update them

    // Get current values for animation
    const currentResultValue = document.getElementById('result-value');
    const currentTotalValue = document.getElementById('total-value');
    const currentResultSheckles = document.getElementById('result-sheckles');
    const currentFinalSheckles = document.getElementById('final-sheckles');
    const currentTotalSheckles = document.getElementById('total-sheckles');
    
    // Extract current numeric values for smooth animation
    let currentDollarValue = 0;
    let currentTotalDollarValue = 0;
    let currentShecklesValue = 0;
    let currentFinalShecklesValue = 0;
    let currentTotalShecklesValue = 0;
    
    if (currentResultValue) {
        const currentText = currentResultValue.textContent;
        const match = currentText.match(/\$([0-9,]+)/);
        if (match) {
            currentDollarValue = parseInt(match[1].replace(/,/g, ''));
        }
    }
    
    if (currentTotalValue) {
        const currentText = currentTotalValue.textContent;
        const match = currentText.match(/\$([0-9,]+)/);
        if (match) {
            currentTotalDollarValue = parseInt(match[1].replace(/,/g, ''));
        }
    }
    
    if (currentResultSheckles) {
        const currentText = currentResultSheckles.textContent;
        const match = currentText.match(/\(([0-9,.]+)\)/);
        if (match) {
            currentShecklesValue = parseFloat(match[1].replace(/,/g, ''));
        }
    }
    
    if (currentFinalSheckles) {
        const currentText = currentFinalSheckles.textContent;
        const match = currentText.match(/([0-9,.]+)/);
        if (match) {
            currentFinalShecklesValue = parseFloat(match[1].replace(/,/g, ''));
        }
    }
    
    if (currentTotalSheckles) {
        const currentText = currentTotalSheckles.textContent;
        const match = currentText.match(/\(([0-9,.]+)/);
        if (match) {
            currentTotalShecklesValue = parseFloat(match[1].replace(/,/g, ''));
        }
    }

    // Update result displays with safety checks (non-animated elements)
    const elementsToUpdate = [
        { id: 'result-title', text: `${result.plant_name} | ${result.weight}kg | would cost around:` },
        { id: 'total-multiplier', text: `x${result.mutation_multiplier.toFixed(2)}` },
        { id: 'plant-name', text: result.plant_name },
        { id: 'weight-display', text: result.weight },
        { id: 'multiplier-display', text: `x${result.mutation_multiplier.toFixed(2)}` },
        { id: 'plant-count', text: result.plant_amount }
    ];
    
    elementsToUpdate.forEach(({ id, text }) => {
        updateElement(id, text);
    });
    
    // Animate the main dollar value
    if (currentResultValue) {
        animateNumber(currentResultValue, currentDollarValue, result.final_value, 500, true);
    }
    
    // Animate the total dollar value
    if (currentTotalValue) {
        animateNumber(currentTotalValue, currentTotalDollarValue, result.total_value, 500, false);
    }
    
    // Animate result-sheckles
    if (currentResultSheckles) {
        animateSheckles(currentResultSheckles, currentShecklesValue, result.final_value);
    }
    
    // Animate final-sheckles in the summary text
    if (currentFinalSheckles) {
        animateSheckles(currentFinalSheckles, currentFinalShecklesValue, result.final_value, 500, false, true);
    }
    
    // Animate total-sheckles
    if (currentTotalSheckles) {
        animateSheckles(currentTotalSheckles, currentTotalShecklesValue, result.total_value, 500, true);
    }
    
    // Show/hide total value section based on plant amount
    const totalValueSection = document.getElementById('total-value-section');
    if (totalValueSection) {
        if (result.plant_amount > 1) {
            totalValueSection.classList.remove('hidden');
        } else {
            totalValueSection.classList.add('hidden');
        }
    }

    // Update mutation breakdown
    const breakdownSpan = document.getElementById('mutation-breakdown');
    if (breakdownSpan) {
        if (result.mutations.length > 0) {
            breakdownSpan.textContent = `Mutations: ${result.mutations.join(', ')}`;
        } else {
            breakdownSpan.textContent = 'Default';
        }
    }
}

/**
 * Hide calculation results
 */
function hideResults() {
    // In our new layout, we don't hide results, just reset to defaults
    updateElement('result-title', 'Select a plant to calculate');
    updateElement('result-value', '🌿 ≈$0');
    
    // Update result-sheckles separately since it's nested
    const resultSheckles = document.getElementById('result-sheckles');
    if (resultSheckles) {
        resultSheckles.textContent = '(0.00)';
    }
}

/**
 * Update weight range display when plant changes
 */
async function updateWeightRange() {
    const weightRangeDiv = document.getElementById('weight-range');
    const weightMinSpan = document.getElementById('weight-min');
    const weightMaxSpan = document.getElementById('weight-max');
    
    if (!weightRangeDiv || !weightMinSpan || !weightMaxSpan) {
        return Promise.resolve();
    }
    
    const plantName = currentPlant;
    
    if (!plantName) {
        weightRangeDiv.classList.add('hidden');
        return Promise.resolve();
    }
    
    try {
        const response = await fetch(`${API_BASE}/weight-range/${encodeURIComponent(plantName)}`);
        
        if (!response.ok) {
            throw new Error('Failed to fetch weight range');
        }
        
        const weightRange = await response.json();
        
        // Update the display
        weightMinSpan.textContent = weightRange.min;
        weightMaxSpan.textContent = weightRange.max;
        weightRangeDiv.classList.remove('hidden');
        
        // Also update the weight input to the base weight
        const weightInput = document.getElementById('plant-weight');
        if (weightInput) {
            weightInput.value = weightRange.base;
        }
        
        console.log('Weight range updated for', plantName, 'base weight:', weightRange.base);
        
    } catch (error) {
        console.error('Weight range error:', error);
        weightRangeDiv.classList.add('hidden');
    }
    
    // Always return a resolved promise
    return Promise.resolve();
}

/**
 * Update calculation if inputs are ready
 */
function updateCalculationIfReady() {
    console.log('updateCalculationIfReady called');
    console.log('Current plant:', currentPlant);
    console.log('Current variant:', currentVariant);
    console.log('Selected mutations:', selectedMutations);
    
    if (currentPlant) {
        console.log('Triggering calculation...');
        calculatePlantValue();
    } else {
        console.log('No plant selected, skipping calculation');
    }
}

/**
 * Initialize mutation calculator (for mutation-calculator page)
 */
function initializeMutationCalculator() {
    if (!document.getElementById('selected-mutations-panel')) return;

    const mutationButtons = document.querySelectorAll('.mutation-btn');
    const selectedMutationsList = document.getElementById('selected-mutations-list');
    const multiplierDisplay = document.getElementById('total-multiplier-display');
    const breakdownDisplay = document.getElementById('multiplier-breakdown');

    mutationButtons.forEach(button => {
        button.addEventListener('click', function() {
            const mutation = this.getAttribute('data-mutation');
            toggleMutationInCalculator(mutation);
            updateMutationCalculatorDisplay();
        });
    });

    // Clear all button
    const clearAllButton = document.getElementById('clear-all-mutations');
    if (clearAllButton) {
        clearAllButton.addEventListener('click', function() {
            selectedMutations = [];
            updateMutationCalculatorDisplay();
        });
    }

    // Random mutations button
    const randomButton = document.getElementById('random-mutations');
    if (randomButton) {
        randomButton.addEventListener('click', function() {
            const allMutationNames = Array.from(mutationButtons).map(btn => btn.getAttribute('data-mutation'));
            selectedMutations = getRandomMutations(allMutationNames, 3);
            updateMutationCalculatorDisplay();
        });
    }

    function toggleMutationInCalculator(mutationName) {
        const index = selectedMutations.indexOf(mutationName);
        
        if (index > -1) {
            selectedMutations.splice(index, 1);
        } else {
            selectedMutations.push(mutationName);
        }
    }

    function updateMutationCalculatorDisplay() {
        // Update button states
        mutationButtons.forEach(button => {
            const mutation = button.getAttribute('data-mutation');
            if (selectedMutations.includes(mutation)) {
                button.classList.add('bg-purple-600', 'text-white');
                button.classList.remove('bg-gray-100', 'text-gray-700');
            } else {
                button.classList.remove('bg-purple-600', 'text-white');
                button.classList.add('bg-gray-100', 'text-gray-700');
            }
        });

        // Update selected mutations list
        if (selectedMutationsList) {
            if (selectedMutations.length > 0) {
                selectedMutationsList.innerHTML = selectedMutations.map(mutation => 
                    `<span class="bg-purple-100 text-purple-800 px-3 py-1 rounded-full text-sm font-medium">${mutation}</span>`
                ).join('');
            } else {
                selectedMutationsList.innerHTML = '<span class="text-gray-500 text-sm">No mutations selected</span>';
            }
        }

        // Calculate and display multiplier
        calculateMutationMultiplier();
    }

    async function calculateMutationMultiplier() {
        try {
            const response = await fetch(`${API_BASE}/mutation-multiplier`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(selectedMutations)
            });

            if (!response.ok) {
                throw new Error('Failed to calculate multiplier');
            }

            const result = await response.json();
            
            if (multiplierDisplay) {
                multiplierDisplay.textContent = `x${result.multiplier.toFixed(2)}`;
            }
            
            if (breakdownDisplay) {
                if (selectedMutations.length > 0) {
                    breakdownDisplay.textContent = `Base: 1.00 + Mutations: ${(result.multiplier - 1).toFixed(2)}`;
                } else {
                    breakdownDisplay.textContent = 'Base: 1.00';
                }
            }

            // Update example values
            updateExampleValues(result.multiplier);
            updateStatistics(result);

        } catch (error) {
            console.error('Multiplier calculation error:', error);
        }
    }

    function updateExampleValues(multiplier) {
        const carrotValue = document.getElementById('carrot-value');
        const strawberryValue = document.getElementById('strawberry-value');
        
        if (carrotValue) {
            const baseCarrotValue = 18;
            carrotValue.textContent = `$${formatNumber(Math.round(baseCarrotValue * multiplier))}`;
        }
        
        if (strawberryValue) {
            const baseStrawberryValue = 90000;
            strawberryValue.textContent = `$${formatNumber(Math.round(baseStrawberryValue * multiplier))}`;
        }
    }

    function updateStatistics(result) {
        const totalCount = document.getElementById('total-mutations-count');
        const averageValue = document.getElementById('average-mutation-value');
        const highestMutation = document.getElementById('highest-mutation');
        
        if (totalCount) {
            totalCount.textContent = result.total_mutations;
        }
        
        if (averageValue && result.total_mutations > 0) {
            averageValue.textContent = ((result.multiplier - 1) / result.total_mutations + 1).toFixed(2);
        }
        
        if (highestMutation && selectedMutations.length > 0) {
            // This would need mutation data to determine the highest
            highestMutation.textContent = selectedMutations[0]; // Placeholder
        }
    }
}

/**
 * Utility Functions
 */

// Format numbers with commas
function formatNumber(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/**
 * Animate number counting smoothly
 */
function animateNumber(element, startValue, endValue, duration = 500, isResultValue = false) {
    if (!element) return;
    
    const start = performance.now();
    const difference = endValue - startValue;
    
    function update(currentTime) {
        const elapsed = currentTime - start;
        const progress = Math.min(elapsed / duration, 1);
        
        // Easing function for smooth animation
        const easeOutQuart = 1 - Math.pow(1 - progress, 4);
        const currentValue = startValue + (difference * easeOutQuart);
        
        // Format the number with commas
        const formattedValue = formatNumber(Math.round(currentValue));
        
        if (isResultValue) {
            element.textContent = `🌿 ≈$${formattedValue}`;
        } else {
            element.textContent = `💰 $${formattedValue}`;
        }
        
        if (progress < 1) {
            requestAnimationFrame(update);
        }
    }
    
    requestAnimationFrame(update);
}

/**
 * Animate sheckles counting smoothly
 */
function animateSheckles(element, startValue, endValue, duration = 500, includeSheckles = false, isFinalSheckles = false) {
    if (!element) return;
    
    const start = performance.now();
    const difference = endValue - startValue;
    
    function update(currentTime) {
        const elapsed = currentTime - start;
        const progress = Math.min(elapsed / duration, 1);
        
        // Easing function for smooth animation
        const easeOutQuart = 1 - Math.pow(1 - progress, 4);
        const currentValue = startValue + (difference * easeOutQuart);
        
        // Format the number with commas and decimal places
        const integerPart = Math.floor(currentValue);
        const decimalPart = (currentValue % 1).toFixed(2).substring(1);
        const formattedInteger = formatNumber(integerPart);
        
        if (isFinalSheckles) {
            // For final-sheckles, don't include parentheses
            element.textContent = `${formattedInteger}${decimalPart}`;
        } else if (includeSheckles) {
            element.textContent = `(${formattedInteger}${decimalPart} Sheckles)`;
        } else {
            element.textContent = `(${formattedInteger}${decimalPart})`;
        }
        
        if (progress < 1) {
            requestAnimationFrame(update);
        }
    }
    
    requestAnimationFrame(update);
}

// Update element text content safely
function updateElement(id, text) {
    const element = document.getElementById(id);
    if (element) {
        element.textContent = text;
    } else {
        console.warn(`Element with id '${id}' not found`);
    }
}

// Debounce function for input events
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Get random mutations
function getRandomMutations(allMutations, count) {
    const shuffled = allMutations.sort(() => 0.5 - Math.random());
    return shuffled.slice(0, count);
}

// Load predefined mutation combo
function loadCombo(mutations) {
    selectedMutations = [...mutations];
    if (typeof updateMutationCalculatorDisplay === 'function') {
        updateMutationCalculatorDisplay();
    } else {
        updateMutationDisplay();
        updateCalculationIfReady();
    }
}

// Initialize everything when the DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM loaded, initializing calculator...');
    
    // Check if key elements exist
    const keyElements = [
        'plant-grid', 'plant-search', 'plant-weight', 'plant-amount',
        'result-title', 'result-value', 'weight-range', 'total-multiplier'
    ];
    
    keyElements.forEach(id => {
        const element = document.getElementById(id);
        if (element) {
            console.log(`✓ Found element: ${id}`);
        } else {
            console.warn(`✗ Missing element: ${id}`);
        }
    });
    
    initializeCalculatorForm();
});