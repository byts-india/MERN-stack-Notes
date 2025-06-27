Here are **basic Angular notes** perfect for beginners who want to understand the fundamentals quickly and clearly:

---

# 📘 Angular Basic Notes

---

## 🔷 1. What is Angular?

* **Angular** is a **TypeScript-based** open-source **front-end framework** developed by **Google**.
* It is used to build **Single Page Applications (SPAs)**.
* It follows a **component-based architecture**.

---

## 📦 2. Angular Setup

### ✅ Install Angular CLI:

```bash
npm install -g @angular/cli
```

### ✅ Create a new Angular project:

```bash
ng new my-app
cd my-app
ng serve
```

---

## 🧱 3. Angular Application Structure

```
src/
├── app/
│   ├── app.ts     # Component logic
│   ├── app.html   # Template
│   ├── app.css    # Styling
```

---

## 🧩 4. Angular Core Concepts

| Concept       | Description                              |level |
| ------------- | ---------------------------------------- |------|
| **Component** | Basic building block of UI               | beginner |
| **Service**   | Logic reusable across components         | beginner |
| -             | -                                        | -        |
| **Template**  | HTML view for the component              | others   |
| **Directive** | Custom behavior for elements             | others   |
| **Pipe**      | Formats data in the template             | others   |
| **Routing**   | For navigation between views/pages       | others   |
| **Module**    | Container for components, services, etc. | others   |

---

## 🔄 5. Data Binding

| Type             | Syntax                | Example                  |
| ---------------- | --------------------- | ------------------------ |
| Interpolation    | `{{ value }}`         | `{{ title }}`            |
| Property Binding | `[property]="value"`  | `[src]="imageUrl"`       |
| Event Binding    | `(event)="handler()"` | `(click)="submit()"`     |
| Two-way Binding  | `[(ngModel)]="value"` | `[(ngModel)]="username"` |

> `ngModel` requires importing `FormsModule`.

---


## 📡 8. Services & Dependency Injection

### ✅ Create a Service:

```bash
ng generate service data
ng g s data
```

### ✅ Use the Service:

```ts
// option 01
constructor(private dataService: DataService) {}
// option 02
private dataService = inject(DataService);
```

Services are injected using **Dependency Injection**.

---

## 🧭 9. Routing

### ✅ Configure Routes:

```ts
const routes: Routes = [
  { path: 'home', component: HomeComponent },
  { path: '**', redirectTo: 'home' }
];
```

### ✅ Use Routing:

```html
<a routerLink="/home">Home</a>
<router-outlet></router-outlet>
```

---

## 📋 10. Forms

### ✅ Template-driven:

* Uses `FormsModule` and `ngModel`

### ✅ Reactive:

* Uses `FormGroup`, `FormControl`, `ReactiveFormsModule`

---

## 🔁 11. Observables (RxJS)

* Angular uses **RxJS** for asynchronous operations.
* `HttpClient` returns `Observable`.

```ts
this.http.get('api/data').subscribe(data => {
  this.items = data;
});
```

---

## 🚀 12. Angular CLI Commands

| Task               | Command                      |
| ------------------ | ---------------------------- |
| New project        | `ng new project-name`        |
| Run dev server     | `ng serve`                   |
| Generate component | `ng generate component name` |
| Generate service   | `ng generate service name`   |
| Build app          | `ng build`                   |

---

## 🧠 Summary

| Topic     | Summary                                 |
| --------- | --------------------------------------- |
| Framework | Component-based SPA framework           |
| Language  | Built with TypeScript                   |
| Binding   | Interpolation, property, event, two-way |
| Forms     | Template-driven & Reactive              |
| Routing   | Handled by Angular Router               |
| Services  | Reusable logic via DI                   |
