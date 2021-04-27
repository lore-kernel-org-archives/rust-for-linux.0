Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B26C433ED
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 10:21:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E60E613C3
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 10:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236536AbhD0KVr (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Apr 2021 06:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237380AbhD0KUo (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Apr 2021 06:20:44 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF795C06138B
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 03:16:44 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id b19-20020a05600c06d3b029014258a636e8so2378490wmn.2
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 03:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4Qc5z/tkzBoKOtfcVCIl+q1KD2DUCWTSU0lf4vOvVio=;
        b=gjiICKJ23iCuDsYudl8MFuu0mqLdEmdTFVA68VDTJo8xnNLBNDFMqKfO/oC37vr8ZX
         YPzHOR9UBQ7KefVjvMPGepgi05Szwl6YKjNpbEKVDb8be91Oz16VtkXZBbYh1X1lPt4L
         6VBZ3GyqLOJcJuHbRyZiZevE5ZnWE+qI+CxmJeJryfyUg6rAHn58xMFyS5WK/y1OUy9L
         RmfamqQOGkxmNVrANKE15dw1RkBJzxjrjjwZVv3n4sS9J67uwDglLoQu9DThlv48mQnr
         4mUFSCRLbKZP9pbPk+hiQPeVljn7Z7Iu6Cry4i6WqKuyjszvd2KDq1ctOCcZYSB4bwwA
         cAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4Qc5z/tkzBoKOtfcVCIl+q1KD2DUCWTSU0lf4vOvVio=;
        b=tfkD2gvUc6Vbj7JoqxSi46LeLviK+HR10PH6QKJIaiKITMpnzQ7CvRTY+7bBY3Qgyn
         H2yLN4Y+9OyIGeKguz3oel4brzwjdqPFr+L3kX+TEBCj+RVG5ckmEM9wWa8SydvGY8Gf
         S21WzpB0fHa8qqc5GUHouFxKraLk8kVbUXAetOzkXhZMwTyGaBoa00MubF1kbSWT6To0
         X6/4gXyhxuT4B2gr4bM/Q5sto3fjIxhkg2OuyE6HAkiIzpqAhI38euDECcT1BarOZ8Oj
         zVFyzTVKEqISQmt3Y2BEM+yDKq4AE4Sdn/GeRrLR0mEHKkXgBa8mMf3fm9esFEdPs6ad
         JOzQ==
X-Gm-Message-State: AOAM530wXzD/ovD+h0nG482rl5DkiCF38DkNC1C6uLk2MAabuzdAlgTM
        pRKY9qpG82ZEzsq0ywbFlGs=
X-Google-Smtp-Source: ABdhPJwnGVgrgc5bPSI5r5cZLJ9wpm2NRMEvuUzpq4A3H50jdovH5O2W9bMi5KdggurFjb4jdhTN1Q==
X-Received: by 2002:a1c:771a:: with SMTP id t26mr24222108wmi.96.1619518603583;
        Tue, 27 Apr 2021 03:16:43 -0700 (PDT)
Received: from agape.jhs ([5.171.81.51])
        by smtp.gmail.com with ESMTPSA id f24sm2023487wmb.32.2021.04.27.03.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 03:16:43 -0700 (PDT)
Date:   Tue, 27 Apr 2021 12:16:40 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Next call on 2021-05-08
Message-ID: <20210427101639.GA2449@agape.jhs>
References: <CANiq72mFxBi9pwh-pr_LgqNBcOFaZ5-LKXwWTB0j4V2kuW+ouw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mFxBi9pwh-pr_LgqNBcOFaZ5-LKXwWTB0j4V2kuW+ouw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Apr 27, 2021 at 12:04:18PM +0200, Miguel Ojeda wrote:
> Hi all,
> 
> As mentioned in the last meeting, we will have another call 2 weeks
> from the last one, same time: 2021-05-08 18:00 UTC.
> 
> As usual, anybody is welcome to join. The meetings take place on
> Google Meet. The invitation link will be sent later on to those
> interested.
> 
> Cheers,
> Miguel

Thank you Miguel,

I'll be there.

fabio
