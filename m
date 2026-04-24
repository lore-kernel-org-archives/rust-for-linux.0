Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEAF363C4C
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 10:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026404; cv=pass; b=fJIvbnR+IkBGOdJvcTzYy3W78KsNpUtcYFS9+hiZNMLATw2fAsFuYfCSJvKdz5tbbCt9xDqy+rzKOrha3qOcfmUSHM52aDLChsIs8AL97FqrkSMQZ2os0z6UpvRsaoxSzszjpFHyrfIV0WYpJEIvAJL1cn7H7UkAqt2FDkt1x6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026404; c=relaxed/simple;
	bh=akrD/7yNgCJ2hr9qe1CwVyZoBGQGlAkQEpZNlJzWaec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9qI4YviLSP4/uzXGFxR/BAmdU5asW3ls0F1rpk3MNFt1YRE9n/RdErtWvEPrdnPDQIABq98Q3pHkgbh/75eOpZs60WBiUWRL9GC4GZ7bvjMNOkM7NtMCk3HfoYivuz5ShV9kLXqWpxAE6vX8Gp5UuT96v0t8UuF2K7kjfAVT1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXk35PTm; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXk35PTm"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2e6b6167d7cso355588eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 03:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777026402; cv=none;
        d=google.com; s=arc-20240605;
        b=VQOvmxhcY3UESbsrOZjaki58XXmgHHMymHaHCLSJbg55BLlKfATUKQtGhYvE10p9EV
         Ga2TeGoXdHZstpCM+JSJEJalLx/5FnYXutv6SenszYwjstIMxEeJImkOs34a6m41UXUK
         d8nFw8SGf7mErG5iwLPxAOzZ81544vKTWt08BGD7JKB1QkCGQTu8VTeAs2WUr4NB/Foj
         URJyqkaSREiaQra13GeZTbMELsHj75CPSFqe0BU2CHhWXhthLM9WU8Uecbo2HJ9+E26D
         xneZcJzZhOSc/DsZgjHff6K1zvfiIdeIIUJoIRHJMztr3WEzrxn9n8D59gXsbXRlfzZV
         SXCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j0xKFe1jeJhx1ESLTH8WRadcy9BjbQbmpsMi2ljEDVs=;
        fh=joI1gy9ofVMo86zxpGJZgEzZen23KW27gBIf7OvAqHE=;
        b=NG6wZZUlv/FbgLw6d4mwwAN+E+VpZj/B9sylOFl28RQ1VJItwYpCUZrjkWsgwSrgbC
         Vw6pLFz1hFQEW+X2E8dGj6sZf/Ob03oKxiG5mv8E8t/5W33k04/2PzgXuLStqCqfGpMp
         CoyH8+J2HNo0z+DjdkkaxqovAG5bkWi2Ef4VFBinWYpJh4GL0miELSRcOOn7C1d3KRY3
         Ysu3FMDi62Br/+WObd3/R+3kYMKLjrAMqxKYUku09yO9aOGv+P/jbgj4A5ZTiHYHCWtr
         qX9QUPJdsmJstzgWSyfFqQsDGJzWmvKxuKnO/CfbHjCuVOdj4BFbb0FybpWa9M7Hpds9
         oOxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777026402; x=1777631202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0xKFe1jeJhx1ESLTH8WRadcy9BjbQbmpsMi2ljEDVs=;
        b=TXk35PTmOto1JDc3Q1rbc/04vhm9RddZYPrM819AtuB5kgXpiM89UnxX6el9HA1noK
         OQMjQUi/1sEYGokkhixaLGe7Vwr4ptfTyEPpzl4Oi0MGgYa4qiufzeE7RG+faJC/QcDd
         JvYgGobTBu3EU5zD1LPdpEuHYHW5VWT8aBK9zmAlge2PVCBcwldMIfFHA9JBX/0g3fZ5
         Rv1fWslvAxfc+3hpgnsg2Psod7FCfV6lG3l+PX0XsyQzaQBqiGMDZjR9TvQDJ7i+Sj6J
         jSUGeb6OafRzzPZutXosUMR4RiExEs/w2YB28XKTABpjJpotpyKi2R4YJeL9GynhhPyQ
         1jXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026402; x=1777631202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j0xKFe1jeJhx1ESLTH8WRadcy9BjbQbmpsMi2ljEDVs=;
        b=Cbs60rvOcscsxEqjdRFoS7abeKa3IjOVAGcZ1f+MAGPmDtUcRBWVnke7qxsb+2hxHe
         UyetNDstZwbg5TlHWY0ASB1HB6fMw1DfTpXmbQCzf33OQyh9ygLRtK4GlX0u59fbh1+d
         tqoETi92fPq78Qm4/D4AH1nvWaRucX3pdSubJaox7ggpXG2y8mFKRfqM6eu0IUdt7/pw
         s3yd2kE4pdFcnua9sWnNsvejqAefy4UKd4uBnp6xBS2MtgQXHtxbHtq/PO7BJ0W+zbLc
         m6mOl/e6fHwo263pepsqBt6gqKBtcMpuy5S1Jg/YE9oj6FmVCygGTD1QwPE2kyetQHUz
         k7bw==
X-Forwarded-Encrypted: i=1; AFNElJ/S3n6qJqF8dsaH2ZoFFEjH3ROT+sVPvdG+So3V1owYqhJNOUVbktNZxWcMNj6Cs3nwt6Vx1rn9lprq+6TZIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT4Lu9At3NmuXkCyljcpUpdmf61iBbQpeJxbhoCqCZdgwryHO/
	DoBvoCFhiJ8QVoaVGnZDdck6ecW9lUkGrSaLbRnhIjrWXpjZcbvlqUJo/K0jdPbJ0elHDrpg1Xs
	CgcNi9ByiVIIaHzrgRa1MiN0Irdz8zEY=
X-Gm-Gg: AeBDieuUtA7eA79nYtgpqwvio6dEB10otJ8Tz10TYeQB53GHBXc1XgB2vN5KVPpCVX9
	MLPiDwetI6oDpbC0aqGdb8iUW+IYenf7wgeqqJN7uAfJUL5O90ilufwKjHFRTQ5MH8vZn7BCTiH
	n7M4/aNiFe4wxsTZ8IsizMgVgYVLl86URfWcQ3ImXVwlzE+8C41kPJkI30JYOSh3IY7b1GTv96g
	I51DvfByaSQ/4FXLooLx1PuozYufRZ5M80EMKzpUxevdZoSfoTY5fg8fzg5+kVRslqHUIhLm8cC
	eyeqgr8m6AugKpvAOxjnGN/ydrXTuZ8nc039xkgzsDBjH8bOpWl4jUHYoXTKjLKAY7UnxI7uoWY
	BpuEZvEJWeL+QWHrgBZgae4YXi+ksf59WNw==
X-Received: by 2002:a05:7301:9f03:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2e478a2e850mr6554300eec.3.1777026402324; Fri, 24 Apr 2026
 03:26:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424054742.45832-1-mkchauras@gmail.com> <20260424054742.45832-6-mkchauras@gmail.com>
 <20260424101425.6bde0e17@pumpkin> <aes7L3M1d_LvvGKa@luna>
In-Reply-To: <aes7L3M1d_LvvGKa@luna>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Apr 2026 12:26:28 +0200
X-Gm-Features: AQROBzDET6d-0hjNl0HV899j9TcLUcNjD1kIJArKfIFhDWI5iKiWhVLnvOkXFjo
Message-ID: <CANiq72nsYy-EUSMynykb=6QyR62M7hT61RoTO3F0-vw1oBMh+w@mail.gmail.com>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: David Laight <david.laight.linux@gmail.com>, 
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, 
	rostedt@goodmis.org, ardb@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	tamird@kernel.org, arnd@arndb.de, nsc@kernel.org, simona.vetter@ffwll.ch, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 11:43=E2=80=AFAM Link Mauve <linkmauve@linkmauve.fr=
> wrote:
>
> A possible solution would be to change the core crate to not divide
> u64s, but the last time I tried to do that I couldn=E2=80=99t quite figur=
e out
> how to do formatting without it, maybe I will just open an issue against
> Rust.

Yeah, I have some context at:

  https://github.com/Rust-for-Linux/linux/issues/2 ->
feature(compiler_builtins) and a way to avoid certain intrinsics (f32,
f64, i128, u128 and 64-bit divisions/modulos).

We have discussed it at some points with upstream Rust (including
related discussions about having more `cfg`s in `core` or a
`cfg(linux_kernel)` etc.). I don't think we have an open issue
concretely for it, apart from the Clippy one to flag the use the use
of the 64-bit division, but if you open a more general one with some
details, that would be great.

Thanks!

Cheers,
Miguel
