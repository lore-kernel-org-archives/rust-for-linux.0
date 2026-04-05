Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5694376025
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Apr 2026 12:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775391233; cv=pass; b=X/5AFdG14Ta4U+DJfS3+zeL/ROHsPkA+wjEBQ/yDzrJFV3rDDG6bFZ9LSHkjQUC9opcuzh+0jVgTcFz6L7AG9M95TAHNYycpK9xxpus1MFXb75sxsqRaJBAq5kEOBGFlF1C15CZJKS8vvz+3PVj7TAvf+AqUpF1Q4p+pP4i35ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775391233; c=relaxed/simple;
	bh=H+YVCHTVAvA5NXsJzWdOYFMKuBI096Y3goWRs1E60C8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYJDfyaukp1/SehP91iyNDk0Rm7uINKUU9sC7KvYpLpHHKerElZmyQ7Wu4bHgtbQP9n1Ao7ZhZD1yMrhJc9/0am0rtlUyGVepQRjDaf9GT2LEtIoCaunjcT58XlcgmE5x8GIyVA++zc71X8i5dxwGUMMelFIKu19ztYCOiTluwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oMGve+vT; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oMGve+vT"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2cad171900dso183955eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Apr 2026 05:13:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775391231; cv=none;
        d=google.com; s=arc-20240605;
        b=L8LfRQ6MTOpZpF9VObRx1i6Ld/v2ysgP0GCcGZxXU63nNPIvgV4S7tcj+yFJNAw3yk
         h5KKVGJ9OWpGwd5Rq9mu1A1mQ4LJI4l3BehmC614AeyXyugkmfSHTalZk7kzBafGS9MT
         p81f9rI68u/+SVWk0hpqkexDkluOgZ3/Xxj4DgPskQ32IYDSmLgdmjVb61jRPvzEukc5
         mx1PkvQBUGL0qf8uIye2YUUVHlYyV71woyp+mI5P7zBRkN3qk8vbwKCkQQWrRDPW6tW0
         JVdeKXIvaTg98+IzMJaZmRJ+hiOhrX+1swt72d7TWlT47U7DfmjSrG5SFK85tU1U1cj4
         GhOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nqA2JXtO49oTQJmE97lBlEiYfZcVoYrYPiOT/3zlhJs=;
        fh=PIevbbxCmhzQxE6rASGioGlPSGt3V9C9PCtQZtQUuf0=;
        b=dMpsy51TKWyLcKp4TSMJ6/z1CH/NegxSzE5EviQweCTrKXF8uA6fbixTiD5je124Af
         kHTKJsyew3xw5i0TXXqCdI1Rb7HuLOW8FVWHtwAk+SldhNMymHbn/JZhOjw+y8DTMSFV
         t7GmRnj/Mwx5BZR7bEFA3lPvSJiugXMSRkHi/9WjNTthaFOYbTEo64aWD/YJx1bEt4k6
         1xXNS+3/ryhwaH0ddHShXSnbipm0/H9sSh0Wa72XhgE4EFYYLR1+AE2Vhp7/I0W2hGo9
         HQzdJpGynjzq1j+EzwJf3bjxyXFU6BQklLhkRqY7QG4f0ICZPrF8Myp0jsVilqDGR0XX
         l0+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775391231; x=1775996031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqA2JXtO49oTQJmE97lBlEiYfZcVoYrYPiOT/3zlhJs=;
        b=oMGve+vTQyZDCh6RhJtJveOKNgaf9IiaVgcHiNduaeqEtSFaCNpvFIUhhfEXXq8HG5
         klKrARx4qcGtXZybLEn8FFyc+rtARCPsXkXYYsGBNZJuEpwAyqllVdO3V4uwm7V8eLq0
         ufavP0eGaz8asYR4JhCDCqsQWWuCIZ2ubIA33fiwSmCaHuh7rCYEIGDGJ5Tn4GR4+7k7
         L+lCB00bCPdbWjjJy5Vyrxri+XoRsPHcUS4w9cPRKZOPALYVMlj72mrtSDsi5dwyvgjG
         X4hn910KqwMGtMStguRM05513aFHG4LnCpa22Qnz3pKRhiT4Jwq8ai1C6EY7VSfn8dBW
         uDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775391231; x=1775996031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nqA2JXtO49oTQJmE97lBlEiYfZcVoYrYPiOT/3zlhJs=;
        b=dXAUowLoIrXIrEto3l4sTN4X+v3/+SJUuSavwDHOi6xNNCdJP41pJGYPOMGsW0ZCX/
         P0kiGrDTfwvSWejfsP6CUgy/hmE4g6tu06MHMMajvvoWaIbGzo3guekczODNbZKV/5nb
         ndcSYXWOIzMaLZrZuFDgkKtyF+S1r9aXR/A62gjZxVkAkBrYxtJ88SLxlFkZu09i0+FJ
         EmBnWaYwNAdi0l2g+Q3KBPAn+rNQefzVGqp0blixKdBURWd3v4ltxIEY7B52tf63y1v+
         tf43k91Ok4NQad3nIjk3f+MN8FMa8fQu8FzxFDr25z0z5kzqB8ljcDhWLCyrXxSYu4t8
         q7jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvnNv2HZ+YyHR+x3ZoF58SWPXuFTeNBU4yCi0Bb417OxyivkN5bOIMe2iOqaYdo4CNIdHRf0pTKfzRZmhBNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYvEiiMe0M59tMIy6PVqO/LSvAGgoNuxwWvCcCczPk4meMZ2Th
	+u5fdyGQkHZe+0D5yElGqQhanZ3FZjMmfbEs+c88FG/iZQf+J+hNkRb6BTNc73b7vLPliMFyzRl
	0Ezs2CBv7sRQCrgKIvzgTQDGQU39GIwM=
X-Gm-Gg: AeBDievNuRW9IjZr4fDXjUhcE9RO6nLUUM/YKNRDdbHS7dGQELgPMnbF0qflNzisO6M
	s+c5kj0YuS8yv+p6IMLrlWjoCUdUthcpjLU8F0JzYpuZlWraYd5Oa3DajivjceTRv8xxaUuREQK
	KPkzuhCn9+qaZevV8aofmdpflY3lHCRChUlpEIVS49Z2cSjmLbPgeZLjv5h8GkCM2lxfzUcE68n
	epsY91oR463boQdMHqjmYJS0uEQ/JYlaDw/+HEEsg+foMEYS19RsxF83yQMXBFTylRkxT4ew31e
	fDushPiHdqs5GZdcmt2ZW5RHNRzNCD3xb5pd/d9Q7h7rkQwj0t2xgBvwMdy3toIUWAxRxe76W9r
	L5o6surQow9xUXdhwBfLQeUg=
X-Received: by 2002:a05:693c:2c06:b0:2be:2912:ff65 with SMTP id
 5a478bee46e88-2cbfbc7d828mr2158998eec.3.1775391231326; Sun, 05 Apr 2026
 05:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404212831.78971-1-jhubbard@nvidia.com> <20260404212831.78971-3-jhubbard@nvidia.com>
 <33128320-a33c-4020-89cf-9b8313b7d9fc@nvidia.com> <DHL6ZYVYIHI3.2SXJQ5VWKIU5T@nvidia.com>
In-Reply-To: <DHL6ZYVYIHI3.2SXJQ5VWKIU5T@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 14:13:39 +0200
X-Gm-Features: AQROBzAj1VSsYIfA-61jyYwyUof9a8GJA5wqG9PeUGQp3oh_b3DdRn0RvWgfYME
Message-ID: <CANiq72mtv9=5wDYmep8QzUwh90x+YSGHrjYCLcpcVCvQPLDJGg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] gpu: nova-core: fb: fix clippy::precedence warning
 in read_sysmem_flush_page_ga100()
To: Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 5, 2026 at 1:42=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> I'm tempted to consider it anyway, because it is a readability
> improvement. Any objection?

None at all -- though I think there are conflicting opinions on the
matter. I think Gary preferred not to have the parentheses, supported
by the fact that Clippy had to roll it back (i.e. linting at that by
default) meant the parentheses may not be popular.

Back then I wrote:

  Now, seeing quite a bunch of parenthesis for this in C files, from
  kernel devs and crypto stuff and all over drivers and so on and so
  forth, means others definitely do not find it obvious or prefer to be
  explicit for extra clarity.

I have checked again a few `git grep` patterns, and it seems to me
there are substantially more files using parentheses than not in C
files, at least with some naive regexes. Can someone double-check?

If we go for wanting them, then I can just enable
`clippy::precedence_bits` to be consistent instead.

It is easier to disable the lint later than trying to enable it later
on, though (because we would need to add all the missing parentheses
everywhere).

Cheers,
Miguel
