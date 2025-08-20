# grow_calculator_ui.py
import tkinter as tk
from tkinter import ttk, messagebox
from core_logic.plant_calculator import PlantCalculator
import re
import time

class GrowCalculatorUI:
    def __init__(self):
        try:
            self.calculator = PlantCalculator()
        except Exception as e:
            messagebox.showerror("Initialization Error", f"Failed to initialize calculator: {e}")
            raise SystemExit
        self.selected_mutations = []
        self.mutation_vars_popup = {}
        self.collapsed_height = 360
        self.fixed_entry_width = 21

        self._build_ui()

    def _build_ui(self):
        self.root = tk.Tk()
        self.root.title("Grow Calculator - Plant Value Calculator")
        self.root.configure(bg="#2b2b2b")
        self.root.geometry(f"586x{self.collapsed_height}")
        self.root.minsize(586, 360)

        self.root.grid_rowconfigure(0, weight=1)
        self.root.grid_columnconfigure(0, weight=1)

        style = ttk.Style()
        style.theme_use("clam")
        style.configure("TLabel", background="#2b2b2b", foreground="white", font=("Segoe UI", 10))
        style.configure("TCombobox", fieldbackground="#3c3c3c", background="#3c3c3c", foreground="#FF9800", 
                        selectbackground="#3c3c3c", selectforeground="#FF9800", bordercolor="#3c3c3c",
                        arrowcolor="white", insertcolor="white")
        style.configure("Plant.TCombobox", fieldbackground="#3c3c3c", background="#3c3c3c", foreground="#4CAF50",
                        selectbackground="#3c3c3c", selectforeground="#4CAF50", bordercolor="#3c3c3c",
                        arrowcolor="white", insertcolor="white")
        
        # Additional styling for dropdown menu
        style.map("TCombobox", fieldbackground=[("readonly", "#3c3c3c")], background=[("readonly", "#3c3c3c")])
        style.map("Plant.TCombobox", fieldbackground=[("readonly", "#3c3c3c")], background=[("readonly", "#3c3c3c")])
        style.configure("TButton", background="#4CAF50", foreground="white", font=("Segoe UI", 10, "bold"))
        style.configure("TFrame", background="#2b2b2b")

        self.main = ttk.Frame(self.root, padding="15")
        self.main.grid(row=0, column=0, sticky="nsew")

        title = tk.Label(self.main, text="🌱 Grow Calculator",
                         font=("Segoe UI", 20, "bold"), bg="#2b2b2b", fg="#4CAF50")
        title.grid(row=0, column=0, columnspan=3, pady=(0, 10), sticky="n")

        rules = tk.Button(self.main, text="ℹ️  Rules", command=self._show_rules,
                          bg="#2196F3", fg="white", font=("Segoe UI", 9, "bold"),
                          relief=tk.FLAT, padx=10, pady=2)
        rules.place(relx=1.0, x=-20, y=10, anchor="ne")

        tk.Label(self.main, text="Plant:", font=("Segoe UI", 11, "bold"),
                 bg="#2b2b2b", fg="white").grid(row=1, column=0, sticky="w", pady=5)
        self.plant_var = tk.StringVar(value="Carrot")
        plant_combo = ttk.Combobox(self.main, textvariable=self.plant_var,
                                   values=self._safe_get_plant_names(),
                                   state="readonly", width=18, style="Plant.TCombobox")
        plant_combo.grid(row=1, column=1, sticky="w", pady=5)
        plant_combo.bind("<<ComboboxSelected>>", self._on_plant_changed)

        tk.Label(self.main, text="Variant:", font=("Segoe UI", 11, "bold"),
                 bg="#2b2b2b", fg="white").grid(row=2, column=0, sticky="w", pady=5)
        self.variant_var = tk.StringVar(value="Normal")
        self.variant_combo = ttk.Combobox(self.main, textvariable=self.variant_var,
                                         values=self._safe_get_variant_names(),
                                         state="readonly", width=18)
        self.variant_combo.grid(row=2, column=1, sticky="w", pady=5)

        tk.Label(self.main, text="Mutations:", font=("Segoe UI", 11, "bold"),
                 bg="#2b2b2b", fg="white").grid(row=3, column=0, sticky="w", pady=5)
        self.mutation_summary = tk.Label(self.main, text="None",
                                        font=("Segoe UI", 9, "italic"),
                                        bg="#2b2b2b", fg="#FF9800")
        self.mutation_summary.grid(row=3, column=1, sticky="w", pady=5)
        tk.Button(self.main, text="⚙️ Select Mutations", command=self._open_mutations_popup,
                  bg="#4CAF50", fg="white", font=("Segoe UI", 9, "bold"),
                  relief=tk.FLAT, padx=8, pady=2).grid(row=3, column=2, sticky="w", pady=5)

        tk.Label(self.main, text="Weight (kg):", font=("Segoe UI", 11, "bold"),
                 bg="#2b2b2b", fg="white").grid(row=4, column=0, sticky="w", pady=5)
        self.weight_var = tk.StringVar(value="0.5")
        self.weight_entry = tk.Entry(self.main, textvariable=self.weight_var,
                                     font=("Segoe UI", 10), bg="#3c3c3c", fg="white",
                                     insertbackground="white", width=self.fixed_entry_width)
        self.weight_entry.grid(row=4, column=1, sticky="w", pady=5)
        self.weight_var.trace("w", self._validate_weight)

        self.range_label = tk.Label(self.main, text="",
                                    font=("Segoe UI", 9), bg="#2b2b2b", fg="#FF9800")
        self.range_label.grid(row=5, column=1, sticky="w")

        self.mult_label = tk.Label(self.main, text="Total Multiplier: 1.0x",
                                   bg="#2b2b2b", fg="#4CAF50", font=("Segoe UI", 10, "bold"))
        self.mult_label.grid(row=6, column=0, columnspan=2, sticky="w", pady=(6, 2))

        note = ("Note: Value = Base Price × Mutation Multi × Variant Multi × (Weight/Base Weight)² • Click Rules for details")
        self.note_label = tk.Label(self.main, text=note,
                                   bg="#2b2b2b", fg="#FF9800", font=("Segoe UI", 8, "italic"))
        self.note_label.grid(row=7, column=0, columnspan=3, sticky="w", pady=(0, 10))

        btns = tk.Frame(self.main, bg="#2b2b2b")
        btns.grid(row=8, column=0, columnspan=3, pady=(2, 10))
        self.calc_btn = tk.Button(btns, text="🧮  Calculate Value", command=self._calculate,
                                  bg="#4CAF50", fg="white", font=("Segoe UI", 11, "bold"),
                                  relief=tk.FLAT, padx=15, pady=5, width=18)
        self.calc_btn.pack(side="left", padx=(0, 10))
        self.clear_btn = tk.Button(btns, text="🗑️  Clear All", command=self._clear_all,
                                   bg="#f44336", fg="white", font=("Segoe UI", 11, "bold"),
                                   relief=tk.FLAT, padx=15, pady=5, width=18)
        self.clear_btn.pack(side="left")

        self.results = tk.Frame(self.main, bg="#3c3c3c", relief=tk.RAISED, bd=2)
        self.results.grid(row=9, column=0, columnspan=3, sticky="we", pady=(10, 0))
        self.results.grid_remove()

        tk.Label(self.results, text="📊  Calculation Results",
                 font=("Segoe UI", 13, "bold"), bg="#3c3c3c", fg="#4CAF50").pack(pady=(8, 5))

        self.results_text = tk.Text(self.results, height=13, width=66,
                                    bg="#2b2b2b", fg="white", font=("Consolas", 9),
                                    relief=tk.FLAT, padx=10, pady=10, wrap="word")
        self.results_text.pack(padx=10, pady=(0, 10))
        self.results_text.config(state="disabled")

        self._on_plant_changed()

    def _validate_weight(self, *args):
        value = self.weight_var.get()
        if value and not re.match(r"^\d*\.?\d*$", value):
            self.weight_var.set(value[:-1] if len(value) > 1 else "0.5")
        elif not value:
            self.weight_var.set("0.5")

    def _open_mutations_popup(self):
        win = tk.Toplevel(self.root)
        win.title("Select Mutations")
        win.configure(bg="#2b2b2b")
        win.geometry("410x410")
        win.transient(self.root)
        win.grab_set()

        frm = tk.Frame(win, bg="#2b2b2b")
        frm.pack(fill="both", expand=True, padx=10, pady=10)

        self.mutation_vars_popup = {}
        names = self._safe_get_mutation_names()
        if not names:
            messagebox.showwarning("Warning", "No mutations available.")
            win.destroy()
            return

        for i, name in enumerate(names):
            r, c = divmod(i, 3)
            v = tk.BooleanVar(value=(name in self.selected_mutations))
            self.mutation_vars_popup[name] = v
            tk.Checkbutton(frm, text=name, variable=v, bg="#2b2b2b", fg="white",
                           selectcolor="#4CAF50", activebackground="#2b2b2b",
                           activeforeground="white", font=("Segoe UI", 9)
                           ).grid(row=r, column=c, sticky="w", padx=10, pady=4)

        tk.Button(win, text="✔ Apply", bg="#4CAF50", fg="white",
                  font=("Segoe UI", 10, "bold"), relief=tk.FLAT,
                  command=lambda: self._apply_mutations(win)).pack(pady=10)

        self.root.wait_window(win)

    def _apply_mutations(self, popup):
        self.selected_mutations = [n for n, v in self.mutation_vars_popup.items() if v.get()]
        self._update_mutation_summary()
        self._update_multiplier()
        popup.destroy()

    def _update_mutation_summary(self):
        if not self.selected_mutations:
            self.mutation_summary.config(text="None", fg="#FF9800")
        else:
            text = ", ".join(self.selected_mutations[:3])
            if len(self.selected_mutations) > 3:
                text += f" +{len(self.selected_mutations)-3} more"
            self.mutation_summary.config(text=text, fg="white")

    def _safe_get_plant_names(self):
        try:
            return self.calculator.get_plant_names() or ["Carrot"]
        except Exception as e:
            messagebox.showerror("Error", f"Failed to get plant names: {e}")
            return ["Carrot"]

    def _safe_get_variant_names(self):
        try:
            return self.calculator.get_variant_names() or ["Normal"]
        except Exception as e:
            messagebox.showerror("Error", f"Failed to get variant names: {e}")
            return ["Normal"]

    def _safe_get_mutation_names(self):
        try:
            return self.calculator.get_mutation_names() or []
        except Exception as e:
            messagebox.showerror("Error", f"Failed to get mutation names: {e}")
            return []

    def _on_plant_changed(self, _=None):
        name = self.plant_var.get()
        if name in self.calculator.plants:
            base_w = self.calculator.plants[name]["base_weight"]
            self.weight_var.set(str(base_w))
            self.weight_entry.config(width=self.fixed_entry_width)
            mn = round(base_w * 0.7, 4)
            mx = round(base_w * 1.4, 4)
            self.range_label.config(text=f"Expected: {mn} – {mx} kg")
            self.variant_combo.configure(values=self._safe_get_variant_names())
            if self.variant_var.get() not in self._safe_get_variant_names():
                self.variant_var.set("Normal")
        self._update_multiplier()

    def _clear_all(self):
        self.plant_var.set("Carrot")
        self.variant_var.set("Normal")
        self.weight_var.set("0.5")
        self.selected_mutations = []
        self._update_mutation_summary()
        self._update_multiplier()
        self._hide_results()
        self._on_plant_changed()

    def _update_multiplier(self):
        try:
            mult = self.calculator.calculate_mutation_multiplier(self.selected_mutations)
            if mult == 0:
                txt, color = "Total Multiplier: 0x (worthless)", "#f44336"
            elif mult == 1.0:
                txt, color = "Total Multiplier: 1.0x", "#4CAF50"
            else:
                txt, color = f"Total Multiplier: {mult:.1f}x", "#FF9800"
            self.mult_label.config(text=txt, fg=color)
        except Exception as e:
            messagebox.showerror("Error", f"Failed to calculate multiplier: {e}")
            self.mult_label.config(text="Total Multiplier: Error", fg="#f44336")

    def _calculate(self):
        try:
            plant = self.plant_var.get()
            variant = self.variant_var.get()
            weight = float(self.weight_var.get())
            if not plant or not variant:
                messagebox.showerror("Error", "Please select a plant and variant.")
                return
            if weight <= 0:
                messagebox.showerror("Error", "Weight must be greater than 0.")
                return
            if plant not in self.calculator.plants or variant not in self.calculator.variants:
                messagebox.showerror("Error", "Invalid plant or variant selected.")
                return

            m = self.calculator.calculate_mutation_multiplier(self.selected_mutations)
            value = 0 if m == 0 else self.calculator.calculate_plant_value(plant, variant, weight, m)

            self._show_results(plant, variant, weight, self.selected_mutations, m, value)

        except ValueError as e:
            messagebox.showerror("Error", f"Invalid input: {e}")
        except Exception as e:
            messagebox.showerror("Error", f"Calculation failed: {e}")

    def _show_results(self, plant, variant, weight, muts, m_mult, value):
        try:
            base_price = self.calculator.plants[plant]["base_price"]
            base_weight = self.calculator.plants[plant]["base_weight"]
            v_mult = self.calculator.variants[variant]["multiplier"]
            growth = weight / base_weight
            clamped = max(0.95, growth)
            g_mult = clamped ** 2

            txt = f"""🌱 PLANT CALCULATION RESULTS
========================================

📋 INPUT PARAMETERS:
   Plant: {plant}
   Variant: {variant}
   Mutations: {", ".join(muts) if muts else "None"}
   Weight: {weight:.4f} kg

🔢 CALCULATION DETAILS:
   Base Weight: {base_weight}
   Base Price: {base_price}
   Growth Factor: {growth:.2f}
   Growth Multiplier: {g_mult:.2f}
   Variant Multiplier: {v_mult}x
   Mutation Multiplier: {m_mult}x

💰 FINAL VALUE: {value:,.2f}
"""
            self.results_text.config(state="normal")
            self.results_text.delete("1.0", "end")
            self.results_text.insert("1.0", txt)
            self.results_text.config(state="disabled")

            self.results.grid()
            self._animate_expand_to_fit()

        except Exception as e:
            messagebox.showerror("Error", f"Failed to display results: {e}")

    def _hide_results(self):
        if self.results.winfo_ismapped():
            self.results.grid_remove()
        self._animate_height(self.collapsed_height)

    def _animate_expand_to_fit(self):
        self.root.update_idletasks()
        target = max(self.root.winfo_height(), self.main.winfo_reqheight() + 20)
        self._animate_height(target)

    def _animate_height(self, target, duration_ms=220):
        start = self.root.winfo_height()
        delta = target - start
        if delta == 0:
            return

        start_time = time.time()
        def step():
            elapsed = (time.time() - start_time) * 1000
            t = min(elapsed / duration_ms, 1.0)
            eased = 1 - (1 - t) ** 3
            h = int(start + delta * eased)
            self.root.geometry(f"586x{h}")
            if t < 1.0:
                self.root.after(16, step)

        step()

    def _show_rules(self):
        rules = (
            "📘 Plant Value Calculation (From Game Source Code)\n\n"
            "🔢 COMPLETE FORMULA:\n"
            "Final Value = Base Price × Mutation Multi × Variant Multi × (Weight Ratio)²\n\n"
            "📊 STEP-BY-STEP BREAKDOWN:\n"
            "1️⃣ Weight Ratio = Current Weight ÷ Base Weight\n"
            "2️⃣ Clamped Ratio = clamp(Weight Ratio, 0.95, 100,000,000)\n"
            "3️⃣ Growth Factor = (Clamped Ratio)²\n"
            "4️⃣ Final Value = Base Price × Mutation Multi × Variant Multi × Growth Factor\n\n"
            "🧬 MUTATION MULTIPLIER (ADDITIVE):\n"
            "• Formula: total = 1 + (mut1-1) + (mut2-1) + (mut3-1) + ...\n"
            "• Example: Shocked(100) + Frozen(10) + Sandy(3)\n"
            "  = 1 + (100-1) + (10-1) + (3-1) = 112x\n\n"
            "🎨 VARIANT MULTIPLIERS:\n"
            "• Normal: 1x  • Silver: 5x  • Gold: 20x  • Rainbow: 50x\n\n"
            "📜 SOURCE FILES:\n"
            "• CalculatePlantValue.lua (lines 17-27)\n"
            "• MutationHandler.lua (line 3903)\n"
            "• Item_Module.lua (u3 table)\n\n"
            "💡 The squared weight factor creates exponential growth for heavy plants!"
        )
        messagebox.showinfo("Plant Value Calculation Rules", rules)

    def run(self):
        self.root.mainloop()

def main():
    try:
        GrowCalculatorUI().run()
    except Exception as e:
        messagebox.showerror("Fatal Error", f"Application failed to start: {e}")

if __name__ == "__main__":
    main()