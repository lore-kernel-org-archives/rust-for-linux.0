Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DE413C9C4
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Sep 2024 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725286781; cv=none; b=lSrbypu1KP3IdMOG2ea3y+CayzNbtqxDiCWzoEwarAZpX6Us1H94IT5yKDihSMJ3W0tkEH6/Mwi35q8Pcjq0Q3/XmTV9iXLLJqzgUipCoovDnPXO3jpTqrXr8WAy51LBwpUAD6ZS5nXo/aC/URC71yeF0TK01J50Y7Mzd5covzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725286781; c=relaxed/simple;
	bh=LG0/mepi4Yn4891dLYyQ4cRspvQjvmHTXGUk+m7kvJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=siWrXzPamaPlOMyPrzNxuIQJ6772QTl5PL0tgsMmndrSIYUMnVrfRps/0EvmdgDlOl18g84zyfhKal2k1K5EOzq1Thd/BJTbPeBa+QWd9d46TyEEUCT2GqoueaZtymNHhL8PKhYS2EtDegxBNGl0d7/YFm/e/AKpClz2V7b5QE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ycd+acDj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ycd+acDj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-374ba74e9b6so2105976f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Sep 2024 07:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725286778; x=1725891578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoa/sFhv9aeIIaoHwgF3hcgD0SXOWcDwajU4vAmZvlw=;
        b=Ycd+acDjZ+/z5cHqtdUbFKLU4OxLrDPrf6wJNNdW8Il+fxkI3mUK/CwbyOziJcni6+
         +gIp0TNq4jfAUftw4CuFMH9NvPFPe98TvsGmRy+0edeS755Lln7qy71h7h6K3eBF+Bev
         4/0bqcrSfbjhf5FWBATRhJfdvd1saO9pfFLFM3IendaIHq2uoKgLTNsoAq+ZYE/2x2q6
         ZfGupWNs35BVSR484Kw2Ov08vdrAHGN/dGyz/OadeNdrwyMQ9SwuYkblAw/BrqJbu8UW
         A7VkCGAlAhCX0G084JsWSNtNuZB+nfO2VViGv6n/U4RH8SNTlqoiREsKy2gF869Hm818
         gXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725286778; x=1725891578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoa/sFhv9aeIIaoHwgF3hcgD0SXOWcDwajU4vAmZvlw=;
        b=JXhyRzZaFhqbapl1smRZQS9pZc6bNrFnYP+hGduDnVTW9HH4L9RCqaTnMmc4iYrGVQ
         J508EN1Mr5ktE6NmNa30L8+sHOIbjuaVBmSyrzbqCq1O0clt/R2La0tTkOAC4+7E0s+W
         LNO+yKEuOs7JQCgBLqtrvQ4qVjt1fokpRI0tc8LK9RildicF9e5Qh6eh+i4nBm/XnksN
         EjCdRBDYmk23edhdQnRD6DGaI5HjiY0MIeqtILtEV2ONRapDxF8VZVQl3Xoh1Hc1JTvy
         VZoqpgosfQ73hdmA21moViooHWkyG6tJYpQsHFhI48/LSA8opzuJ7aO0neiEq5k8wrng
         eI/w==
X-Forwarded-Encrypted: i=1; AJvYcCW0qxi1qJw73UXPZmHlGpZmOTb0/uBs1lfafavr0HuXzh3v++zofj9YNkr2R39OmEE4hZZjO/f89v96BtF6TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE2MFSeLKgtgO7AxHryFo99iexGjkjJbDpQY0cwbIM640SNEno
	5t11uCAZU46rkbIYHIGJCyhc2oGf5KqQqIAtaWKAmCNhnyAoIVYUui9WQyeSKshMJcnh6KS8IDX
	FuJ7SxjFnX49D8cs57qwsbnCDdRtuoEjjjYg1
X-Google-Smtp-Source: AGHT+IGxkHEaZH/ZhcBOmeWnhbMJUIKaj6yfOK2C/lu4yJnt27SEIG5s+Si57ntQAuhwDIsQi5J9SQtVTkAUmC9Xpuk=
X-Received: by 2002:a5d:56d1:0:b0:374:bcdc:6257 with SMTP id
 ffacd0b85a97d-374bcdc639amr6440738f8f.54.1725286777254; Mon, 02 Sep 2024
 07:19:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827-static-mutex-v2-1-17fc32b20332@google.com>
 <10453342-d269-4b78-8962-821ef53d3cb5@proton.me> <CAH5fLgh-DYvXobXQVaQ9txYS4Rx8QhjyVvfTphk6vvnUOGzPnw@mail.gmail.com>
 <3b557f61-cead-4568-b2b4-4a56c4cbff52@proton.me> <CAH5fLggE-fWDuZXH_F3ixDSo7sQEFwnUV3cd+9_rpFH+XmnA2Q@mail.gmail.com>
 <CAH5fLgiZt3uVZiU1xXPcvYNR-Em2V3y+-C9EbsqrNvkScbiAYA@mail.gmail.com> <ZtXJGzse8CN30Cp3@Boquns-Mac-mini.local>
In-Reply-To: <ZtXJGzse8CN30Cp3@Boquns-Mac-mini.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 2 Sep 2024 16:19:25 +0200
Message-ID: <CAH5fLgg9ntk4Zn-kBB-XLHaqHz4NXNhrS526HahBG9T2MhUx5Q@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add global lock support
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 4:18=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> wr=
ote:
>
> On Mon, Sep 02, 2024 at 01:42:53PM +0200, Alice Ryhl wrote:
> > On Mon, Sep 2, 2024 at 1:37=E2=80=AFPM Alice Ryhl <aliceryhl@google.com=
> wrote:
> > >
> > > On Fri, Aug 30, 2024 at 3:22=E2=80=AFPM Benno Lossin <benno.lossin@pr=
oton.me> wrote:
> > > >
> > > > On 30.08.24 07:34, Alice Ryhl wrote:
> > > > > On Thu, Aug 29, 2024 at 8:17=E2=80=AFPM Benno Lossin <benno.lossi=
n@proton.me> wrote:
> > > > >>
> > > > >> On 27.08.24 10:41, Alice Ryhl wrote:
> > > > >>> For architectures that don't use all-zeros for the unlocked cas=
e, we
> > > > >>> will most likely have to hard-code the correct representation o=
n the
> > > > >>> Rust side.
> > > > >>
> > > > >> You mean in `unsafe_const_init`?
> > > > >
> > > > > No, I mean we would have `unsafe_const_new` directly set `state` =
to
> > > > > the right value and let `unsafe_const_init` be a no-op.
> > > >
> > > > But how do you set the right value of a list_head? The value will b=
e
> > > > moved.
> > >
> > > Right ... we probably can't get around needing a macro. Can statics
> > > even reference themselves?
> >
> > Looks like they can:
> >
> > use std::ptr::addr_of;
> >
> > struct MyStruct {
> >     ptr: *const MyStruct,
> > }
> >
> > static mut MY_STRUCT: MyStruct =3D MyStruct {
> >     ptr: addr_of!(MY_STRUCT),
>
> I'm guessing you're using nightly or new enough rustc, in the current
> stable (1.80), this would complain using static mut without unsafe:
>
>         https://play.rust-lang.org/?version=3Dstable&mode=3Ddebug&edition=
=3D2021&gist=3D2954daab193caf14d1fb91492dcf325a
>
> , which gets changed recently:
>
>         https://github.com/rust-lang/rust/pull/125834

That's a trivial matter. Adding the unsafe block makes it work on stable.

Alice
