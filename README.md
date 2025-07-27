# Widgets in Flutter 🌟✨

<div align="center">

![Flutter Logo](https://storage.googleapis.com/cms-storage-bucket/ec64036b4eacc9f3fd73.svg)

[![GitHub Stars](https://img.shields.io/github/stars/CerberusProgrammer/widgets_in_flutter?style=social)](https://github.com/CerberusProgrammer/widgets_in_flutter/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/CerberusProgrammer/widgets_in_flutter?style=social)](https://github.com/CerberusProgrammer/widgets_in_flutter/network/members)
[![GitHub Issues](https://img.shields.io/github/issues/CerberusProgrammer/widgets_in_flutter)](https://github.com/CerberusProgrammer/widgets_in_flutter/issues)
[![GitHub License](https://img.shields.io/github/license/CerberusProgrammer/widgets_in_flutter)](https://github.com/CerberusProgrammer/widgets_in_flutter/blob/main/LICENSE)

**The ultimate playground for Flutter widget exploration!** ✨

[View Demo](https://cerberusprogrammer.github.io/widgets_in_flutter/) •
[Report Bug](https://github.com/CerberusProgrammer/widgets_in_flutter/issues/new?template=bug_report.md) •
[Request Feature](https://github.com/CerberusProgrammer/widgets_in_flutter/issues/new?template=feature_request.md)

</div>

## 🎭 What is Widgets in Flutter?

¿Te has preguntado cómo se ven y comportan TODOS los increíbles widgets de Flutter? ¡Bienvenido a tu nuevo playground favorito! `widgets_in_flutter` es una galería viviente y completa del ecosistema de widgets de Flutter donde puedes:

- 👀 **Ver widgets en acción** - Ya no más adivinar cómo se verán los widgets
- 🎨 **Jugar con parámetros** - Ajusta configuraciones y observa cambios en tiempo real
- 📚 **Aprender con ejemplos** - Cada widget viene con muestras de código que puedes copiar
- 🎮 **Divertirte explorando** - ¡Porque aprender debería ser disfrutable!
- 🏆 **Dominar Flutter** - Desde widgets básicos hasta los más avanzados

### 🎯 **Nuestra Misión**
Crear la **galería de widgets de Flutter más completa del mundo**, cubriendo todos los 200+ widgets oficiales con:
- ✨ Múltiples variantes y ejemplos de cada widget
- 🔧 Todas las propiedades y configuraciones posibles  
- 📖 Documentación clara y comprensible
- 💻 Código listo para copiar y pegar
- 🚀 Ejemplos prácticos y casos de uso reales

## ✨ Features That Make You Go "Wow!" 

<div align="center">

| 🌈 Theme Switching | 🌓 Dark/Light Mode | 🎛️ Live Customization | 📱 Responsive Design |
|:------------------:|:------------------:|:----------------------:|:--------------------:|
| Change app colors on the fly | Toggle between dark and light themes | Modify widget parameters in real-time | Works on all screen sizes |

</div>

### 🚀 **Core Features**
- 🧩 **Growing Widget Collection**: Currently 70+ widgets, targeting 200+ total
- 🔄 **Material 2 vs Material 3**: Toggle between design systems with one tap
- 📋 **Copy-Paste Ready Code**: Grab code snippets for your own projects
- 🔍 **Smart Search**: Find exactly what you need quickly by name or category
- ⭐ **Favorites System**: Save your most-used widgets for quick access
- 🎨 **10+ Code Themes**: Syntax highlighting with multiple color schemes

### 🎯 **Widget Categories Currently Available**
- **Actions** (9/12): FilledButton, OutlinedButton, ElevatedButton, TextButton, IconButton, FloatingActionButton, DropdownButton, PopupMenuButton, MenuAnchor
- **Selections** (9/15): Checkboxes, Radio buttons, Chips, Dialogs, Date/Time Pickers
- **Inputs** (6/12): TextField, TextFormField, Switch, Slider, RangeSlider, Stepper  
- **Navigation** (7/18): AppBar, BottomNavigationBar, NavigationBar, TabBar, Drawer, PageView, NavigationRail
- **Text** (6/6): Text, RichText, SelectableText, TextThemes, Decorations, Alignment ✅ NEW!
- **Images & Icons** (8/8): Image, Icon, CircleAvatar, NetworkImage, AssetImage, IconButton, IconTheme ✅ NEW!
- **Layout** (15/15): Container, Padding, Column, Row, Stack, Wrap, Center, Align, Expanded, Flexible, SizedBox ✅ NEW!
- **Core Features**: Navigation, Search, Themes, Code Display

### 🔥 **Coming Soon**
- **Complete Actions**: Badge, Tooltip, SegmentedButton
- **Complete Inputs**: Form, SearchBar, SearchAnchor
- **Complete Navigation**: Tabs with more variants, Stepper navigation
- **Lists & Grids**: ListView, GridView, ReorderableListView
- **Animations**: AnimatedContainer, Hero, Transition widgets
- **Interactive Playground**: Modify widget properties in real-time
- **Complete Widget Coverage**: All 200+ Flutter widgets
- **Widget Relationships**: See related widgets and alternatives
- **Export Features**: Generate code for your projects
- **Performance Tips**: Optimization guides for each widget

## 🚀 Getting Started in 3...2...1...

### Prerequisites

- Flutter SDK (3.0.0 or later)
- Dart SDK (3.12.0 or later)
- A sense of curiosity and adventure! 🗺️

### Installation

```bash
# Clone this repository (The fun begins here!)
git clone https://github.com/CerberusProgrammer/widgets_in_flutter.git

# Navigate to the project folder
cd widgets_in_flutter

# Install dependencies (Get the goodies!)
flutter pub get

# Run the app and start exploring!
flutter run
```

## 🗺️ Project Structure

```
widgets_in_flutter/
├── 📁 assets/                # Icons and static assets
├── 📁 lib/                   # Source code
│   ├── 📁 core/              # Core functionality
│   │   ├── 📁 routes/        # App routing and navigation
│   │   └── 📁 theme/         # Theme management system
│   ├── 📁 code/              # Syntax highlighted code viewer
│   │   ├── code.controller.dart   # Code display logic
│   │   ├── code.screen.dart       # Code viewer UI
│   │   └── code.settings.screen.dart # Code themes & settings
│   ├── 📁 widgets/           # Widget demonstrations
│   │   ├── 📁 actions/       # Button widgets (9 implemented)
│   │   ├── 📁 selections/    # Selection widgets (9 implemented)
│   │   ├── 📁 inputs/        # Input widgets (6 implemented)
│   │   ├── 📁 navigation/    # Navigation widgets (7 implemented)
│   │   ├── 📁 text/          # Text widgets (6 implemented) ✅ NEW!
│   │   ├── 📁 images/        # Image widgets (8 implemented) ✅ NEW!
│   │   └── 📁 layout/        # Layout widgets (15 implemented) ✅ NEW!
│   ├── 📁 components/        # Widget constants and helpers
│   ├── 📁 favorites/         # Favorites system
│   ├── 📁 controllers/       # State management
│   ├── 📁 shared/            # Reusable UI components
│   ├── 📁 settings/          # App settings and preferences
│   └── main.dart             # Entry point
├── 📁 web/                   # Web deployment assets
├── 📁 android/               # Android platform files
├── 📁 ios/                   # iOS platform files
├── 📁 linux/                 # Linux platform files
├── 📁 macos/                 # macOS platform files
├── 📁 windows/               # Windows platform files
└── 📝 README.md              # You are here! 👋
```

### 🏗️ **Architecture Highlights**
- **GetX State Management**: Reactive and efficient state handling
- **Modular Structure**: Each widget category is self-contained
- **Code-First Approach**: Every widget demo includes its source code
- **Multi-Platform**: Runs on Web, Android, iOS, Desktop (Linux, macOS, Windows)

## 🏗️ Want to Contribute? It's Party Time! 🎉

¡Ayúdanos a construir la galería más completa de widgets de Flutter! Cualquier contribución es **enormemente apreciada**.

### 🎯 **Formas de Contribuir**

#### 🧩 **Implementar Nuevos Widgets** (Más Necesario)
1. **Elige una categoría** del roadmap arriba
2. **Sigue el patrón existente** en `lib/widgets/actions/` o `lib/widgets/selections/`
3. **Incluye múltiples variantes** de cada widget
4. **Agrega código fuente** en archivos constants
5. **Actualiza el search controller** con el nuevo widget

#### 📝 **Mejorar Documentación**
- Agregar más ejemplos de código
- Mejorar descripciones de widgets
- Crear guías de mejores prácticas
- Traducir contenido a otros idiomas

#### 🐞 **Fix Bugs & Features**
- Corregir problemas reportados
- Mejorar performance
- Agregar nuevas funcionalidades
- Optimizar para diferentes plataformas

### 🚀 **Guía Rápida para Agregar un Widget**

```bash
# 1. Fork el proyecto
git clone https://github.com/TU-USUARIO/widgets_in_flutter.git

# 2. Crea una rama para tu categoría
git checkout -b feature/layout-widgets

# 3. Sigue la estructura existente:
# lib/widgets/[categoria]/[categoria].screen.dart
# lib/components/[categoria]/constant/[widget].constants.dart

# 4. Agrega el widget al search controller
# lib/controllers/search.controller.dart

# 5. Commit y push
git commit -m 'Add Container and Padding widgets'
git push origin feature/layout-widgets

# 6. Crea un Pull Request
```

### 🎨 **Convenciones de Código**
- **Seguir el estilo Dart/Flutter** estándar
- **Usar GetX** para state management
- **Incluir animaciones** con animate_do donde sea apropiado
- **Agregar tooltips y labels** descriptivos
- **Mantener consistencia** con widgets existentes

### 📋 **Checklist para Nuevos Widgets**
- [ ] Widget implementado con múltiples variantes
- [ ] Código fuente agregado a constants
- [ ] Widget agregado al search controller
- [ ] Navegación configurada correctamente
- [ ] Probado en múltiples temas y tamaños
- [ ] Documentación incluida

### 🏆 **Ideas Específicas para Contributors**

#### **🔥 Prioridad Alta** (Necesarios AHORA)
- **TextField y variantes**: Implementar todos los input widgets
- **Container y Layout**: Padding, Margin, Column, Row, Stack
- **AppBar completo**: Con todas sus variantes y acciones
- **Image widgets**: Image, NetworkImage, AssetImage, CircleAvatar

#### **⭐ Prioridad Media** 
- **ListView y GridView**: Con ejemplos de diferentes builders
- **Animation widgets**: AnimatedContainer, Hero, etc.
- **Navigation**: TabBar, PageView, BottomNavigationBar
- **Form widgets**: Form, TextFormField, Validator examples

#### **� Prioridad Baja** (Para después)
- **Slivers**: SliverAppBar, SliverList, etc.
- **Custom Paint**: Canvas y drawing widgets
- **Platform Specific**: Cupertino widgets
- **Accessibility**: Semantics widgets

### 🎮 **Proceso de Review**
1. **Automated checks**: Formateo, análisis estático
2. **Manual review**: Funcionalidad y estilo
3. **Testing**: Pruebas en diferentes plataformas
4. **Merge**: Integración al proyecto principal

¡Revisa nuestro [CONTRIBUTING.md](CONTRIBUTING.md) para más detalles!

## 🗓️ Roadmap: The Adventure to COMPLETE Flutter Widget Coverage!

Nuestro objetivo es ser la galería más completa de widgets de Flutter. Aquí está nuestro plan maestro:

### 🎯 Estado Actual (Julio 2025)
**Progreso General: 35% completado** 📊

#### ✅ **IMPLEMENTADO** (Widgets cubiertos: ~70)
- **Actions (9/12)**: FilledButton, OutlinedButton, ElevatedButton, TextButton, IconButton, FloatingActionButton, DropdownButton, PopupMenuButton, MenuAnchor
- **Selections (9/15)**: Checkbox, Radio, ActionChip, ChoiceChip, FilterChip, Dialog variants, Date/Time Pickers
- **Inputs (6/12)**: TextField, TextFormField, Switch, Slider, RangeSlider, Stepper
- **Navigation (7/18)**: AppBar, BottomNavigationBar, NavigationBar, TabBar, Drawer, PageView, NavigationRail
- **Text (6/6)**: Text, RichText, SelectableText, TextThemes, Decorations, Alignment ✅ COMPLETED!
- **Images & Icons (8/8)**: Image, Icon, CircleAvatar, NetworkImage, AssetImage, IconButton, IconTheme ✅ COMPLETED!
- **Layout (15/15)**: Container, Padding, Column, Row, Stack, Wrap, Center, Align, Expanded, Flexible, SizedBox ✅ COMPLETED!
- **Core Features**: Navegación, Favoritos, Búsqueda, Temas, Code Viewer

#### 🚧 **EN DESARROLLO INMEDIATO** (Próximas 2 semanas)
- [x] **Text & Rich Text**: Text, RichText, SelectableText, TextThemes, Decorations ✅ DONE!
- [x] **Images & Icons**: Image, Icon, CircleAvatar, NetworkImage, AssetImage, IconButton ✅ DONE!
- [x] **Layout Basics**: Container, Padding, Column, Row, Stack, Wrap, Center, Align ✅ DONE!

### 🏗️ **ROADMAP POR CATEGORÍAS** (Orden de prioridad)

#### **FASE 1: Fundamentales** (Próximos 2 meses) ✅ COMPLETADA!
- [x] **Text & Rich Text** (6 widgets) ✅ DONE!
  - [x] Text, RichText, SelectableText, AutoSizeText, etc.
- [x] **Images & Icons** (8 widgets) ✅ DONE!
  - [x] Image, Icon, ImageIcon, CircleAvatar, etc.
- [x] **Input Widgets** (12 widgets) ✅ DONE!
  - [x] TextField, TextFormField, Slider, Switch, Stepper, etc.
- [x] **Layout Basics** (15 widgets) ✅ DONE!
  - [x] Container, Padding, Margin, Column, Row, Stack, etc.

#### **FASE 2: Navegación y Estructura** (Meses 3-4)
- [ ] **App Structure** (10 widgets)
  - [ ] Scaffold, AppBar, BottomNavigationBar, Drawer, etc.
- [ ] **Navigation** (8 widgets)
  - [ ] TabBar, PageView, IndexedStack, etc.
- [ ] **List & Grid** (12 widgets)
  - [ ] ListView, GridView, ReorderableListView, etc.

#### **FASE 3: Avanzados** (Meses 5-6)
- [ ] **Animations** (20 widgets)
  - [ ] AnimatedContainer, Hero, Transition widgets, etc.
- [ ] **Custom Paint** (8 widgets)
  - [ ] CustomPaint, Canvas widgets, etc.
- [ ] **Gestures** (15 widgets)
  - [ ] GestureDetector, Draggable, LongPressDraggable, etc.

#### **FASE 4: Especialistas** (Meses 7-8)
- [ ] **Slivers** (12 widgets)
  - [ ] SliverAppBar, SliverList, SliverGrid, etc.
- [ ] **Platform Specific** (10 widgets)
  - [ ] CupertinoButton, Material widgets, etc.
- [ ] **Accessibility** (8 widgets)
  - [ ] Semantics, MergeSemantics, etc.

### 🎮 **FUNCIONALIDADES AVANZADAS**

#### **Playground Interactivo** 🛝
- [ ] **Widget Customizer**: Modificar propiedades en tiempo real
- [ ] **Code Generator**: Generar código basado en configuración
- [ ] **Property Inspector**: Panel lateral con todas las propiedades
- [ ] **Live Preview**: Vista previa instantánea de cambios

#### **Experiencia de Aprendizaje** 📚
- [ ] **Widget Relationships**: Mostrar widgets relacionados
- [ ] **Use Cases**: Ejemplos prácticos para cada widget
- [ ] **Best Practices**: Tips y mejores prácticas
- [ ] **Performance Tips**: Consejos de optimización

#### **Características Técnicas** ⚙️
- [ ] **Export Options**: Exportar ejemplos a diferentes formatos
- [ ] **Widget Comparison**: Comparar widgets similares lado a lado
- [ ] **Platform Demos**: Ver cómo se ve en iOS vs Android
- [ ] **Responsive Examples**: Ejemplos para diferentes tamaños

### 📊 **MÉTRICAS OBJETIVO**

| Categoría | Total Widgets | Implementados | Meta Q1 2025 |
|-----------|---------------|---------------|---------------|
| **Actions** | 12 | 9 | 12 |
| **Selections** | 15 | 9 | 15 |
| **Inputs** | 12 | 6 | 12 |
| **Navigation** | 18 | 7 | 18 |
| **Text** | 6 | 6 | 6 |
| **Images** | 8 | 8 | 8 |
| **Layout** | 25 | 15 | 15 |
| **Lists** | 12 | 0 | 8 |
| **Animations** | 20 | 0 | 5 |
| **Gestures** | 15 | 0 | 3 |
| **Slivers** | 12 | 0 | 0 |
| **Platform** | 10 | 0 | 0 |
| **Otros** | 35 | 0 | 5 |
| **TOTAL** | **200+** | **70** | **107** |

### 🎯 **HITOS IMPORTANTES**

- **🏁 Milestone 1** (Enero 2025): 50 widgets - "Fundación Sólida"
- **🏁 Milestone 2** (Marzo 2025): 100 widgets - "Galería Robusta"  
- **🏁 Milestone 3** (Junio 2025): 150 widgets - "Colección Avanzada"
- **🏁 Milestone 4** (Dic 2025): 200+ widgets - "COMPLETE Flutter Widget Gallery" 🎉

### 🤝 **CÓMO CONTRIBUIR A ESTA MISIÓN**

Únete a la construcción de la galería más completa de Flutter:

1. **🧩 Adopta una Categoría**: Implementa todos los widgets de una categoría
2. **📝 Mejora Documentación**: Agrega ejemplos y explicaciones
3. **🎨 Crea Variaciones**: Diferentes estilos y configuraciones
4. **🐞 Reporta Bugs**: Ayuda a mantener la calidad
5. **💡 Sugiere Features**: Nuevas funcionalidades

### 🔥 **PRÓXIMOS SPRINTS**

**Sprint 1 (COMPLETADO ✅)**:
- [x] Completar categoría Text & Rich Text
- [x] Implementar categoría Images & Icons
- [x] Agregar categoría Layout completa

**Sprint 2 (Próximas 2 semanas)**:
- Completar Actions widgets restantes (Badge, Tooltip, SegmentedButton)
- Completar Inputs widgets restantes (Form, SearchBar, SearchAnchor)
- Empezar Lists & Grids (ListView, GridView básicos)

Ver el [board de desarrollo](https://github.com/CerberusProgrammer/widgets_in_flutter/projects) para seguimiento detallado.

## 💬 Community & Support

- **Report bugs** through [GitHub Issues](https://github.com/CerberusProgrammer/widgets_in_flutter/issues)
- **Request features** that would make this app even more amazing
- **Join discussions** about widgets and Flutter development

## 📜 License

This project is distributed under the MIT License. See LICENSE for more information.

## 💖 Acknowledgements

- [Flutter Team](https://flutter.dev/) for creating such an amazing framework
- [All Contributors](https://github.com/CerberusProgrammer/widgets_in_flutter/graphs/contributors) who have helped this project evolve
- 🎨 UI inspiration from [Flutter Gallery](https://gallery.flutter.dev/)
- You, for checking out this project! 🙏

---

<div align="center">

### Made with ❤️ and Flutter

**Star ⭐ this repo if you found it useful!**

Back to top ↑

</div>