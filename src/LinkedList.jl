mutable struct SingleNode{T}
    data::T
    next::Union{SingleNode{T}, Nothing}
end
SingleNode{T}(data) where T = SingleNode{T}(data, nothing)

mutable struct SingleLinkedList{T}
    head::Union{SingleNode{T}, Nothing}
end
SingleLinkedList{T}() where T = SingleLinkedList{T}(nothing)

function insert!(list::SingleLinkedList{T}, item::T) where T
    node = SingleNode{T}(item)
    if isnothing(list.head)
        list.head = node 
    else
        node.next = list.head
        list.head = node
    end
end
