Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D271A18FC72
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732525797; cv=none; b=pjvMcK7umG94hiPxlhG2C7V9IAddpforE7vIS9NQvBQdj/Cv4M9qlyHnvwgI2Hu2BokB92fA/9Q9hX2CdszlCapvzcB/U7osI1mwpkffjRhr5+f9Rpl+rz6R8KhN4K4HI29+71iXWlrd14JrLB/alqGLozzL1c5Qq3GqJdZH9bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732525797; c=relaxed/simple;
	bh=+iYj/LXeXfLCayyBoWgVOM4VHVy9tGibHOMx4/PqDv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3+8ihyYLxKYVh/z31p1f0pJoLmQc/n/7fvDfl6SalG/hmWjVUiaQbuRCzlCpGk0z7ULsHlgDl1+vjZBMHNiWhssx1atTE5PnOoXQ4hSHL8ATQWxqZdYVP21g/4fAmxcM7uIlucqdtkp8ni0CfP7//bjsH0zlQg7T8COKGjK2T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wLNpswc6; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wLNpswc6"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-382456c6597so3008336f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 01:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732525794; x=1733130594; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iYj/LXeXfLCayyBoWgVOM4VHVy9tGibHOMx4/PqDv0=;
        b=wLNpswc6TLRa72Gdcjwmz+1mvkzVjYK3fX7Kbic6NhX1xtHXnWnwswD1bU45s8Gn4Y
         8mSeujVvBXL5V7u2RNv/eSwZZzk16qAkBca1RDo3wRVSB0TeUm75SOL8Esst9K1+3z2v
         VyT2I398diIgAuxgtBlvQXSpuYm7oDvdKenYcjBHrmaby5Y74g4vk8t/b9oZmUcIY79l
         hJRUuVPolk5b+6ClJKJReCP+6KnxH/2bkE7OM/sbAQxIWe73//vk0fV8W90Xl3tQeCU9
         uJH4ih4gCCmkUYYTLuL4sEkQZjAWr21SX7PEYmJ+GGEjw6n2czxKj5JIPKtkbhg5S2kf
         kBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732525794; x=1733130594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+iYj/LXeXfLCayyBoWgVOM4VHVy9tGibHOMx4/PqDv0=;
        b=I02ckqajytVSdqStPf6Dai8aFuXfS1E5eF8qfxTWZNKByKIZHnEBbqqe8jL3NK9bM2
         4vtocp4MKDtEirS2eSX5iQWLjt1hlGF100nSSbsOPlQIbaO/jIQlyeH3xI5XI9VkDAE4
         NeeZYNE7U61gMHsxXrnsG1Xi1AUEbqYU1FcDXPoJkon15FQublyYxvnuSvb5gJdZz3o3
         35o1lUgWEKOJIqIAih6ojzCnhHBWNjUt4hvUqMhSHttFmDXEdZJyBWNAZQBb9PWgCe1w
         sH018MWHzu5YzhvuZXj5H/YVRHofWCWjSzokp8/gFnbvPeFg3vLlrDTiIzw6QIK2tTr7
         N+zQ==
X-Forwarded-Encrypted: i=1; AJvYcCULiadZtZ0mXPD6rUH97/DIsm4uhc45A2FMPwTP5VP8aHr4rjDoSEdiSIApVbLKjbrOUhHqPlh6Jx/DJnYd9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxcmrZdAnUejSmeCl5WiAdHNq1r4On5xzCpMtdsISYRIF4s+Ji
	LOsMkuG/QpVB7BGJj2I8Gab1ANN1nYVAzEfdnh5bJjO9ihcEx5FAca6h74jtfU4dLa+jdKGVOuc
	G99mpUYTUGaU1fQtFVRquy1/NTjf8gg8qBeO4
X-Gm-Gg: ASbGncsDcd++6k/t9aCAa1Uk2KarFH7e85OB++B/k1I04QKeQJtfF8OrNI+1ZIzc6Wj
	TzVX1JN1WaVVI4ciBOl86MaHN7QNTBKGIVjtIabEoVnGUFLhtPjSEy33zA3AMew==
X-Google-Smtp-Source: AGHT+IGUuEuCPmk+t9yOajZz2nGezK7YqZW9Qfb/96OWC3HZfQsiSBJ5BzwP+t8u98N6IXgnX1LVesACO+Kn/Ohc0AA=
X-Received: by 2002:a05:6000:1aca:b0:382:3210:4de0 with SMTP id
 ffacd0b85a97d-38260bcba20mr9942093f8f.44.1732525794090; Mon, 25 Nov 2024
 01:09:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123222345.346976-1-ojeda@kernel.org>
In-Reply-To: <20241123222345.346976-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 25 Nov 2024 10:09:42 +0100
Message-ID: <CAH5fLghVxRbiNTVBF=Xh77gGGTF8K+jtgFFSe5HRSS_76GdttQ@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: give Clippy the minimum supported Rust version
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 11:24=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Clippy's lints may avoid emitting a suggestion to use a language or
> library feature that is not supported by the minimum supported version,
> if given by the `msrv` field in the configuration file.
>
> For instance, Clippy should not suggest using `let ... else` in a lint
> if the MSRV did not implement that syntax.
>
> If the MSRV is not provided, Clippy will assume all features are availabl=
e.
>
> Thus enable it with the minimum Rust version the kernel supports.
>
> Note that there is currently a small disadvantage in doing so: since
> we still use unstable features that nevertheless work in the range
> of versions we support (e.g. `#[expect(...)]`), we lose suggestions
> for those. However, over time we will stop using unstable features
> (especially language and library ones) as it is our goal, thus, in the
> end, we will want to have the `msrv` set.
>
> Rust is also considering adding a similar feature in `rustc` too, which
> we should probably enable if it becomes available [2].
>
> Link: https://github.com/rust-lang/rust-clippy/blob/8298da72e7b81fa30c515=
631b40fc4c0845948cb/clippy_utils/src/msrvs.rs#L20 [1]
> Link: https://github.com/rust-lang/compiler-team/issues/772 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
