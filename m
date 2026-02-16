Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7712B15A86D
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 11:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771241350; cv=none; b=UnB0/xsF9CZJS0ms8nMxqH6uu2aAeWaPzdxqKf0OIE9p2KeFY3UVqeWjS3GZiC9R558FwJIWQaBQS4hNdOq9XjIBGBuWItyP2SKx/NAhiA0PtHjvtOAjVwAsp6mfAiLxxKJUMhVDjEoWF65KlSBwyT2bLAJ4rRz96mq+Y3D9Hqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771241350; c=relaxed/simple;
	bh=rfGNZt4wfm2MdI7paUPyGtc4ybUASyTm3360vtReSHs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GxMFAtHdtYSqz35odieW5T8Wx5P2afzi67qKaRdCqldHGwZFYFQrX7PQFa07jeVR2JTtzcr4dPm3QgvrP5z/DXgDAjNafiFa+ObkkSoenzJld48KmJ/PDk9w1Cpp6ybz7Cgr/TjneoZ2+F4NOvx32wRjRnXHayUu4ZpP2MMGGQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NhSoLJXb; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NhSoLJXb"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8861544696so325505666b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 03:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771241347; x=1771846147; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vo1OOIvCISDxl5O3fpiaDD0IWyIfX7wGxG8VPYZFpaE=;
        b=NhSoLJXb5+wQ3rXesgYnIcrBSYag52n1o/LYG8bQep1F8/GAYLSlmUOu6PuMafFO3G
         BJQEVil1Mv805XVwMzfVglDRbO2qLMwh2x2OGdKSrRAo3tE2T26ffZHlWCwMNUgIBuRf
         9rs8Q8jqAmwDXceBhBIpSnzvefl2vtwgOR9aTQu4zRV21WYaTUlR3f6WfE3vLH2PP8Oz
         3J21F/M9tEqPH2dcnYi63wV4sYkfpAZuklRzV/rvnWsWMZtfi0jpaOpBz2dC3FdqsVmm
         VtU5IG7HYC/FdShSM4R8yaQ5j57Vs08S2I+NEhCbJg8Hf8Sygaio5qt2xHH0HF6wWab0
         8dJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771241347; x=1771846147;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vo1OOIvCISDxl5O3fpiaDD0IWyIfX7wGxG8VPYZFpaE=;
        b=k0B3YXZCt513tSLIGfLA+ULbbWmsZyKnJepQJhaRw3i2D3aQJbEFLC0k8i4uA6rnFR
         WESMLxuplNJt4BFVAzzG4dDWSyB0HPN+Z8gsV0nYMPJkjzbKjfNQQa7FDC2Y/mLdBB6x
         xRcYFWIvR2W25TKB0JA3Zp7x1gIzE9mGav5bNH0J4pqDoifGo9Piyi+pG9yTdT3nnnSj
         XNAZN9+o/xu25tgbAhWRvClHHdvDDpCPjfXT6cylfVEX7gqAogWKTIX6y0JCtgv6JV5r
         1F49VUU4E1W/6zartVPpV0jMOTh3iJjvNSMAARvzM/dcNAWHv8hnu5pdxINcvF3cTPdj
         hUog==
X-Forwarded-Encrypted: i=1; AJvYcCULak6Gaz3dWpecxK0WQ0cJYBR3r4yx0wJYDp5dTQFV3xvl+NAE/zlqIFqJoLj3XRBsryDUwVuUjKaSjObxGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDjWXh+zP8K2YxEPgCqU1pUBPvhhyHqiHh/HfuvTPRqMtMuo3S
	0ZOmqpunTywPcJ4JqlLtcPgXaiQ/xsqrWb3xz0nIRRqagDj3Ny7tSilp91XRPCUj5WlPZNp0/9h
	GmJESptKO47KjqNm96g==
X-Received: from edqp10.prod.google.com ([2002:aa7:d30a:0:b0:659:474e:caf2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:869e:b0:b8e:9e11:6615 with SMTP id a640c23a62f3a-b8fb44d5e4fmr626744366b.47.1771241346405;
 Mon, 16 Feb 2026 03:29:06 -0800 (PST)
Date: Mon, 16 Feb 2026 11:29:05 +0000
In-Reply-To: <aZL-JO3950gc9YO_@probook>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260204210125.613350-1-mkchauras@gmail.com> <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna> <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
 <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com> <aZL-JO3950gc9YO_@probook>
Message-ID: <aZL_gVBFVzMjQkYK@google.com>
Subject: Re: Rust version requirement (was: [PATCH V2 3/3] powerpc: Enable
 Rust for ppc64le)
From: Alice Ryhl <aliceryhl@google.com>
To: "=?utf-8?Q?J=2E_Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>
Cc: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 12:23:16PM +0100, J. Neusch=C3=A4fer wrote:
> On Thu, Feb 05, 2026 at 09:12:01PM +0530, Mukesh Kumar Chaurasiya wrote:
> [...]
> > use rust version nightly-2026-01-28
> >=20
> > the latest one has some issue. I just raised a bug for the rustc
> > here[1].
> >=20
> > [1] https://github.com/rust-lang/rust/issues/152177
>=20
> Another reason to use a nightly version is that Rust inline assembly for
> PowerPC will only be stabilized[1] in version 1.94, so current release
> versions fail like this (tested with 1.91.1):
>=20
>     error[E0658]: inline assembly is not stable yet on this architecture
>       --> ../rust/kernel/sync/barrier.rs:19:14
>        |
>     19 |     unsafe { core::arch::asm!("") };
>        |              ^^^^^^^^^^^^^^^^^^^^
>        |
>        =3D note: see issue #93335 <https://github.com/rust-lang/rust/issu=
es/93335> for more information
>        =3D help: add `#![feature(asm_experimental_arch)]` to the crate at=
tributes to enable
>        =3D note: this compiler was built on 2025-11-07; consider upgradin=
g it if it is out of date
>=20
> This is somewhat at odds with Documentation/process/changes.rst which
> only requires Rust 1.78. I wonder if the rust version requirement should
> generally be bumped, or if there should be arch-specific requirements
> somewhere in changes.rst or rust/arch-support.rst.
>=20
> Best regards,
> J. Neusch=C3=A4fer
>=20
> [1]: https://github.com/rust-lang/rust/pull/147996

The MSRV is planned to be bumped to 1.85.

If it's available as a nightly feature on 1.78, then you can just add
#![feature(asm_experimental_arch)] to lib.rs, which already enables
several other stabilized feature on older compilers.

Otherwise powerpc support can always be gated to require a larger
rustc version than other platforms.

Alice
