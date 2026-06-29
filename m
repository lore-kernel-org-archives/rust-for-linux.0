Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CF81A6838
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730561; cv=pass; b=Kpl74prmL2ADphADEIJbx6n0sUoEJDmG/JTQWvdImqPOZZ70QqRPYd/Dagewz0RVSv1cUAjsF9x5Nb7Trr3qIfkllEgHU/P3easWhLo54i68pdal3CFguKVDJ5lClXIF9qIBovd54f3YvtdcIzbK30kDSK1N/BzNvT1zgZlkGY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730561; c=relaxed/simple;
	bh=QzJoRm+vbiHGAm79sx+SGnsX7SKEikNC3+uwNsaEejE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZAvI5Kk+VKF5+RzfLjG+aBbQmj75B6IgcsVW44tFNqAXdFa+hYwitPvPTuOhg0HtFASwRaE1Bd57UDRgpBkgqNA9QYkQh/CYVGBHg00IR8pOAyCncMVl06aABgByXzDId2qU8L/8bi9Zv+w5bbl5UO2wvIawnKo3q4qHj6xGBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsvVs/SC; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsvVs/SC"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30c7ec13248so147058eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 03:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782730559; cv=none;
        d=google.com; s=arc-20260327;
        b=E8h8tSVaED9sD7YwprXG/YJAxlM9tm5QReTQEDhq9FB3/Q3pXhS97Ilgs/4jAB3d2j
         1fZWjRaDHR7dFeoeBY9z+8asMwcCKj8JhtMmROqrJvJQ+JlnlqV9tcf2VyFwi41KG3r7
         9jiZIxjJFSWE61i7x7gvBDT5/SWLFKBNkG1/ZWJat5hkasgZZDcnJ3WT0V4iN8/B4dYZ
         cOHsGxqw6WGST/+eqQsF8l05h141fs4GDdk0FxtKNbPcksA2THgL8q34D3sZJZn/f6Ds
         O+Rpt0794TkHtGR+E/SfKsXPMkgOjz3YZRFMa0mmewZbL8/JshFEdy4AYLq2eTNhsvt4
         KfAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZI90vBIjTstqPW5yvvTDQ/fPx7wSFck6qeQRo20qS4c=;
        fh=Vje+Vrm22zG5piUEvlY3C9FNiDQYFqQg0Pt7kMDrSPQ=;
        b=iKl6jXsdkkdYnYaVXBI1ygTKcPXRWTDIObFfYZ3oEHW+JUmg/jHBIlR4lf+39HNNpu
         wJGBmsvwQmIHMiJH3bzKkUNveVb1WiP/WbgiJokkRblTixqkoYd/CeD1RkuBjn9ribDk
         Pdb3XKHlcvyQYSMdThY6s1qhxQRnb5Ni47iop+IjVRJJ4D6gvdCqYwDPC1zJIo85kTLv
         uHLCV5LoJE1jr/zqTUOR7mzo1m3Mm5dC1AQGu/KdT7sWZP8UOB2zuFGZ9mgXgrP6BJF8
         fbpPVRHOYnKdEAoL12ba+jLTMPYuujQ+56enhpHIRafVanb4xh0yyqbqQi1pR5JxaQSb
         jlwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782730559; x=1783335359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZI90vBIjTstqPW5yvvTDQ/fPx7wSFck6qeQRo20qS4c=;
        b=AsvVs/SCwhEUPFDTWjb6IHgkvabaBPUEeEejSdeLTGURSfIkNhTsuzVWHVXzDmsP7Y
         MlkzH6ijXBN0pcSHPlk6voUmaDF6uQcia1StyoWHpsA6+H+m+uTHQXK/Bcmm8W0uKSAw
         Z+zj8I4c89qRvAijhOJPfdFai/lYbZkvSV6u2k39WnYiSdzn0yVvqGN3maCxCqFPpgtv
         XBjbKccI+ZX1JB1VY/KIriu9cO2itxv7y9hgD/L6U9dTPjNGnxDdANsbFDTce9dfkJl6
         9l7cyp4BnkIchIF0EmVyYp9ob/NrkgdRyF5DgCkLO3nbQvhENimQ7dbClHxlqw/Bw9F/
         +0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730559; x=1783335359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZI90vBIjTstqPW5yvvTDQ/fPx7wSFck6qeQRo20qS4c=;
        b=q41RUBfDoLs1bgKTsYhAd0idWkZhscfU5aDhV5zMKwXWc7WUXrmg34MVyhiahPzdzu
         grm7o56D28YlRntzdSM0FHnF+pfQ+78q3ucX3svHzj5rrfq0dgEaWduoWWh4dgeEC7Q8
         BiCuvBPn5GashLdN2AGW6P4X7ff87gAL2sBcmp9uqtohvWTZTdpJXQRJ4IT95fb+BoBq
         9bLaaUPFGzEMc44xX72PPo8r0IlkIidTbZcDpTSqBnEZId4nTtw/SoS58LIFhXmLwbWL
         MHrfo+ResXm8QLY4bbJQC4LnIrdEZAkaciuUwrnXpnXwdI4J7slVGIcJp/xjXUWWEISI
         MRKQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQaAuFUk3RANm2OlXd+Nr9wqKJpqaRSZ9v0TPbDJ2ofJ7NeHJc+OSobrKdf4twSYuGoMVqlJvt5YZDXfQR8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxBMZAuXeOXxXsYUqYwT9vCcBanvj7bIu0pg/pW+OR+Z6fMH6P
	01iqzyZGf6336tiMhE79y8Y/UznClu/znb+kSbI5AmhkMGGl/NMnm8FbWuSU6BCFIhF3zsC4m8s
	s3mOc6vt21OvdffDevPXST9RrPSgpJ4w=
X-Gm-Gg: AfdE7ckj1yeS9ysTgtnBAfrvPZDHzYu1bOi2goVoueOU9vdm5BbzmpO3/gLUlO09g8J
	HPFEBo1r1gJHKO6/FYefb2XQIUlqQyS2cIVEL2xAIxqTNENOwKPewJTeD8+1asJ5Sa/pai9aHyK
	av5QYBTG7CI4u5jmY3FT3vvzU1jjf71hZ68v4V9kU5lpxDyKa8iw+cdn2nOQrmRKRWfTz5ErQY7
	rZluNFvBsGjyXi8j0RIvT1i7k+nTFmu4DUYRb6DNn5MLUevJ3j91nf7ZnG7d64Xe8xM+hLARxJ3
	vVAt5UQMCObBbyvWXke6LxJCG0o/+a3jPzwnjRB++tLhnluo5AtlQchbBtHWQzodVT/rhhkEQN+
	nuO39514c+ZCa
X-Received: by 2002:a05:7301:6502:b0:304:e327:aef8 with SMTP id
 5a478bee46e88-30c84b1570amr6442790eec.2.1782730559225; Mon, 29 Jun 2026
 03:55:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615143225.471756-1-ojeda@kernel.org>
In-Reply-To: <20260615143225.471756-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jun 2026 12:55:45 +0200
X-Gm-Features: AVVi8CdXufg4rKJzModjJj53zc9BlhbJkLuAlU-RHHjegTEupJdv7x4x-E61lY8
Message-ID: <CANiq72=QWC2XXbf7Pf80c8FcGjV16Jyzgm7Yt5S5aEBxpgWX=A@mail.gmail.com>
Subject: Re: [PATCH] rust: allow `suspicious_runtime_symbol_definitions` lint
 for Rust >= 1.98
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, Urgau <urgau@numericable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 4:32=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.98.0 (expected 2026-08-20), Rust is introducing a
> couple new lints, `invalid_runtime_symbol_definitions` (deny-by-default)
> and `suspicious_runtime_symbol_definitions` (warn-by-default), which chec=
k
> the signature of items whose symbol name is a runtime symbol expected by
> `core`.
>
> Our build hits the second one, i.e. the warning:
>
>     error: suspicious definition of the runtime `strlen` symbol used by t=
he standard library
>          --> rust/bindings/bindings_generated.rs:20018:5
>           |
>     20018 |     pub fn strlen(s: *const ffi::c_char) -> usize;
>           |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>           |
>           =3D note: expected `unsafe extern "C" fn(*const i8) -> usize`
>                   found    `unsafe extern "C" fn(*const u8) -> usize`
>           =3D help: either fix the signature or remove any attributes lik=
e `#[unsafe(no_mangle)]`, `#[unsafe(export_name =3D "strlen")]`, or `#[link=
_name =3D "strlen"]`
>           =3D help: allow this lint if the signature is compatible
>           =3D note: `-D suspicious-runtime-symbol-definitions` implied by=
 `-D warnings`
>           =3D help: to override `-D warnings` add `#[allow(suspicious_run=
time_symbol_definitions)]`
>
>     error: suspicious definition of the runtime `strlen` symbol used by t=
he standard library
>          --> rust/uapi/uapi_generated.rs:14236:5
>           |
>     14236 |     pub fn strlen(s: *const ffi::c_char) -> usize;
>           |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>           |
>           =3D note: expected `unsafe extern "C" fn(*const i8) -> usize`
>                   found    `unsafe extern "C" fn(*const u8) -> usize`
>           =3D help: either fix the signature or remove any attributes lik=
e `#[unsafe(no_mangle)]`, `#[unsafe(export_name =3D "strlen")]`, or `#[link=
_name =3D "strlen"]`
>           =3D help: allow this lint if the signature is compatible
>           =3D note: `-D suspicious-runtime-symbol-definitions` implied by=
 `-D warnings`
>           =3D help: to override `-D warnings` add `#[allow(suspicious_run=
time_symbol_definitions)]`
>
> Thus `allow` the lint in `bindings` and `uapi`.
>
> A more targeted alternative to avoid `allow`ing it would be to pass
> `--blocklist-function strlen` to `bindgen`, but we would perhaps need
> to adjust if other C headers end up adding more (or Rust checking more).
> Since it is just the less critical one that we hit, and since eventually
> this should be properly fixed by getting upstream Rust to provide a flag
> like GCC/Clang's `-funsigned-char` [2][3], just `allow` it for now.
>
> Cc: Urgau <urgau@numericable.fr>
> Link: https://github.com/rust-lang/rust/pull/155521 [1]
> Link: https://github.com/rust-lang/rust/issues/138446 [2]
> Link: https://github.com/Rust-for-Linux/linux/issues/355 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

The PR got merged upstream a couple days ago and is now triggering
with the latest couple Rust nightlies.

Cheers,
Miguel
