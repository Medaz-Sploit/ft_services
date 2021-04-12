# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mazoukni <mazoukni@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/12 14:15:35 by mazoukni          #+#    #+#              #
#    Updated: 2021/04/12 17:05:47 by mazoukni         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/deployment.yaml