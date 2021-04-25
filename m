Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7304AC433B4
	for <rust-for-linux@archiver.kernel.org>; Sun, 25 Apr 2021 07:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30ACD61480
	for <rust-for-linux@archiver.kernel.org>; Sun, 25 Apr 2021 07:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhDYHki (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 25 Apr 2021 03:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhDYHki (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 25 Apr 2021 03:40:38 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E89CC061574
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Apr 2021 00:39:58 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id m9so39848327wrx.3
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Apr 2021 00:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=allOirMARTceDAgIrGknfbSAj+daX+/aqXsQ/aWbOg0=;
        b=ELtPhOHnbTRWZdM+WUvsHCa17m0HrMs9S34YIXGhHCrtHAObdoU56a3m313sv04cS3
         ntpzCWixUd4cikVKKSCWUgGu2lTfkxF8S1l6jBBOOT0iEulGknARb6yMvSpuZ1tjAtz9
         6quWgXtFgSY0g5Otfhe4xSHP064X2e3QrPPy0s+AJ9JgYVfUBAlXed3nOCg2ZLoRWexD
         YCyWyvopl5DvXhuBh9Y2vBXoOz6TfZ7UI8QbSVNqq1XUdq0sS//SxN0R1jsguNJsQ3Vs
         fewxzoQQzS23YS37uncV+O6awMIhvTXcddbB6ykUTKaEcmnsJ01qZF13n5ONQklbnnQV
         PskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=allOirMARTceDAgIrGknfbSAj+daX+/aqXsQ/aWbOg0=;
        b=k97CmMl0/AQAgRK9g2sVahZx+9XhwZHF/V1bqtCPGFkGFSEBsqpnh4yGlfVgQMlPy8
         6Dc99i7v7GvlR/FoimmhpFM+TcgERMjQNYbLdRskDaJxKKEvl51VUrhii076g3+qyUqL
         +aX3NM4EiqFGkECbmGz80UodRxQ3/pofjcHZBzBliE8+HAEGrKyiWhiPY6qHf+0sxEFR
         QACLumXnW7TSg2SCEbkfBFRup4l/O+W+lOSfKH5G4vqjonGy3hPFGziKGwM+2cm0JUpJ
         NKD2yXzfAk4ffXYhJagG7qJ3rvtqIXKmhOtBO3QmaKpyY+M896Ou/pQ/6sSWlR7qOzN6
         cIjw==
X-Gm-Message-State: AOAM533/rWF5gQDby5CI5jkayte7Sl0mwwoxXnEceVFWSWp9E3Y9P+6x
        xh1NZOB11LeLMGYhYHa52qG2IbJe3yY=
X-Google-Smtp-Source: ABdhPJyJErmlj7kTPUvjB+76T2XO6z2wWippl3IyZ6PJ02cIBev7KJBPS007FYqQOrmw8XK3iVnyeQ==
X-Received: by 2002:a5d:638f:: with SMTP id p15mr2405655wru.255.1619336397067;
        Sun, 25 Apr 2021 00:39:57 -0700 (PDT)
Received: from agape.jhs ([5.171.72.75])
        by smtp.gmail.com with ESMTPSA id d6sm1148457wrr.77.2021.04.25.00.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 00:39:56 -0700 (PDT)
Date:   Sun, 25 Apr 2021 09:39:54 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Geoffrey Thomas <geofft@ldpreload.com>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: Notes from 2021-04-24 call
Message-ID: <20210425073953.GA1400@agape.jhs>
References: <alpine.DEB.2.11.2104241558400.11174@titan.ldpreload.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.2104241558400.11174@titan.ldpreload.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Thank you Thomas for this work,

fabio.
