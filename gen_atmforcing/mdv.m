function data = mdv(input, winday, winnight)
% Perform gliding window mean diurnal variation method to fill gaps
[m n] = size(input);
data = input;
for i = 1:m
    for j = 4:n
        if(input(i, j) == -9999 || input(i, j) == -6999)
            if(input(i, 3)>600 && input(i, 3)<=1800)    % Day time
                count = 0;
                container = [];
                for k = 1:m
                    if(input(i,3) == input(k,3) && k ~= i && ...
                            input(k,j) ~= -9999 && input(k,j) ~= -6999)
                        count = count + 1;
                        container = [input(k, j) container];
                    end
                    if(k > i)
                        pt = count;
                    end
                end
                % calculate mean from container within window size
                if(exist('pt', 'var') && count ~= 0)
                    if(pt <= winday)
                        data(i, j) = mean(container(1:2*winday));
                    else
                        if(pt > count - winday)
                            data(i, j) = mean(container(count - 2*winday));
                        else
                            data(i, j) = mean(container(pt - winday:pt + winday - 1));
                        end
                    end
                end
            end
            if(input(i, 3)<=600 || input(i, 3)>1800)    % Night time
                count = 0;
                container = [];
                for k = 1:m
                    if(input(i,3) == input(k,3) && k ~= i && ...
                            input(k,j) ~= -9999 && input(k,j) ~= -6999)
                        count = count + 1;
                        container = [input(k, j) container];
                    end
                    if(k > i)
                        pt = count;
                    end
                end
                % calculate mean from container within window size
                if(exist('pt', 'var') && count ~= 0)
                    if(pt <= winnight)
                        data(i, j) = mean(container(1:2*winnight));
                    else
                        if(pt > count - winnight)
                            data(i, j) = mean(container(count - 2*winnight));
                        else
                            data(i, j) = mean(container(pt - winnight:pt + winnight - 1));
                        end
                    end
                end
            end
        end
    end
end
