Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3E33FE35E
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Jun 2026 17:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780422158; cv=pass; b=FVNbuxSPWKEygQe3yvItRCDZA+7qVBHAry/G5s0qWSg6JisLDO5LDjR/EpO85sCrE54RG4kwsJpcDLSxLsoa0B/ze4UOeDSr79h4gzyv4CuLJHYlZtRL9D5F6YQlhCfqu1osWZkk4H/KwHTfxfUfPfdwYAHUP53ED7TR2T3S+vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780422158; c=relaxed/simple;
	bh=cB+FK6kf/Adz/pwPxhpxo1tvMZtjuqm0PddQaUVizx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kVk31JScBomQx8JJOHj5e4U4KVkWMaDldeI0jzqWnqsAzwGb6V0pGu3h9dDvLji2sGg1PzWzL70HR3u8WykGxbXNBA/K+JRAlbGi9l9xlMSHIiXFH/0YNhQfI8JodWqgaHbVxJ/vKNCyJnO3Xptg7diOSLGklI8cweEv1bM/LLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDnaJ682; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDnaJ682"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30741f821cfso122018eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Jun 2026 10:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780422156; cv=none;
        d=google.com; s=arc-20240605;
        b=VEMx5gTJzmHPfnes7qyDFbXLIiqLdavoYabpQO33OaKwVVXl+O8A5EGTukjz9Ys5t4
         5sDWFXL/X7xgkcV96xiT9BVp+DHK0RBPNPNa0gcCnt1/na3AmqaiQcUM46oTsdyjEn0p
         qX18uy8EKgX4vhMSlzL7LYlJKqRU29wzk/rcVCWyWsQpFSRcVJIjnBxrcDwFKEnNkyrb
         gU38iySX1+s5YC8B2YNKlWaazhf32wAmwk4y71cDWJDv2PUneHYjbm/iqJBH4vpVCDeg
         IpQU8X5P5zMbJJybtZL+34suFvGnauQHe2x5Usqm+tNUOQnHQAqnIRC777iwfnEFW1wu
         Ukqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cfDzhsnQd5soOg2P3CtPIPXAH3OnSFtIQ+tYBcVUhI0=;
        fh=twgyv0yA+AedJEdYWHIOG1gvEcKSVagi7fps12Qd2js=;
        b=JgeVswbetPJQRYJIn+38S3PZC2ph3gUVXm5rHNM4grbvZPqifzHwWDKAT4TBNb1FRS
         VN2pF6zQPxIjGv0iMjD+ED2yegZ7037LpvmeYE+ZvOVNXvCZoZIHFhXE1XEZZAgJg5lA
         rju9bB/38hzx3QehGgmdQQs9nYw3p9cGAN0GACNR75gudcGK8Jn9UjzcJRpAiTsJ0oSe
         i4mgtJ0/1BXJhJMHg+oY89ULs5uY15DrKgNflff8iTGFZdIGKlvws5RAHI5CXdVzrqmy
         rI04wZjDDQKShRE6796yG7zi0DGf/inK68R5+wGAWPAAV0KUOwx43aD8qKjhD2nb3dtN
         91Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780422156; x=1781026956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfDzhsnQd5soOg2P3CtPIPXAH3OnSFtIQ+tYBcVUhI0=;
        b=QDnaJ682bZcnU9pPeqHWONeVvTN/47bOXZ0na1m9DwslqpYr5lgJ7RRiIMzecD2qbq
         gfhhAUw73gh+hs06rB7BHQ/bI+GeSaTt2EHbV56iLtg5TdigNLDjI9jts6N17pR2DSgC
         bp+PaS4V9QmjmklL1VWWs4nhuPz5K3Hnc5FsDRWAy6kQw/KuU2+TclxV5Lc8Ff3t6K+w
         XSF+1X0+CLbRihX2PpbU46hDbQrekohYdqgm4SEvpw89daEo9lZqpStXQtFh1i+uXhzV
         /g4WDPXmvlDQUpOoMExGnCx/DpEVgVS7pQ1CoyWsOgkhF2ISvZHaqzZGX4d2qvmVwRIK
         wKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780422156; x=1781026956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cfDzhsnQd5soOg2P3CtPIPXAH3OnSFtIQ+tYBcVUhI0=;
        b=Pb5R0jhU5eDzNtQsealHdVbYFEdBo6wKAkxVVSK6jWwcGQCedXiF+CT+cihhMtWnzA
         9N2nm0nah0+jTGh/qK0dnBzJZtjZ9IYoydWKiPLstvRLJvE5XF/Q4N8+AfifPdQrZUgw
         HzsOlzNRMTUpjNrJnrmr3I1DOX4v98nYJc8OAkZotCRnuPy7w+04ts5SMX6p5AlT01hn
         SxOP6QNzzcEL5LTGScBv74fanasE22ghbDiig1zrKFvbMW+WZmD1gQszpOttUDZtOaK7
         wwAv6gV+63nxzJNq+UM/sn34kUJLbSQTtFERPkt65kw6KhIRsooow0ug0eW+ZVNrVIId
         YRvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wi+1TByeANT9ObeVTjfzaoX0QtHT6yF6e61fXXt0SmMM13BXzVD3VjYkZ5oNNoAnqNGmvqwSFPTrPxu/YLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw22BASBw4Ord40MuI0G35mEQ2guR4ftGfA2mbWFhHfOgtVAWru
	zQDwRnx7vs0U0KvtTp5hw4rzUG1/CV+RFKAZSxd7zG/oxS2rNEm5n+7levERr+VVRVdofa5WNRu
	l+GECSlFwrZxPwSE/oHc3TrEZYWwT+aw=
X-Gm-Gg: Acq92OFXDzailAkaSzviOroSSxR6r1gk30pUsRfDvRnI5B1XVeAAGI9Wbou7KIo0J1i
	gOLvHSpeccIBezHKpfjP+rYntT8Pe93q5qBz9YmKNx4DQ791+kNCoz7FNFSQRrrOU/TMXHkkJqD
	SGfZlcBWl3+ioFLvZYuUkb7XtTt2FFGp8ixiI/dGfBUgHewAh1ov8oiGJa9OogH0TBpWR9lN66A
	5Uq/QF3g0VgkE0jWvbeROQ6CBWVg+zIkrOhLdB54wESRv7TvlxcrCvrXNXVIS1oCKkYfU7wpzc2
	QsKdGcHfno9EN/yd7pB8FOj1bmBaNZHXgw70ozrUnPei7tScazrrm+iC3Fc/wl7Mss1o0GA0oIh
	SQIql8mUESkARerY0594oF1rEuEoLQmkjKQ==
X-Received: by 2002:a05:7300:fd02:b0:2d8:7302:d3c with SMTP id
 5a478bee46e88-304fa658e8fmr3812966eec.4.1780422156331; Tue, 02 Jun 2026
 10:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602172920.30342-1-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Jun 2026 19:42:23 +0200
X-Gm-Features: AVHnY4LO55kfdvPBb2_bfVBAcomqXxB6mPWZy7OOmQYofSFewCwToqcraa5_B0U
Message-ID: <CANiq72=nmJ5rn0N6FKWmHm4bxY4-0X_tok9pNYvn7vEqXLAHXA@mail.gmail.com>
Subject: Re: [PATCH 00/18] `zerocopy` support
To: Miguel Ojeda <ojeda@kernel.org>, Jack Wrenn <jswrenn@google.com>, 
	Joshua Liebow-Feeser <joshlf@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 7:29=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> This patch series introduces support for `zerocopy`:
>
>     Fast, safe, compile error. Pick two.
>
>     Zerocopy makes zero-cost memory manipulation effortless. We write
>     `unsafe` so you don't have to.
>
> It essentially provides derivable traits (e.g. `FromBytes`) and macros
> (e.g. `transmute!`) for safely converting between byte sequences and
> other types. Having such support allows us to remove some `unsafe` code.
>
> It is among the most downloaded Rust crates (top #50 recent, top #100
> all-time downloads; according to crates.io), and it is also used by the
> Rust compiler itself.
>
> The series starts with a few preparation commits, then the `zerocopy`
> and `zerocopy-derive` crates are added. Finally, an example patch using
> it is on top, removing one `unsafe impl`.
>
> I had to adapt the crates slightly (just +2/-3 lines), but both patches
> could potentially be provided upstream eventually. Please see the
> commits for details.
>
> In total, it is about ~39k lines added, ~32k without counting `benches/`
> which are just for documentation purposes.
>
> See the cover letter for `syn` for some more details about depending on
> third-party crates in commit 54e3eae85562 ("Merge patch series "`syn`
> support"").
>
> The codegen of an isolated example function similar to the patch on top
> is essentially identical. It also turns out that (for that particular
> case) `zerocopy`'s version, even under `debug-assertions` enabled, has
> no remaining panics, unlike a few in the current code (because the
> compiler can prove the remaining `ub_checks` statically).
>
> So their "fast, safe" does indeed check out -- at least in that case.
>
> P.S. This version of `zerocopy` has already the unstable `Ptr{,Inner}`
> types -- to play with them, please use:
>
>     make ... KRUSTFLAGS=3D--cfg=3Dzerocopy_unstable_ptr
>
> Miguel Ojeda (18):
>   scripts: generate_rust_analyzer: support passing env vars
>   rust: kbuild: show the right `quiet_cmd_rustc_procmacrolibrary`
>   rust: kbuild: remove unused variable
>   rust: kbuild: define `procmacro-name` function
>   rust: kbuild: define `procmacro-extension` variable
>   rust: kbuild: support per-target environment variables
>   rust: kbuild: support `skip_clippy` for `rustc_procmacro`
>   rust: zerocopy: import crate
>   rust: zerocopy: add SPDX License Identifiers
>   rust: zerocopy: remove float `Display` support
>   rust: zerocopy: add `README.md`
>   rust: zerocopy: enable support in kbuild
>   rust: zerocopy-derive: import crate
>   rust: zerocopy-derive: add SPDX License Identifiers
>   rust: zerocopy-derive: avoid generating non-ASCII identifiers
>   rust: zerocopy-derive: add `README.md`
>   rust: zerocopy-derive: enable support in kbuild
>   gpu: nova-core: firmware: parse `FalconUCodeDescV2` via `zerocopy`

Cc'ing Jack in his new address -- I took the email from the latest
commit he authored in `zerocopy` from a few weeks ago, but that was
not the right email anymore, sorry!

Jack: in case I don't need to send a new version, you can see the
series (and instructions on how to reply if needed) at:

  https://lore.kernel.org/rust-for-linux/20260602172920.30342-1-ojeda@kerne=
l.org/

I will fix the email in the Cc: tags in the commits themselves too.

Joshua, Jack: you may be interested in the two "tweaks" I did to the crates=
:

  rust: zerocopy: remove float `Display` support
  rust: zerocopy-derive: avoid generating non-ASCII identifiers

A double-check that it is good would be great! :) It may be that we
can add it upstream somehow (e.g. with a `cfg`) for a future update
when we need to bump `zerocopy` eventually.

Thanks!

Cheers,
Miguel
