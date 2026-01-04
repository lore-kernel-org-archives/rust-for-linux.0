Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9868D298CBE
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 13:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767534021; cv=none; b=IWjbce11GjNaf6BB5htllK1EnKhvjiDKUEvwmMOfzCT2AStvU598K9csIO8iaU8eAGwDXosdqnZa1hupEc3mz4qSdHKrmv+ezhZDcAUCdsOxFfig6LCPpmvJGoaDs9o6p73S861yIqBnEIjMOy7ZLSACYVuCC5raw+qX1RuM7vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767534021; c=relaxed/simple;
	bh=PxhnafdhUkoL7xs39CEOt903VzFLroguxsgbB0FJ5Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BsljeUpUBx/5xtYT/we3XvDWFj7l4wnQDKihA5GMbDZqIjFHHWwIGUSNO42z49tYd2ARsKL5Bb3sQov2zLCOveaDTZER/b/3ih0VHVswJq7gN8gwedQ+0mBn4ZyCXi/IUXnxEmvCeMFSpYCNyXDv7eupeNW9pLclNbupc1RMI8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5OZTfMG; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5OZTfMG"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37b9728a353so160512791fa.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 05:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767534018; x=1768138818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxhnafdhUkoL7xs39CEOt903VzFLroguxsgbB0FJ5Dc=;
        b=f5OZTfMGFVWRHDACpgOK8Ax1DFbvD4QQsrXxSp4N2m5p1dVgQBpf/PNmZgP0eeHYKw
         6BQy1cm/6IHn1qyRRUfUazNcujHecZYGGsZnHpxUQZ6njyQXrlNxpBxU1KZp8vL8LuF/
         OvQHwvvfVTToolTVrr/s9orcsglzQ7TomLEq9j3wf5uGMVm9NKGQ7EoPEXet9n3NGrte
         2mt6TQ9TsoZdPvxWJes529zrA22BCf+uDPGomt+ZzexZPj64peDUZfqtyPHvRr2w8RTI
         WeAvfmMq4GoZ5ylO/OzwnZZi3e6svV3eEhw3oMrd+uf83ujxdDzaqnQODecn8Y4aio1J
         6dKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767534018; x=1768138818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PxhnafdhUkoL7xs39CEOt903VzFLroguxsgbB0FJ5Dc=;
        b=BxOhR187/dPt8LfAuGpDgVG7WToAYrZSD3gfRjjc35nVp4E23RO73dZpe/6P6Lcmlv
         A6AWpayZorJzwQMuSWbC8c6vowQZXyiGZ5F8PinDcQ792owsRHuaKERm06qpkPNSMR15
         KAhb7sCpR2jXJIqfEVDbBxPT4ddEyD+5tW9GV8DqoCzTu/3DPF8LAy8Wa7Qv0m0W4Of/
         sDZvjoijh6g6elPXOyDMpvxwkRFPFhZTeNfWAG5cAFM1lq0qCRAbNoo2PKfPW78ZX9sa
         v67uwebzanSQCdKKPIqiOvry2m7XiPUisrbvZt3Dl3oG9P65aR3tvBucS5wNhGTDPrVF
         qJrg==
X-Forwarded-Encrypted: i=1; AJvYcCVBVA1eEuXk3Y9NI/DfKpvhVB07FTwpte42+o1DqUeC+7jj4QEFLa4l3xEgESBQ708A7bcL16TqQ6RhKjfCaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRyco1eKGomOhIo4eupfMnr1iIqCU8SI8wvUPJVl7dEziwtN8f
	C35ruyw+ziB1CcKhqFPR1ZFDZ4ylpMRS+sQ7+n03WjJ3TFBtNtO3mcLEKC5a6YgjWFgeqNsORPZ
	BrKBT4C37rJfwlyLfL9kvbAb+OmzemcI=
X-Gm-Gg: AY/fxX6iZ4DGWxT/s91LkvjME2zLDrGW5dUL8gmEHc7Jd5fU9Y3jRzE4Dbl8KV3SHYM
	wiZR/qMZ/OsMXwr9J63gyVATFcUgtR5DrxePdGJh+BPJSVcMDQ041DyVuxUm/EzdS4wTVdu1SVg
	5DFd+FefopC1lKm2CAEpF121rMrNJ2OG9AtuHXW3kzM3RY9xfxBLTfUlxfTSXNaUzPFSn3pLUMq
	EVC/LiNj+6Q/i4Kdw7218tZKnhXKi8VbQ5WspljfsAsX0yImUszIefW/HfbtTv9FGxVjdPaSYSf
	29CkjKB6Ve4zpGKjHxHOgmn1QF1OQzA971a99uCt5DX8khmqlKAtT3tssklSJpUDsnLPkScqmzq
	qYvUTwf6MUUhc0wdKjPKRY0QxxpoxQbjYwIJH1aK2dg==
X-Google-Smtp-Source: AGHT+IEbBB9vVZCX9s2Xya73C0YMR1yaHANMzVSX2SG6EOMN2EgG7mq5cYhnsniYCMMQ4mlIafFdcZHA4pK0y+I92ZU=
X-Received: by 2002:a05:651c:b23:b0:37a:5990:2ba8 with SMTP id
 38308e7fff4ca-3812161517dmr152767841fa.23.1767534017462; Sun, 04 Jan 2026
 05:40:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211185805.2835633-1-gary@kernel.org> <20251211185805.2835633-3-gary@kernel.org>
 <DEZJOAT8ERZ5.34R3FCWWNF065@kernel.org>
In-Reply-To: <DEZJOAT8ERZ5.34R3FCWWNF065@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 4 Jan 2026 08:39:41 -0500
X-Gm-Features: AQt7F2qVzPAZs4tIHaDG_ROmfVds8KB9z5J4NySN-dxo_RD5WIHqxR9vi_U-EnE
Message-ID: <CAJ-ks9mMnmf+KiMYigyRjnpvcvmRzA86GuDAKAcbQFu2YWt6ww@mail.gmail.com>
Subject: Re: [PATCH 02/11] rust: macros: use `quote!` from vendored crate
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <raemoar63@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Fiona Behrens <me@kloenk.dev>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	=?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 4:47=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Thu Dec 11, 2025 at 7:56 PM CET, Gary Guo wrote:
> > From: Gary Guo <gary@garyguo.net>
> >
> > With `quote` crate now vendored in the kernel, we can remove our custom
> > `quote!` macro implementation and just rely on that crate instead.
> >
> > The `quote` crate uses types from the `proc-macro2` library so we also
> > update to use that, and perform conversion in the top-level lib.rs.
> >
> > Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
