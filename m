Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299BDC3DA79
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Dec 2022 23:34:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234141AbiL2XeZ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Dec 2022 18:34:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbiL2XeX (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Dec 2022 18:34:23 -0500
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98EF61658A
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Dec 2022 15:34:22 -0800 (PST)
Received: by mail-vk1-xa31.google.com with SMTP id j5so9437810vkp.10
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Dec 2022 15:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B6vjM9HDqFcQM2Fq1TFyVxl0DwEN8yHOhhNLLy0+rA0=;
        b=Gq58iELz1GhvWt9rwaJL/vmVHXtjAeLbpi1g8e8UvwnbNjAcuN18F3kHQaWSSZxdVP
         c4gy6yuOmL38NXN2lnQowzfhO4WnuXxVBIamrK1ilP7BrOrCQ6NYJ8bm1SEaSZxpnAWM
         vpkDTc6WoHw5Xvk5JUSGvoIJi7ZxcPFJo8UIBqwRrqArV7g3Zi2wfD72AkIfR0f9cOkW
         eN0u8XMW/LKayfVbyaXPYyPXiLMejLcwSqujUB/UExLoSCqaueysN9/DC/VAZUQ4ymN6
         c0HVm876MvVVDf9J9yP3mffaHUMm8CJTpm07GJr91lNS0H1C6fis/lJptAvktZQBWuAW
         8Aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6vjM9HDqFcQM2Fq1TFyVxl0DwEN8yHOhhNLLy0+rA0=;
        b=DMIbK24unfwF2KOA5MAjEJxBzyb8HpRrmD8HVQWstuOPlmxYdCya0ZuML17zzxZRB6
         /meue9HzZ3lYnR5u+SxfAjH66eZaHpE3ZBcf7PNZDM7btXlXTxKtBhX+UeKp0ptfPHsL
         EwTIJxBCyler+UHyWr6LfnTxayjVpJLQiwoIkimE4XMjlzwOW15zSvEBoDCS+OwBg7dF
         +Aue5UY/K9WjZ3rtfqaTgCke9vYxyGV2EXSd93V7Ez3fbfbePjSbJzBs/oQ93jzls4Dr
         zzUExN5u+Cz/5vLBYpcAtJZQ8Pw5LlCHdVQ/c/IbAI9M1v1imw+qBXwsfjLTmSCFkiXQ
         Sz0w==
X-Gm-Message-State: AFqh2kr9pBZXDT50WVeXIwUUGJsHiDYwWbeVybb5xJPu3+3/SylY3GUS
        jdg0SHFcccOsRfMIrmmnLDM0tzIyiwK5z590qakp31g6cQiUqw==
X-Google-Smtp-Source: AMrXdXv4D1Cx74cT1OSwd2dzOLkwdVhwklWI29mPwtkJiYf9vKsdvDe7BioZTKpejZNnynnAJbxAOlhHWggEZe3L3K0=
X-Received: by 2002:ac5:c970:0:b0:3d2:b9c2:4e89 with SMTP id
 t16-20020ac5c970000000b003d2b9c24e89mr3425432vkm.32.1672356861613; Thu, 29
 Dec 2022 15:34:21 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+Zx=3OwXeJNsz8DLp_94ciWpQKoiV75v=XH3FoUQKW==_S8w@mail.gmail.com>
 <CAFRnB2Wp18E_PNpcN3fjVDh0FjSGgC2ACfA+-cDwTBv4p1eZqQ@mail.gmail.com>
In-Reply-To: <CAFRnB2Wp18E_PNpcN3fjVDh0FjSGgC2ACfA+-cDwTBv4p1eZqQ@mail.gmail.com>
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
Date:   Fri, 30 Dec 2022 08:34:11 +0900
Message-ID: <CAJ+Zx=3pD2PJaFRHiNPUHdGYJMTnjqDz5xToi-7mwinC-hmnFw@mail.gmail.com>
Subject: Re: Rust in-kernel TLS handshake
To:     Alex Gaynor <alex.gaynor@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,
Thanks for the comments!

On Wed, Dec 28, 2022 at 10:50 PM Alex Gaynor <alex.gaynor@gmail.com> wrote:

> There's many reasons to be leery of complexity in the kernel, but
> security vulnerabilities due to memory unsafety is definitely a big
> one, so I think you're completely correct that Rust can significantly
> change the equation on that risk.

Surely, I'll work on it to see how things work.

> > I worked on QUIC as a consumer of TLS. This can establish a QUIC connection
> > with Quinn's example client, Rust QUIC implementation. Only minimum
> > server side functionality and connection establishment are supported.
> >
> > From the perspective of Rust-for-Linux, the main work is implementing
> > APIs for crypto subsystem. Also libraries such as working with buffers
> > (like Tokio's bytes) would be helpful, I think (should be useful for
> > other projects). I'll work for mainline. Meanwhile you can compile
> > this kernel module
> > with my fork.
> >
>
> I think a Rust API for the crypto subsystem would be great, I'd be
> happy to help review patches for that.

Thanks, I'll try.

> When you say Tokio's bytes, what parts of it are you interested -- the
> lifetime management (e.g. refcounting), or the APIs that are useful
> for handling network protocols (e.g. put_u16)?

Probably, both.
For now I use something simple like the latter for playing with TLS
and QUIC messages.
I guess that a Rust API for the crypto might need the former; passing
buffers to the crypto subsystem via scatterlist.
