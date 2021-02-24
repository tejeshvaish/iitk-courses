
import sys

def fsm(n_clusters):
    # %matplotlib inline
    from fcmeans import FCM
    import numpy as np
    # import os
    # os.environ['TF_CPP_MIN_LOG_LEVEL'] = "2"
    # from matplotlib import pyplot as plt

    X = np.loadtxt('T.txt')
    # n_clusters = int(input()) 
    # n_clusters = 10
    fcm = FCM(n_clusters)
    fcm.fit(X)
    # outputs
    # np.set_printoptions(suppress=True)
    fcm_centers = fcm.centers

    np.savetxt("results.txt", fcm_centers, '%d') 

    # np.savetxt("results.txt", fcm_centers, newline="\n")
    # fcm_labels = fcm.predict(X)

    # plot result

    # f, axes = plt.subplots(1, 2, figsize=(11, 5))
    # axes[0].scatter(X[:, 0], X[:, 1], alpha=.1)
    # axes[1].scatter(X[:, 0], X[:, 1], c=fcm_labels, alpha=.1)
    # axes[1].scatter(fcm_centers[:, 0], fcm_centers[:, 1], marker="+", s=500, c='w')
    # plt.show()
    return 0

n = sys.argv[1]
n = int(n)
# print(n)
fsm(n)
# plt.savefig('images/basic-clustering-output.jpg')
# plt.show()

