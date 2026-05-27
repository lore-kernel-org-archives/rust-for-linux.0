Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7373D1CB5
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 12:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884014; cv=pass; b=Vp9qr+7rGWtugyteaKQmxqFr3H6jA1PpI9dEddgvzsyg7BCfxZaWNIFA1qpWU7iL1YWwP+aLLpCBBvMGm+/aKdIfgb1pQmrOsowhemaw2Dl39tj4YvBFw0RFv5L4J1DEDVqFJybYoAKL5wxAY0RkuooNCi4kcrYruDHv4SoXFcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884014; c=relaxed/simple;
	bh=NAp+HjVVXVjttBdYWawgStYcjpadZmRU0himGf6B3NU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BY+PDMACjTzPBl3baYSh69RtFw15uw2KpYi0huLxvET9lcUTgL/3p+zUWDshBw1S/AZfEI1Z1iP0g9hZX+D2lNLErQp109ZNvUJOYT2PnpId8D8IsV/AdeXA9Cgoy1UayhhSwz4lU5eb0u9oYvPxe9ghxe4rO31SR2jRhnr/R0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlP+rVxF; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlP+rVxF"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bda3b4318dso1187482eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 05:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779884012; cv=none;
        d=google.com; s=arc-20240605;
        b=JPPl0El/1iIAM35Ler+GGHxevaJ6XkyThHeRqwMwWL2yAC5U1NtVm5BJkKbptxtQ4m
         i3UTZYtxJzU44sYhK1ul6SuibTVNF8rv60zK1KcHsNOIz7zuvJPwXZSm9vDxgz1ZugfN
         cyyV1zYJaWX6Bl1ZMhonP4ZHSpvriDg8SI6fk5U6mWfXIK268aS97R9QuBEM8F4nqA7F
         wS00uX0nVbXhrwNjbgYREPkupq4cH7zCIjseLvli35oBHeh4/hwn3YQsxBhHy0hAw44W
         fegmh4u8R3kq5t3XxeX+6VEwadmecLljg3CbEHmpSz2yeel27iLR44YshUbrFH2ximKN
         +VYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2YmVqv9okgQcHxUHPq09ZT+qHm21oC1V9ne5icLLd1k=;
        fh=pfU1ZRLSJ9iehUh1QJMuY+asczYfPQ/0SiW71fzNS68=;
        b=fYaexOMPvXn/lFS9+octqp9TTh0sOjkzEIRwNYWJML/3qxAkAQiI7HGvuHaLcPuVjD
         ASjjjPjCHB85GLVYXSMxfuLP0z9tz2cHY99dIqM+e/bJPymdkvlvNXCpxNMHUHbzo2/R
         1ktb1aaPvIM3NdOnIuRUqYRsy05jHZLEN0mzuLtkp2WL0/1YQKEEjFQxT/nfF1+OT5v2
         fNbSMdRMgWrCHqlxEpzPEex31rbLwg7lN5J5nVKs36a9q+Wa9IdKg0suts3alcML4L+L
         rl8zai5ITBe3cnalQAkYz8DrSN18al1/LnEOB23aQ/x50jvnbGCLE63VOWO1PFdoGDM+
         +KDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779884012; x=1780488812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YmVqv9okgQcHxUHPq09ZT+qHm21oC1V9ne5icLLd1k=;
        b=KlP+rVxFeyGv/M0Ah1YKQ16Fb9uLpEw1mqTL5yMFZlyC9mcxCg3MEXCN1IMkFZhKO7
         jRzz3nlsbDYIYMZp0xb4UWIUSGgLGQ17yr1OCZ3Bem3tKcIHgWoglie/0WuPC5uJk5V/
         50Oy7lGmDwbwULJsWfCl4omqlAmCtqrxkGRt7L5Yavo5WlT8gnLbe9nF7+IBcFpAw35K
         Sl1eZshALjpLIliObqavAreqC7whGSL2ewgMJz4oauxBJQs4OTKBOVD65YPQBXS8X3Fx
         m039oFGKiVAg6hMFFq5TVvJdn6Z0rcCiMcnmPTrM/ybN09XohpTIvX2UvP/5NLG1SDTq
         8/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779884012; x=1780488812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2YmVqv9okgQcHxUHPq09ZT+qHm21oC1V9ne5icLLd1k=;
        b=LW5DyxL8a5zwsMS2E5CnlE2TS3dk4bJV6046kyldZ4P6CLuOAn/jIOQb67i7VyK4/S
         ktmlJj1zlzzXWuqVgDQGtDJnDrEQ/PTCUEL5qZ+FGK17djANT+4s2yRK5puQyDqaAD2y
         ffnJYmiJ3Esf4hNhZt5/yspTYJp/uapTKXnzDMzljV5lwZA+c3SkEvJ7GsuEbiqlCvNK
         RNTJ4K32mBGqlgMB6JJiSlZXN5rvQvoEPflu26aXotjWIUKtk/lO6CsXITnNpqF0QhFP
         FPsJbMZaq5ZSpSanLCCjqkgkHt7fEneukD4msgzg1GIBG/8WYAw5CSOZjP+RnoqpU9P7
         2Ewg==
X-Forwarded-Encrypted: i=1; AFNElJ/umeGe3OUsVSmYDo5QMMCdWB6SKN9uQiXaTW9Mrwzba1w+zoIoNoKluWJAL66wsU27Hj9bo/Eo8xnw1vhYkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxLkkxlJRDW1oZzHFh36V3OKt9N3Bb7JqVpf+ynYJRd5b4iDtm
	wjWVJnmgR91KDiRzXSckOR9nZSWiykwo0KHbxLEl3+CjPnjcaviyBMws+nLFBFRRv+MkyC4xyYG
	brwKAhkc8wAuWWUuc21PIU4+e43xwbA4=
X-Gm-Gg: Acq92OF6/3guQKec72g7GZe/uClZ4cEN9WlUJOUpWsRmzfb4RobBxWsopDJlSVJoxCM
	ef6PK60b06UIUDc1RRFXBIG1T78Dp0jWJaygYqZxiZmCKWCbOvkZBgB0jUPxZiLFe5dcYAHR4D8
	qexgbEwPIKIN3q3/R0UHNk9bUep2xRr5dd+1NvTsDENahFcIvXJA/6uUna+k5JJC9VTeApkmtqX
	zdX1Jd9Wg2236l8RumC9+xMfO9uv3vVo1IIlIs44wufkVeqJpdUVmhyatgLtzayUO2yqvDo0uEx
	ep7P5pSBcDWVBSVztGocqo/1pQU1VuFoJHyAMuZ6mt7goB4C0ir2wVrwUjdqixVZKYVUROZ0CDU
	iTxP3YYN2Y2mXBTPxAECEUIdjIXMuPdbmnw==
X-Received: by 2002:a05:7300:df44:b0:2e6:b55a:76c9 with SMTP id
 5a478bee46e88-30448cf0ceamr4348652eec.0.1779884012079; Wed, 27 May 2026
 05:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521165622.279953-1-japo@linux.ibm.com> <CANiq72kT7YEuMaM7wkOtCz8ZqEXbPLniA-x4L7E=B+x0zXt_2Q@mail.gmail.com>
 <20260526161312.19291A8f-hca@linux.ibm.com> <CANiq72m4GVWFYqnxNtCHTPu7XcGewHB5LNwOoayTfnXs9pPbNg@mail.gmail.com>
 <DITEIKBF8WWY.FAJEEBSV71OZ@garyguo.net>
In-Reply-To: <DITEIKBF8WWY.FAJEEBSV71OZ@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 14:13:19 +0200
X-Gm-Features: AVHnY4JQHTxFN2TRtqRY-ei3MdKO21XDrZtHtYMBCgQrYDq0GAC_fHE27gs-GgA
Message-ID: <CANiq72mXAZc0sNM7ShX8VDVs_7zJddawP-e=wt+ERr1YUCcWUw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] s390: Enable Rust support and add required arch glue
To: Gary Guo <gary@garyguo.net>
Cc: Heiko Carstens <hca@linux.ibm.com>, Boqun Feng <boqun@kernel.org>, 
	Jan Polensky <japo@linux.ibm.com>, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	ojeda@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	rostedt@goodmis.org, ardb@kernel.org, linux-s390@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 12:53=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Looking at the functions and the test case I don't understand how this co=
uld
> happen. Could be a miscompilation?
>
> Perhaps it'll be useful to provide rustc and Clang/LLVM versions so it ca=
n be
> investigated.

Yeah, as we discussed, it seems due to s390 emulating 1-byte `xchg`
with a 4-byte read.

A deterministic reproducer is e.g.:

  make LLVM=3D1 ARCH=3Ds390 defconfig + KASAN + no MODVERSIONS + RUST + KUN=
IT

  qemu-system-s390x -kernel arch/s390/boot/bzImage -nographic -m 1G

Cheers,
Miguel
