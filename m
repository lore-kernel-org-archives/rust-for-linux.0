Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A2AEB64D7
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Jun 2023 18:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbjFTSKQ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 20 Jun 2023 14:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjFTSKP (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 20 Jun 2023 14:10:15 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F565198;
        Tue, 20 Jun 2023 11:10:11 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-bad0c4f6f50so7328201276.1;
        Tue, 20 Jun 2023 11:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687284610; x=1689876610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inJZvDJyUb8Nu+i51qS/woZOXldqIjlxsmu5xQEs1PM=;
        b=NN85jh8lM/sSSUZTpV4/5XkaVqfbrHOO4DjFzIWYTJbEAV07mfck3isazdpWFERd77
         TxJmQIjYTI0ddz2YBLEtZkPFX+ZbBeWp+r4TNuXLBffWI0hJpgNEvFMTi797Pkv+KNrf
         NhvXqAl3tj6VUGd8DOFepcC0Z7WjJSFxuUDuf4DWkQY+oZHEPoz6xAFp8iCcPLOQT7pv
         0+s03+iVzf41ZII2JDfvbh97EDoFl3usFfLwXzrTOPIzN4bTF9GgGraanC/hpGseItCT
         k8dXe5ftcWcUNP1rpGzFjz9tI46v6znHr51lsWulLut5lbW38VJNcWFOpQ4rW6Dq0dRi
         oiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687284610; x=1689876610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inJZvDJyUb8Nu+i51qS/woZOXldqIjlxsmu5xQEs1PM=;
        b=OG2QOw4TVeDqhVALt0orY4sfciAvbiJhLaAH8cxXwj252AcjYdcr3axvLo+PTZ9HYu
         vKs1C01ivsam7mp5unSqy+Zshynnf/bT+Qgl1H2GjnMBA44phyKwct9IlX9gh3uAPwRD
         xcJRoVDFmJUuIWL1h0XfA6HX7tmbl/qcXhNRx0wptJgVpIneQzUo/lWgdtQXMvBev3Ft
         erxtozn5KJI+Pl/oVY7WrYc9e4oAwSLyUrmhS/icT/HfNRftsls1d0NJehlm9xAjnnaV
         6XT1Hk62rbV3uXxDOGNEF+E4m2Lq6eqsS/9/m6Px2zHm9xghjrU27K/DGv3HUJLUsTAm
         YEIg==
X-Gm-Message-State: AC+VfDzO/ri1kpn5xK2BMQKY8AxStjv+fkfCn8X9rNYq3Tao+/OBzMrH
        JAZlsuLMCTc9QLpgKe2S1tbzVYJ1il++pxPP87w=
X-Google-Smtp-Source: ACHHUZ6JtjsqjxGzSV8GiYl5NPwNkvAIWZ42oWcq6fe37zGuUxY4XKn0ycCT6zp9nJ2dJCfIamt5g4Gm9cu9GdTbUDo=
X-Received: by 2002:a25:468b:0:b0:be5:521c:b3f1 with SMTP id
 t133-20020a25468b000000b00be5521cb3f1mr10754571yba.2.1687284609939; Tue, 20
 Jun 2023 11:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230614230128.199724bd@kernel.org> <8e9e2908-c0da-49ec-86ef-b20fb3bd71c3@lunn.ch>
 <20230615190252.4e010230@kernel.org> <20230616.220220.1985070935510060172.ubuntu@gmail.com>
 <f28d6403-d042-4ffb-9872-044388d0f9d9@lunn.ch> <CANiq72mMi=7P9OxSH0+ORYDEyxG3+n5uOv_ooxMJ72YRBRZ+PQ@mail.gmail.com>
 <a4bc8847-c668-4cff-9892-663516cf8127@lunn.ch> <48a98d0c-bfd1-68a9-5d1f-65c942b7c0ef@crisal.io>
In-Reply-To: <48a98d0c-bfd1-68a9-5d1f-65c942b7c0ef@crisal.io>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 20 Jun 2023 20:09:58 +0200
Message-ID: <CANiq72=x9kEniX78vA7fLu+6wiwDKEr=BYy+aCMZ5S+eSRFf+A@mail.gmail.com>
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
To:     =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>,
        Andreas Hindborg <nmi@metaspace.dk>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        FUJITA Tomonori <fujita.tomonori@gmail.com>, kuba@kernel.org,
        netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Jun 19, 2023 at 1:27=E2=80=AFPM Emilio Cobos =C3=81lvarez <emilio@c=
risal.io> wrote:
>
> Hi Andrew, Miguel,
>
> On 6/16/23 16:43, Andrew Lunn wrote:
> > I said in another email, i don't want to suggest premature
> > optimisation, before profiling is done. But in C, these functions are
> > inline for a reason. We don't want the cost of a subroutine call. We
> > want the compiler to be able to inline the code, and the optimiser to
> > be able to see it and generate the best code it can.
> >
> > Can the rust compile inline the binding including the FFI call?
>
> This is possible, with cross-language LTO, see:
>
>    https://blog.llvm.org/2019/09/closing-gap-cross-language-lto-between.h=
tml
>
> There are some requirements that need to happen for that to work
> (mainly, I believe, that the LLVM version used by rustc and clang agree).
>
> But in general it is possible. We use it extensively on Firefox. Of
> course the requirements of Firefox and the kernel might be different.
>
> I think we rely heavily on PGO instrumentation to make the linker inline
> ffi functions, but there might be other ways of forcing the linker to
> inline particular calls that bindgen could generate or what not.

Thanks Emilio! It is nice to hear cross-language LTO is working well
for Firefox.

Andreas took a look at cross-language LTO some weeks ago, if I
remember correctly (Cc'd).

I am not sure about the latest status on kernel PGO, though.

Cheers,
Miguel
