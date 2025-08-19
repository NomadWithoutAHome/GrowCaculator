# grow_calculator_ui.py
import tkinter as tk
from tkinter import ttk, messagebox
from core_logic.plant_calculator import PlantCalculator


class GrowCalculatorUI:
    def __init__(self):
        self.calculator = PlantCalculator()
        self.results_frame = None  # results container
        self.setup_ui()

    def setup_ui(self):
        self.root = tk.Tk()
        self.root.title("GrowCalculator - Plant Value Calculator")
        self.root.geometry("800x700")
        self.root.configure(bg='#2b2b2b')

        style = ttk.Style()
        style.theme_use('clam')
        style.configure('TLabel', background='#2b2b2b', foreground='white', font=('Segoe UI', 10))
        style.configure('TCombobox', fieldbackground='#3c3c3c', background='#3c3c3c',
                        foreground='white')
        style.configure('TButton', background='#4CAF50', foreground='white',
                        font=('Segoe UI', 10, 'bold'))
        style.configure('TFrame', background='#2b2b2b')

        main_frame = ttk.Frame(self.root, padding="20")
        main_frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))

        # Centered title
        title_label = tk.Label(main_frame, text="🌱 GrowCalculator",
                               font=('Segoe UI', 28, 'bold'),
                               bg='#2b2b2b', fg='#4CAF50')
        title_label.grid(row=0, column=0, columnspan=2, pady=(0, 20), sticky="n")

        # Info button (top-right)
        info_btn = tk.Button(main_frame, text="ℹ️ Rules",
                             command=self.show_rules,
                             bg='#2196F3', fg='white',
                             font=('Segoe UI', 9, 'bold'),
                             relief=tk.FLAT, padx=10, pady=2)
        info_btn.grid(row=0, column=1, sticky=tk.E, pady=(0, 20))

        self.setup_plant_selection(main_frame)
        self.setup_variant_mutation_selection(main_frame)
        self.setup_weight_input(main_frame)
        self.setup_calculate_button(main_frame)

        # Results box initially hidden
        self.results_frame = tk.Frame(main_frame, bg='#3c3c3c', relief=tk.RAISED, bd=2)
        self.results_frame.grid(row=7, column=0, columnspan=2,
                                sticky=(tk.W, tk.E), pady=(20, 0))
        self.results_frame.grid_remove()  # hide at start

        title = tk.Label(self.results_frame, text="📊 Calculation Results",
                         font=('Segoe UI', 16, 'bold'),
                         bg='#3c3c3c', fg='#4CAF50')
        title.pack(pady=(15, 10))

        self.results_text = tk.Text(self.results_frame, height=12, width=70,
                                    bg='#2b2b2b', fg='white', font=('Consolas', 10),
                                    relief=tk.FLAT, padx=15, pady=15)
        self.results_text.pack(padx=15, pady=(0, 15))

        scrollbar = tk.Scrollbar(self.results_frame, orient=tk.VERTICAL,
                                 command=self.results_text.yview)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        self.results_text.configure(yscrollcommand=scrollbar.set)

    # ------- Plant / Variant / Mutation UI -------
    def setup_plant_selection(self, parent):
        tk.Label(parent, text="Plant:", font=('Segoe UI', 12, 'bold'),
                 bg='#2b2b2b', fg='white').grid(row=1, column=0, sticky=tk.W, pady=(0, 10))

        self.plant_var = tk.StringVar(value="Carrot")
        plant_combo = ttk.Combobox(parent, textvariable=self.plant_var,
                                   values=self.calculator.get_plant_names(),
                                   state="readonly", width=30)
        plant_combo.grid(row=1, column=1, sticky=(tk.W, tk.E), pady=(0, 10), padx=(10, 0))
        plant_combo.bind('<<ComboboxSelected>>', self.on_plant_changed)

    def setup_variant_mutation_selection(self, parent):
        tk.Label(parent, text="Variant:", font=('Segoe UI', 12, 'bold'),
                 bg='#2b2b2b', fg='white').grid(row=2, column=0, sticky=tk.W, pady=(0, 10))

        self.variant_var = tk.StringVar(value="Normal")
        variant_combo = ttk.Combobox(parent, textvariable=self.variant_var,
                                     values=self.calculator.get_variant_names(),
                                     state="readonly", width=30)
        variant_combo.grid(row=2, column=1, sticky=(tk.W, tk.E), pady=(0, 10), padx=(10, 0))

        tk.Label(parent, text="Mutations:", font=('Segoe UI', 12, 'bold'),
                 bg='#2b2b2b', fg='white').grid(row=3, column=0, sticky=tk.W, pady=(0, 10))

        mutation_frame = tk.Frame(parent, bg='#2b2b2b')
        mutation_frame.grid(row=3, column=1, sticky=(tk.W, tk.E), pady=(0, 10), padx=(10, 0))

        canvas = tk.Canvas(mutation_frame, bg='#2b2b2b', height=80, highlightthickness=0)
        scrollbar = tk.Scrollbar(mutation_frame, orient="vertical", command=canvas.yview)
        scrollable_frame = tk.Frame(canvas, bg='#2b2b2b')
        scrollable_frame.bind("<Configure>", lambda e: canvas.configure(scrollregion=canvas.bbox("all")))
        canvas.create_window((0, 0), window=scrollable_frame, anchor="nw")
        canvas.configure(yscrollcommand=scrollbar.set)

        self.mutation_vars = {}
        for i, mutation_name in enumerate(self.calculator.get_mutation_names()):
            row, col = divmod(i, 3)
            var = tk.BooleanVar()
            self.mutation_vars[mutation_name] = var
            cb = tk.Checkbutton(scrollable_frame, text=mutation_name, variable=var,
                                bg='#2b2b2b', fg='white', selectcolor='#4CAF50',
                                activebackground='#2b2b2b', activeforeground='white',
                                font=('Segoe UI', 9), command=self.update_total_multiplier)
            cb.grid(row=row, column=col, sticky=tk.W, padx=(0, 15), pady=2)

        canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")

        # Footer section with total multiplier + clear button
        footer_frame = tk.Frame(mutation_frame, bg='#2b2b2b')
        footer_frame.pack(side="bottom", pady=(5, 0), fill="x")

        self.total_multiplier_label = tk.Label(footer_frame, text="Total Multiplier: 1.0x",
                                               bg='#2b2b2b', fg='#4CAF50',
                                               font=('Segoe UI', 10, 'bold'))
        self.total_multiplier_label.pack(side="left")

        clear_btn = tk.Button(footer_frame, text="🗑️ Clear All",
                              command=self.clear_all_mutations,
                              bg='#f44336', fg='white', font=('Segoe UI', 9, 'bold'),
                              relief=tk.FLAT, padx=10, pady=2)
        clear_btn.pack(side="right", padx=(10, 0))

        self.summary_label = tk.Label(mutation_frame,
                                      text="Note: Rotten/Ghostly = 0 • Groups don’t stack • Specials fixed",
                                      bg='#2b2b2b', fg='#FF9800',
                                      font=('Segoe UI', 8, 'italic'))
        self.summary_label.pack(side="bottom", pady=(3, 0))

    def setup_weight_input(self, parent):
        tk.Label(parent, text="Weight (kg):", font=('Segoe UI', 12, 'bold'),
                 bg='#2b2b2b', fg='white').grid(row=4, column=0, sticky=tk.W, pady=(0, 10))

        self.weight_var = tk.StringVar(value="0.5")
        weight_entry = tk.Entry(parent, textvariable=self.weight_var,
                                font=('Segoe UI', 10), bg='#3c3c3c', fg='white',
                                insertbackground='white', width=32)
        weight_entry.grid(row=4, column=1, sticky=(tk.W, tk.E), pady=(0, 10), padx=(10, 0))

        self.range_label = tk.Label(parent, text="",
                                    font=('Segoe UI', 9), bg='#2b2b2b', fg='#FF9800')
        self.range_label.grid(row=5, column=1, sticky=tk.W, pady=(0, 10), padx=(10, 0))

    def setup_calculate_button(self, parent):
        self.calc_btn = tk.Button(parent, text="🧮 Calculate Value",
                                  command=self.calculate_value,
                                  bg='#4CAF50', fg='white', font=('Segoe UI', 14, 'bold'),
                                  relief=tk.FLAT, padx=30, pady=10)
        self.calc_btn.grid(row=6, column=0, columnspan=2, pady=20)

    # ------- Events -------
    def on_plant_changed(self, event=None):
        plant_name = self.plant_var.get()
        if plant_name in self.calculator.plants:
            plant_data = self.calculator.plants[plant_name]
            self.weight_var.set(str(plant_data["base_weight"]))
            min_w = round(plant_data["base_weight"] * 0.7, 4)
            max_w = round(plant_data["base_weight"] * 1.4, 4)
            self.range_label.config(
                text=f"Expected Weight Range: {min_w} – {max_w} kg"
            )

    def clear_all_mutations(self):
        for var in self.mutation_vars.values():
            var.set(False)
        self.update_total_multiplier()

    def update_total_multiplier(self):
        selected_mutations = [m for m, var in self.mutation_vars.items() if var.get()]
        total_multi = self.calculator.calculate_mutation_multiplier(selected_mutations)
        if total_multi == 0:
            text, color = "Total Multiplier: 0x (worthless)", "#f44336"
        elif total_multi == 1.0:
            text, color = "Total Multiplier: 1.0x", "#4CAF50"
        else:
            text, color = f"Total Multiplier: {total_multi:.1f}x", "#FF9800"
        self.total_multiplier_label.config(text=text, fg=color)

    def calculate_value(self):
        try:
            plant_name = self.plant_var.get()
            variant = self.variant_var.get()
            weight = float(self.weight_var.get())

            if not plant_name or not variant:
                messagebox.showerror("Error", "Please select a plant and variant")
                return
            if weight <= 0:
                messagebox.showerror("Error", "Weight must be greater than 0")
                return

            selected_mutations = [m for m, var in self.mutation_vars.items() if var.get()]
            mutation_multi = self.calculator.calculate_mutation_multiplier(selected_mutations)

            if mutation_multi == 0:
                value = 0
            else:
                value = self.calculator.calculate_plant_value(
                    plant_name, variant, weight, mutation_multi
                )

            # Show results box only after calculation
            self.results_frame.grid()
            self.display_results(plant_name, variant, selected_mutations,
                                 weight, value, mutation_multi)

        except ValueError as e:
            messagebox.showerror("Error", f"Invalid input: {e}")

    def display_results(self, plant_name, variant, selected_mutations,
                        weight, value, mutation_multi):
        self.results_text.delete(1.0, tk.END)
        base_price = self.calculator.plants[plant_name]['base_price']
        base_weight = self.calculator.plants[plant_name]['base_weight']
        variant_multi = self.calculator.variants[variant]['multiplier']

        growth_factor = weight / base_weight
        clamped = max(0.95, growth_factor)
        growth_multiplier = clamped ** 2

        results = f"""🌱 PLANT CALCULATION RESULTS
{'='*50}

📋 INPUT PARAMETERS:
   Plant: {plant_name}
   Variant: {variant}
   Mutations: {', '.join(selected_mutations) if selected_mutations else 'None'}
   Weight: {weight:.4f} kg

🔢 CALCULATION DETAILS:
   Base Weight: {base_weight}
   Base Price: {base_price}
   Growth Factor (Weight/Base): {growth_factor:.2f}
   Clamped Growth Factor: {clamped:.2f}
   Growth Multiplier: {growth_multiplier:.2f}
   Variant Multiplier: {variant_multi}x
   Mutation Multiplier: {mutation_multi}x

💰 FINAL VALUE: {value:,}

📈 VALUE BREAKDOWN:
   Base Price × Growth Multiplier × Variant Multiplier × Mutation Multiplier
   {base_price} × {growth_multiplier:.2f} × {variant_multi} × {mutation_multi:.2f} = {value:,}
"""
        self.results_text.insert(1.0, results)

    def show_rules(self):
        rules = """📘 Mutation Rules

1. Zero-Value Mutations (always override):
   - Rotten, Ghostly → Plant value = 0 regardless of anything else.

2. Exclusive Groups (only the strongest one applies):
   • Size Group: Giant, Tiny
   • Element Group: Shocked, Wet, Burnt
   • Growth Group: Twisted, Verdant, Albino

3. Special Multipliers (fixed):
   - Shiny = ×50
   - Golden = ×20
   - Rainbow = ×100

4. Normal Mutations:
   - All other mutations stack multiplicatively.
   - Example: Thorned (×1.5) + Glowing (×1.2) → ×1.8 total.

Tip: If you select Rotten or Ghostly, final value will always be 0.
"""
        messagebox.showinfo("Mutation Rules", rules)

    def run(self):
        self.root.mainloop()


def main():
    app = GrowCalculatorUI()
    app.run()


if __name__ == "__main__":
    main()
