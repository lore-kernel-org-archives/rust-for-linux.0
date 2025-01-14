Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906221ADC84
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jan 2025 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848960; cv=none; b=iiHKPjE9ZeQn3/+XE/Ylq6SCLeDIeddzNFLsfwhpfpjFSqPMsI29HgtnQKTnvj3xX/6N9fttXvQ/bKl49BAlSjYveMsMhk6SwQGcm8VOy/qiVGIa5+WjD+tnwnpumoaMn3VUgqgnyjnSkoZpyj3Pac58BvkjTMPRsQfFMd+Gu2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848960; c=relaxed/simple;
	bh=rzrq47YYXSkQJ9utKcLYFbYgc2e3YH5q1tXBGESkApE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sX5tC2oWLUj0UOkdILUODXHgEdhiZAQuOH2sXShdwLeLVWp4kit8TmwZaCXpwTPFRuYQPAwIA32PPZYnAzo9w0vNE+z8pQXveqld0Zynz0s9gGOazT3xpmImJh7DGayMcUq4hfv8n9Hko/1ubBSYwZtF76aFoHUV2/W7xG4uBqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tXgSVWar; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tXgSVWar"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436202dd730so37417205e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jan 2025 02:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736848957; x=1737453757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hAnPM4gNIGuB4WE/pw1j86p4Zb/k88JNNK4kLdk5f8=;
        b=tXgSVWarkamr32FPFw9k5f8VZxJd2smeSmy/7CqPUuH+f3bLAjnuJcMlkghpofMpze
         0oEJwD/7LGPoehgLLlVayd1vLLArVAeWabCwo72jtkRWR9syv85XdIThZhhA7uOclcEE
         Y82g6ti2ClOD4nFrc3htfrbu1gAqwXgvtMNOuydpROzDs6Joo5UUjQPTzL8pACr+B9bj
         PBYDlaytYRxNGm22TVJXr1yifAQaYoJMkNQ/YL0AHy20+oYYWLq3SDjzHxAwcrP/WPSc
         pTjT1/g7Ccb8ngwZeMdJFaqCUhQKeNMeD14m44dBE6gimAMLMEADBaJhDN5Y6xQGhoUe
         no/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848957; x=1737453757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hAnPM4gNIGuB4WE/pw1j86p4Zb/k88JNNK4kLdk5f8=;
        b=Uuiyp+hFMMdHVEXpvZQjGUpKtEKDpDsatEGnpOgc4bDSpRE1jPwZMzjGbB9IHdM/S2
         hy6jjetJh7+1aSaUqwy24kAEi2otu44L/YG/F6R8iBy2gr4KvAJ72hk1QZSEo1LvD5eU
         X251MEbJr8wmNZogh+hlcCBnIo66vy9rr75wD1d7BRGWkj2mdf8zXvgfRCRkEAJ3+H6F
         PgCD+93ZzGJsNW9HjPAcwQ73pkDxRn+2iOQFSVrnS43vypOfE6ZpczGYsJoXity9DoQA
         wYZLWyTF5D/Ky96hxnWOIYPCbODxroGnIhda0BpKoCPoCCIf/RvoQl/bngz8JIxjE6Dj
         sJ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNj1SDspWxv0ALvKqK7TTbNR1WkjdvpbGA2zHZB0ERV1VZRIxOasuoa6y9iQZ77xTByVXGs94CHTn/j98BTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF8QjisL4w/uP1Ls4kFlSIaafR4m+GSuhtW6Yy9V6SiMU+JInw
	LkHD84d3heNTehvgI/67UetHewzAE1S3Eq/NTA3bbDm0/9Ddh9EpHFmtH6W9y98oWkVvXy16wLK
	AE3BGE6TY/xVZj5Joj85dQViz2NVHVohnnijA
X-Gm-Gg: ASbGncvW5va9xriAdijXrulNkcbuvgeJJGkllQCoqLiv9L7E9WizyONyawLeJxs2LN3
	cyUofAyNy3aumoxrluVKQjyechtfguc/1GF7yI5EmG3i7ILckZDM7Ta+XRvBwkKlifMCW
X-Google-Smtp-Source: AGHT+IF3daPtVTmXioen3B3cUV8DgIHpdvif6E24QUjslo4B9aDd8h9rplJmNv2owOFcVEGAmWecHD0HjBkwLigFuxM=
X-Received: by 2002:a05:6000:1a8c:b0:38a:4b8b:c57a with SMTP id
 ffacd0b85a97d-38a87336f7amr24250979f8f.44.1736848956759; Tue, 14 Jan 2025
 02:02:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241221183024.3929500-1-gary@garyguo.net> <20241221183024.3929500-3-gary@garyguo.net>
In-Reply-To: <20241221183024.3929500-3-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 14 Jan 2025 11:02:25 +0100
X-Gm-Features: AbW1kvY2OVSyYu-6j1cvxSGAxGrpmxA1gVzSFKxK6Ju2CMAjIcQeVt08kC7sspI
Message-ID: <CAH5fLgjOfw2otu4FJ1XHhjsSx3Fj3iQA25Hh-Anz5jXaLamrAQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: convert `Arc` to use `Refcount`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Wedson Almeida Filho <walmeida@microsoft.com>, 
	Valentin Obst <kernel@valentinobst.de>, Alex Mantel <alexmantel93@mailbox.org>, 
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 21, 2024 at 7:31=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> With `Refcount` type created, `Arc` can use `Refcount` instead of
> calling into FFI directly.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

[...]

> -    pub fn into_unique_or_drop(self) -> Option<Pin<UniqueArc<T>>> {
> +    pub fn into_unique_or_drop(this: Self) -> Option<Pin<UniqueArc<T>>> =
{
>          // We will manually manage the refcount in this method, so we di=
sable the destructor.
> -        let me =3D ManuallyDrop::new(self);
> +        let this =3D ManuallyDrop::new(this);
>          // SAFETY: We own a refcount, so the pointer is still valid.
> -        let refcount =3D unsafe { me.ptr.as_ref() }.refcount.get();
> +        let refcount =3D unsafe { &this.ptr.as_ref().refcount };
>
> -        // If the refcount reaches a non-zero value, then we have destro=
yed this `Arc` and will
> -        // return without further touching the `Arc`. If the refcount re=
aches zero, then there are
> -        // no other arcs, and we can create a `UniqueArc`.
> -        //
> -        // SAFETY: We own a refcount, so the pointer is not dangling.
> -        let is_zero =3D unsafe { bindings::refcount_dec_and_test(refcoun=
t) };
> +        if !refcount.dec_not_one() {

This is wrong. The into_unique_or_drop function must establish an
acqrel ordering when a UniqueArc is created, but dec_not_one() does
not do so. You need to use refcount_dec_and_test() instead.

Alice
