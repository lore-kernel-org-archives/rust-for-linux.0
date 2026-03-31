Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197173E317F
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986210; cv=pass; b=VABk50R0F5bkcCpATcS1K5y3UKoiaHW15fhcOIfkSq5Pf2+4GPOCt0Hu1cwmIwUfx89RCvt04HV9Is8tpg9If6K4efVTVOWQx2mevllBm5tieZlaPYRIoAKYF7GyYt30TSXBAUqnFHIXgyC/uBAbkVR8Mne11bY5C525aPlbJmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986210; c=relaxed/simple;
	bh=WY7CtfgpFYrVBcXYHHTRG2HtyVVxqMU0lLU7Zo5R3Dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i7MywZUwCke0QTWJUQ+qiMBlyCILDuhJy6WMRPsk8TCAakEZTOEtFWdD4/baUkYuthEhItWPYC74ITUpkJAYkPd7Ad4cSeUo1U/LXi8Evyq2fgZTw0W3dkmQFsBDRq3X/OJr3f3eRWyWbDqCNOnFek3KE7XdyT6WTbazh46Ousw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOQcWJhB; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOQcWJhB"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1277863a912so766266c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 12:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774986208; cv=none;
        d=google.com; s=arc-20240605;
        b=XJ+WFJ2EymqisDKh940b5QLjimNmyoQgLZ+BheMN5aIBcRl5HF/WOMFmEf1YUUF03s
         vslH0L/6bStdrFPzMMgbgqE64e1gAvejLYyYLyA7/CBXLICgYTYWfXC86fW80jo1jz2l
         Sid356JEX0nvRGaiDhivmttBbHroj+qmLe1gwuugcG/QnQXHs2F0oKpPMIC5wpuCQaYK
         e9/m2g17Za8qbTXzCMAgA/DDQndgvHzzZaC4rSr0SeogSIlsCtDh5QjKz0F4Ce0MbUow
         z9DVCMrQIKpBDZSplQzQfWBiAf6vPQew2WbEAkBxth0oC8GOEULaXQj3AaO0fjEZFao0
         ITfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WY7CtfgpFYrVBcXYHHTRG2HtyVVxqMU0lLU7Zo5R3Dg=;
        fh=JVJvvxE6YZeHCVF5gY842wcSACLPUwqj7sZGO+LVpp0=;
        b=fM3AfIUDNTrG5qtnLU2J0DyOMGSMxnZr0oIfIBodDqBc+kb0i3IJRfkLexc8gQ+Sge
         h/zsDlSkwplOcyuqTC1rSRf1vti3IOzTusyIHgLRNPkFr9UcD4kn7wPnmwnpMLRyjqns
         jyWH/9ds4jmpeoNDdHUI37dcRfaunwa8k4ZTAfi3rGvc4d05+KJADkPuEGfBQ/vqj8ob
         6WtwcHeeak1pzb6bq6IFWx8YK4j33MD+ryDzinCP0lzSWDutemUE0EczwITkw0NkYQrp
         SCe5MbewjMxDHv7xVoB5Glt06lnMs7VT38XbVik3dhAqzFSH55wU3XGMw86MeXVZf27C
         +vVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986208; x=1775591008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WY7CtfgpFYrVBcXYHHTRG2HtyVVxqMU0lLU7Zo5R3Dg=;
        b=DOQcWJhB76OxHIJ4toG+R8KkH310z7rGAnfL+1Yn+6/j3uTqQA+BsfRcd6nPkVqPKA
         1iwO8Du3krh7ZAQHwLAEBCv4R8MxZnfBaAy9FH5+CW4PzJVODA1bw/M2gJdjlb8xNUkg
         CwxGjNXIf1J/kZKiRFUWr2Owt+RYCokryDMCRiv1qWoQnXDmbcfzqLFAaBcVWKR1Igj6
         Kcp6EdIbIhcGLHaULPzjMNCy4VrjqwVyk3e1swGnLB9n+87a+s0XLAFMok6eh6bhDL3I
         UTrhy2bSbkcmHlLyI3JLtmav4qxaa4Bmye2Ugg3MwKNi/Vt+asbeeO/98gzoo8vW4RrZ
         ccuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986208; x=1775591008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WY7CtfgpFYrVBcXYHHTRG2HtyVVxqMU0lLU7Zo5R3Dg=;
        b=r92rh6PGrWGeRMXh4jhpOrprcyYQBL2HKJnGzJtgz08z1msfFVNo9GxHdibdnYpk37
         wE0H3fVTPADR7aEOm2CtmtyHkx+WvWO0bMeQeVnNW2Xcp3Hw1mjrOHKDAwKUx0dxeeUu
         zJjR6G5yZOkQF6DQ8tGasVflVMmefZ+qysMy5JhJBO1z3Lmlt4YaXm0SbIe060WNwlKr
         SPtIkhfGdt5RL0hQTlZg8YMrK23Di5sxa2EwuM7dwZZE/1+IS4vvG3w+JzieCQa/W5aV
         BuG5W4AeTqaLwQ6M9Criqt6hz3SovKaNSy2MP922FOkEs1kZ6sWPdRepslTB1Mu/qK4B
         PiqA==
X-Gm-Message-State: AOJu0YzgiBjo6slpwrVUdNA+KkXq62dPQVnWtpRnDQiOyFOS6JQ35m+I
	tRmq6Br9ApoiclUiJZINthS+RTendxLXXwZygsHbHNwBU3no8ZIPWe8/nqxd/5Z7UnxdHYihg8r
	Cv+dfusLbZgjmCsBQDpovdkZQ5WNlp0M=
X-Gm-Gg: ATEYQzwmDbUamplqkclKg0P4Td7EFGwqPCVayDOtXU2nRR3G8dMytLyjCKFkLtQz4Kr
	XmKHJXKsHN2f0PwA1Ef1I/ojMCIQiZdlS12T6HOX2d71Xkn4kd2dC9DX09QgD6mk9mygulAn9ai
	re2lJVcZBqubwLz4QdcyljUfiQaHe2V+F1WQRo00KfNjXnACQzVP3c0AIwg2ZTiRBCtCdaWk/5J
	POu4HcO4hsPbiu6m7jjXKOXgPepkE/o2Y8f1TzLKNa2Y66JSWn8Z5xknVVfBb8xVi+qrGK3Wkkt
	2ofDnv32yHlFFuYig77r21fnkDLS6Stwo0QBV1nOcNgAm2DblSJuCGfzukdZ/XSudBtexkNFqEI
	X2NPHHZ1j+0lksiUUgg4NGm5XE+clNtLidw==
X-Received: by 2002:a05:7300:2211:b0:2c6:2bac:8af with SMTP id
 5a478bee46e88-2c932db3c6cmr149173eec.6.1774986208175; Tue, 31 Mar 2026
 12:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331190308.141622-1-david@readahead.eu> <20260331190308.141622-14-david@readahead.eu>
In-Reply-To: <20260331190308.141622-14-david@readahead.eu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 21:43:15 +0200
X-Gm-Features: AQROBzB13n6-OGUz81yD1RGy3TQpwlOxfE8YR7bN0oAJRS1hH2hPoXEgX2pTqW8
Message-ID: <CANiq72k+OZ-t_nyXooQ3hpogSNvUNwvkWyC+CXbcYYRyi6KXYw@mail.gmail.com>
Subject: Re: [RFC 13/16] bus1/util: add intrusive rb-tree
To: David Rheinsberg <david@readahead.eu>, Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, teg@jklm.no, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 9:06=E2=80=AFPM David Rheinsberg <david@readahead.e=
u> wrote:
>
> Add `util::rb`, an intrusive RB-Tree using `util::intrusive` for the
> API, and `linux/rbtree.h` for the implementation.
>
> The API is designed for very easy use, without requiring any unsafe code
> from a user. It tracks ownership via a simple atomic, and can thus
> assert collection association in O(1) in a completely safe manner.
>
> Unlike the owning version of RB-Trees in `kernel::rbtree`, the intrusive
> version clearly documents the node<->collection relationship in
> data-structures, avoids double pointer-chases in traversals, and can be
> used by bus1 to queue release/destruction notifications without fallible
> allocations.
>
> Signed-off-by: David Rheinsberg <david@readahead.eu>

Cc'ing Alice, plus "RUST".

Cheers,
Miguel
