<template>
<nav class="navbar navbar-light bg-light d-flex justify-content-around">
        <div>Bonjour {{username}}</div>
        <button type="button" class="btn btn-primary">Login</button>
</nav>


</template>

<script>
export default {
    props: ["username", "email"], //propriétés passée du parent au fils
    data() {
        return {
            
        }
    },
    mounted(){
        // récup local storage ici
    },
    methods : {
        async createUser(){

        },
        async updateUser(){

        },
        async getUser(){
            
        },
        async deleteUser(){
            
        }
    }
}
</script>