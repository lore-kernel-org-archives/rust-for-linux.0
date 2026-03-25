Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EEB3FAE15
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 17:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458661; cv=pass; b=X6KV1NJOIu7XIye9cPEsKN2hwDGFy2xOinZVGEYVg5tZyEaEZ5rC6/VFwQJsAxDE1xikmXkccQxmUaJ5c4OwNE41m2Xs28SUUG6fZFygi0TWaQVyIwX9rX+jM6sXValL14yaWqTYV9NZCRKqvmHjvjLGUvexnkUr7yMIOBhkT8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458661; c=relaxed/simple;
	bh=j+VBEf+0liTbFanA21zz1icnKXsNEwApv9HrJkjmpW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uu8K8q2NPG0m39gEILyDSogD5PsuQilBPwC9jKpwbg37WdjUYrGi/EO03ql2DwFzlroWoO3dHaQ8XEm8D7o/ysAPy1xPSK5sYF3rfDUKjOBnOq1OgnRz/rfH0opGom3acNGz+i89GtXbQuUQ1/iFJs5GVv7Qrt0BhGixKrmYOdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lPL4YcKR; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lPL4YcKR"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66a8242c1d8so599a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 10:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774458656; cv=none;
        d=google.com; s=arc-20240605;
        b=FcjY/HW5VYxebtRKz1GhysW5ZeWvBLvD9UcdFR/zeDkqLu7rttZOiwaMo4GNC7HbOn
         7pbVnL6iyb2twU6xcVD/LWpnEY3TgD4Ywc3QSkCFGEinc/Lieu1w8cIrDpHq5+YWLthM
         z6ZVl63nVc8hH/Wr4DaK/yzQUuhKcR2hR8rxWfhUuBGEVX6f6mhaGYeVeOGXAZVEIp4W
         fWFCmPh/l3Y0X1ToLoeMTIdgAjNdbgAgm4AqxYLaT6C1bhrhuDrqS72zRW7w/h0pDbcA
         uID/nGbmoi6OzMqnCNEmZmJlV3P9eOuPF2oSqitZLE4uiYhvyep4yWhyi65GANxXhuSk
         tbeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j+VBEf+0liTbFanA21zz1icnKXsNEwApv9HrJkjmpW0=;
        fh=lGmE2Ez2fpqn1ZCR1fTKc06KyfQx1HNK1Pd5XlvwNfI=;
        b=jCNh8UPWFGiVs9gFNDVloylkh/LkLWVIx/I3xMqro1PVEXyqayEeVSqJf3WTUgHK1V
         3gxmsD+SqnYk+BIEt4R1yBgUzO9TTU+h3xHa6Ts83X+MmMr5fIIV2rc/xfQkoMEve1Ns
         vduOKknXWD/1FH1jlW5StJRfoC0zw6rUzBYvZ12TKLptRaxYr7VdwXyb8iEGKQHkzjHS
         JTBdTxMvTv2rsphACfoMWJVpJuhBSp33JmjZ6zQ3WC5cs0Sg055FTb4IHP0s9ATlI2//
         +jtaWzq0VS1CNVl0AYFMlxSMuGDc+7emyeOiS7dJENRMBQqlwzh82akc9s2ya2nnh5k8
         j6pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774458656; x=1775063456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+VBEf+0liTbFanA21zz1icnKXsNEwApv9HrJkjmpW0=;
        b=lPL4YcKRVTJnH4qcn+l6H70QLsxVAQUvmN6H76xmfscRknSCZf6uTHRwJY6SuYqd34
         b06LEjWYqyguLIj86Ku7HwUyFJVm0RYgIyGdSPY7CtgPiTk9RN/HMMD1PAyMbpknnasc
         0W/xsxYGOTrwVoshTbNsWPphP7HeFBEKa6VcFkVP/hvHZY+GXHgarU7lelwDex82/OgS
         SmqNEMFGyBHWMn8pPRe+fS3Q7XarFEYUFwORzk6DRwg8mwP5OAaqV65MrCKLSRu1uo6u
         A5NlNtqqZ8LV0pGAOKxHRs2shvskBoGAGtKhF/R2HPOOjGl7V9TzlofgjXfiBOGo02Yc
         8Wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774458656; x=1775063456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j+VBEf+0liTbFanA21zz1icnKXsNEwApv9HrJkjmpW0=;
        b=pDqQmvV5NEj4fJorlT+qNzV+7AsN8S+YeMR8tZN65XrqDZU3ASY9EkZht04uik9Vlp
         P1NVkkC2c2oGzgSxWyWJF75/PoGu80qh11D3mOpPnZ8JYw4hr24qBMHiBRQN6k9r0Wa/
         rJmYEmwnis/Ub1dlWfdw3JgZne1IdNh5F4tfjbnzTUYbDPWU3vldtGpWm6S3K6rkuRbP
         46snzkYZcwccOcILhks+z2ouFJm7JdKZQCjGGa6UqSGYRgvi4dFifdE2elRUZaLTTmGE
         9eJIyjXk6PahRbfh6ZXYaBaim4v7d03La4L6NazDFT7XrcRaAh2g0Kz+BUH1bVtkgQuS
         +Mtw==
X-Forwarded-Encrypted: i=1; AJvYcCWkgRzDxnEqaV7H5MQPklBceIo3hN/UXPuaoa70Dymjv4VQ6rgXWyxvCTX+hn5etT/t9zJAdb7KgC0lcbUPyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGi39bawZ0d9MqxsdaI64qcwFVjhgDMbb+5SI3asoKoTJNYKr3
	HVqjSGXTdULk9OQJoDwDf1MhYCQdcNlTC4gKaCQj4DuY5Y7i/i8mp8URspSME9g3gXHmhD7H0zc
	Yj/w01A2z8nu3E6S9/FHbflf5DwWGvFU2GW5Cl3c5
X-Gm-Gg: ATEYQzzsUj1PW3aFxj5Od9iP5eoGiK6rC/fESGI+0tFkzBL7qYb1QMhCvig7lzbkeIX
	8FTX3dEFSp5dStPfGR/ZjyadlPESSIW6D6NC7PZBufnOg9v4k5rd6aG12GKMgfIpU+BKeN9z6SC
	4/ujf89EEVPWzkc31PkpecQ8t6q2/3TIBB5lS1HAqpUI8owJF+yuLTqImP2Osgb3MboyUFS7u1r
	HaoulMi31awk0BXP9jFRnbzkpZa1a6bTQPbeK88b0hpYRH/X+cB03afGoOQDX/Pl8GM40c3t5+u
	nRlVIwTyY56Z913xtCPu+Q2woOheH9RiXIM=
X-Received: by 2002:a05:6402:1493:b0:662:fa40:a4ab with SMTP id
 4fb4d7f45d1cf-66ad9b6d3c0mr10a12.5.1774458655680; Wed, 25 Mar 2026 10:10:55
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
 <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net> <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
 <DH6QGQDMPLDY.1H3RLPD1X8CGL@garyguo.net> <CAH5fLghkK76Od1AxSH_NgrxOr2pt2XOoVBuLD6ZovzcLoxNwQQ@mail.gmail.com>
 <DH6ZUW2WRTNM.3B6SWJS4I3DE4@garyguo.net> <20260319235443.GB769346@ax162> <DH7XVDAUF5JT.2U3SPHXDFH8PS@garyguo.net>
In-Reply-To: <DH7XVDAUF5JT.2U3SPHXDFH8PS@garyguo.net>
From: Rong Xu <xur@google.com>
Date: Wed, 25 Mar 2026 17:10:42 +0000
X-Gm-Features: AQROBzB3MBD57ReM7Vot3B9es8jWLO08WJJ045zX_uTQmHQ7XmKgC3cZWPHLi6o
Message-ID: <CAF1bQ=QX5p8OObpZkV9f=y1i-S7Snvsu2HH8gQK9RD=eBiakCA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add AutoFDO support
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have reviewed this patch and it looks good to me. I suggest updating
autofdo.rst to explicitly mention support for Rust.

Regarding the naming convention, I understand Gary's point that Clang
and Rust should both be viewed as LLVM frontends. I am open to
renaming *FLAGS_AUTOFDO_CLANG to *FLAGS_AUTOFDO_LLVM. However, I would
prefer not to use *FLAGS_AUTOFDO, as GCC also supports AutoFDO, but it
hasn't been integrated into kernel builds yet.

These naming updates can be handled in a separate patch.

Reviewed-by: Rong Xu <xur@google.com>

-Rong

On Fri, Mar 20, 2026 at 9:48=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Mar 19, 2026 at 11:54 PM GMT, Nathan Chancellor wrote:
> > On Thu, Mar 19, 2026 at 07:09:22PM +0000, Gary Guo wrote:
> >> On Thu Mar 19, 2026 at 4:33 PM GMT, Alice Ryhl wrote:
> >> > On Thu, Mar 19, 2026 at 12:47=E2=80=AFPM Gary Guo <gary@garyguo.net>=
 wrote:
> >> >> On Thu Mar 19, 2026 at 11:44 AM GMT, Alice Ryhl wrote:
> >> >> > Do you think it's worth having Rust not match the CFLAGS here?
> >> >> >
> >> >>
> >> >> I think the C flags should probably be renamed AUTOFDO_LLVM too. Af=
ter call, all
> >> >> the perf tools involved here are called llvm-foobar as well.
> >> >
> >> > But isn't it just called this because the config option is
> >> > CONFIG_AUTOFDO_CLANG? So it's the CFLAGS or RUSTFLAGS related to tha=
t
> >> > particular config option. It may make sense to rename
> >> > CONFIG_AUTOFDO_CLANG to CONFIG_AUTOFDO, but that's out-of-scope for
> >> > this change, in my opinion.
> >>
> >> I get that it's an existing config name, but previously it is a correc=
t
> >> description, while after this change it is no longer accurate.
> >>
> >> I don't know if there's an established practice on renaming CONFIG opt=
ions when
> >> this sort thing happens though. Perhaps one way is to have add
> >> CONFIG_AUTOFDO_CLANG that selects CONFIG_AUTOFDO.
> >
> > As Miguel mentioned, there is the transitional keyword for Kconfig to
> > handle renames now but I would really like there to be a compelling
> > reason for the rename other than LLVM is a little more accurate than
> > CLANG. The kernel has never really done a great job of referring to
> > Clang when it means the C compiler vs. the whole LLVM toolchain (like
> > LTO_CLANG and all its derivatives should be LTO_LLVM since it requires
> > ld.lld, llvm-nm, and llvm-ar in addition to clang). Additionally, aside
> > from the configuration, there is the user facing Make variable
> > CLANG_AUTOFDO_PROFILE that would presumably need to be changed for
> > consistency.
>
> If you think the config name should be kept as CONFIG_AUTOFDO_CLANG, then=
 I
> think there is no real benefit in changing the variable name.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
>
> Best,
> Gary
