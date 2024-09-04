Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA99C1CCEF2
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Sep 2024 10:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725444937; cv=none; b=M7fYPOEYGKLQlWeqPx8exDqdJgs9eL0d5+aE1va1t/NACwFsVY+gE69zajLJL3vG4tgKf0QPwMiqvTlNQZnwl5s0joEpX35i+RzMYOqvsMfgHgcfx+gCxR7v12W/VksRFb/RfpGfXklCKteYCeWPnaeKPcRfiYV7GNGsVXFHMxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725444937; c=relaxed/simple;
	bh=wMRgd+zwB0aXoTGxwXzh3t2qA3Lqhwut8iVdWmvlx8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KulnlSgqgqIjPd5IwiTETGZkAdgn1mBAUF8sOk/Q4peVKLgRofnKnTC+9HMX3AQW7Zbzl4pcNHlPXn7C8aNTc78+aTNpNw6rboMHV2C3q3nlAJwxiiaFQMAz0Fq9tCZfF9DaG/JCTq2Fb427v9Qu/0cFy9GcbixbBgE8usEQt6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=quOWyWhm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="quOWyWhm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42bb8cf8abeso51370735e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Sep 2024 03:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725444934; x=1726049734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpjVKN5cWQhj45jb1EGlvgKVJ/zrno7xEZ0+EzIrPcA=;
        b=quOWyWhmGBln/H0u2I6G6WBgqWiWlNoGxPRjIh1VqjR7ubNhHDhWbfECy3+F8ckrPG
         pFsIyvelG5xI5QG3Bo9O/iJeOdtClhKXQDoi2/ZsO+175ip19rfyClRfWqNWGAklQsmg
         O9i1jObq+/mS0RXsnCQNPPnSPDWNsOyOi5gduumIC/PxXkWGdb7nXo3i1dln+3M4IfjC
         F9/QBUYwNrcFl/0XiCHhttItnZz5PJgdMI52+GuGVM8JqxK47SLgsMdC+EGJtMQxkgwE
         qq2RviTRkf4BNYF4qO8tnDVshwCcA9cAvUJmba+O9QHSCFCK9kPh9gI5UUWof3SAqpZT
         XplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725444934; x=1726049734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpjVKN5cWQhj45jb1EGlvgKVJ/zrno7xEZ0+EzIrPcA=;
        b=TNpNXEDKtHqWs3MpAFMxIhdhhSS13e8AkvcJTAYxtT0mHs9Xyf9b13FRtVlB1YRdc9
         sAdySkpvldTIFqnJHv9HEs1o0n2fInzAWe1WcpVQo/7SFtfsIvUX3ZdlnoEkDAikCOOW
         ingaqJ+/cTLEEsZtGkXQGTB4SSUdemKcyn+VMc/6QEwVdLVEElD/Q83/qTZQsmT/IQTs
         tNm+fm5H/y0FGZOhln7UUQgNpstzWugwu7tt5RgxIj2K/uSGPg2TmkSy5lb3Zcpv9wI3
         vx3qf94YSm4WmWqTOwt6Atvq7HlIoLUvnaYQc1Dx4ngiWxXmVMMFYcR64YUU55sh2H3T
         LXOA==
X-Forwarded-Encrypted: i=1; AJvYcCUFFaN++sKQSF7LaA65wDSbSShpVJTa8G8X4SQsIMOcQZ4Sn+qSXuff73/EjoAw78iEcpqfbaqDJnxjabetKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+x2pgllALCaHvScm87PY0nd8K2ebcRq+pFFO6cYyrjLmZWQRm
	7xR9AhW3XgJiSEJ2bJucN5zj3RSItm13w5A9+nQbWQML6EqGv6f2lD8+TGR2KAJIcSk+Mn1AVBL
	w9hSDOeF8TfXWNLkYtPEUsR9EgGsliM3Wbh8D
X-Google-Smtp-Source: AGHT+IFvgcolurGoupUJmeWy+d85GiYNEpCVqFra1ZIgUnTNUb7A0YTAJ4BFYzV8MAI5ROTmbcvMlPgqAZlqbhn09Pk=
X-Received: by 2002:a05:600c:3509:b0:426:62c5:473e with SMTP id
 5b1f17b1804b1-42c8de9deb8mr25799725e9.26.1725444933762; Wed, 04 Sep 2024
 03:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240816001216.26575-1-dakr@kernel.org> <20240816001216.26575-27-dakr@kernel.org>
 <20240831135712.0d7366b6.gary@garyguo.net> <Ztb6_XW3ccnHQDmw@pollux>
In-Reply-To: <Ztb6_XW3ccnHQDmw@pollux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 4 Sep 2024 12:15:21 +0200
Message-ID: <CAH5fLgjbnGstjzsudjavzt5+UwK_r8n8X3LPdw29QSkBzaygxQ@mail.gmail.com>
Subject: Re: [PATCH v6 26/26] MAINTAINERS: add entry for the Rust `alloc` module
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 2:03=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Sat, Aug 31, 2024 at 01:57:12PM +0100, Gary Guo wrote:
> > On Fri, 16 Aug 2024 02:11:08 +0200
> > Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > > Add maintainers entry for the Rust `alloc` module.
> > >
> > > Currently, this includes the `Allocator` API itself, `Allocator`
> > > implementations, such as `Kmalloc` or `Vmalloc`, as well as the kerne=
l's
> > > implementation of the primary memory allocation data structures, `Box=
`
> > > and `Vec`.
> > >
> > > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > > ---
> > >  MAINTAINERS | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 42decde38320..560516b3aaf4 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -19925,6 +19925,13 @@ F: scripts/*rust*
> > >  F: tools/testing/selftests/rust/
> > >  K: \b(?i:rust)\b
> > >
> > > +RUST [ALLOC]
> > > +M: Danilo Krummrich <dakr@kernel.org>
> > > +L: rust-for-linux@vger.kernel.org
> > > +S: Maintained
> > > +F: rust/kernel/alloc.rs
> > > +F: rust/kernel/alloc/
> >
> > It feels like we should use `mod.rs`.
>
> The same would be true for:
>
> - rust/kernel/sync.rs
> - rust/kernel/net.rs
> - rust/kernel/init.rs
> - rust/kernel/fs.rs
> - ...
>
> Do you propose to change it for all of them?

I do actually think `mod.rs` is superior in general, but it's probably
not worth changing it right now.

Alice
