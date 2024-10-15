Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012891C07DF
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Oct 2024 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728998505; cv=none; b=gFnVc+dIX0RR7vByFujg6ubCIJ4CNMX9f92tzu6ZTNwg3Tul9yDNFH3dpGGlwf20+BU1XZN6IwVm18OiqRqOtpVGbhhOU0pwQmrOe/qz0wadykYNR2qJsZ1muxYsr31jJJhGEvIxQ8tZPxuD/HGkyAQ0hYcMGkBWheFbwm0j32o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728998505; c=relaxed/simple;
	bh=K8j37Y3NeHTSMT2XD/Vi8P46SlNMypsxn4DSZpg+r0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLOSa1QYqy/CSDm0ZeZvoN11ZH9EUHLvH7lwUKQ+e0NmZEnYHBmV3GB6Ler89/wAfQXpDvBP0xq4sJz32Qvfu86zKKbG30TZiKnwHdrDnzAKzArMu93DcsmlmGNGPs1PS1/8Ddhl2Um1l1enoP81urLN72mcaZ314LOzxnO7uMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TS261FeU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TS261FeU"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so3553899f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Oct 2024 06:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728998501; x=1729603301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9n0q1KEeo2CPHzRQUjPiqBunABt8CrDdywKyGxq8L14=;
        b=TS261FeUN1VG7pSP7BIYVxSVv6Y4ErA51QUPWqMIc01UO8R21kaGhBPw/3lApd/GFj
         kM6atMmZO/yXVX3tGk1rCR/Jc6leJ/2xhEziRIZTVV0czsAG+IOToJCbKredoSpft6Yl
         rN5KtXV7xiMytKLfU0xcz4tIIUI+rr3i0xGiw42dgwFPQtpmWX5RM47+BZJGuII/Tco/
         W6vt664WA4YXhDBlP/Ewq+EMhJ7+Zw/iu8ZB5Gp01/qhIo44JUo63qSTOpzrI8nS2h06
         zmh0iwXzcqh+c8Y+6JVO+MNTtdN0MvalYgnDJY6fOLp2VRAz4Pr3IFgMk4TT03TnZVD+
         Bsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728998501; x=1729603301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9n0q1KEeo2CPHzRQUjPiqBunABt8CrDdywKyGxq8L14=;
        b=TiaUyDYn+y/eANO+VON8YwiqIb40ThSHlH1i37H0tqOAiPbxwpINCrcuAvpm/h4j1j
         JQQv3B5zdRqWav3jVa8Fh3/520R8/iIFn7EgxFWVGY90kJCfZ7yu8bQefb1uqV/zAsa+
         oS6iqV+1PQXqkZyLoVgzisT4AvrogpO3aONgeKyrBPwDiNYnE9e4EoCOQJ4jS3lYadPl
         NFuy1KR4GFDj7HfhC+LcWWCQYNRZcMsl4uUqCdrSAUS1ak50MQCEHdAjsF9DrelxqHb6
         StF0X9kIzHKAbPVAtI1oDcNEQVivoORfv3P/OhLRQSD0hEqoxqfQrq1qUMqe2wd6MSEE
         4ZBA==
X-Forwarded-Encrypted: i=1; AJvYcCUesQmiJqZGQhd7Ar/VRcKHLtFr9yguB7/iaMz2CIJbG1wRmS1pWXon+QrxD8+s2tZD2MY7Ih5aOrZH0yGs0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/F3FZ1h9VslmHUaS/3nmZ+FKaInNoFoomd7cmPc65MQ6JvW8o
	Bdu83AKnKKDUVuaUhRshS2pCFY94hdFAURrM1cmrWKvExN7XLlxCwnWCUT9iY4XLuLG5jd67vKW
	uAB+XHy7pjerRRGLjZBu1r51KKlAFSv/ExVV7
X-Google-Smtp-Source: AGHT+IEs4y1lsgZZyZeKndW8H2aOP/taIrYhkxqpBCO265rUvdXSxly/PKF+yBNK4FxQzvpl5te02bSQ+3Szz/EodnM=
X-Received: by 2002:adf:eace:0:b0:37d:5084:b667 with SMTP id
 ffacd0b85a97d-37d86c040b5mr178619f8f.33.1728998501000; Tue, 15 Oct 2024
 06:21:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007202752.3096472-1-abdiel.janulgue@gmail.com>
 <20241007202752.3096472-2-abdiel.janulgue@gmail.com> <065A20A8-EB66-4350-965C-2456841D03A1@kloenk.dev>
In-Reply-To: <065A20A8-EB66-4350-965C-2456841D03A1@kloenk.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 15 Oct 2024 15:21:29 +0200
Message-ID: <CAH5fLgiSt3Lc5+Rmcfg7frsy2y4o9yuj6LLqp6j0oNrzHRZGGA@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: page: replace the page pointer wrapper with Opaque
To: Fiona Behrens <me@kloenk.dev>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, rust-for-linux@vger.kernel.org, 
	dakr@redhat.com, linux-kernel@vger.kernel.org, lyude@redhat.com, 
	airlied@redhat.com, miguel.ojeda.sandonis@gmail.com, boqun.feng@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 1:07=E2=80=AFPM Fiona Behrens <me@kloenk.dev> wrote=
:
>
>
>
> On 7 Oct 2024, at 22:27, Abdiel Janulgue wrote:
>
> > Replace NonNull with Opaque to make it possible to cast to a Page point=
er
> > from a raw struct page pointer.
> >
> > Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> > ---
> >  rust/kernel/page.rs | 19 +++++++++++++------
> >  1 file changed, 13 insertions(+), 6 deletions(-)
> >
> > diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> > index 208a006d587c..08ff09a25223 100644
> > --- a/rust/kernel/page.rs
> > +++ b/rust/kernel/page.rs
> > @@ -8,8 +8,9 @@
> >      error::code::*,
> >      error::Result,
> >      uaccess::UserSliceReader,
> > +    types::Opaque,
> >  };
> > -use core::ptr::{self, NonNull};
> > +use core::ptr::{self};
> >
> >  /// A bitwise shift for the page size.
> >  pub const PAGE_SHIFT: usize =3D bindings::PAGE_SHIFT as usize;
> > @@ -25,8 +26,9 @@
> >  /// # Invariants
> >  ///
> >  /// The pointer is valid, and has ownership over the page.
> > +#[repr(transparent)]
> >  pub struct Page {
> > -    page: NonNull<bindings::page>,
> > +    page: Opaque<bindings::page>,
>
> Still not to sure where to encode pinning in the type api. Looking into t=
he C struct I see a union that sometimes holds a list head, should this the=
n be a pinned thing in this type?

As long as you only hand out immutable references to it, nothing
further is necessary.

Alice
