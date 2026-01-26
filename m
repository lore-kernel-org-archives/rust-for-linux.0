Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B4E145348
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 03:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769396974; cv=pass; b=sSh9bYZ6JpaKEG1lrYBHsorJWJ4kkTufXiqa1b7jLL5HnYBT62vTmky3MdajyuKTnEMD5EZBe9lccI8RzPVTXJPCsR3oLjG6A/EuxgahcxNeFndTf+DIqFb5IgCg7uMhglj4925bxdByg/uzn1QdkWdLEwK5fLThXIsVKVGuDfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769396974; c=relaxed/simple;
	bh=K6DDw0DnPj7mvHPYtwH3BVqEUAIu+jK9lefxwZGtH7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iTtfdFin+PXSxackjOJtHCEemQHpuM5b2/E7Q/eUS9XDqWLFF87uvKn7RaRNZJkq1mwCU1VjL8eRtkG6m272FrLsu3n1YUeCCiuodJ6RmAUgFJ27OsM9LkKoYvSsd/sY7xAbhUzT6c+naQ+AUynGcoeLo3ozagCutPOw504GIgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdZbVd3k; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdZbVd3k"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b703e04984so240773eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 19:09:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769396972; cv=none;
        d=google.com; s=arc-20240605;
        b=THyX0GyQUk1J7uX2JLu3uIR0E2EnPCJzL+Llz5Mu0QEuYJd2CoX18V1A8qvnvspYmJ
         V9KmUqtlI5/INm2h0bg4Zj8kW7aSHmOxWi7ZtWYTIMBSxfvKLhDdsoVhv2y6PSPMEXhC
         E+iJhTsitIHmGJD9JQUCV4DYzhoZ5JGLewO1eTHfQwQoHj7HZ/ws+no0kK476zy4F++R
         Blb2Of4GLobDwydq4uTbaVF/FrCdrjweFhb3NB2Xx2klVU/A6oNdox5EmH5vlxR3ocU9
         wiD1nmcNzVASVOMe4f8HUtbW2qVdVzvNi1etyepaM6pfjn+jjDDDqM/P4NvpjErHs6dz
         qe0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R1fUeALujy44mUEAZiAhmpCspOLrTsCLnopvPc5dHxI=;
        fh=PIyQfGL9NBXWB/J2VDCuN5gIBDXTU3rxKesKJlPboQY=;
        b=RO/etvWtqMbrWX2nqxQJrC9PYwDgg1dfZW/Pdpthkre8cO7jTfscGZz6qbwmYvI+tZ
         lMIsSkPXsLO/842aLn9KqrjtwCySy0tpcclBhAoAAtIdLUrY2CNIbbf963KuI9/5xTaq
         3VzlgnExGNAFJoeT3FTP3ykoi/AgnBTv/MNhEdsUJMjwgXHbmB1n/nNlg9fzbBW7uBQp
         PTWMjXygCBPaiU54tmJVSGYr6rekwYp8Xg5IApXVbDqyNUr/G6epAPbGP4K7sRv9E3ip
         mph7dZcoGQj5mwMos1kzHfFPUqSp096S277vSfVCP3Mj/QF+rbWoY2PE4jX/3UARHzoP
         nTaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769396972; x=1770001772; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1fUeALujy44mUEAZiAhmpCspOLrTsCLnopvPc5dHxI=;
        b=cdZbVd3kaWd0ioVrLpJg2AjRqA4iheKh6CQdowlBMgUxrPIb+JHiflLFfK7I3LbkVQ
         kyuFCuZXMbDUmyHIsZErJzMJbgyBNyNEvxp1Dhj0v7ZlsbjzndLJfY/HSnV8Q4YSsl91
         i0JsjgLnbjxsrSCgQabzmVaLZxeek5A0w0ddmtMVofTS30gDe/fxCJ6WfFETyX8PDMGu
         Y7iQ6icOSD7kARNQogpjhL+RoV2ceo4c2Qt4iJOPtFZudYeKqpMt0fnQ2r4Np7DLq1dv
         Kz2/6M9rlvEUA9sHLLf0xnNSUc879p8KCy/2klrwu4dwTmREYGlxGeBohyMP/3PoFTAA
         a9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769396972; x=1770001772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R1fUeALujy44mUEAZiAhmpCspOLrTsCLnopvPc5dHxI=;
        b=hAazq1nF+XZRZyLB8aY56pwuribyGjXyZVzYL1dguWUCN2usz/LBR9ONpbJYn569jX
         0YU8gBCChCc/qszm7Brb8xJeBbW6O6poUgN6N4NgQzW7w6r7DhLbCqh/Aa4FO0BMFfjq
         hsPip5M3cLvr0UE227QeHSQA9cJ4xjfA9MX924G6waIuLksKM0OnkwVUTWjAqJhzoAwB
         hn6g/rWNo5nXxTz2CQMErVnjmss0hgKR4JuJB9ksJg4w14WGerBomLSMBY2wfsCACU5w
         1yRf0cpJ3c4KfXezetKxW5MzwPM3/xMzHI4ue7VGG5SokqT0N3Udqy/gfWfHTjtD+2U2
         JpUw==
X-Forwarded-Encrypted: i=1; AJvYcCX8b6ltZozybrZZqL2AlWUqkQOh89++9OPIeGgrXEyD9rRtepn7M1RE9tvXS/sXb5sFZtCLRvkkj0lbd8a9eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5KZu0BcYYT1WO+ZuxMpFAMWFDuqVVJW0+eMIM/zWuknHn4O29
	Kvqu623HarhxomviidaRiR2rnkzzwlNPnVqXKdCrHoqr531ZcNDRmDwaxM+0ULvjfrB/9UU30O8
	qMnIsGwPDuqI1sumNtRfxgvVfMaKEdiw=
X-Gm-Gg: AZuq6aI3q8J+4nWRv6diZ6qmcnMsRG9ies9sIFA3m/PPr57DVJ1SxlvhGj+BKe+DorI
	bYoPGhtjZPQbdLZhsZPFiv77YsuRYQqcUN8mK8RCYHdN2FBmjxGKQ721v+Ihtz89mW/n9PQyfB2
	xnY9IXBw0tICmDzcFC093+bUntueVlrwoCMwo3f3G6j2uihbofHDP8EdJxaZqrMMXgFNe6iKecJ
	c+kyRUqV3nkOLK1sBpHswsu60G4T++giPN0CWmJlhm/vUdApb9vzybDBhIkkKbX37X1yYSrStlx
	a+g7PL96aYkQcQSYCUE17zFECoxpS1Djtg/DxwY5NoMzZmY8qc9lI7lsvGACJgPUX4a91CZlemy
	HB4ffmGZ6KuP2
X-Received: by 2002:a05:693c:2c0c:b0:2b7:3678:2d1a with SMTP id
 5a478bee46e88-2b7645253a2mr790352eec.6.1769396972164; Sun, 25 Jan 2026
 19:09:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123233432.22703-1-ojeda@kernel.org>
In-Reply-To: <20260123233432.22703-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 04:09:19 +0100
X-Gm-Features: AZwV_QhyJlwqjnxEjcnWt33KyJTo5YK6Z1Wag5jcoj96I5FuwtWe1hRjBgDDTd8
Message-ID: <CANiq72mQEeW4dN0_QvB1=F2cnOe7=56q9mG=y+g1CznASG32xA@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: atomic: Provide stub for `rusttest` 32-bit hosts
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

Applied to `rust-fixes`-- thanks everyone!

Cheers,
Miguel
