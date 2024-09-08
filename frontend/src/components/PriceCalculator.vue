<template>
    <div>
        <h2>価格計算機</h2>
        <form @submit.prevent="calculatePrice">
            <div>
                <label for="users">ユーザー数:</label>
                <input id="users" v-model.number="users" type="number" required />
            </div>
            <div>
                <label for="mboxes">受信箱数:</label>
                <input id="mboxes" v-model.number="mboxes" type="number" required />
            </div>
            <button type="submit">計算</button>
        </form>
        <div v-if="result">
            {{ result }}
        </div>
        <p v-if="error" class="error">{{ error }}</p>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            users: null,
            mboxes: null,
            result: null,
            error: null,
        };
    },
    methods: {
        async calculatePrice() {
            if (this.users <= 0 || this.inboxes <= 0) {
                this.error = "ユーザー数と受信箱数は1以上の整数を入力してください。";
                return;
            }

            try {
                // const rr = await axios.get('http://localhost:3000/api/v1/plans')
                // const rr = await axios.get('http://localhost:3000/api/v1/plans', {
                //     withCredentials: true
                // });
                
                // const csrf = rr.headers['x-csrf-token']
                
                const res = await fetch('http://localhost:3000/api/v1/plans');
                // const res = await fetch('http://localhost:3000/api/v1/plans', {
                //     method: 'GET',
                //     mode: 'cors',
                //     credentials: 'include',
                //     headers: {
                //         'Content-Type': 'application/json'
                //     }
                // });
                const csrfToken = res.headers.get('X-CSRF-Token');
                console.log(...res.headers);
                console.log(csrfToken);
                
                
                
                const response = await fetch("http://localhost:3000/api/v1/calculate", {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-Token': csrfToken,
                        'credentials': 'include',
                    },
                    // credentials: 'include',
                    body: JSON.stringify({ users: this.users, mboxes: this.mboxes }),
                });
                console.log(response);
                

                if (!response.ok) {
                    throw new Error("APIリクエストに失敗しました");
                }

                this.result = await response.json();
                this.error = null;
            } catch (error) {
                this.error = error.message;
                this.result = null;
            }
        },
    },
};
</script>