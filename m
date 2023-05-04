Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95047C77B7C
	for <rust-for-linux@archiver.kernel.org>; Thu,  4 May 2023 22:28:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjEDW2K (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 4 May 2023 18:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjEDW2J (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 4 May 2023 18:28:09 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F15AB186
        for <rust-for-linux@vger.kernel.org>; Thu,  4 May 2023 15:28:08 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-52c6f81193cso737493a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 May 2023 15:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683239288; x=1685831288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14Y397b4BvvmmP2dEn/DY1zpvluNh4u4ZUFFXog6oMo=;
        b=XSfEEbqKaI4xnyRsCgpfDXeW73mBJo4ioGGPcA3EgvmnsFS4C8tVIio4NfkUMQtLjh
         3uaOCUodHmac+zBMOCMTwbb9h7W5QaMBpP/jF4F2Uo8hDxgAwaUuqtbXA78Tu97UJHUt
         zG3AgPIGvXUZI0C8Pa/oSjWdZdccqRLRck/ZBe1uQecrKD/4zMuAUPCagIwxg8e35780
         JfHE3UZ0hE180g53GzqaVTByRZhjS4wWVSlJjTbGXkz4mz0+DniXWzd8tXMetX1YKn72
         lYruzcN1QoPZT5k9wOJHBtutw5H9zq1Tf/AcXP9mAflLZup62O/48gCMoeMj/tfP/+3M
         NeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683239288; x=1685831288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14Y397b4BvvmmP2dEn/DY1zpvluNh4u4ZUFFXog6oMo=;
        b=Uzfi5QqqUpH0CqXS6k1SU9T8F3OStE3zM+wqMHL7LLU3SnCvI2S9MTftvCw3rzL7TH
         Qnm/P+P0aFrj1bwrzecWQ0Wi3SORxN9KnQa+Z9Y3dr6C2OgvXuFhulU84QOFCQjQz2MJ
         t+0gAIlfVfBWlnIvy4WHrVbDiK63RhnpSiSXJxiPySnawn4B00iW88qwGlFPippfY6St
         WapnWNlTwkYFb29SlKgDNksfyx5PH7pBiZ4+Gwupg/SiKepnKyo59xH1pB+1shj38J/D
         RqpmuoyAgdHKO41VqH6ZqEiIHAjGXRrLte3ZYBguzBK1psPlGxADyKq6iJfjbt4Ft83l
         C4Pw==
X-Gm-Message-State: AC+VfDwdWjYOLh7jWFJRevgoDNghtxXVO1LO+Usb88PoEB+u8MyLxuz2
        hnrgsrtAnLWBqv6GC/nchX5EgJaSRhTdoq9Kdx6A2g==
X-Google-Smtp-Source: ACHHUZ6r8wbeiVxPGDv1nvrWX0mu3liDZBBew1HY0J11ZfzafuKGlLj7woEc5lgEFX8fsZihe/a8kRXXcvNFMYOZLz4=
X-Received: by 2002:a17:903:44b:b0:1ab:f74:a111 with SMTP id
 iw11-20020a170903044b00b001ab0f74a111mr5019402plb.63.1683239288468; Thu, 04
 May 2023 15:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230418214347.324156-1-ojeda@kernel.org> <CAPDJoNsG1E25yYM+L_H21vVCt-5S16etx3KMxx8ySZtWMQt4FQ@mail.gmail.com>
 <CANiq72mtb9V+1a7nPEHBCeg_fob4rpPTWJZjdahnGL2Mg3uoUA@mail.gmail.com>
 <CAPDJoNvGQBNN6X6fs26tjUy7LbpJjWwPvQuf=1+nSwj94aa6LA@mail.gmail.com> <CANiq72m7zdYo566PxX3g03+XPpHnrQy7GG9WkgEP82mK_2JBpw@mail.gmail.com>
In-Reply-To: <CANiq72m7zdYo566PxX3g03+XPpHnrQy7GG9WkgEP82mK_2JBpw@mail.gmail.com>
From:   Fabien Parent <fabien.parent@linaro.org>
Date:   Fri, 5 May 2023 00:27:57 +0200
Message-ID: <CAPFo5VJpGq70X6efWESDoCYE3J0pjgMB1c7X_ACA4Q9MxnoHQw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Rust 1.68.2 upgrade
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Ariel Miculas <ariel.miculas@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Josh Stone <jistone@redhat.com>,
        William Brown <william.brown@suse.com>,
        Georgy Yakovlev <gyakovlev@gentoo.org>,
        Jan Alexander Steffens <jan.steffens@gmail.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Miguel,

I'm getting the following error when running rusttest on top of your patchs=
et:

$ make LLVM=3D1 RUSTC=3D/home/fparent/.rustup/toolchains/1.68.2-x86_64-unkn=
own-linux-gnu/bin/rustc
RUSTDOC=3D/home/fparent/.rustup/toolchains/1.68.2-x86_64-unknown-linux-gnu/=
bin/rustdoc
rusttest
  RUSTC L rust/uapi.o
error: the feature `core_ffi_c` has been stable since 1.64.0 and no
longer requires an attribute to enable
  --> rust/uapi/lib.rs:11:12
   |
11 | #![feature(core_ffi_c)]
   |            ^^^^^^^^^^

After manually removing line 11 in lib.rs, the error was gone.

Fabien

On Thu, 20 Apr 2023 at 19:20, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Apr 20, 2023 at 7:18=E2=80=AFPM Ariel Miculas <ariel.miculas@gmai=
l.com> wrote:
> >
> > Yes, I've edited the commands since I've run them out of order, let me
> > include the output of commands and my general setup.
>
> Thanks for confirming! (and for all the output!).
>
> Cheers,
> Miguel
