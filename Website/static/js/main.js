/**
 * Main JavaScript functionality for GrowCalculator
 */

// Global state
let selectedMutations = [];
let currentVariant = 'Normal';
let allMutations = [];
let allPlants = [];
let allVariants = [];

// API endpoints
const API_BASE = '/api';

/**
 * Initialize the calculator form
 */
function initializeCalculatorForm() {
    const form = document.getElementById('calculator-form');
    if (!form) return;

    form.addEventListener('submit', async function(e) {
        e.preventDefault();
        await calculatePlantValue();
    });

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
    const plantSelect = document.getElementById('plant-select');
    const amountInput = document.getElementById('plant-amount');
    
    if (weightInput) {
        weightInput.addEventListener('input', debounce(updateCalculationIfReady, 500));
    }
    
    if (amountInput) {
        amountInput.addEventListener('input', debounce(updateCalculationIfReady, 500));
    }
    
    if (plantSelect) {
        plantSelect.addEventListener('change', function() {
            updateWeightRange();
            updateCalculationIfReady();
        });
        
        // Initialize weight range for default plant
        if (plantSelect.value) {
            updateWeightRange();
        }
    }
}

/**
 * Initialize mutation selection functionality
 */
function initializeMutationSelection() {
    const mutationButtons = document.querySelectorAll('.mutation-chip');
    
    mutationButtons.forEach(button => {
        button.addEventListener('click', function() {
            const mutation = this.getAttribute('data-mutation');
            toggleMutation(mutation);
        });
    });

    // Clear mutations button
    const clearButton = document.getElementById('clear-mutations');
    if (clearButton) {
        clearButton.addEventListener('click', function() {
            selectedMutations = [];
            updateMutationDisplay();
            updateCalculationIfReady();
        });
    }

    // Max mutations button
    const maxButton = document.getElementById('max-mutations');
    if (maxButton) {
        maxButton.addEventListener('click', function() {
            selectedMutations = ['Shocked', 'Celestial', 'Paradisal'];
            updateMutationDisplay();
            updateCalculationIfReady();
        });
    }

    // Clear all button
    const clearAllButton = document.getElementById('clear-all');
    if (clearAllButton) {
        clearAllButton.addEventListener('click', function() {
            selectedMutations = [];
            currentVariant = 'Normal';
            document.querySelector('input[value="Normal"]').checked = true;
            document.getElementById('plant-weight').value = '0.24';
            updateMutationDisplay();
            hideResults();
        });
    }
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
    const plantSelect = document.getElementById('plant-select');
    const weightInput = document.getElementById('plant-weight');
    const amountInput = document.getElementById('plant-amount');
    
    if (!plantSelect || !weightInput || !amountInput) return;

    const plantName = plantSelect.value;
    const weight = parseFloat(weightInput.value);
    const amount = parseInt(amountInput.value);

    if (!plantName || !weight || weight <= 0 || !amount || amount <= 0) {
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
                friend_boost: 0,
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
    const resultsDiv = document.getElementById('calculation-results');
    const noResultsDiv = document.getElementById('no-results');
    
    if (!resultsDiv || !noResultsDiv) return;

    // Show results, hide no-results
    resultsDiv.classList.remove('hidden');
    noResultsDiv.classList.add('hidden');

    // Update result displays
    updateElement('result-title', `${result.plant_name} | ${result.weight}kg`);
    updateElement('result-value', `🌿 ≈$${formatNumber(result.final_value)}`);
    updateElement('result-sheckles', `(${result.final_value.toFixed(2)})`);
    updateElement('total-multiplier', `x${result.mutation_multiplier.toFixed(2)}`);
    updateElement('plant-name', result.plant_name);
    updateElement('weight-display', result.weight);
    updateElement('multiplier-display', `x${result.mutation_multiplier.toFixed(2)}`);
    updateElement('final-sheckles', result.final_value.toFixed(2));
    
    // Update bulk/total value displays
    updateElement('plant-count', result.plant_amount);
    updateElement('total-value', `💰 $${formatNumber(result.total_value)}`);
    updateElement('total-sheckles', `(${result.total_value.toFixed(2)} Sheckles)`);
    
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
    const breakdownDiv = document.getElementById('mutation-breakdown');
    if (breakdownDiv) {
        if (result.mutations.length > 0) {
            breakdownDiv.textContent = `Mutations: ${result.mutations.join(', ')}`;
        } else {
            breakdownDiv.textContent = 'No mutations applied';
        }
    }
}

/**
 * Hide calculation results
 */
function hideResults() {
    const resultsDiv = document.getElementById('calculation-results');
    const noResultsDiv = document.getElementById('no-results');
    
    if (resultsDiv && noResultsDiv) {
        resultsDiv.classList.add('hidden');
        noResultsDiv.classList.remove('hidden');
    }
}

/**
 * Update weight range display when plant changes
 */
async function updateWeightRange() {
    const plantSelect = document.getElementById('plant-select');
    const weightRangeDiv = document.getElementById('weight-range');
    const weightMinSpan = document.getElementById('weight-min');
    const weightMaxSpan = document.getElementById('weight-max');
    
    if (!plantSelect || !weightRangeDiv || !weightMinSpan || !weightMaxSpan) return;
    
    const plantName = plantSelect.value;
    
    if (!plantName) {
        weightRangeDiv.classList.add('hidden');
        return;
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
        
    } catch (error) {
        console.error('Weight range error:', error);
        weightRangeDiv.classList.add('hidden');
    }
}

/**
 * Update calculation if inputs are ready
 */
function updateCalculationIfReady() {
    const plantSelect = document.getElementById('plant-select');
    if (plantSelect && plantSelect.value) {
        calculatePlantValue();
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

// Update element text content safely
function updateElement(id, text) {
    const element = document.getElementById(id);
    if (element) {
        element.textContent = text;
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
