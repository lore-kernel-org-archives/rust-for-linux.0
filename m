Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058E3171A5
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Mar 2024 09:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710147848; cv=none; b=QkdF8wNim3Ub2amV91mSvs12SyNBNu7m2j34FzSrt9BVs/ka91XDAChQR7eMnPt7rtOz3BYBfTNspFLu/+5cP7nXSLuNhYm7gzKhjSxT7n7d3oNqaFsmdsAwP1zmTUHW42pfZubMki4S7jnnzzL0kjoghIyvKd4rz0I6Aw+e+fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710147848; c=relaxed/simple;
	bh=YZIvk45Qdwe+WgoeWiUCSU3e5i9+mC93jSqXbug2wgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhGnX4qpEbbo+27DBZrwXER2TM+7P+9hhPBXMEvQWn+xmC/0YrvxEYN6zrYN90L+lE3fmvGTk30xS/WBE0fUmhlibhotXV6qcA0aVfS1mU6ELw0sfA20fc07PLyD09RuWki2hRX264Hc6ss2WQNLh6Sl2LExP6OlRCXalgAf4WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QOxwuDhu; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QOxwuDhu"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-47268589ec9so1971156137.0
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Mar 2024 02:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710147846; x=1710752646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6BaIj82ne96lSVNCUMkWu0rka7gtZJhD+DKobLwFLE=;
        b=QOxwuDhucLDB8NXZdhw0Zh9iLejJHSoZGB98Zz7gAr/FsCaE5zCPCGchhebiazyx4l
         HQ+AGSSUVHw2igVW8Pj+P4ZbM4GTVyvMgd16cmEmlpLvIioTSJ003CrntGkcOWdGMaCo
         gJ7Tt45wulVxHrvF4PT92F41kiz9YRKu1/dVWPImSfJdwZ9YVrf+aJ17m4Kc99SQsAJZ
         ZS/f28mPg5uxG4igMYVfKtaou0v6FjPvf6jEimnZV2mZXLAGs6RrzVx+H+QL8OW2Drne
         QRxjC9QRDZp76KGA6F05MQQYoN69YMEHfyLBCB6mQiYPyBthCGQBMIRSeWz7n+dBu5hO
         seig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710147846; x=1710752646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6BaIj82ne96lSVNCUMkWu0rka7gtZJhD+DKobLwFLE=;
        b=rVo9EJ9xW/zR0ll9+Sece3AhP4RAdsKy4eXrCf4vj2Doig2bGRQnml/DqafaD0LIDX
         rl7yfR6wkmPI34W9wTjY8mKpWKCh61D1c6+OvxcoyVfREEw80zYysqlaWNGwzmTuk9MM
         1hrwa9R4U6+k8Yc1poEeH+S1eyoDewTZqGAQBjRWI7IQ1e9RyvRZKyKHNxc+7LBVqRyp
         TcLBqJTS1GbJ7xdFwy1+RYC6TxK/p24/R2lkROyb/2mzFcbUVpSm5cTl+3THmBF+aqMI
         44QEK/bdfODoyccaVVx9mu/Hu7YQm6zBZqqLjwrncJtSuBSbRno98378XnHIPkn2Sq8i
         rEvg==
X-Forwarded-Encrypted: i=1; AJvYcCWIUGAmR7l1ydmDcKHojpoS8Rs1gCP2Bxn2wxTmDJfJB6HorjUg+zO6l19NZu9ek3KAthO0YLNdFkURVMmtbTjVOQeZn2F/Yfyo41MaL/g=
X-Gm-Message-State: AOJu0Yx4tMhsVX/d/6UvtYEPfhldYjU1Smn4bCM8YLLbTKAnWMxc70uS
	OYw/flJ7zEymzD0uuoeSzHONjUGO+mfJpKov7dLLZYfuS+zTxS661CLJjll7K9tbp/8s41LnOsW
	mYciKoq9jPv7aDFOO2aByZ+S8owhw3HlF1oikw3o9e3uDrZ2ogA==
X-Google-Smtp-Source: AGHT+IGDyXcLeuaPrjaudYCASjkgYgdbUsiIhZv89u6VhpK9strLPA7X0y5X6IsmIJ0P7sQ9CtdvUxjjVZ8yX+o79Hc=
X-Received: by 2002:a67:f607:0:b0:472:65bf:9f14 with SMTP id
 k7-20020a67f607000000b0047265bf9f14mr4320102vso.5.1710147845811; Mon, 11 Mar
 2024 02:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-arc-for-list-v2-0-ae93201426b4@google.com>
 <20240228-arc-for-list-v2-2-ae93201426b4@google.com> <d52c5d95-99cd-4bd4-864f-b704299d3b1b@proton.me>
In-Reply-To: <d52c5d95-99cd-4bd4-864f-b704299d3b1b@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 11 Mar 2024 10:03:54 +0100
Message-ID: <CAH5fLggrRANz1GrjEa671Vj0m9=UDeEcGV5vhOxq8XtR6EjUSg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: sync: add `Arc::into_unique_or_drop`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 9, 2024 at 2:02=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> On 2/28/24 14:00, Alice Ryhl wrote:
> > +        // SAFETY: If the refcount reaches a non-zero value, then we h=
ave destroyed this `Arc` and
> > +        // will return without further touching the `Arc`. If the refc=
ount reaches zero, then there
> > +        // are no other arcs, and we can create a `UniqueArc`.
>
> This comment is not explaining why it is safe to call
> `refcount_dec_and_test` on `refcount`.
> It dose however explain what you are going to do, so please keep it, but
> not as a SAFETY comment.

I'll reword.

> > +        let is_zero =3D unsafe { bindings::refcount_dec_and_test(refco=
unt) };
> > +        if is_zero {
> > +            // SAFETY: We have exclusive access to the arc, so we can =
perform unsynchronized
> > +            // accesses to the refcount.
> > +            unsafe { core::ptr::write(refcount, bindings::REFCOUNT_INI=
T(1)) };
> > +
> > +            // SAFETY: We own one refcount, so we can create a `Unique=
Arc`. It needs to be pinned,
> > +            // since an `Arc` is pinned.
>
> The `unsafe` block is only needed due to the `new_unchecked` call, which
> you could avoid by using `.into()`. The `SAFETY` should also be an
> `INVARIANT` comment instead.
>
> > +            unsafe {
> > +                Some(Pin::new_unchecked(UniqueArc {
> > +                    inner: Arc::from_inner(me.ptr),
> > +                }))
> > +            }

The from_inner method is also unsafe.

I think that using new_unchecked here makes more sense. That method is
usually used in the case where something is already pinned, whereas
into() is usually used to pin something that was not previously
pinned.

Alice
