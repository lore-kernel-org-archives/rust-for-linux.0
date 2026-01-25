Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2782749D6
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 14:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769351041; cv=pass; b=JoD48cHJr7TP5iPaA32qIPsivw+3Kfxhz0fABIGz7NSv8VmjMwJ5oHHAiH+E092abkOn2Iff5KD3TD5O3MiMZX8lC9SAwNzeovmmaUQsj+JBHPjhJzOFGOEpWfnL4NaEX72pBf3c/w6HlyPQrshuLAw6tT190jiu93nDMzsrNmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769351041; c=relaxed/simple;
	bh=kPQvgJe28ox2CQfy547+PBRSVihKGOOiKUd5wXSYbRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ot5aRFA9gesLFVjAJgrBMQQ2/xNSBr7HDdxNYuiun6UTnJNOZynBc4nKTKmOv/7s0dev/S2dPYXeZ8F3bNOw4BiNxW44w2VS4K5Yo4jDiLpxY+brvPLyJR7mqS2T1NTYAVFPghPtKhE7a+gFMvN6ErjlTtUv6s6hFImJ36jA3RY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isg4jQoG; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isg4jQoG"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1233e05c77bso334531c88.1
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 06:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769351038; cv=none;
        d=google.com; s=arc-20240605;
        b=kvwDZ8PE2JtN5aiJqOGi66So6SarZkwCK33063RAnKOG4eptwwpOdLl3Ux63z1kLPI
         hGKfDO+rSChBLQ2wld2caJRrNq8krSyczGJFP8uznx0b4tPFOk0U900EavgL8FRTYshh
         2aYrr966xRDiMmInCBHQNzEd0M40nM8hZj3aJtxLXSTM2Q2ykj+u0wymkRAs9GmxYDpZ
         I/P8UxLXfayjrl0hxiEBfqdZlOIAubCp2YZQUFtn6ucAiNa4sb6YBTuHDl8LVbQIQFEC
         FoPA+55xzxVizbYfcoebujWVQFB8lr51lbua678wyr8lZP/eWrxPu3eBaoyYaE1P40Y6
         fYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D+Hn4KM6uwjsnUq4VCGNkFIAYOhZygARt/sBuI4xIkY=;
        fh=C62r5TDJNovxmFfi3QVxY14RZ0dG3iggNX7pArgJZ+s=;
        b=WfAVLufBO6vyvJ6KBoatmNRBDKdDP16AOT3bAdjjDWFDVSddxANjunCM2hKljI05uU
         JDsVmKT8gLByRvxPtVVHni6+2uxP7uzE5x3jVHOACY+WwvMX2l0qMCdGcOfNoqDsukbQ
         cMEXPtWkO6od8L7Lk02uRZH7EMeeTAnYYFVsVojPSvKOi0T2Brs3Eo5r+RvhEmvUde8P
         D6pJCIYGeAB5N4fA2Sz99ooRPK6xgGIRNn4/LdfSQ8GeKegwYRwyqBaC2+XAkaFgsW8K
         KmB0XdpLAAcArNyXee4VNwDHjPunO2ghWi/a9XpPAT2HRfA41VlHfHQwNYa0dfiqVN/n
         z9SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769351038; x=1769955838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+Hn4KM6uwjsnUq4VCGNkFIAYOhZygARt/sBuI4xIkY=;
        b=isg4jQoGXlZTvdYc2Hqkbl1/TCWDsx3eHO2FnJMf0T3o1cJQEnNYzhK2eoWW5Fyixk
         E+JSTvBeAyZCLVvzj/rqYi0OZ6UwTnbDaFSTySzAin7SvwwktROhaV83yKHdaC/W6Cth
         7uvUy+7GFEaWdnAmggGzJu8GyjIIq93Q9W/43d9Z7ES/wAS/aowSSxdQtNZVIl12bbwU
         s7nvxMxbT+WsohZbcUuVf6vwISP4ut5E1Hv/bR7EkPkETVScMNnUC3PL13WNFEU0efmA
         g3TU/MAgNfLzUkY8glF0l6S7jOjusVMusKSHR44WR2Zd7WhsulEGDLX1xZSMv1OhGv5f
         090w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769351038; x=1769955838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D+Hn4KM6uwjsnUq4VCGNkFIAYOhZygARt/sBuI4xIkY=;
        b=lqUlIqfB7IV0nnaFEGuA9K+KWhpEBsy8ebQRN3Y6I4kvAJLkSPlCpSNBXpjwb1Pspy
         DVlU75dZeVnebS5rWam73TSpIVqkrEVnZMHSDCg1VTbwomP5LAuEHjOqNwpZoPUb9BbT
         qzoozTdN+tHZtQs2uW4wWlr0OdTq4ZMS4RBEteJAZzFRbRUVdsTVsb4a8Z34fTf01T7g
         2LkXTy7kCExLef23k7DtEWgK49xAPvA3aEZuehYzzQJ0qEQMO2CkcySIxw3BgxNZRYoS
         HkYnWeSEi9zHW5pdUQ2LL6PyOPImJVsKtZ2DVUuw6I0py49AWlyg/fah1UaTil1HFSbO
         //yw==
X-Forwarded-Encrypted: i=1; AJvYcCVFhKSFCMwjXQQ06iJ5yTDKDkArvxreoKveR8zlml5ff4wa8ziZmrpKpZv8JkE/X6jMgNLbHHEAQSpuEunrfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwREw3jsUt8v4xA4VdvCx4G+Z6dlkRinpPQo3oe1+iT9nPyO+6L
	87kNhSrya27W4zBCAAoX74PujmknL5nB8yGLfNvYcAgJaDfWanynyxAc3DGoZgbjUbmMDN3SBLN
	yvFSXzXVVUSy6JKg46p+wlYKVat25uiw=
X-Gm-Gg: AZuq6aKtmN14G4LjWOCyputp4WBhFdynWBEKKNXcO4YI0awv57bnOnz418WDUOT1BVj
	m/g5juN9NGsrs81WmrX0gUYmPYetD5ISp0TqlwpiwKs77Ru2EjH94JUcOynWo8zcCNBguO2RlE/
	mRUhovcPaQJK6ezSdLcXvnj1LWYxuEJD3Ev+j6xyteQjMGUAJXxipGqIJkQhuFqn5+sxm05JRFu
	Z1lg4aclkuz/KjlrqQveo3tRysekdMz9x7fzIGRRhPuSmdCw0ht1PeU4tokCCN8QkgRyyuL0EqW
	8NEUUM6M6eKdl6a9KQZy84Zmj1hWLHVELwvkcOqEv0Bitn1U/fhtr4q7z152K5HPhiJFGKZBZ/g
	hnRPlDP22+8NYG3kysywtz44=
X-Received: by 2002:a05:7300:fd05:b0:2b0:4a1a:657 with SMTP id
 5a478bee46e88-2b764827c0amr395815eec.8.1769351038208; Sun, 25 Jan 2026
 06:23:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123233432.22703-1-ojeda@kernel.org>
In-Reply-To: <20260123233432.22703-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Jan 2026 15:23:45 +0100
X-Gm-Features: AZwV_Qhg6eEx-UkSkKUjlOjUjy3l7sGBW9zLBuC2APMKxVRF69KWe-wXxD2MwjU
Message-ID: <CANiq72no9wwdXa0Ct0c0P+6+_4WhBZ3GChTFHth8EeuCFSzAOQ@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: atomic: Provide stub for `rusttest` 32-bit hosts
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 12:35=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> For arm32, on a x86_64 builder, running the `rusttest` target yields:
>
>     error[E0080]: evaluation of constant value failed
>       --> rust/kernel/static_assert.rs:37:23
>        |
>     37 |         const _: () =3D ::core::assert!($condition $(,$arg)?);
>        |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ the =
evaluated program panicked at 'assertion failed: size_of::<isize>() =3D=3D =
size_of::<isize_atomic_repr>()', rust/kernel/sync/atomic/predefine.rs:68:1
>        |
>       ::: rust/kernel/sync/atomic/predefine.rs:68:1
>        |
>     68 | static_assert!(size_of::<isize>() =3D=3D size_of::<isize_atomic_=
repr>());
>        | ----------------------------------------------------------------=
---- in this macro invocation
>        |
>        =3D note: this error originates in the macro `::core::assert` whic=
h comes from the expansion of the macro `static_assert` (in Nightly builds,=
 run with -Z macro-backtrace for more info)
>
> The reason is that `rusttest` runs on the host, so for e.g. a x86_64
> builder `isize` is 64 bits but it is not a `CONFIG_64BIT` build.
>
> Fix it by providing a stub for `rusttest` as usual.
>
> Fixes: 84c6d36bcaf9 ("rust: sync: atomic: Add Atomic<{usize,isize}>")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Boqun et al.: in case it helps, I will send a fixes PR early this
week, so if you happen to want me to pick this one up with the rest,
please let me know.

Cheers,
Miguel
