Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902EB35CBD0
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 10:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162644; cv=pass; b=m45QYU8vBtx6MKY48fztKevvbItCARbaWnFjwTT75ybVqTjqYQdTnEvNtjmnLqTJ++aC5c8tuFVkcJa6qx7zf3E52r9SSUR0OXjxLkuNii2T5MQZlvgAM4i2d7AJ620Zj19uOSU9Kkr6HqKxdemxLgKi3/tdWEbOQQzD0xdEqK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162644; c=relaxed/simple;
	bh=BRIfbKHKfVzkLXmQL298DB7cbBMiKdki5CBIhdL7KC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFdbpBLqvL2LUAheMZdzEW45/YNTEsqYXjWLbSJEOw2PX6lyEUU/JtR7iQbEJ+sddppsOFrlbusnxMmRfGDVMCUaGGnUg5y20/7PLiXBP/JDInajNKwYzEKWyK7JiN0ImajlM/Z8Bsi2SGJTwA1pfHgkD51clNo6KkZh9kUIn5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIIII3SU; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIIII3SU"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b1769fda0eso219507eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 02:03:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769162635; cv=none;
        d=google.com; s=arc-20240605;
        b=MD8rV4g0VemMJdqEJOUCKI7HPROgsT3P27vLAMgRPuMeHBfdCi4xtX9LfO6LZ4XcOE
         C/huCfg0I7hYcTimlc00utGeN3Ui1CqQfOjnCud0njUtgFuA1/ky23E16RlVsgTjDcxi
         Ki6MsXUMC1ffI4iP9RaHSsKKHK+RjiXEqwX61FhfruA4ikp6hOeXqaVfPvhdlxsNJsau
         sqgjCYfjxfgUjQ3dDxkUJG1gg/e9iVcysKibXTy3KAEgGUV0NryMcqxcAvYsuefDsYEF
         8wJCf+qLZmE337LIucdAM4vInsTdqsvYTw9TzGVXdnGJVAg4SFO3aWmECAz2ILex0Qip
         YGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CE4OiFC6+ZBXl8BzgB29qbXF34gjOePJNZ1Ruw2PvIM=;
        fh=qWwsPHeIJRIygI8Pi4fjq2Blr7JSGsQbIJvwowHkQSk=;
        b=InuUjZxhQIQKAV0E7NEd8WOO/8pmDKflyn+wmSNj5KVIcqyf+Ofa1r2bqy/2VeMlps
         OLadVfIRhN1+6ueD+whYj9IYKR+syttsN+3GLmFMxkl/HIt0SCieD34w9rZicGplSoTr
         k0C1M3TvMHUPU64PVcE4sS62bA2oxBhzvIQ7V2wJ5X2uIBcy1aWXJ7VZ4eJjXe0SEGFH
         VLXWOI3NyIp2Mp5B4Sn3XpCkWLXcStvx/rZpEK3Oit4ZKlMNFYlBVEgXfrFuehEwV0L8
         is33Akyacwd8zg3RyAnidwjzfFL0T21rrQ9aJ4Tb2O5liYlmUPWJGqSTD5UYiJK8mruf
         RUYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769162635; x=1769767435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CE4OiFC6+ZBXl8BzgB29qbXF34gjOePJNZ1Ruw2PvIM=;
        b=RIIII3SU0MNdXn1asIYD6kCWQFZQeIZY3auTiH6Jt8LPpUhJ/10EGPO3mn78SKH3yP
         zjiJybWiTbS81sSeKuqRzd1gKtOizcco7XtDd8hql9U0lkp2mOmAYylfSg2LzvCSZUO9
         eavt7zJm21tYlE5MHm3TCEOt702PsVefSEYjwplFU9oF6eEaLckXTGAwiWX9Rh3L8qj5
         hgnSdVNj7y2+6dUMIlEDw/zwifame6Zoa3usrrNh+mutUAwBY4dcaXOQuATIYRDFnghN
         LQ+s1DivBaFzmn7Zr0LZoczjyTuB6yEOaWstRuHpkipMn3Ha6wZd/J1b7o7+TAlORgTO
         VI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769162635; x=1769767435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CE4OiFC6+ZBXl8BzgB29qbXF34gjOePJNZ1Ruw2PvIM=;
        b=ArWVM8JaSBnzYJH0fi3P4d1MXoxHUhTcWORs/xpda/aEtvQPcyQM64vvwLTo9I35x4
         ngG7y75TU8WL0/01PaJnDJJ3YroibTHrlmogLkL+Auw6LxejLhvKXhciTH9dcA71XtBc
         6OgFuFV2J/wjTVLVA8coB9z86NUKJL6TyaMet4D7LIXaBKT+6p6fd8Y0GRt1YlcWhM/l
         vxBYxu6tI9NNIOzW1On03lzxjXvK4oMVFiMiHqbs2fyvyOo6t0x5Sk8ApcuetHkdM9nO
         j4A21xhYkO4Nr2b++/QKYMQnVMXx7VbLu0UtGKWkQBdk3gmwn47UVupfIkvEUJlCPAOX
         c9pw==
X-Forwarded-Encrypted: i=1; AJvYcCX2liZ4sKG9zXAOd9TYzS+Y1owvJ2q3S77Nd5WNzfUmrIUyYR7SWzhz/Jsp83PAgJEB3pKHVgjrxHASEC+v4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoXYBtSZQ1PWXCd4OW1rtquD4CpFRYE9KxpEokQn1XbgzEjedA
	g7X9cP1ZbJTK1W+Cn7/I3Z8+94SuOAyuXvAokptyy0g7iWrhqbleQ+FO6wt3oMvUENoqr9NczAI
	8oP7BDt8DLBgOOMkHMjZQH8Im4jpQEx7ofA==
X-Gm-Gg: AZuq6aJPrz76VnTfisSeCMRaI57QbFiFI/fNINATPEk6GPYVD5gFqqR2Q7U3DN0b4Ht
	y6TYMP+rbLh5N9HS1sp+AUedMKFlYvk8aUkdRFWI4PIdzA6shOiL/8tLZidVFoe1IzAmyGjdiW5
	O0XyPKL+2Yz1JZrr/YIHuVRoiBb+6fJYp6b04oHtR13GeeHdMsdjI/kRXyvlfP9boz2WAe4W/tL
	siyAXgQLlP27SOxbU3PsutkF+ZsmxJve3WKC41FycWMh/1V2sqBrsVW/RPKy7lzbimy7M9jeD5g
	iFCxS0P0/bK0eViMWG4x7XjmuHO7WIps8Ir4oT9ixOgp5PSwi7KkpMIeQ/+W/P5oY2R5iorZqcJ
	iC+kbuzS7Xvwv
X-Received: by 2002:a05:7300:f081:b0:2b7:24fc:f625 with SMTP id
 5a478bee46e88-2b7397b575dmr574956eec.0.1769162634772; Fri, 23 Jan 2026
 02:03:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122054135.138445-1-ojeda@kernel.org>
In-Reply-To: <20260122054135.138445-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 11:03:41 +0100
X-Gm-Features: AZwV_QjWr0oPOG3Wnr9kQVoosMcSP9b13bD5dE0oUkBJ5yESEySGOVGmDsfyPvg
Message-ID: <CANiq72=f=PO9OFHkTwLDVgibwWznTZLX1hg1CV13GM0Avvbk4w@mail.gmail.com>
Subject: Re: [PATCH] rust: proc-macro2: rebuild if the version text changes
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 6:41=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The Rust compiler cannot use dependencies built by other versions, e.g.:
>
>     error[E0514]: found crate `proc_macro2` compiled by an incompatible v=
ersion of rustc
>      --> rust/quote/ext.rs:5:5
>       |
>     5 | use proc_macro2::{TokenStream, TokenTree};
>       |     ^^^^^^^^^^^
>       |
>       =3D note: the following crate versions were found:
>               crate `proc_macro2` compiled by rustc 1.92.0 (ded5c06cf 202=
5-12-08): ./rust/libproc_macro2.rlib
>       =3D help: please recompile that crate using this compiler (rustc 1.=
93.0 (254b59607 2026-01-19)) (consider running `cargo clean` first)
>
> Thus trigger a rebuild if the version text changes like we do in other
> top-level cases (e.g. see commit aeb0e24abbeb ("kbuild: rust: replace
> proc macros dependency on `core.o` with the version text")).
>
> The build errors for now are hard to trigger, since we do not yet use
> the new crates we just introduced (the use cases are coming in the next
> merge window), but they can still be seen if e.g. one manually removes
> one of the targets, so fix it already.
>
> Fixes: 158a3b72118a ("rust: proc-macro2: enable support in kbuild")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

I am applying this one fairly fast since Rust 1.93.0 is out and folks
may trigger it in linux-next.

Cheers,
Miguel
