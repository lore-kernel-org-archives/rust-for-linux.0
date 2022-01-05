Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C892C433F5
	for <rust-for-linux@archiver.kernel.org>; Wed,  5 Jan 2022 13:46:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240428AbiAENqB (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 5 Jan 2022 08:46:01 -0500
Received: from mail-wm1-f53.google.com ([209.85.128.53]:44706 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbiAENqB (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 5 Jan 2022 08:46:01 -0500
Received: by mail-wm1-f53.google.com with SMTP id f134-20020a1c1f8c000000b00345c05bc12dso3353019wmf.3
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Jan 2022 05:46:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PhlHf0RZxU44kE10oe0JYD+/6HZN8SzebW/5U6uDiQ8=;
        b=tsYAImmByFbEfXi4S/3gaHQo7WCmlNGko6PnlVdSn0EQgXaslMZOCoIWO6s/doK4mJ
         JOI/csFnwdLlKLYVHQRwEPSLPPwCG11a18EpX0HfGWl0hODQUHEoFQsBu1So9CiNXW7j
         TdENgrsRxLklMxBZDoo4GLcqRx7Kv2JP0FGeTz05fOV5JN+fDE66xIre1GRsmTHm8Wnr
         qJ0R6AsDubWhRRnpW80se6C6okVcg5QMeH71asNLYDoMzYOPAKCaV+q/KRGznmadihwm
         lRYDo6LDkgha1ONgOOnUJ6o6n3GEAUPQV4XR5svAdO4GIh4LdCLrU735z4OTCYj8eRTK
         xg3A==
X-Gm-Message-State: AOAM531vnM23oSVK7/5k4k8bg0jOPQSGaiOCvJYDT9pBEz4D/AtQ5hlV
        I7xlxa42cWRqAuYlFDZctqMHxYCbfug=
X-Google-Smtp-Source: ABdhPJyRY9atU/O09+6WMuiBWWYFY6VQDc935lv8Myw/xyWm8pf8tQS1uD8q5YfVIwabqxOkQfTecA==
X-Received: by 2002:a1c:4406:: with SMTP id r6mr2933497wma.42.1641390360378;
        Wed, 05 Jan 2022 05:46:00 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id d4sm40681474wrx.102.2022.01.05.05.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 05:45:59 -0800 (PST)
Date:   Wed, 5 Jan 2022 13:45:58 +0000
From:   Wei Liu <wei.liu@kernel.org>
To:     Li Hongyu <lihongyu1999@bupt.edu.cn>
Cc:     Wei Liu <wei.liu@kernel.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Which linux  kernel version should I choose?
Message-ID: <20220105134558.nbll2j5tueoqg2cg@liuwe-devbox-debian-v2>
References: <tencent_78F7527A2172D4676B48757B@qq.com>
 <20220103112146.pt32tktmjdlb7p3o@liuwe-devbox-debian-v2>
 <20220103112257.mvz25qghrnsapicw@liuwe-devbox-debian-v2>
 <61d51c88.1c69fb81.3b0da.ae02SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61d51c88.1c69fb81.3b0da.ae02SMTPIN_ADDED_BROKEN@mx.google.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Jan 05, 2022 at 12:19:56PM +0800, Li Hongyu wrote:
> Hi Wei Liu,
> 
> Thanks for your help sincerely. I tried to reply to you the day before 
> yesterday. But it seems something goes wrong. The reply email did not show 
> in the kernel email list. I am not sure whether you receive my reply. So I 
> resend this email. If this bothers you, please do let me know.

No worries. I did get your original reply.

I'm not bothered. There is no need to apologize.

Wei.
