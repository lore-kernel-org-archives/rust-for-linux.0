Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4883FC433B4
	for <rust-for-linux@archiver.kernel.org>; Mon, 10 May 2021 16:56:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21FAA611CE
	for <rust-for-linux@archiver.kernel.org>; Mon, 10 May 2021 16:56:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhEJQ5g (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 10 May 2021 12:57:36 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:36369 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbhEJQ5f (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 10 May 2021 12:57:35 -0400
Received: by mail-wm1-f48.google.com with SMTP id l24-20020a7bc4580000b029014ac3b80020so11572438wmi.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 May 2021 09:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6cPCeh6bscbuvK9GCppT92tjQucOEO2EZt+5lCS7Zgo=;
        b=KIt8F3R5osXKzgAWRIJFwfzRRQdb0To5p2dJTaE/hfwEmgE4IERxlqGyXKXS05XRQj
         o6ENO1I83CTj49dl9k/e24BIaMq4bTNMeN9JuN5SF7feHiFWpavro8coxoOb3lvks+lT
         Galyg8pnGcrwjTmeMo/lN3mKOsRNONFHGOTWJfusLVv7PeFIL1hZkowQ/9pHeZIDW/Vc
         RWZCvrtfEOKF6mVqYnfX3DkRXqJXrZT4bq2ZcZoBA6Y/KbhKQbRTWffMNAbsCWM02pP+
         VYz091DIhujpOdzJBRdSjf+Yzj1EWGjGvuml0t61IROf5bRvJfTv9FrNwtb/43KSHM1E
         rTtw==
X-Gm-Message-State: AOAM533J2HJyTvM0V5VIrrBkSf0JlFMz4WrpC9zn8peC8l5Pg2STe1ko
        q80fiKJOAbLmeAnZYuSWEsw=
X-Google-Smtp-Source: ABdhPJx0B++isSZTaPjlTVfYRtnPZb6QkiQY0Gktbc7ywJm6lNkkSYvmhVgPXya0jdqvGbGUEK4/HQ==
X-Received: by 2002:a1c:238d:: with SMTP id j135mr88487wmj.170.1620665790197;
        Mon, 10 May 2021 09:56:30 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id m16sm23708323wru.68.2021.05.10.09.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 09:56:29 -0700 (PDT)
Date:   Mon, 10 May 2021 16:56:27 +0000
From:   Wei Liu <wei.liu@kernel.org>
To:     Robin Randhawa <robin.randhawa@arm.com>
Cc:     rust-for-linux@vger.kernel.org, nd@arm.com,
        Wei Liu <wei.liu@kernel.org>
Subject: Re: Meeting minutes (Sat 8 May 2021)
Message-ID: <20210510165627.pnhqxyzmtdf2ni7o@liuwe-devbox-debian-v2>
References: <20210508202258.m7uk6cfxzyghzu7f@FVFF77RQQ05N>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508202258.m7uk6cfxzyghzu7f@FVFF77RQQ05N>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, May 08, 2021 at 09:22:58PM +0100, Robin Randhawa wrote:
[...]
> Q What about the previously discussed use of the Zulip chat platform ?
> 
> - Not done yet. Should happen shortly. ** Action: Miguel **

Look forward to having Zulip. Emails and calls are too heavy weight for
quick questions and discussions.

Wei.

> 
> Cheers,
> Robin
