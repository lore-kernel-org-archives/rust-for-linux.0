Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8341A3BB0
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722522342; cv=none; b=nycsBiYyygbP6Izgiic4zujOEO+Bldy2W58JwjMzP0uMa3mxAimM74F8rWM4FZnmYzL0cve+x+bNgk7KQ4JWiovWWIx3poPn0Qd6qcWXjE+ROnPaHzzYBpIk9SHXmjVehZHXKOvKDdUtgpFyiHuhSK3fwRK/1I57SHFVwstWNVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722522342; c=relaxed/simple;
	bh=xZVYm2alWS2dQPPSFg1bSgQYV8gHGRWp6WJy38yv+jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=favix+LKaoaPdMDfn+oW5+2uuowEttx8pBMoQ8OVUyjioSiUvg4iASAx0H8VMdncprlbnQxBZy8aiUby5KJoqu87949n4oU0MK8ymXl/Ya4KllFuhf9+/SHGzdqgQPghGc1ix9cacc3W9XHWPrDl5gBFVATSU90mr1XoLVV/5pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z673j3pC; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z673j3pC"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70d199fb3dfso5888468b3a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 07:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722522340; x=1723127140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMXLyrNv6gAVe2xpU5/FnQfc6WbYmugR7fD/Bg6dOs0=;
        b=z673j3pCSQaybW3F2PCT9olIyRDw+IeX+gDhvgfJKkAVhHhwLyD+2rL7o5kRVKh1aN
         skGKLAMZZu5wHZab5Lw2Ip6bYSqZmrggxwxrbFGWujCZ4BMuScY8OE2zc2Kpy4Cmmsxi
         u+ULXH/RJTAFr9i3Z0fk3QHS/EtgWAahSLriLdareTSJNj4lrtBWX4W8sbos2OkI6x9e
         tqUjQTgNZ/OZ/8xIdP2gtiDff68aRLThkgVATOQaWSVTWHNt+mCLE+//OyTzck7rXwwY
         nYgtBs6V6GmQNEGVIZvfNrboG4lMMMBNpfVJGiVhfrFBy2GDTNObzgHhiR4naHBzFGPk
         mFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722522340; x=1723127140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMXLyrNv6gAVe2xpU5/FnQfc6WbYmugR7fD/Bg6dOs0=;
        b=A5j5ch4SlhZAMzXaxEDuY5lP+mmXbpz6xWWeqcFyw6yBjr2IYyfZXU3PGKwiMbm+fT
         ZxTJStfmljCW7hsaB3/e9li/j5atNVBMQs6sDCD3hpwuHNWCXy0asUnwOXK1ZhhDCQa3
         FzrK575OfSB4XItomi39Pwd1epVAHGovZsX+h1O/zAOQZZdcpfEHsx4j5h0PpHXe5E7J
         0fHbyOMXGb/0rinagrshOpKOXrbxCwUk3WNopCTpre8H5LrO2cgedXySNfBwH89QFXIK
         hBIR7N1a3X1h3+L4Fm95su+zuZWvyj5KbywBLsgoIqYtMheMVE5GmBFt1hGcVZ/jsgJu
         8y8w==
X-Forwarded-Encrypted: i=1; AJvYcCUMQtiQK8iI4lqWIEYW3goQmTz3VJVVCmM83w+dBVlFHpG1lw78T10DCONBf/01jfTHgnIHonHsOs1TTGc08i75stleWPaWU1zFCttlnEI=
X-Gm-Message-State: AOJu0Yw2wRr/MbAJZ1aHe8eOsWf0Sd0Rpxngf2ebMtlrI5doQvUPseLe
	Gyj1bxFhpxLdbuXlarvgg0H1LYLW5SaFsjbzOJ21dUyOwiZMVCRdTiy5+ypG6cy6T2PIua7HZgG
	ogFbiYO1c4AUm1GwxRdvB+vIa7qh3b4urTWlH
X-Google-Smtp-Source: AGHT+IHWwdfCXSbrbEMMYZ1PpRprRVKf1JZMNsbSZ4PVV1VmDOudXf9Ktyc7oZ26GiiZCb3/7NGUglVGUheZkdgmYcw=
X-Received: by 2002:a17:90a:f02:b0:2cd:ba3e:38a5 with SMTP id
 98e67ed59e1d1-2cff9469006mr410991a91.21.1722522339636; Thu, 01 Aug 2024
 07:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801000641.1882-1-dakr@kernel.org> <20240801000641.1882-2-dakr@kernel.org>
 <CAH5fLgj5xf4QdDU7yWrqUjcmJw4Rqe0-UzesHLhfQRvPqAv8eA@mail.gmail.com> <Zqt_BuyoUk12m61Q@pollux>
In-Reply-To: <Zqt_BuyoUk12m61Q@pollux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 16:25:25 +0200
Message-ID: <CAH5fLgiSjwZetUm5WW9cjM8gTsCXPMB3byzKgvMRt-o_n24YKg@mail.gmail.com>
Subject: Re: [PATCH v3 01/25] rust: alloc: add `Allocator` trait
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 2:27=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Thu, Aug 01, 2024 at 10:19:41AM +0200, Alice Ryhl wrote:
> > On Thu, Aug 1, 2024 at 2:07=E2=80=AFAM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> > > +    /// Free an existing memory allocation.
> > > +    ///
> > > +    /// # Safety
> > > +    ///
> > > +    /// `ptr` must point to an existing and valid memory allocation =
created by this `Allocator`
> > > +    /// instance.
> > > +    unsafe fn free(ptr: NonNull<u8>) {
> > > +        // SAFETY: `ptr` is guaranteed to be previously allocated wi=
th this `Allocator` or NULL.
> > > +        // Calling `realloc` with a buffer size of zero, frees the b=
uffer `ptr` points to.
> > > +        let _ =3D unsafe { Self::realloc(Some(ptr), Layout::new::<()=
>(), Flags(0)) };
> > > +    }
> >
> > At the very least, the provided implementation of `free` changes the
> > alignment when it calls `realloc`.
>
> Yes, I think that's fine though. Hopefully no one attempts to use the mem=
ory
> anymore once `free` is being called.

Sure, but if you require the alignment to remain constant throughout
calls to realloc, then you have to word it in a way that allows a
different alignment when the new size is zero.

Alice
