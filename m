Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853CC193070
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Sep 2024 08:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725523801; cv=none; b=X/7HI40MSgdtDNI6rrqXTK+G+sr7kM3JEPafX2Y0ArSr8gQd30+Ht9YHC3qTsDOF6aQGqPDMDcsZk+t8os7d1R6FH09yy6rH9MuDUXBlaxXHZDIXBmtYIbumvhE1+H/1kmifT//Y+Vy+qZfKINFLv8+a181ubjakoOO03HoGJ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725523801; c=relaxed/simple;
	bh=tySEusZ4FVsvRHMC8dzgnyRnOLSB1ruPGBu0iAoTrG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=odqcFQsRUaxtdx1Em0foDutTvP10nZVsMz7Xz7ZflTciVaPjrBYpuXVKwgHOtX3mw9gnQH+hO8hRajqIyNv1dXzMylE/XUMR6152Mn8Eyj7ZmHCfZNAEcH++RSwqG1NtqfwR152FRVGKuKljXTSGIGPzii0uX+k6mHxR7LFcHXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NiFipsIJ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NiFipsIJ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-374c4d4f219so300579f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Sep 2024 01:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725523798; x=1726128598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6n/3Nx3QiIN/O2j0qCpOzIrPKFXDE9gLIjro9H442WQ=;
        b=NiFipsIJD+IQv0J7h0WoIgxlCxIabSIIJWGsfY3ummX+IzcDCJbwTSWdlSNgFaHEEQ
         T7wrLc27s6XMiF/UNAoQQ+BICzCehWTxqmeCaLklvP4t7NKRtwgyB/JAUW+Q4Ipuoz2O
         KqH55wQiR1X/tzSGCjduuSK1n+S3yaheLS7xY/DdFALYXmwR8+TJ2d56AKsiS6K6GsGn
         xeaN4m16ix8Mul0+1icYMyoqOE7lDjjI0N7DkDBtn7u3pbsmRkp0oOv1AfuZOTIG20m0
         POKi3WUwJrc/8WS4fbgt6Nn/f9niAAnVvrQP7xSt38LpD9u3bk4TjOL8/K9qlSvwWi+L
         Saaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725523798; x=1726128598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6n/3Nx3QiIN/O2j0qCpOzIrPKFXDE9gLIjro9H442WQ=;
        b=JyG/3kiq+gC7qEu3HEyI0qoQzS021g5umq7UythMgf1q3VJrbHegZkotV5fzVtS0nO
         gOyPGgZ7s1QKo1tw2P4XEj+hacYtVydLWxam2IxRErx1g619djBKnnh4rk83ZkyVAo0O
         D9nVJa4e24FUT0ISqzBBgJnI0T9/kWsW2wdIJ7rD1qIo+ila9CqDTdNCPKs+aYqJ43sD
         hPMQIYWVlwWEmJ1e0Zff7rK0qU6971UELLRndDU1ysrK1b1UdFjb1MB3GsGhY1CuaL0Y
         VqhoaQK+FMF221xpa4gNin4zSHFTDoL1aTI+qDgZRnFLTRssmzwra2v8HepDXCuw63GA
         2ofA==
X-Forwarded-Encrypted: i=1; AJvYcCXCiygwVbQMyBjenl16Jq4pyyTwn9CGhjW4YiTxjzFhCn1ZC1Q6qkoI1eeUcNxHpIDwd91F5ufGLdTwfEEbzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZWTySnw69gGsKKzoViyQJfcJ2hnWOvwQjbNciC/wWZF3ODCTV
	iDPgTJ40sEbpoz53jgWd7Isib+8g8A+nCwbqqPrQ9Yx/TIEljMpYmFWks5G2KRu47lA/byT3C9c
	EUQ/aSRWOh3eVOEWdKinUkdmI46SNEAqj1X53
X-Google-Smtp-Source: AGHT+IFD+VhaVe30caoIouMe2WUcx/xOWXVjE0LRfp5/b0qYljHoevwRDg/MOcmEHwV7hYCpWSrPr1zFvGm/2eAJAlE=
X-Received: by 2002:a05:6000:2c8:b0:374:ccb0:66c7 with SMTP id
 ffacd0b85a97d-374ecc8f350mr8137862f8f.16.1725523797494; Thu, 05 Sep 2024
 01:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-9-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-9-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 5 Sep 2024 10:09:45 +0200
Message-ID: <CAH5fLgheU9ZSZzRF3RzG3AvW_h1E+UVb-PG9d3VnDUDjfLSoLQ@mail.gmail.com>
Subject: Re: [PATCH 08/19] rust: enable `rustdoc::unescaped_backticks` lint
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 10:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> In Rust 1.71.0, `rustdoc` added the `unescaped_backticks` lint, which
> detects what are typically typos in Markdown formatting regarding inline
> code [1], e.g. from the Rust standard library:
>
>     /// ... to `deref`/`deref_mut`` must ...
>
>     /// ... use [`from_mut`]`. Specifically, ...
>
> It does not seem to have almost any false positives, from the experience
> of enabling it in the Rust standard library [2], which will be checked
> starting with Rust 1.82.0. The maintainers also confirmed it is ready
> to be used.
>
> Thus enable it.
>
> Link: https://doc.rust-lang.org/rustdoc/lints.html#unescaped_backticks [1=
]
> Link: https://github.com/rust-lang/rust/pull/128307 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
