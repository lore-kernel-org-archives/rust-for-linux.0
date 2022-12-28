Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682AEC4167B
	for <rust-for-linux@archiver.kernel.org>; Wed, 28 Dec 2022 13:50:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiL1Nur (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 28 Dec 2022 08:50:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiL1Nuq (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 28 Dec 2022 08:50:46 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8435DE77
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Dec 2022 05:50:45 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id z26so23699878lfu.8
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Dec 2022 05:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C54ql/sDt4N/nsTgbWt4dj5/NNvyakRhF17jU3qMhVg=;
        b=B2vgKIx5FRvby/u1ZfB1lQiid6n+8+5u2D4pkFZHfBn2CdbEX+9hGdXbt0P1UC+uyO
         jMhdsaxXMnhCc7Q4zRxdiImz7niTpxxvxekPMCO45oqvhmX3nfLWypbaY0/nB8mc9w5h
         vW+ZsopR9J5f74qTSQ9avQwXFBe1T6pfQWTiCrEgsHEnqzO7yxHAiFz7ipprApH8oF8u
         2tEdnCgRLosj1b/tVxrDGtjmhGsDXLjUj5XyvudnVhE4TmnYemQFxlEweDyTIpOgjMXI
         BlKFKbzh5QaXLuYB2vICpafoj4wQoZZ60bHOTsJao+XFZeleizNT+Wq4qycjLMM+Ol36
         Hipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C54ql/sDt4N/nsTgbWt4dj5/NNvyakRhF17jU3qMhVg=;
        b=GY22kGGyLKFlQWov9d2bsyg+LEH02Z4uQKi1GZblVX1HUQVSIocLpK6uYpOIh2qGaa
         9UIin4wc+AxEgTl5jA20Z0kmvOy8mAxAQBcwOATxMXk6E8p90wenojXFJ9/reKxQ5LbJ
         H0xk61UhxDfiHQXvCLku4WMXwlR9qiMqdG9AhOQ0TEVRuxe70r2VnbhseOVAYDxn1wPN
         1paPjMMJaOHLFUYEPck00zzPfKIPs1mLT1piiWuPYDQ4m8SatNN8zWRTAPiMHvDOIThP
         X3jjuTyRe2pqnKDk5Qsun2PkAKxdMFfryqGB53zX2n/jYP6aVCciEQa41NC1VCeT6m8l
         6vwQ==
X-Gm-Message-State: AFqh2kr8d5V4ZiRlzEDcp+80O60cN5NT1O3i57VkyYWMdJdcrQ1Uk3ps
        tSxMRqQo0h5nLeoSvyeDCLsJJw21zrAVSORA31RoZHUWuAs=
X-Google-Smtp-Source: AMrXdXse3izRSaN6HzKW1evfrhA7E/7pjhaUcNz5k55zM0qXRjfm8W3q1ImJdVyPpa+l27cDAxJd0xLTaIIugM2EDZQ=
X-Received: by 2002:a05:6512:3d1:b0:4b5:b803:eabe with SMTP id
 w17-20020a05651203d100b004b5b803eabemr979023lfp.549.1672235443713; Wed, 28
 Dec 2022 05:50:43 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+Zx=3OwXeJNsz8DLp_94ciWpQKoiV75v=XH3FoUQKW==_S8w@mail.gmail.com>
In-Reply-To: <CAJ+Zx=3OwXeJNsz8DLp_94ciWpQKoiV75v=XH3FoUQKW==_S8w@mail.gmail.com>
From:   Alex Gaynor <alex.gaynor@gmail.com>
Date:   Wed, 28 Dec 2022 08:50:32 -0500
Message-ID: <CAFRnB2Wp18E_PNpcN3fjVDh0FjSGgC2ACfA+-cDwTBv4p1eZqQ@mail.gmail.com>
Subject: Re: Rust in-kernel TLS handshake
To:     FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Very cool! I'm excited to see demos like this!

There's many reasons to be leery of complexity in the kernel, but
security vulnerabilities due to memory unsafety is definitely a big
one, so I think you're completely correct that Rust can significantly
change the equation on that risk.

On Tue, Dec 27, 2022 at 8:49 PM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Hi,
>
> I've started in-kernel TLS handshake implementation in Rust.
> https://github.com/fujita/rust-tls
>
> There is some debate over in-kernel TLS handshake mainly because of
> the complexity. I'd like to see if Rust could help with auditing such
> complicated security-relevant code in the kernel.
>
> I worked on QUIC as a consumer of TLS. This can establish a QUIC connection
> with Quinn's example client, Rust QUIC implementation. Only minimum
> server side functionality and connection establishment are supported.
>
> From the perspective of Rust-for-Linux, the main work is implementing
> APIs for crypto subsystem. Also libraries such as working with buffers
> (like Tokio's bytes) would be helpful, I think (should be useful for
> other projects). I'll work for mainline. Meanwhile you can compile
> this kernel module
> with my fork.
>

I think a Rust API for the crypto subsystem would be great, I'd be
happy to help review patches for that.

When you say Tokio's bytes, what parts of it are you interested -- the
lifetime management (e.g. refcounting), or the APIs that are useful
for handling network protocols (e.g. put_u16)?

> Opinions?
>
> Resend due to a delivery issue. Sorry if you got this twice.

Cheers,
Alex

-- 
All that is necessary for evil to succeed is for good people to do nothing.
