Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85517FBE6
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Aug 2023 17:43:08 +0000 (UTC)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB646DC
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Aug 2023 10:43:06 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d07c535377fso68922276.1
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Aug 2023 10:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690998186; x=1691602986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKdroMZKuJwSirWZ0alYPdk59SG5zcptY3Oe4J1YBsA=;
        b=O9VA1c6GfmNAHlYktLzdGQyr9dQOOnMBB43QOhMWuxR1EZ1oxelf2ryydvqp3ISxe6
         c36qfX2RFAfWz1rb/AFtUgrmfE/coDu6HUlkPxT9/XF7pzY260gSQLpa7fgnnxMCPIZS
         /P41Og3Vqz54NLVsJUftSJptdeRcDeY3684xVHRP5RtbixP4wu5BTBhQ8uFxLGnTqb8H
         uKW628MBrgJd6+ZL1L7VjOVUsUiLMIfeYHc+0LlEnoDbDcZvhSL8a+Cq4wfBO1phn9JA
         L2snuf2T7qanAmBmAvAgXSnyUl/2UOX/UUlIRjh1znbyRt4Gsn+V2vQoXvNLwNqUfIYX
         JYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690998186; x=1691602986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKdroMZKuJwSirWZ0alYPdk59SG5zcptY3Oe4J1YBsA=;
        b=RcHAwkxlwtxlGI5GFOMi/WuEtSiOS1rbWuvfFrEr0YYaueLWVuoXQskeLGjphEwYnj
         +3uR6gklQmuXCY3Z/0wrLbO/vA3Yg/0aiBg3de37ZkmDcX8rjmFnJHsFVMNxoR214fjS
         orvIINZQuKmGuC1dOYAWOBqZXNOVsVNAYAbYk1zioUOK1E6nMhpa3OEyeKf3GA65I44x
         rL7TogkIZeuyIM7HGssu4JJb80kZgp0Ofu1fTndXLEfNaG1MekNkOLyXyeFN7mCRnAsU
         15rufR0Z3RFNd/eM1LC1tDwxAcomVLrE6KruOEZzW7qysmy1fN0aUeP8yozDM5hROp32
         mxDA==
X-Gm-Message-State: ABy/qLadQ6bANM7obfMzRwRUB4RaXRmMtWaBclkk72Ju/yv/I0HxuaVL
	QGxGb3Z/4zkr0+zypBkpagHF2cFz/Q2tPmH/YLI=
X-Google-Smtp-Source: APBJJlH3J76lZsDW2jZ9W3dwKrIRKUUf+s18Ex9612ejS8DOQ+Y0840eiWbD6tinSwlyWMY+SlWcl20+0Nf4tVxtgG4=
X-Received: by 2002:a25:4d0b:0:b0:d09:34f4:6693 with SMTP id
 a11-20020a254d0b000000b00d0934f46693mr12422385ybb.25.1690998185838; Wed, 02
 Aug 2023 10:43:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230520231701.46008-1-yakoyoku@gmail.com>
In-Reply-To: <20230520231701.46008-1-yakoyoku@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Aug 2023 19:42:54 +0200
Message-ID: <CANiq72n=O2ED-8+nJD-f=eBjn_3EFx2oESzGrucuxU1tF81RjA@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: read cfgs from Makefile for rust-analyzer
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, May 21, 2023 at 1:17=E2=80=AFAM Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
>
> Both `core` and `alloc` had their `cfgs` missing in `rust-project.json`,
> to remedy this `generate_rust_analyzer.py` scans the Makefile from
> inside the `rust` directory for them to be added to a dictionary that
> each key corresponds to a crate and each value, to an array of `cfgs`.
>
> Signed-off-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>

This is a much better approach than reading the `Makefile`, thanks! It
works on my side.

The commit message is outdated, though: we are not reading from the
`Makefile` anymore in v2. What about something like...

    scripts: generate_rust_analyzer: provide `cfg`s for `core` and `alloc`

    Both `core` and `alloc` have their `cfgs` (such as `no_rc`) missing
    in `rust-project.json`.

    To remedy this, pass the flags to `generate_rust_analyzer.py` for
    them to be added to a dictionary where each key corresponds to
    a crate and each value to a list of `cfg`s. The dictionary is then
    used to pass the `cfg`s to each crate in the generated file (for
    `core` and `alloc` only).

Also we have Vinay's patch on `rust-next`, which conflicts a bit, so
if you can please send a quick v3 with the commit message fixed and
rebase on top of it, it would be great.

Thanks!

Cheers,
Miguel
