interface Theme {
    name: Array<string>
}
// los temas son un array de string ya que pueden estar en diferentes idiomas pero se refieren al mismo tema.

interface Diary {
    price: number
    personalized_price: number
    description: string
    theme: Theme
    gr: number
    sheets: number
    tamaño: string
    img: string
    sheet_type: string
    laminate: string
}

interface Notebook {
    price: number
    personalized_price: number
    theme: Theme
    description: string
    gr: number
    sheets: number
    tamaño: string
    img: string
    sheet_type: string
    laminate: string
}

interface Drawing_Notebook {
    price: number
    personalized_price: number
    theme: Theme
    description: string
    sheets: number
    tamaño: string
    img: string
    laminate: string
}

interface Keychain_Sticky_Notes {
    price: number
    personalized_price: number
    theme: Theme
    description: string
}

interface Bookmarks_Set {
    price: number
    personalized_price: number
    theme: Theme
    description: string
}

interface Stickers_Set {
    price: number
    personalized_price: number
    theme: Theme
    description: string
}

interface Wall_Calendar {
    price: number
    personalized_price: number
    theme: Theme
    description: string
}

interface Magnet_Calendar {
    size: string
    price: number
    personalized_price: number
    theme: Theme
    description: string
}

interface Magnetic_Fridge {
    price: number
    theme: Theme
    size: string
}

interface Painting {
    price: number
    personalized_price: number
    theme: Theme
    description: string
}

interface Resined_painting {
    size: string
    price: number
    personalized_price: number
    theme: Theme
    description: string
}

interface Happy_Box {
    size: string
    price: number
    personalized_price: number
    theme: Theme
    description: string
    content: Array<string>
}