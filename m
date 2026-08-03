Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E525401497
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758982; cv=pass; b=Y+/I+IfXDfKg8Ima7EqWOJKC7X0bdMAEQUkm8sXY4CpEXHQjWeti5FePDpCADvGsCfx/ykh+/8nDgmfdB/BYD+9dHSEYukA9qgohCrFbp8KFhLkFhvRbYm1/Ufyz7y7qPt6/NM5n4UZfcu/AoZ8l2XZnZiNGlqZwinhkXNzyiOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758982; c=relaxed/simple;
	bh=ep3vF8Mbkzr+lbr3sbVY3QC2FXyStMB2rm6Ia4oojgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPOOUYZhoQCM9OmjuWcb9BBfKwk3phzTVE9YZzMt7+OUBQgHGZBRnlxp1+Gx4/lpFa6vDQD2ua/1mEm8R4ka8a4/2U6eXB0nEeB+0RF2j/UAL60tfBSjfYdQxa/Vptppu32xm2c/NNeKfit2znxcS0JVMCbv1/5qFKneOfS3TEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCWZABwf; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCWZABwf"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbe4592c193so56084a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Aug 2026 05:09:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785758978; cv=none;
        d=google.com; s=arc-20260327;
        b=aQEyVsKO2P5BKWDN+oWIjGRVTZkYsHyNl9deVeQ2ca2qiwbDQfB4A3uUWQ+nDTk8yn
         YnHqjjb169qT+m+Te3aZiBMRMDb2qccLnPF32dd4M+Bj848bBbFnz7QsBMeBxLWMcdnL
         /G8WYq5FLenc/IjP3tO+FN81r39SF4efYhyIUiMZsTFBOwMim1dGimhsq+Ngu058xvy4
         aNvchnWusnmHFDm5UaZW9NF1fx0pKEGttrChhZKFBQlHjgyNXjDWFEXxdcK7Q4FplIJh
         PWo+AyLQig00QjYDRK/8zPNa7etPbOXt2h1XLKUWadxqPnpk5VV/dFYk898+mC7DPtlH
         uYSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KYvlSgun/krf0XEv53304y0w7MM8kxAVccYbDVtczSs=;
        fh=p8iNLLAFhRtohIjSaXLCClnTPgRGw6jZjgm22VTqg5I=;
        b=KiXb5SJzTwrTFFlucDoWxvsddYEL6aWguU04HJfEWPnL+qwqw7/ob285kbSfgvhnse
         eRCUvZr2pDM5PrLo6Hv38TDBiTZatBADjwlAQD30Ea7JR3J2F0m3JKhPZEPgb+tJDZi7
         ksX+eBz0jQXg1qjUan7n7BnoesiVDes/kD+hNzEDqWeH3jseNSyPgDcrRqV/ZIa6tr1z
         feBFP7CrpDgvdKriGdlIMBqu+Gjogu9ASV94kbWZhuGY0HS4p+cPZz/s9Vc4FC+qxh8M
         KC0Gij5dGvTHGG58FA0Q7ufZZnktTXDrWD870qQCSCWEjNoVAS2KddIDag5OM2yCeK3G
         iUdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785758978; x=1786363778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KYvlSgun/krf0XEv53304y0w7MM8kxAVccYbDVtczSs=;
        b=oCWZABwfN1vpLmrBHTrEiQZOPnhDw9DCnpXLQXN9RJI36h8XuujJQYg/l9ct+QOkTd
         ScGrbHs9isjBgWacqHwBAKxwnrHnc5Amc1isWl6DPwgomo0Fmbsp/aSysauhGy+bWNJr
         pbc0GQEVjtx3564FnbZr2zmJyX+xShdGqRM3nATP2Fx/q83ZL48IVwyuo85r9zpN+e7M
         BW8orulrT2tZuQPZ6KknnICZtEKhuw5WVEXllRLKK/uR7cwInZ+WiuD4IY2FceU2LnCt
         ashE/qrQ/7vSlpsT8etftFz922QRLa3RqTFyCV3SNjVAsL4SV0w2dUzCHLB3IQfWa1y+
         UY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785758978; x=1786363778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYvlSgun/krf0XEv53304y0w7MM8kxAVccYbDVtczSs=;
        b=MGhLHlKaoZ44N6G4IxAfX8Ekg0nPvM2Npyl87Qm5RCAfdgl6d6hUaRT4N8WgdYf0Cp
         m9BWu1NzL+GDw7W3Z2dr079Ts9xlfM3iuwFJJw7WzYPs9wuWZH0TLuF0c9dmxMeQkPjF
         4Q6IzF1OyIo8lhxMPwrUcWDez/tB6zG24fqUtMfZI8ns13ZFsFUACXmwVY6Tb4Dca38D
         aq/boBIh+7z/sdWuuBvYTKoXqpejcNPF97r7rH31BqAfadkOL1i7F2wTMXXoFU/nMjsq
         ucuCSuNppzmTaMQCKKqBQQC96wDvcOyP8aWYfyRl0vPKvnXXXFfAbV3U9ZwYXO3Y9FxJ
         e1Vg==
X-Forwarded-Encrypted: i=1; AHgh+Rrxs0ECv1jBQM6NcOXF6aGVWTJthEWn4/UKvy8HadUdIw86iwg29/aY+ctA7bqmoLzZBHLTVaXF5YTT7dDsQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc3n66ftcxvDDiFZ6RRl5MGf2hxANY0f3yxHqPjRUlU4XB3k77
	SOdiMtDtwtVRfZsFsIPDstbmGUWWDygSfz984qzqIt4BH0XxRo3FklnYkgqrG10oSFsWfvUEM/4
	TXT2imDDYy7GSdspodhYZ7E61pZPunT4=
X-Gm-Gg: AR+sD126q3TBiwlYvX+PiYycVQT/b0rTE2p1+TS3ar81zuQhB61oH/JPJnPPtxdo0J8
	fYSXBVO9aHbxNsEM25C5ldxH1zUnHxk5ml/1/ximQJ8DZEIDUFi6DTN7Mt7ODVmwbZViZsH6VsY
	liDbiSG9ddsEc+LN3gU/1V68H7gqCLJDzIw5oJ39v6bmHFiwABWkIqxczuNeh3jbLGuI1zcR0kZ
	zmSuDbpaIl+YkmwryV4ZUQGTp2P4S/cBEyClHpwKC0pyXup1gJTXK3TlJf1rq81o63mQNOhr7G+
	YXCT6ZTRtZsQxmJFdC2yiDJrbFz/hsUK+v+/RNbus87tecvVKQqRFTPwsjPwEUER//Fs5Ljtv1r
	ePsmE6PyIoQe/GDpkENecJeMZvYMGhS+rLIrr3rqdpM0BrFnHXSHyVmY8BNWF
X-Received: by 2002:a17:902:f78b:b0:2c9:e846:a582 with SMTP id
 d9443c01a7336-2d05206277emr130951385ad.0.1785758978283; Mon, 03 Aug 2026
 05:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719120514.159914-1-ojeda@kernel.org>
In-Reply-To: <20260719120514.159914-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 14:09:25 +0200
X-Gm-Features: AUfX_mz-OsXg_HyB7KA1Tp5Ta2A0vKekPzs4v9Me9KUIubg4UUzCvsvRYoLNjEw
Message-ID: <CANiq72mKE66OthZ7hEfxqig7+9ePmdv+xSWQ4uMSZDhW-qt8DA@mail.gmail.com>
Subject: Re: [PATCH] rust: rust_is_available: warn for `bindgen` < 0.72.1 &&
 libclang >= 22
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Burak Emir <burak.emir@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 2:05=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with LLVM 22, `clang_getTypeDeclaration()` may return a forward
> declaration instead of the type definition. This made `bindgen` generate
> opaque types [1][2], which in turn made us fail with e.g.
>
>     error[E0609]: no field `__bindgen_anon_1` on type `bindings::kernel_p=
aram`
>       --> rust/kernel/module_param.rs:78:46
>        |
>     78 |         let container =3D unsafe { &*((*param).__bindgen_anon_1.=
arg.cast::<SetOnce<T>>()) };
>        |                                              ^^^^^^^^^^^^^^^^ un=
known field
>        |
>        =3D note: available field is: `_address`
>
> This was fixed in `bindgen` 0.72.1 [3].
>
> In order to clarify what is going on and avoid confusion [4][5], add
> a warning to `rust_is_available.sh` about it when the versions match,
> similar to past warnings like the one removed in:
>
>   commit ae64324ad5c1 ("rust: rust_is_available: remove warning for `bind=
gen` < 0.69.5 && libclang >=3D 19.1")
>
> In addition, even if the versions match, check if the issue appears to
> not reproduce with the given binaries, to avoid a warning in such a case.
>
> Finally, include tests.
>
> Link: https://github.com/rust-lang/rust-bindgen/issues/3264 [1]
> Link: https://github.com/Rust-for-Linux/linux/issues/353 [2] # "Missing f=
ields in nested class with LLVM 22."
> Link: https://github.com/rust-lang/rust-bindgen/pull/3278 [3]
> Reported-by: Burak Emir <burak.emir@gmail.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1247 [4]
> Link: https://lore.kernel.org/rust-for-linux/CABwQupNfMAJOGqRM9ke6tj4f53d=
CCsBDKU7Vp+zf8mwk7bqt8Q@mail.gmail.com/ [5]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

    [ Nathan, in parallel, updated the instructions of the LLVM+Rust
      kernel.org toolchains [6] so that `--version` is not passed to
      `cargo` for `bindgen`, and thus the latest `bindgen` is installed
      by default, which should help to avoid some of these situations.

      Thanks!

        - Miguel ]

    Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
pinned in older LTSs).
    Link: https://mirrors.edge.kernel.org/pub/tools/llvm/rust/ [6]

Cheers,
Miguel
