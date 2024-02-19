Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C1325567
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Feb 2024 09:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708333564; cv=none; b=DReHyFwhU8Nl4W9+5EOosImzR+kfTvijezn1yvTpXCcYDI+Fx/T7R4Xn4JZ4ccvG7CX/PptV2aD85gKN4ICFbxt6mE40wO4wNcFYGk+IWY75xQqVAvCmRoEQMmCuot7Gd1miTjWdNynpJyPVPvLHIiPrazMC83ZVHKXwGBDe84w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708333564; c=relaxed/simple;
	bh=xpY3ZmKzm5W53U81GOab3gbPC2jYO9O/nb67la/7GTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2VqoWbzNpyn4Hs/fG5EVZ8+FkMax273V7qRoJsU8+w1p0Ak/AzJlXzAMcOCL0DZoWMqLFusdnNcZlfZHB8a8eqV2oHUVLgp0DxPmUZyC/LdcAvzjSERj85oouBNym0GJ9sY5s9236VeNzIfW3ScKqlmhd0zhPEd2/ySXE/Dgy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ApXLLN4S; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ApXLLN4S"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-7d5bbbe57b9so1909695241.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Feb 2024 01:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708333562; x=1708938362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpY3ZmKzm5W53U81GOab3gbPC2jYO9O/nb67la/7GTs=;
        b=ApXLLN4S3mDbrHTU/U2jLnKEz6wz4Nl/9kO76lpoyykaKLqeJ2QUJgqoTC6+DGqQGC
         F1GRnlNib6EicIrvLa5M/1fAiQr50/GLv24REdNFVOtLkpDxprBVWN6KddkHCqv02Qri
         l9ADWkZM6TEBu1WIVqKHu0tr+NldrFThQgSHPtx5up2m2h6Cfr0gE+gWuoTE6JrgP+N0
         J1kfBiGX7mLVInXiZ1a0JqiQXiMp5FSDRuRI7s4Aj2RDXfanYaWsEZG6273atdAm+0YB
         lHB3qsOErY3qfCaOyKt6HI2Xnr/pXTu5yhDvXFsOKjapm29a+fednO/T4wDT37wMry/w
         dQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708333562; x=1708938362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpY3ZmKzm5W53U81GOab3gbPC2jYO9O/nb67la/7GTs=;
        b=U9Jlj3OVXU32lWzma7JNTB0jQrG9VnMZnwfdbi0/Ksd00MSVBwhZZ0x8Rk4i/yYD8I
         CSklGPXKyD/FGW6HUSXJKW1qH+or1jzvPmBfUmYe19OaMs7leE5eUmFYSR3HC9gBUqrX
         Z+auqf9+ZgKWTQzitsRWOlGBfnxY0yPDIamIlhusrbdWtMC0XJ6ecgNJRdgFLXTBEqpM
         vf3wZk/ejDDDEtC8xHsCeceBv1JFQSvmQewCNwcoCc4Dzhd1dOV6JKPBVc6aoN2/4FEO
         OE3/PmUZqBd5qQnC1XUaoTUc0cOJAuWn5osxYnA/KVGes9UzfKJLqC34DqoOGXoeOIvI
         7ILA==
X-Forwarded-Encrypted: i=1; AJvYcCV31pFK04L+SOdDNIyeSvYbQLbxobLhkOC4tfhguEZEJU/y0/EIEomZ9bfBPuh5HIxC44YZvJ6VjPIwWaXMZIma6VOi/ewAC3HOjygy3KM=
X-Gm-Message-State: AOJu0YzHsMlQVByFC4YX2RAJVlJsE/WElEvDTuPsVXu7myimuEPN5jaD
	vM4GAiayc9SrKOht2Zo+luPxhtio1RlvcIGjC3Z1Ico6UqdS4I8Xf72sHXWI6sh7Errwj8sjfih
	HAfJ2RUA1pq4G8SHDizjMlERG8r9PwGzWio0U
X-Google-Smtp-Source: AGHT+IF1//6y3SGVWkcDFEE9RbhBB+iqv2Qr9EGFFuWkEJX/nlJvEdkBWwNoyAZuDtuFmc9lsVY4W0RoTQFSx7ySmig=
X-Received: by 2002:a67:f3da:0:b0:470:4510:eda8 with SMTP id
 j26-20020a67f3da000000b004704510eda8mr995388vsn.21.1708333561626; Mon, 19 Feb
 2024 01:06:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217002717.57507-1-ojeda@kernel.org>
In-Reply-To: <20240217002717.57507-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 Feb 2024 10:05:50 +0100
Message-ID: <CAH5fLgirUqw2hkEgFKOV4a2N2sW-GAGVY=KkkyzptMN+H2txfQ@mail.gmail.com>
Subject: Re: [PATCH] rust: upgrade to Rust 1.77.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 1:27=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> This is the next upgrade to the Rust toolchain, from 1.76.0 to 1.77.0
> (i.e. the latest) [1].
>
> See the upgrade policy [2] and the comments on the first upgrade in
> commit 3ed03f4da06e ("rust: upgrade to Rust 1.68.2").
>
> # Unstable features
>
> The `offset_of` feature (single-field `offset_of!`) that we were using
> got stabilized in Rust 1.77.0 [3].
>
> Therefore, now the only unstable features allowed to be used outside the
> `kernel` crate is `new_uninit`, though other code to be upstreamed may
> increase the list.
>
> Please see [4] for details.
>
> # Required changes
>
> Rust 1.77.0 merged the `unused_tuple_struct_fields` lint into `dead_code`=
,
> thus upgrading it from `allow` to `warn` [5]. In turn, this makes `rustc`
> complain about the `ThisModule`'s pointer field being never read. Thus
> locally `allow` it for the moment, since we will have users later on
> (e.g. Binder needs a `as_ptr` method [6]).

Maybe you should just add the as_ptr method to ThisModule now? It will
silence the warning, and doesn't trigger a warning of its own since it
is pub.

> # Other changes
>
> Rust 1.77.0 introduces the `--check-cfg` feature [7], for which there
> is a Call for Testing going on [8]. We were requested to test it and
> we found it useful [9] -- we will likely enable it in the future.
>
> # `alloc` upgrade and reviewing

[...]

> Link: https://github.com/rust-lang/rust/blob/stable/RELEASES.md#version-1=
770-2024-03-21 [1]
> Link: https://rust-for-linux.com/rust-version-policy [2]
> Link: https://github.com/rust-lang/rust/pull/118799 [3]
> Link: https://github.com/Rust-for-Linux/linux/issues/2 [4]
> Link: https://github.com/rust-lang/rust/pull/118297 [5]
> Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-2-08=
ba9197f637@google.com/#Z31rust:kernel:lib.rs [6]
> Link: https://doc.rust-lang.org/nightly/unstable-book/compiler-flags/chec=
k-cfg.html [7]
> Link: https://github.com/rust-lang/rfcs/pull/3013#issuecomment-1936648479=
 [8]
> Link: https://github.com/rust-lang/rust/issues/82450#issuecomment-1947462=
977 [9]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
