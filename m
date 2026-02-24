Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1875739C626
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 15:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771946241; cv=none; b=G0ccDl4yLu/9f6dtR3wkGQQBD2kC2Qgn3T9Vjf7G+hQF5QeqH+VtEF8WpdO2FsXMUxMg3fJdPKzBw6QizOCNRhecKlITWWazIt8KaGAAsIuB6J9dreyIoRaLVdMsuJjoPwhC0UT23RGmwQu2VRT5GSTPJbkoT4xXgiK9fuQJskQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771946241; c=relaxed/simple;
	bh=bpTGTozvD3yasSrq4XIec/IuQ7bIWRv4psvjDM1rGY0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EocvpJQXW7XDYDeCRkL2jMxTo/pFM5lueyC9EanBtX9ymuoe8FSLQiKdN41cTL1/mnPLjLTWN6DBEQx26olI9+75iQIPCAzRsaJn8kwHssubyJCbh+XNg67Uo6kfV1t8Hezj/QHrCjVAVhJqZUYxILV0vrc1ds4/Y7GIfah6IjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hxUGMi5a; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hxUGMi5a"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4830e7c6131so52345595e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 07:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771946237; x=1772551037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpTGTozvD3yasSrq4XIec/IuQ7bIWRv4psvjDM1rGY0=;
        b=hxUGMi5aqKDDy6pjXae5Sew+FIKjn9h3BhLsS2xvH9jNpaYIvjfX+XymKGwiTqnb6V
         vDDP2r0LL2h2qV62u8jxqh3mu+izE8+DWxOgtQW5hfQa1cMN8kdzeh+5wwa71jBTGN9M
         0cg37cl0yDHflGq6y3YrADsZfWuhisdlSyDHIm4cz7HptAL2/TVOVk9BGcGuRZrKN7I2
         Fje6aFCj9/xIxbhhI2FO1S+sGNJ5uAR7o8aV28rBpm5W/JquAqGleCVGZwbeR5GRpDkn
         qxkwOXTN7Iibz3DN6As1xHnWi3+Y+Cc62H+SXBNLc6Rl+SMRToGi7YbgLIXC+FKwqEJF
         NkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771946237; x=1772551037;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bpTGTozvD3yasSrq4XIec/IuQ7bIWRv4psvjDM1rGY0=;
        b=GPiJo6f/lyL8W9JoxHBkNuZSSzgTx9/YkOxQRfCt/Nui4HPFez5pPoDYCHb8HRw4Ul
         zm0ZXqK3qZQpOBw2Mzh6WEWcX8f99w2V2z4LJlQ7+/0QeyyspQxVUQH6sQ62sutPqy6I
         7KEXGRuFM6+KZJglQThV7EMt+MHNB1qLMTJ/kDdGbErRJmIORrpzap7GnVQVp/1DJBVF
         Ud+vDXLsl0PqRoPrPcGFKsgLX+M6QcLtfVTvTtsWbjIHopghS08DHBoJTBxKzT3aqrfb
         DEs8R/CejvAHnGJGrYdZiWx4iwPE84FQtGg+nEDLB2GTChno2+dVqtG9RlOIC4j2Iv/J
         kAEA==
X-Forwarded-Encrypted: i=1; AJvYcCWBxjCmjweP2i+8tH2C3R7TvKLHxsgcaFRZMZF8l7hkuNbwxppsxtkVzQFM1SYhQ6R4M8ZmBBzgjPvuVTi0mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOJJsfN645pCiFB6wBs1t6TAA5B15wDhK9IahUYMNNQSJ7DgfM
	Ej5B8CWea2gRKrICrDdBVukXqjO6UXZcPr/y7IZqhTH5nkYBsDNoB2GkdNvqHwKUXgt0L2MCoOx
	ABcUPHIgMT03aDk+n9w==
X-Received: from wmof9.prod.google.com ([2002:a05:600c:44c9:b0:477:988a:7675])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f93:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-483a962dff6mr201499035e9.17.1771946237254;
 Tue, 24 Feb 2026 07:17:17 -0800 (PST)
Date: Tue, 24 Feb 2026 15:17:16 +0000
In-Reply-To: <CANiq72keRQupX8UX7PQrLYgzzbdRquxV06SDzY9aubA_p+uGjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com> <CANiq72keRQupX8UX7PQrLYgzzbdRquxV06SDzY9aubA_p+uGjw@mail.gmail.com>
Message-ID: <aZ3A_KBWFJES0d_t@google.com>
Subject: Re: [PATCH 0/2] Change Rust Binder crate name to rust_binder
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 02:24:59PM +0100, Miguel Ojeda wrote:
> On Tue, Feb 24, 2026 at 10:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Currently the crate name of the Rust Binder driver is rust_binder_main,
> > but I'd like it to be called rust_binder instead. This affects e.g.
> > symbol names in stack traces.
>=20
> We discussed allowing to customize crate names years ago, at least for
> dashes vs. underscores, for matching C names more closely and perhaps
> other needs.
>=20
> Back then, we decided to keep things simple to avoid confusion (i.e. a
> single identifier used everywhere the same way is simpler, at least
> for humans) and to avoid having to deal with those dual names
> everywhere (e.g. adding workarounds for rust-analyzer here).
>=20
> I talked with Alice about what she needed here -- could we rename that
> source file to just something like `binder`? That would avoid the need
> to have a custom name, so everything would still match (symbols,
> source file, object file...), and it would give you even shorter
> names.

Sure just renaming rust_binder_main.rs to binder.rs would work too.

Alice
