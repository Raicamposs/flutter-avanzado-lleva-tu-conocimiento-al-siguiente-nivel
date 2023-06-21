import { randomUUID } from 'crypto'

export class Band {
    id: string
    name: string
    votes: number

    constructor(name = 'no-name') {
        this.id = randomUUID()
        this.name = name
        this.votes = 0
    }
}
