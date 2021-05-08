Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B61AC433ED
	for <rust-for-linux@archiver.kernel.org>; Sat,  8 May 2021 20:03:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27FA8613D9
	for <rust-for-linux@archiver.kernel.org>; Sat,  8 May 2021 20:03:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbhEHUEr (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 8 May 2021 16:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhEHUEq (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 8 May 2021 16:04:46 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495ECC061574
        for <rust-for-linux@vger.kernel.org>; Sat,  8 May 2021 13:03:44 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y26so14221933eds.4
        for <rust-for-linux@vger.kernel.org>; Sat, 08 May 2021 13:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=lKv5rz6syqN/d49hoaTuWVXeaGOtoVNzue5gNB+Rbcc=;
        b=OvzsBWcwfrv+6b9dyvdNUWNnQMnPwxbpyJbV0AjnUev8U78NEr9D41H4mgbPprBNVM
         9oHuUS1ffrF1oNW3MeFAR7JaFsooRNbzFj7GngFRP8VmiaOs9wI9wx44FReOmmq/xOzB
         nYm2GN4qqGfE/oAkxVESdMa6+7B+2NaEV1c2f1/YHK72slse6NdDx5E6Q/wZ8v8XN6DW
         lIXQFDS59E7+msvuRsKoBSNyZrXsadsoh7ft1W7iN1s7DEfHpWHm7joAvsa/uLiWCdDF
         Ok7j3esHbNSJPELY1ar/gv4p3Btdq7Mjw3KRBHBHtLTLUpZ026ZkqSLUOrn2/KreXUGa
         cYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=lKv5rz6syqN/d49hoaTuWVXeaGOtoVNzue5gNB+Rbcc=;
        b=WdW5NB+YOflezH3yMKsnamaDRacDwBZZkxN3rtUpfWjPr6sbvBu+8V+g3PpwntCOvG
         funDuNN/eHh6st8WgKFFk/SCjYTiM1YJgkucaH7u/EigVUlZlWJMZVXEywPbk2lLqAuh
         ULi2p669QjzczLpUbcSOMA27oGHFfvRFbs2IpQOkGvNfO7P+Pv6fUZvNhXA6DQg48Y9p
         KhKCM9SWzPcYpy836uJGPpvxq8j4qkOrV3/MsH/IjgXJ9XbGPNBDfvIZcfvr0urJkFoF
         SeeXg0M3ZjF8h/Z+IrkeewhmcxCeG8krCQF2QQkadoQfbp/AkmwJlYaMdnY2JjLRVfI7
         4Eug==
X-Gm-Message-State: AOAM532+uPXfK+itS37HAiOt/ppR/5tT+Dx7t4qXiJrqiApbWKN2Fcke
        r40YXR+wOKY1+Kzt08KSoDS7NPpVnBjIzw==
X-Google-Smtp-Source: ABdhPJyGHzMxI5KORdLSkbcda5Z9jp24g2YMdZbqG1zH/eOt1d+GVg0ikaugIf76l8bVOmVn8g+nag==
X-Received: by 2002:a05:6402:204c:: with SMTP id bc12mr19371641edb.35.1620504222842;
        Sat, 08 May 2021 13:03:42 -0700 (PDT)
Received: from agape.jhs ([151.37.191.65])
        by smtp.gmail.com with ESMTPSA id t7sm7079653eds.26.2021.05.08.13.03.42
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 13:03:42 -0700 (PDT)
Date:   Sat, 8 May 2021 22:03:39 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     rust-for-linux@vger.kernel.org
Subject: thank you all and see you to the next call
Message-ID: <20210508200338.GC3002@agape.jhs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

unfortunately my connection went down, living in countryside has 
is drawbacks:). Thank you all for the really interesting conversation
and contributions.

Have a good day/night!

See you all on next call!

fabio
