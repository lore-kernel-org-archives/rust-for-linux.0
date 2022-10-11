Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C8BC433FE
	for <rust-for-linux@archiver.kernel.org>; Tue, 11 Oct 2022 03:01:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbiJKDBy (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 10 Oct 2022 23:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiJKDB3 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 10 Oct 2022 23:01:29 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720023AB18
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Oct 2022 20:01:27 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id n73so5033024iod.13
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Oct 2022 20:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ooSL6x6epkP6OOB3mNxBTJdqRITrmmPttPBl0cW4JHw=;
        b=h0SWU3NT6eadahOCOUiB61qWuKpg+/IB5l3FpWGEW35eXD2cKwIzGphgFcecIsBp9L
         LskvqzeeT3wS7njy4lfj8tECA3QaISe/6FnY2idYMZdTbr5v2buuhibWUd2NXG+WPLNe
         j/IiGhG3Ez5Rrhk0Ls++dfoOZHjLCRuHrjqli08uKsPHvk3bu4bOQ1S+1jHAom26wfD8
         kgZ8fL23RHK+LM8Gv5Ajhae2+tNsdPeUQQnqCMEndsL9ESI9HlcBXLRFfYhhG8m+n9TG
         crq6MWboECjqzaAehI43R07WajxrqPnXiaS7eF1IsShjlZBAhNNMLFbnnfFOyCXDWojf
         +jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ooSL6x6epkP6OOB3mNxBTJdqRITrmmPttPBl0cW4JHw=;
        b=lYigiHkGsNFKVgAR4VjVKGe5f8VhURTIqXhY91IqsjtBoXhmJpltcVr040hxS0nuwl
         EQwOjDmzihTI1zFTO6sinMPKqlfRE1OkQYSqfzAoYEy4Q1St/Kel+VeibNI78QbqJXnn
         LVEk4PSoq7yPB77yVYdzHvoM9dSkxlwx1uXV2zTBWwY18lTC2L3N+RMDWNLTuObEmLLA
         0ohgvsktcCM5R9w/C9R4BqpuHZFLaIgLHp/BpoUnmCHJ53WPKEwUanDEsQCq6llaKB+D
         hqWVx/DSrCEz2xgX6AHOZP/A6N+oa56eEJv/10tDyyWWSh5TkO+u5pIIH40+UxzQjuce
         oOCw==
X-Gm-Message-State: ACrzQf1YwDZcvYbRHendSVVSYySz/+y9+YrnxSLUyeNhc6Y6husupjPD
        eRVg/6+xYbbHcQ9f9TeJM9YXO+WrskIAigpia+7s1Ihmapo=
X-Google-Smtp-Source: AMsMyM63j1PmutkvOLZIAXt9oKVXpiZwEciwH4CK/wZgrptp+1g56hWxbV8wf2+9GUxIFD0mxUlQ78/f7dAKLYT4i/Y=
X-Received: by 2002:a05:6602:3427:b0:6a1:e91a:2e80 with SMTP id
 n39-20020a056602342700b006a1e91a2e80mr9958326ioz.52.1665457286787; Mon, 10
 Oct 2022 20:01:26 -0700 (PDT)
MIME-Version: 1.0
From:   Gioh Kim <gurugio@gmail.com>
Date:   Tue, 11 Oct 2022 12:01:16 +0900
Message-ID: <CANc8B5MUDNfR=zLrigH0DtR1YVDc1hwp3Usz-_vEczBppP+cqA@mail.gmail.com>
Subject: wrapper for __register_blkdev and unregister_blkdev
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

I tried to make the ramdisk module for exercise but found that
there is no wrapper for block layer APIs.
I thought it would be great if somebody is working for the block layer.
So I just implemented a wrapper of only __register_blkdev and
unregister_blkdev for testing.
https://github.com/Rust-for-Linux/linux/commit/65fd073d9f2ccbdabeae444ff34a72e23d717845

I am wondering if there is somebody working for the block layer.
There are wrapper APIs for the character device and sample code but no
code for the block device.
I found FUJITA Tomonori already implemented binding functions that do
not have wrappers in RUST style.
FUJITA, will you continue to implement more block layer APIs?
I saw you were busy for the e1000 driver.
If you will, please inform me of your repository, and let me review and test it.

-- 

Best regards,
Gioh Kim
