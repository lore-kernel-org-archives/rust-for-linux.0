Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800B943C05D
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 16:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701909; cv=pass; b=VFW8QQJJzunJT3u5SLpAjcyINdN6rZXHFnTJ8MijRXAEun8Q5sTzSw0TdYfQ+sSfzpx3gkPalYWH3SAedt2rVH8Iqfrgaf3VPy+m00r4nJPMPpwshdKgfTOHhRA3S9f4H8higIZA9hxLrvlR/OKMWdEzV/x9qZVZVdlrxVFz5SU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701909; c=relaxed/simple;
	bh=xCjy7nX78kVpVGwcDacIhBhg3InIXD0P3WacXKtfrO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5G/laiZLcpzEpNwr7ZvEByVl3imfj/LXinfYy/tE++9ILon59tS0q1tK112Ztt3P0DQQqKIq4H9MvFo7MjGO2Bn6mGanetYDDizXyDE/cZIjFmXCFQgzPIayPw6BMZcxyAiOLj7NzrNfdD5jqbfz9nYE10eiaYHApMA0c5EWdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVO0d8fH; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVO0d8fH"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca53979f8e8so110113a12.2
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 09:45:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783701905; cv=none;
        d=google.com; s=arc-20260327;
        b=SwYfeOjIoWvTaMPrWrGi+T4jgl4Xr/6VITQ5U60wSxH9GcbkcycC62JLd2HpJqhkcL
         aL6pbxYCmz1fiixJZgvIqcMlvpEPQvxC1MOss/FReiR2JaVoEAAN0YS+9AN6I/3NSF/5
         7Tlc5StNBVhdmF6OucDOl0Jl6Fa1mcwDGmSqfKxT5WHGH568FBq13qz6HIAmCgI8a/wt
         phrQ0VZtLpv+1LY70lNlonnuDfEA6cqNvYUR0vXDNxWphUul8RElv8zWBzeqEVG9GraU
         MfRQQbq7acGmCyt+IUdYqbmTWLJ+xw6dBtT4tcX9BjKhXtYE0U67xrLswimwErCVJdSe
         KoVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hBlwEABXvW44zvsPx6ksviQAF3K4tXM0YakCYODCtvI=;
        fh=mbGr04USke0UPHZPwR3eEqXSniXk2iWi4Ou8/pkunBE=;
        b=ENgYqo3YFoOFFVULNLnCLv2YZ9PQpr5Vvclib7Glaot0iqU8L5e7MvZT8sCNig2bAW
         IyrGxS8NaYGbUi6KR1KT66i6fcKkMm7kciqlfhur5qyy58hjXqRaDlPXU4r3++nph8ez
         TanCNomLPIf7N/ruQDxSq5ghWWazcHmUl+2kCOjCbMXqMSeYydzYlfwoO0dUlDBhRqaD
         OezHyoUSUIepy77QKFD5L9FwY43WgvTr82bmyfweL+bdKlwqQIehrYLpPhbkrdAjIynY
         VzjDzQtGXp2c3MgqbuKpStoKaTivCSLjK6CQcQEofbSBhbhHuFLGTN6k1pqUKJXVKLh1
         dbWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783701905; x=1784306705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBlwEABXvW44zvsPx6ksviQAF3K4tXM0YakCYODCtvI=;
        b=mVO0d8fH7l0iUdZfxMaQeXaQcug6AsjTvO8fkDsZvJP+hoNzJi6vA23dNzU3U1+rdp
         hEZP1z2fCWOF0ZnmPGSfeBSA2lXet25HFHLQWg8wf6LItvChJkm3GdJzdGBL1CuAvrR1
         FtPZQ0uHDb3s2v4IpWl6Iy7UzPl/bHjiNcfbfpVbr1S3uKfZNnn9lMqM42/iAoJpj49G
         uG8BnGlCuPM4yC3QPPDMLmeRRPveXa0aeDCfAs0LKSfippe96vwBShrwB/RPJe52aXFe
         mWNbArMer+IVhPWJ4wVrqK6oiIpMqCIKhMgeYcsBhTX2SySgZV0YVkrpZ1YFtRkkjVOW
         K83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701905; x=1784306705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBlwEABXvW44zvsPx6ksviQAF3K4tXM0YakCYODCtvI=;
        b=bIZiWU2Lyk2L6qkAQJQR1SgQfA3i77CfkSiTpJFuAhK+SyRNUtmQb8IPJSgeePPu6j
         ou+CO4P4JV1r7U44O6IdyQe5XKkvd2zVuPDEYCghg4pqPDI0gFx1p6i7Ezfd6YerjBM7
         bRRBDI/maVVBFNtjArrwn0t+HbucHcX9tKmEsqvfKKOWxsErvkcu/4YiZdP/Y6ahkLUd
         nYYb1fXxi7jqXBDOkSj8VF1PPDw9gsY9CItqkeBWNGH2tmTcFIUwxdnGUnZcJnsXsMSP
         +WBkjmGQX5DwjBoI+IHPVwwBgERW+w0AtV3b8Du6phH7HOSnravaSSW4sIOXoc94LTy+
         i/iw==
X-Forwarded-Encrypted: i=1; AHgh+RplUSTF8W5P1sKAcc/ZHSO+inPgoa7t93GwFpJavFjDU6QKZ0aYjDSGNLa/Aue7CnJV7EJbdPEwMyKmImTPdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFT1urnLsAUn+mcnoSIg3zuaPrVNl8MQoOCl4Ef8xvPDSDmVFP
	vEM03F+LsRY24JlLkLuPbCwZNApSoZRV54ymn/oR8I/DFhbUyWBcu4Mt+omMJjtKj5K0Xryg/hm
	g1XUaTm0IoD7cJ78l0xpuIEje/sATyX5l2bas
X-Gm-Gg: AfdE7ckwIYxbsInwknwqFxlpOFUmoQky9QNKKaZ7n8uPmrpABRF9k3B43VyhBbbl7jS
	i/D28u6LcHxXYLVOojo7xZmMus4dXNg6H0lvSp8JiDoKlxbPgrEBSFxJQY1FQnNPEyBeHTV19yI
	1h+87LGnRfAo1RsYMSz1XxcMMHetEDudx19FB8biDIva1nTTn3hTip2dvz4+bL1Tt8g2hhvFU2t
	cOvr+Oj7DEcQjHrD5QmIyVuU5bYHx7rJ5SPgyCbBSqPNE4FzhdEfxrtiact18NTYkShde3u8xIQ
	I7oM8ZaZGDbl8XsrpplfefDs12WT2rV2RaKvUo87UAaeAQUwHIHJGC5WR7VVfsQKKz8LHFMn+fu
	OgNMCutru0Q/Kx3/U+FSGlPI=
X-Received: by 2002:a17:90b:4c0e:b0:381:1ffc:7d35 with SMTP id
 98e67ed59e1d1-38a2122c84amr8231942a91.6.1783701905167; Fri, 10 Jul 2026
 09:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625231919.692444-1-ojeda@kernel.org>
In-Reply-To: <20260625231919.692444-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jul 2026 18:44:52 +0200
X-Gm-Features: AUfX_mz8DZWlL1QD9ua806LSMQX3ccUfIVTtJeIAxBxmg2orczQrnhnY_ukACyY
Message-ID: <CANiq72=z6p0LH1Wq+_r4c9Zctvwmu-8m6rdw2Tufg_BuOGwpPg@mail.gmail.com>
Subject: Re: [PATCH] rust: zerocopy: update to v0.8.52
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Tamir Duberstein <tamird@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, Jesung Yang <y.j3ms.n@gmail.com>, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 1:19=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Update our vendored copy of `zerocopy` (and `zerocopy-derive`) to v0.8.52=
.
>
> Most SPDX identifiers have been added upstream at our request [1]
> (without parentheses -- supporting them is an issue on the kernel side,
> but it does already reduce our differences). The CSS one for `rustdoc`
> was added too [2], but will be picked up in a later version.
>
> For `zerocopy`, enable `--cfg no_fp_fmt_parse`, which was added at our
> request to avoid our local workaround [3]. This means one less difference=
,
> thus indicate so in our `README.md`.
>
> For `zerocopy-derive`, enable `--cfg zerocopy_unstable_linux`. This
> allows us to use `#[derive(zerocopy_derive::most_traits)]`, a new feature
> upstream added for us [4]. We noticed a minor doc render bug [5], which
> will be fixed for a future version too.
>
> The following script may be used to check for the remaining differences:
>
>     for path in $(cd rust/zerocopy-derive/ && find . -type f ! -name READ=
ME.md); do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.52/zerocopy/zeroc=
opy-derive/src/$path |
>             git diff --no-index - rust/zerocopy-derive/$path &&
>             echo $path: OK
>     done
>
>     for path in $(cd rust/zerocopy/ && find . -type f ! -name README.md);=
 do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.52/zerocopy/$path=
 |
>             git diff --no-index - rust/zerocopy/$path &&
>             echo $path: OK
>     done
>
> Cc: Joshua Liebow-Feeser <joshlf@google.com>
> Cc: Jack Wrenn <jswrenn@google.com>
> Link: https://github.com/google/zerocopy/issues/3428 [1]
> Link: https://github.com/google/zerocopy/issues/3457 [2]
> Link: https://github.com/google/zerocopy/issues/3426 [3]
> Link: https://github.com/google/zerocopy/pull/3416 [4]
> Link: https://github.com/google/zerocopy/issues/3466 [5]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

Tags still welcome for a couple days.

Cheers,
Miguel
