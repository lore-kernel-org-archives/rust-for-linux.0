Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40663CF6A
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 04:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727585789; cv=none; b=X4nUeUzr2oCvRqJe+GANtDaz3keHLgtM9itI0AgBcJnb5+e2lT5FRAp2AXZA8t8JLYDauDLZS8GnD7nlnc3D8a9bI4MfTX6yYfZr/asvsDFyZaJsQGgqEsEQbKxAwMKIhrPKtA0l8c27hWFfY3QTtvq3iqHf/dROKYTwJkF8Fuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727585789; c=relaxed/simple;
	bh=YkNxXWjpqjYtCMtoRe3WVpFUJbFDdsQaD/T/kG7nl/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGWj8T1JSXyx9PJi7lIo5ziXVpvGxwmSd4hdDj0Hap77lgYeqxy0yMj07QPcd19YfIoszI6vQrWCFkcsPm7t0GHYbnFZdx3cbqFszxdpSEn/ei8jqeg/t8soGcpu1YJTXrEpfjN1DQoV8D2bK90KfcXg/9l44QAL33asYCUkffg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=IZIZtvJt; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="IZIZtvJt"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e26114a1b16so510788276.1
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Sep 2024 21:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727585786; x=1728190586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOYsLISsVfhDxhjLXV7hyv9Fxzlka9wAvMifvGXxyVI=;
        b=IZIZtvJt5tdFYez4u3trirCWSR8hZ2I2Dk5YMu/sI4Q6bgxADpye8dbvLlbXBnGJkx
         5pGU/OMCgE29MMKJtisdos7Hd5BhwD6R9AYbW/7ldH7yxB26D5ilmeddBXx8LNoykutl
         tpzigfPioTOaRnWfJzx4d0q921QnmwB8AexENP2ib8GgnrVKr43K10HDqGOU2AgRUFO6
         iQoMBB2eDvYG8ksUlstLCUxilO2k2sQvowtbokGJP6lK44t3oVnjwvwYKarCt+dU7IRr
         u5Ztsw5puNebDfPyFOBBQIJYUpPOhz6bh+XiYF9+R6UMlc8BBaDTyZ6NmA/2kKRRTbFZ
         Irqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727585786; x=1728190586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOYsLISsVfhDxhjLXV7hyv9Fxzlka9wAvMifvGXxyVI=;
        b=Pt5G8la8KIsv2cY5NB+YwxrFq7hShZ/6cXN316w5lDCtCLTLzqQazzordFY2VjhTpo
         y5CXOzFxL85UXOz7swd9RYkH+38kPvRTKaweSKY+s/OmPgBfFi40XjCMXA8r+HJO+7tt
         BmFyPMRQuuAK4lzf8sE/Eg8k9hUO3c+xCg3PmdCwK9A5pwHoJS9yZWIfQYO4XsLOwnGt
         dbuGx5VU3QI9uNliX2MYqNRou1wFimjvp4Fu5H+etCpz27NTCHgZnCYGM6h4kuiym5k3
         GJ0qzZszpJWf8eWlcN+DsgWuel9A+Edfd4TdaLK6pCysFWvb9Uau8PS/1r0JBZ+738H0
         N/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvwi2GvFYEMX11iKb58XfaLIY6j01qtuSob0TpcqWOvh3dhp607e/gHCoMX6/uI11j3xHJLbDGHUdVZJJBXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB6Ru7Q9DeHym3B0Dh0SP8Pph7B4JnHdSEV5rDJYEHBSiE59Px
	GqPgW94mFTvwhLD81IrB2lScGGzc8SekoOI5k3IIamJI8k3JHGxIQxcFdvWtSoZ6zxJo7XTBT8M
	yhqHhTKAHvcg2N5XSeLA49ztF4LtvbOS2sBQPtg==
X-Google-Smtp-Source: AGHT+IES+mS3dwA7x3mj4/IZRVIw+FMcwmqXUyBn9jFMyuY82OeecDI+pqzm14EDy7gj7TkzRp0qLVGuvnyig5ATprI=
X-Received: by 2002:a05:690c:2b92:b0:6e2:1bba:ed4c with SMTP id
 00721157ae682-6e2475470bdmr36609157b3.17.1727585785734; Sat, 28 Sep 2024
 21:56:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-15-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-15-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 00:56:15 -0400
Message-ID: <CALNs47u+vEO5+v7dS3Zm2QbeOQfp9OdNv_y7G5c_AxqxjppFHg@mail.gmail.com>
Subject: Re: [PATCH 14/19] rust: provide proper code documentation titles
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 4:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Rust 1.82.0's Clippy is introducing [1][2] a new warn-by-default lint,
> `too_long_first_doc_paragraph` [3], which is intended to catch titles
> of code documentation items that are too long (likely because no title
> was provided and the item documentation starts with a paragraph).
>
> This lint does not currently trigger anywhere, but it does detect a coupl=
e
> cases we had in private cases if checking for private items gets enabled
> (which we will do in the next commit):

I think some words got flipped around, should this say something like
"...a couple private cases we had in case checking..."?

>     error: first doc comment paragraph is too long
>       --> rust/kernel/init/__internal.rs:18:1
>        |
>     18 | / /// This is the module-internal type implementing `PinInit` an=
d `Init`. It is unsafe to create this
>     19 | | /// type, since the closure needs to fulfill the same safety r=
equirement as the
>     20 | | /// `__pinned_init`/`__init` functions.
>        | |_
>        |
>        =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/master/index.html#too_long_first_doc_paragraph
>        =3D note: `-D clippy::too-long-first-doc-paragraph` implied by `-D=
 warnings`
>        =3D help: to override `-D warnings` add `#[allow(clippy::too_long_=
first_doc_paragraph)]`
>
>     error: first doc comment paragraph is too long
>      --> rust/kernel/sync/arc/std_vendor.rs:3:1
>       |
>     3 | / //! The contents of this file come from the Rust standard libra=
ry, hosted in
>     4 | | //! the <https://github.com/rust-lang/rust> repository, license=
d under
>     5 | | //! "Apache-2.0 OR MIT" and adapted for kernel use. For copyrig=
ht details,
>     6 | | //! see <https://github.com/rust-lang/rust/blob/master/COPYRIGH=
T>.
>       | |_
>       |
>       =3D help: for further information visit https://rust-lang.github.io=
/rust-clippy/master/index.html#too_long_first_doc_paragraph
>
> Thus clean the two instances we hit and enable the lint.
>
> In addition, since we have a second `std_vendor.rs` file with a similar
> header, do the same there too (even if that one does not trigger the lint=
,
> because it is `doc(hidden)`).
>
> Link: https://github.com/rust-lang/rust/pull/129531 [1]
> Link: https://github.com/rust-lang/rust-clippy/pull/12993 [2]
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#/too_long=
_first_doc_paragraph [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
