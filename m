Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3786D17BB7
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Feb 2024 09:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707731816; cv=none; b=eNbxihk6McM2osNmIkA+4D91x2Sg7bpZfBq0cGs+usRNCp5HNljdK6l0L7zNV/Z/BdyrUfoSfvkcMxOJAx6alIJn6+jiY3TTJwAcpTBKbjspoPdUR5FOjO8P0nDTQ89dWDy9cAeqM05brqMJNC5JXX3n1Uqkye7y95ufhSLX1xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707731816; c=relaxed/simple;
	bh=SC/Bvc3Wfc7h52TGzU5tpw8Q+pcsuz6wa67xmHV3x0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUyAsXIiKKKC4QeaGDBT3SvnA4us4XN7XmOGZIMSkt4ku39DuAQkxXXVmgjPGhWMbIDBq4rIarIe7sgLI3daMbTRMCsL+l9/bQQquanMuXyztUjPUVdrxZCHonIOOTCfHysZ9ZQ41C1FLCcF6etg8lm4336L7tgtQAJ1rIMQHLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2rbKER83; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2rbKER83"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4676a37e2c4so559695137.1
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Feb 2024 01:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707731814; x=1708336614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hj/cyHB0z1e1XClr1rbLHnWGhhAbJzVqElu75k2EOnM=;
        b=2rbKER8385ymguatyLRtYsLk5LxiBVCijck8iduZK70Yy8QYobkPTrzJa1+MDp43cG
         f3WsbGrMeutFtzFZxlPW33ohLCNStzrwVa1N6CCYzIzWGL04ktycPMaToARiOUywP7ov
         e97xmP+rTi36/XFyDgooWicteKfxfaOQECUY0MlFUePesqxGuysOKwQr24GtdLNz1XcR
         nkl8kVgO54nmTqR93NroHE8vEC2KgF9B0VZ3AOI9wvL+ruVSVY6q9oSOakKxM25jn40O
         fi73XKShS8NgskzG0aBg1bTVxj5GohR0m5tbaAzNHCNUCjvesb5+Cnp3+OQHZupT3u8G
         5S4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707731814; x=1708336614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hj/cyHB0z1e1XClr1rbLHnWGhhAbJzVqElu75k2EOnM=;
        b=CPQdJZcM0n7WvqyR+3+BGJ4nDoUy40JOABdw7GVJphenZJX2LxiRBWBDfn7as7qXC9
         LJfmMT/WL6ritiXhEFpHHl/D6jJPPqZlT0+lC5ZiM49W6IIPTU8y/HkTobSFsUPI9jh+
         SfuZDUM/PusTPLP43HDjY0h8yvVRa+nsF181JLhkuf0g0Y4e5Oyd49ggDCvenv79PtpK
         NtiYdT2XPRsI2YVmMemwoHsBvecZVymXI0AbDFkqgwLlag29X0GvEx9GbP15bZ4O+gEM
         wvbF6Rag0HJob2uaglzgIXvOpHcbNb1jV0nZ8PYz0x1mRGO9bdFwfBgBUAQKOiNiAZ4H
         5vvg==
X-Forwarded-Encrypted: i=1; AJvYcCWxDvMyIhD1WxxSmeBAzPPIM1DimU1wUfBFSLSvHHj6/O2eGZpUN3EXP1BRQVDR9ytN5P1rA3yWNVDdWUIjdyKiCoDSIZ+9OuGiEOgvayg=
X-Gm-Message-State: AOJu0YzB2b4n22IKIZZ5m3axOs44pnfKFRM2pSO0ISgK49ocWQwyWcuk
	gBfAQZte/1ipiiiOHI2n3SBYpM9tQcztEc7mfvLe6ZPg+fWjL9o6yCZaxrR8l+tEJs41xJtq8fg
	ND/g31BpqOMKcZbHkTc4TvPjhbkTZbP/HhbEG
X-Google-Smtp-Source: AGHT+IHJQ0Fvz7BW4S5y9aj9tYnAjzKiDvJgsFF+HNC4++k9uj8mZsR9yI7DhIqz8n4KChbYUMFYm5PltcVxLbEdcF8=
X-Received: by 2002:a05:6102:394a:b0:46d:370f:9813 with SMTP id
 f10-20020a056102394a00b0046d370f9813mr3841120vsu.18.1707731813990; Mon, 12
 Feb 2024 01:56:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205-b4-rbtree-v1-0-995e3eee38c0@google.com>
 <20240205-b4-rbtree-v1-1-995e3eee38c0@google.com> <CALNs47vgryKctpsP9EV_SsVF8TX8kfwzQ4KCLy9vr5FS_vBq6A@mail.gmail.com>
In-Reply-To: <CALNs47vgryKctpsP9EV_SsVF8TX8kfwzQ4KCLy9vr5FS_vBq6A@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 12 Feb 2024 10:56:43 +0100
Message-ID: <CAH5fLgjP98pS1wsP=YXP5Yr79Y62VF7XPKjbj+G75B3SOFt80g@mail.gmail.com>
Subject: Re: [PATCH 1/6] rust: add `container_of!` macro
To: Trevor Gross <tmgross@umich.edu>
Cc: mattgilbride@google.com, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>, Rob Landley <rob@landley.net>, 
	Davidlohr Bueso <dave@stgolabs.net>, Michel Lespinasse <michel@lespinasse.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 10, 2024 at 9:05=E2=80=AFAM Trevor Gross <tmgross@umich.edu> wr=
ote:
>
> On Mon, Feb 5, 2024 at 9:50=E2=80=AFAM <mattgilbride@google.com> wrote:
> > +macro_rules! container_of {
> > +    ($ptr:expr, $type:ty, $($f:tt)*) =3D> {{
> > +        let ptr =3D $ptr as *const _ as *const u8;
> > +        let offset: usize =3D ::core::mem::offset_of!($type, $($f)*);
>
> `offset_of` will be stable in 1.77 BUT only for a single field [1]. I
> don't know if there are other blockers in the kernel already, but if
> this could be changed to call `offset_of!` recursively then  it will
> work with the stable version.
>
> We might want an `offset_of_many!(a, b, c)` macro somewhere if there
> are other places that need this nesting.
>
> [1]: https://github.com/rust-lang/rust/pull/118799

Rust Binder *does* need that in one place. Creating a nested
offset_of! is kind of tricky, because you have to fail to compile when
you're following a pointer with the Deref trait. I haven't figured out
how to do that yet.

> > +        ptr.sub(offset) as *const $type
>
> Instead of casting to and from `u8`, you should be able to use `byte_sub`

Casting to and from u8 also has the side-effect of making it not work
when the target type is !Sized. Not allowing this might be desirable.

Alice
