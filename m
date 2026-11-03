Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793703281;
	b=d7CMP27ftnuZCKHZvYQlsXrivP7CvWMMaAdJnJsPXWeWJl7HdLF3e7OIxl6Vm4x4RGXZ
	 wTfYT5A2RTPz5VcBp7Q9S54Ict/WXx8Kg2xPoVU1J5x0xQ2zlZdR32rSMroM8ztEv0jZ9
	 Y2OLUhdv5+nO4kSr6CFhT+4D9GOTRMc2R9iCEa23TWjfJ1pUzHmbRpNuKkc1SPn+TQrjZ
	 LqPUQKnXxNP0LfgfId8WMtC8MOsHimulY1y0PwLrFxenO2nYj6s2TyuNvxc4lAePLqt70
	 jfL5zw9mvRvr+dTdZ1e0x/TQSak8faXsEMUHNKxzU0Wl/dVMZXIkGBaBZB1QEzXgTQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7DDULC3KPzKIDWVmQ+q5ejATIo4Oeo4GEh0Meuzfoe0=;
	b=gVCnBRSeZF7d4mSo00hnbjiHF/vL6xL3npzmEIRt9JrF9vB8Yf0EeLTh7Y3vhPbB1Gcu
	 pmBWmU+q8hj140mk3BcUcZLF080mq4CTe1jJuG4rxqIjhV3K38CCgVY5eak4sBhak0roh
	 ng6UykMekP5Z9k9TOkgIRh6L2svShwqgaXincz3tmLYwXzVOPF3FlKNH5EQWrz1cJtHaq
	 xBMuXbV40sQndQsugHtzLDnSGeFTgghAGKYMcT7bKi6/F/Sd/eV7u2ELof9Vn2Lo9ApUW
	 x/RHJ1fC4S2h8+gvmtqjTlIF1xunUMhTLeM+5QEKiKnRDW9gRzQKJVBc4rGIyYo3uWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0mz32Vj9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A7F606BA6B
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 10:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37A7F606BA6B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0mz32Vj9
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a6ee9c59aso299778eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 02:54:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793703280; cv=none;
        d=google.com; s=arc-20260327;
        b=pAD6HcNw7mgfghrSHULWM73fdOArUkbhGacRcNw3axsI5CjB+VgJUK967JYh1EmAVy
         liS2LwYvS+BMYvgCgjtcGXwp1qVQDj3nBlF/ZxS05U3T/bsZbgmNikmPtA9p4fQ7+Yp5
         9R5+gphnE7bCf3wZ9oyxhvzlZfYZqasttS75dHyQiJRFK5V5bHSSL2iiR+HF1WAx6GtC
         2Tscw9Ml9QJ6CD1dwr5dW9HWa5l9C+qLWtGBCdPGgrTDKETMyVj76GAXyGc1LNm4dXeM
         C7DQx6qLpjO1GEy8mAbcrAUa5APgNSnx7uqiO+Sm/2WhfI5KPSTWRrLTvvursSsyLAIc
         TY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7DDULC3KPzKIDWVmQ+q5ejATIo4Oeo4GEh0Meuzfoe0=;
        fh=X+0/8JIcgIdYxafeKRJV0FK7vEPbD+j0iNVoio9fPmk=;
        b=iYAidwNVS8H8sugLD7ASz+9f1qTRT9LP3tT4NoBHfZnNIw5XZXNgZMSTK8rLHigOLl
         Y27rZ2JCHGRfVNqdvTWvX/yI1Bl016t4BPq3UuYcCATTykRGnevt7EPOS2GF3Ya3NXFD
         +5QDTLiREJCwt/hkFvOmAhe90SVFJeMn2SGy705Wyw8DowGJLYebVa7P9ZlTzyf4Umxe
         0mocZmaYJLOrzvHjHec+l+yO3rRS/F9Jxwtfo4zVOGo55vqQtruMMB+JYdZV/mbnAi5u
         22rxemtHfOiuVB04SBeHyBqv+gLl6B/41lfDI132FarQv4H1NpZ0sIEoFRy4NqI3pBWq
         YLsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703280; x=1794308080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7DDULC3KPzKIDWVmQ+q5ejATIo4Oeo4GEh0Meuzfoe0=;
        b=0mz32Vj92dDEWVl0+Ldipoklb3g26vEtgzzzSG5HQ8ZcphWmNHi6ZC5PtGThqeafnc
         RXLKcEUe6MoUMFfm8iKuqCkqIHp846dUj3ar91d2RlzU8XO83iS4d18LUkPkeLChO3p/
         gI+KfMEhu4wZsgsxEHLcUaRqIz6b6RWDszPZkncpODTj3qo8azw/9QXYnqJcclAISEtH
         6rBfFLQXUxKquh4rMxGOAkQTeIr0IS2T/nds5/LNre0QWyFVDBnWUb8KOeIHxC4PGIcR
         aUCG4E4GcCHXMuMuBp4ieCRHm3NKlt7RRDrR1FBZbbhGOFqdwOZG8NMlJhJwrK/7zfRo
         Mtsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703280; x=1794308080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DDULC3KPzKIDWVmQ+q5ejATIo4Oeo4GEh0Meuzfoe0=;
        b=vuSi/sWqM+4uIhg9mECd3xos9HU+kIt5R4vQdKZ2NuD3u7nneSbANi7NV7ah/P4LyU
         RBq567fwgjghLxstrIOLMeyrnN/spRlPj/sd1M0mYLWQn7OKjfUkMiJBHHSYia3GYQ+v
         rwNza4iBvJNFfuq0dXdpzQ9Xdsss3h+hYoiggy94LZm/j4f97VAyZ5LnFxDZg1OBNcaV
         +9IFlD2tiU9/6zJoZI34C5YnEk6aNXyMFgTugpLbikTjzCDcz/9ffnboPbymeVcoSfWX
         0j6sMaMGUWVH3Y8ZoqFhggMUdpSMRWApBUp+iII6IQQz2/4p+r4HbiEBStjRiwz3yynm
         I0uQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdFVODXhjFihhTudve8MesNKBDiwzgZ3Y8pk8TQe8RgganvpcTgaRcaHBMP4K0eh7kk897B0QmE1NeOqMevQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ocx9f9az1joouJvIIC0CNbQApDnpy1Tgl3CzxOE6U7yuvp4Wa
	E4JZmfRyLXNyjn+Zq428DhxhRmXdRuvRLxhLcqPcY1H0FzvFWGLgJqAlf2Xnfu063x/NQsHw2uZ
	UKQTkap1zAzkm8aJJeRz9nhZUx+iF/5A=
X-Gm-Gg: AYBFou0oQnyUZhrNDD4S4J7I+DbhgKWlrWCgDgaRLo2OJfScAL83sfq7Cssd2AGydCU
	SUq9Plwt6R2Q6SGILS0D3h4Vo5IjxKP0O2N7Urr0QO7kWdPQDuO4pDYyrGg9cYMQpOotQ4ixBsi
	bqiC52JFHdClxfiEKR4Mif/PlXV8iNBLMqdgcF+m4AxjLQRU8zGMV9hqSOkk7sGuKtJWtLBZITC
	aH5mVCw9of5YmIoJtni4qx5dTeWfXF3IxHmOJg2Uecvl2pXzs/ySquLrRGiXZzAaVZXmGQ+k2Ct
	ImGs14dM+vPC+S+huGDNLn/2/JRYHmmXzYz8TypP8GWJw7L0Ox+WyWTcxUkgoTAc9/pr+FsUQkE
	QaoLGRleeXmdJQuboCT08AqK0Trp4jb0rPCN/MVxZWOJYF6O6W+pR/GBottr9YZqrf+aDiE3ri8
	5r14AJuEA3NyC90Ka1X9cNZuti4pjk2cZy8s92KQfibT0ATzJVi6pGCHV5eypAwUcTrFvtIEgw3
	HBEa5KL/TV6QTrF0YAA+rQilri4F8FZIWiy
X-Received: by 2002:a05:7300:fb14:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-36a41daec1emr26383180eec.0.1793703280164; Tue, 03 Nov 2026
 02:54:40 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009224626.1331914-1-tomo@flapping.org>
In-Reply-To: <20261009224626.1331914-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 11:54:26 +0100
X-Gm-Features: AclHuK_pnVrdqrlQyFWno1TFvdl_qmpVucNqyH0UM0ggn10TK4U2_J0q-bNre4Y
Message-ID: <CANiq72nxjrWpBjwzgdWncKECKwzj6zfjS3XC=da62xr8wiSxEQ@mail.gmail.com>
Subject: Re: [PATCH v4] rust: compiler_builtins: Fix silent trap in prohibited intrinsics
To: FUJITA Tomonori <tomo@flapping.org>, gary@garyguo.net
Cc: ojeda@kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, lossin@kernel.org, 
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 12:46=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org=
> wrote:
>
> +$(obj)/kernel.o: private rustc_objcopy =3D -w -W '__rust__*'

Hmm... I am a bit worried about doing this here, in `kernel`, because
it is a big crate with many other things around. The pattern shouldn't
match something else, though.

By the way, since this is here (in `kernel`), do we need then the
original one in `compiler_builtins`?

Actually, taking a look at that, I don't think we needed it (for the
original reason, at least) after commit

  cb7d9defdafb ("rust: compiler_builtins: make stubs non-global")

Gary: did you keep it for another reason? I asked an LLM, and
apparently the only reason it can think of is about an unrelated
side-effect: `objtool` assumes weak symbols return, so if we were to
remove it, we would get warnings in IBT/LTO builds because then it can
see how `core` uses them doesn't make sense if they are `noreturn`.

And now, here, in `kernel`, we don't seem to need it either for the
original reason, except for the `objtool`, but also for yet another
reason: if they weren't weak, they would be exported
(`EXPORT_SYMBOL_RUST_GPL`). Which again points to the fact that we
should probably clarify all this with a good comment or that we should
do this sort of thing in another way, e.g. in a separate, small crate.

So this paragraph we have (please see below) was outdated anyway
already, no? i.e. this one:

> -//! In any case, all these symbols are weakened to ensure we do not over=
ride
> -//! those that may be provided by the rest of the kernel.

So we should probably move this weakening explanation somewhere else
if we still need to do it (e.g. to the top of the new `-W` or to the
new file).

And if we didn't actually need to weaken the symbols after
cb7d9defdafb, and it was just about `objtool`, then we could consider
doing something else, e.g. an exception in `objtool` for this set of
symbols. (Of course, that can be a different patch, but we should
understand that part above for this one anyway).

> +//! Since we do not need the vast majority of them, we avoid the depende=
ncy.
> +//! But `rustc` still needs a `#![compiler_builtins]` crate for every cr=
ate it
> +//! builds, so this crate is provided and left empty. The few builtins t=
hat
> +//! `core` needs are in the `kernel` crate (`rust/kernel/core_builtins.r=
s`).

I was going to say we should say "why" here, e.g.

    //! ....... so that `panic!` works as usual, without getting converted =
into
    //! `core::intrinsics::abort`, i.e. a trap, by the compiler
    //! (https://github.com/rust-lang/rust/pull/122580).

but part of this is in the other file -- so maybe here we can just add:

    //!  -- please see the details there.

(But please see below)

> +//! The stubs are here and not in `compiler_builtins`, because code in a
> +//! `#![compiler_builtins]` crate cannot link to functions in other crat=
es.
> +//! There, `rustc` turns a call to [`panic!`] into a trap that prints no
> +//! message.

I think this explanation may be helped by mentioning the PR link, and
perhaps shifting it to say it is a decision by the compiler, e.g.

    //! The stubs are here and not in `compiler_builtins`, because the comp=
iler
    //! would otherwise decide to convert calls to [`panic!`] into
`core::intrinsics::abort`,
    //! i.e. a trap that would print no message -- please see
    //! https://github.com/rust-lang/rust/pull/122580.

I mention it because the compiler's behavior is quite surprising, to
be honest (even if it is only within this very special crate), and I
see in the compiler PR that others were surprised too. In addition,
the compiler could have decided to do something else, e.g. failing the
build, or perhaps supporting particular cases somehow (like with
EIIs). In other words, it is not that the compiler is forced to take a
particular action or that the system in general must behave like that,
which is how the original paragraph reads to me.

I hope that makes some sense...

Cheers,
Miguel
