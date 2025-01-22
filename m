Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054521F7572
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 09:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737536994; cv=none; b=IM0LFWOXBep1JzgqkkfmzT+VuW/b4rqs4QBU32khID6P7DDwaGT1teWFMO24e59REsII10s1Wv0QgZRH1yMvoYpwWKGLHjd2DrKtvC7xTpZ4fC7esY/UlQtaI2FKkdyzWcky0Lf2pfdelAHDLO7hTR6/og635Vxdyt5LvT6Q/EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737536994; c=relaxed/simple;
	bh=2WAv1fZWi6FSo+sNAeuewqpsZCPg9rKwCFH+MiQwAa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c6dQ7CkvWR6BQh8FphvXkAn+kvuJ46X8xr+Gg28zt7d9GVboqF2ojK4+OXO4SDlQG99qtZf4VdI6BnidjLlTjc0YNl1dCLglHVM1w9Dy7jPXJoYAbs1h9eM0I6cZrKWdCiDvbGtvqrcB1GZXGg63LLjx9LoS2KAa3/gf4Keriog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GvJ8v8B+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GvJ8v8B+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e27c75f4so5490067f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 01:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737536990; x=1738141790; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAtNzABgivJyMHl67AxVlrKNNT4N7NGsuX2tPsVc4oE=;
        b=GvJ8v8B+KVs9l2arSL40JghPq9t1jPA7ud7MweEn2X1a4Ygmul6MbAJMLEN1hp+v8Z
         lbJm5DyMzzlLkZ0f9bn2ioz5Hm85rYfuupCjLY40MEDlFSGeKC/X9yMk+pYiVXXjoTrO
         hX12mG/Sdh/4dRV6ZbrudUa+4OiSc2KnuOlMY4jWC8Wh9egEYZ2f56ngBuLIJ2o41c4j
         6rcVlmZa609wsqxlkF24mAMD+QISv03nj8XfBgmuNcnVinkzsSwYa+3djo5CIe1ZMGkx
         gAIXJQ6VghWq6sh1dTho2TOK/VWoFtmZv9TI20pNYTgWYHlEymIA8V663JXp+g67q36L
         JYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737536990; x=1738141790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAtNzABgivJyMHl67AxVlrKNNT4N7NGsuX2tPsVc4oE=;
        b=dhKCjEgx5aasEhDDrJWpJqgq0bVDcNulTC3YLFSY1+fRVlvpPUdA59RLFpEuBSNaMd
         R3wqbSIgJzOWFKi0JIAhCXkn4Q8QHXNk+fD8VuYv6Ux/J8U3md6d4+yYUZbGg1jTiY/j
         G2LJsW9WopV5m35Q9Jhy8VFQs7CGgy8NDoWJoHJEUUa0rkuotc4MguX+iPxBDshdEWR9
         MykGIBSZFS39AThtzG8axdhLs2B0BVjQiT5jjlEZo5TlvUiZYOkghuzXn1HiqRUFZ/BO
         4Ywr/Z5Wy5PpPlUQAbcEnqCXt+5XCkfFbX2w29eAj5KStNSmplHe4F5m92z33bPSzK4v
         YdWA==
X-Forwarded-Encrypted: i=1; AJvYcCXTXQVWXOXQQvLFSzTQgaWQHdNTtBJsligUjgXhKcT2xaIA1IVXX0po/7F5N9nW8AwXxmANWw/yIXT9lXjHbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZOMW8b/tYmz3kJ9vxzmcNzOWulA9zROERkGFdbCjuB25bSiZD
	LpXQDFojzMheM0axOfwd8tnZNuqyFhwN1tPfvkI+SJv4fJkxRaqIoviTDvPBx6qofAyipf1xV2t
	xl+yQ2fmxmUvNaJU3+nGNomwp6P6Ld3pmFCNW
X-Gm-Gg: ASbGnctHIcSaQ2WIlXZAgr9zaJdHs/j2O/eo3m966v9uXZlaerKIdL0o+ohwuzQW8NA
	h9G16BQoJvoL6NDZ8hazjo/DigCoZRT1163os+yNPhR4SxLlwvSerT0UIMUuMKU4OcEbmVpwZID
	wxUVmK
X-Google-Smtp-Source: AGHT+IE8sISUJ0sbUjuJ5vU8uBRJi5Fk4KbIbU8O3jiSMDOjh27QXtxILwzagCqnqCojBFBUcdB3Q2ffYFEPyhRlpFo=
X-Received: by 2002:a5d:6d82:0:b0:388:c61d:43e0 with SMTP id
 ffacd0b85a97d-38bf59ef478mr21993524f8f.48.1737536990282; Wed, 22 Jan 2025
 01:09:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121200934.222075-1-ojeda@kernel.org>
In-Reply-To: <20250121200934.222075-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 22 Jan 2025 10:09:38 +0100
X-Gm-Features: AbW1kvYgEPke0Mm4asQAeuWGL9gs90635G5kOjS1vZYCD4ylQc7U1G4SnIpfKoA
Message-ID: <CAH5fLgizcjPgnQ0WcZ6q-pjzxaJT53cwsFh0r==m6pmnfYObeg@mail.gmail.com>
Subject: Re: [PATCH] rust: init: use explicit ABI to clean warning in future compilers
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 9:10=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.86.0 (currently in nightly, to be released on
> 2025-04-03), the `missing_abi` lint is warn-by-default [1]:
>
>     error: extern declarations without an explicit ABI are deprecated
>         --> rust/doctests_kernel_generated.rs:3158:1
>          |
>     3158 | extern {
>          | ^^^^^^ help: explicitly specify the C ABI: `extern "C"`
>          |
>          =3D note: `-D missing-abi` implied by `-D warnings`
>          =3D help: to override `-D warnings` add `#[allow(missing_abi)]`
>
> Thus clean it up.
>
> Link: https://github.com/rust-lang/rust/pull/132397 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
