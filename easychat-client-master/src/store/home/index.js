import { mockGetChatList, mockGetFriendList, mockGetFriendVerify, mockGetHistory, reqGetChatList, reqGetFriendList, reqGetFriendVerify, reqGetHistory } from "@/api";

const state = {
    onlineUsers: [],
    chatList: [],
    friendList: [],
    friendVerifyList: [],
    chatHistories: []
};
const mutations = {
    ONLINEUSERS(state, onlineUsers) {
        state.onlineUsers = onlineUsers;
    },
    CHATLIST(state, chatList) {
        state.chatList = chatList;
    },
    FRIENDLIST(state, friendList) {
        state.friendList = friendList;
    },
    FRIENDVERIFY(state, friendVerifyList) {
        state.friendVerifyList = friendVerifyList
    },
    HISTORY(state, chatHistories) {
        state.chatHistories = chatHistories;
    }
};
const actions = {
    // async getChatList({ commit }) {
    //     let result = await mockGetChatList();
    //     if (result.code === 200) {
    //         commit("CHATLIST", result.data.sort((obj1, obj2) => {
    //             if (obj1.createTime > obj2.createTime) {
    //                 return -1;
    //             } else if (obj1.createTime < obj2.createTime) {
    //                 return 1;
    //             } else {
    //                 return 0;
    //             }
    //         }));
    //     }
    // },
    // async getFriendList({ commit }) {
    //     let result = await mockGetFriendList();
    //     if (result.code === 200) {
    //         commit("FRIENDLIST", result.data.sort());
    //     }
    // },
    // async getFriendVerify({ commit }) {
    //     let result = await mockGetFriendVerify();
    //     if (result.code === 200) {
    //         commit("FRIENDVERIFY", result.data.sort((obj1, obj2) => {
    //             if (obj1.createTime > obj2.createTime) {
    //                 return -1;
    //             } else if (obj1.createTime < obj2.createTime) {
    //                 return 1;
    //             } else {
    //                 return 0;
    //             }
    //         }));
    //     }
    // },
    // async getHistory({ commit }) {
    //     let result = await mockGetHistory();
    //     if (result.code === 200) {
    //         commit("HISTORY", result.data);
    //     }
    // },

    async getChatList({ commit }, userId) {
        let result = await reqGetChatList({ id: userId });
        if (result.success) {
            commit("CHATLIST", result.data.sort((obj1, obj2) => {
                let time1 = obj1.latestChatHistory ? obj1.latestChatHistory.createTime : obj1.sessionTime;
                let time2 = obj2.latestChatHistory ? obj2.latestChatHistory.createTime : obj2.sessionTime;
                if (time1 > time2) {
                    return -1;
                } else if (time1 < time2) {
                    return 1;
                } else {
                    return 0;
                }
            }));
        }
    },
    async getFriendList({ commit }, userId) {
        let result = await reqGetFriendList({ id: userId });
        if (result.success) {
            commit("FRIENDLIST", result.data.sort());
        }
    },
    async getFriendVerify({ commit }, userId) {
        let result = await reqGetFriendVerify({ id: userId });
        if (result.success) {
            commit("FRIENDVERIFY", result.data.sort((obj1, obj2) => {
                if (obj1.createTime > obj2.createTime) {
                    return -1;
                } else if (obj1.createTime < obj2.createTime) {
                    return 1;
                } else {
                    return 0;
                }
            }));
        }
    },
    async getHistory({ commit }, params) {
        let result = await reqGetHistory(params);
        if (result.success) {
            if (result.data.records) {
                commit("HISTORY", result.data.records.sort((obj1, obj2) => {
                    if (obj1.createTime < obj2.createTime) {
                        return -1;
                    } else if (obj1.createTime > obj2.createTime) {
                        return 1;
                    } else {
                        return 0;
                    }
                }));
            } else {
                commit("HISTORY", []);
            }
        }
    }
};
const getters = {};

export default {
    namespaced: true,

    state,
    mutations,
    actions,
    getters
}