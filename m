Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E2E3218CC
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 21:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768512193; cv=pass; b=CbJXyCy27qYSJuDJrEgRLveDVteDecIU0P/sprSNOwiZX9m9i52MnstvPt0TUH3ITzI4zZMQj2gwynhEWrdmdntSIKAORHCBkGoBq8ynO/HKpB8JEx9B1UXRxGtusGO68/RW5q/U7Cj11o1ypPT/ByxHQpMYWuvm6TjOxOqnoc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768512193; c=relaxed/simple;
	bh=8DuZ/0M2V4XdwNCYfr79DkUNFhF+PZUIlEhCu0cBR4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvquiZ5yAo/xaDHXwpYQjZipI8GVd1NxsjUn3NS1rp3mIPRCtoCjBkaaQC9W8gyf2lgufVgewZgw45DSYujTQn5GuSDk9av01BTZM9OhpVSpWXrMifUcFkIjta5rXWIyP8CcoKTdCoqUVp4bY84KpuJuU/hdDEwDFfx2R1qmXzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHdwQMo2; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHdwQMo2"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ac370cf8c0so137553eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 13:23:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768512192; cv=none;
        d=google.com; s=arc-20240605;
        b=kUk+fK9Vtbc8SRVVITrAcfY/+B6reJ6HvhLFSC7q5P+Z5R81LUdQwPnewjIWYIE9FH
         aj5feH+D19L/uv9GApyHi24ywqOJkEFq+m9FKgAFubXMKPpDCLndhGDbvV+tlD20Jfjm
         HO5zTEiLMoMa8GkDTR9RTPa9LB6obCNCPn278KWC1ojyVeu0N/Rl5oPNaKN1m0VEJcmW
         9DSP+BAAjV678fZ05nHBnEjbAayfG24U3OuY7fmdjD1wRemt3HOjES7FRoqWJhC1BRK6
         lU+o9apkAr3/PNDgtfR+SESghDZICo4pq5Eu6e8s40RmcfqQEnQiihT83wqQALKvDt0A
         N4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=trnT1HKbtJuS9j9D70FC/qOSsWDVKwH61nujNaDr87Y=;
        fh=Z0Icad8uOc2gMSnubugXVJf+G13JAYbYjdj3GJ6+xxE=;
        b=MOD0Y5QkenKO+Rcueptk50koEOJ6m/QnXCk5b1d8AyJW4CtCDOBzPP4U0hbP61iAHZ
         ADeayMKlPLNkg7HOe+YhRG//ZKg7NInCM0o0W1Sq4pEiq/BjFy4VsH+KE1GHvb4wrHH6
         8SUZl4yNHpywxIZ/HQ4vWwGVyA+JukS/hSkQXPgqJIWb7tZ1ZyHoVnLTLiHnc4Ulo3iE
         gVI8KN2at/Qkm7Hj0kvks4IlcNjAqWHJ4BRimmDfykTggBH6TJEbXuNGeWfQxpnvA6bk
         jMYhwK9ACIyc1ax0qaaRUauOLdhXng5DMA+y9S/WxhPglAlxXyat3ec5cv9xtMZBBv5q
         3+Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768512192; x=1769116992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trnT1HKbtJuS9j9D70FC/qOSsWDVKwH61nujNaDr87Y=;
        b=gHdwQMo2k7pJDjWzx9o3foAQ19St7IbrroqdcDkwVrWPenUuC3ZElBRkeN1lH1fru2
         oHb4EyS6f+vCDbzK17pFoE7EgH3z1su3NWdRjVNdC9BwxgrF4Tp8YXCRL7jvWvoWOHp4
         YLF2iqQC52+8NQdlGzpgFXVnenAFWCk3ZmIqb1bAZ/18vE4P9PZJgaOhoGSyJem6KhoU
         XrBmUYzOZHSoC/iIHQp/PG9bENSbYZPEfTe+w2H3vTkBCY7va/wCpBYrINku/nkIDzWL
         60+/J/Te9QSYhMtXA89lnsJgcatR5QAc9Om9XbC/IfpmyYQtK+n7wmUXLsDI5pLFQ2L2
         DE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768512192; x=1769116992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=trnT1HKbtJuS9j9D70FC/qOSsWDVKwH61nujNaDr87Y=;
        b=upwjXZO3JGvAokfdepjvsHUSwQ3p/Qeab2ErDll7fCaqLmACwi3O6HtXXRjIMAIllU
         kmMOXK3jt4tyt9XHaHClWI920cPc25/jpaD/gLSQ8WoOnP5P8dWLDjqOy1WXPkJl8VA0
         1iIcVVNmzjHfvt8ZAMuJWLGZ5+uCk/NV05ky8848RVqmg4/gpTScLQboDVEv6A/d3zEl
         hQugTltNzNjBv1a1l3ZajeZzBD4ILjWIe1yOTWMvJYzYYDQ4rHOpU4Ql4IIeFwq2Z9NL
         1lF6/9Oq/f20hZKYH+yjs+W6FWjyjqGUzDFq5+SJOZVcBlrx6l0/IULfdadHm1vNcIr+
         cyZA==
X-Forwarded-Encrypted: i=1; AJvYcCXlbSGwNCQ5/c8YvHzKmUireAqhYiyZ/PVbglSKGloTLi85uf/rH7iHDWes7kJbqYZd9KtaJjujgtjzbVI4UA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/5sCtFlb5XKUx7tKCHNcYWMt2d7YZqFk6pXERWx4uDOxxoXMq
	+2iqaYzfaVk7jH2meMg+CQxAii3Euj4gH0WYJxAtK7XtKRCXXwXabTo6rozKP79wxD8z9hTOTL9
	zk/uaaZ6nY0NfYX1S3qcrwzc6yb8liS4=
X-Gm-Gg: AY/fxX7M1jJQIIIw9cp3S4K5yL61IF5prt8G4Dlv1ylTiOwenDfBX1dy9GwSKcE0s/I
	KmE5jkEhqwjh97GEQEs3gGzg83YK3zdiIJz6l7jOl3FxjXJyTWAlCc9JAJ7hRKInmX3G0YD6BsP
	2ue9DQxbRu2oO06om1/UP97ouh9TjgituqmZneB4ca/GBw4nfzbuXjmNEdsSkg2f2XZbhlA5xRs
	K84OJsYj5Un/zXPl+paSjRRjfYEuJlZmLiFX5x+oMbcSk/Q2xwLBtHH+pW/G0EggQXwmZ2nOGCo
	kpP7UBULiB4a9I7w9PwY8KagGKiILlDFJSGlFbl+QQoxxxqgk+/ObFeEmipu4P3DFCx9oDUN5Sz
	RlGt25ncgtatH
X-Received: by 2002:a05:7300:dc85:b0:2ac:2b5b:a567 with SMTP id
 5a478bee46e88-2b6b410771dmr573142eec.6.1768512191446; Thu, 15 Jan 2026
 13:23:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-rust-analyzer-sysroot-v1-1-4de831df234a@gmail.com>
In-Reply-To: <20260115-rust-analyzer-sysroot-v1-1-4de831df234a@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Jan 2026 22:22:59 +0100
X-Gm-Features: AZwV_QjmKRmwBvrIfbUmozuyhxIwDFHbn09NBFebEQi1R3XQBiLw0qhlQ_F0950
Message-ID: <CANiq72kd9bHdKaAm=8xCUhSHMy2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: compile sysroot with
 correct edition
To: Tamir Duberstein <tamird@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 5:35=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Rename `core-edition` to `sysroot-edition` to align with the naming used
> to refer to standard library crates in `generate_rust_analyzer.py` and
> apply it to all standard library crates rather than just core.

I think, in principle, even the sysroot crates may have different
editions, which I think I used that variable name.

For instance, in the move to 2024, it seems all happened at once in
1.87.0 in these upstream commits, so that seems OK:

    0e071c2c6a58 ("Migrate core to Rust 2024")
    f505d4e8e380 ("Migrate alloc to Rust 2024")
    0b2489c226c3 ("Migrate proc_macro to Rust 2024")
    993359e70112 ("Migrate std to Rust 2024")

But in the previous move to 2021, `std` moved in 1.59.0, while the
others in 1.60.0:

    b656384d8398 ("Update stdlib to the 2021 edition")
    06a1c14d52a8 ("Switch all libraries to the 2021 edition")

Hmm... I guess the new name is fine, but we may need to go back to
separate naming eventually if they get updated at different times next
time.

By the way, it says `sysroot-edition` in the message -- I guess you
then later used underscore because it is now not attached to a
particular crate? In that case, I can update the message.

> Note that backporting this will conflict unless commit 46e58a9637ec ("rus=
t:
> kbuild: introduce `core-flags` and `core-skip_flags`") is also backported=
.

This normally is solved on backporting time providing a resolved patch
or, if you think it is worth backporting the other one too, as a
prerequisite in the Cc: stable lines (see
Documentation/process/stable-kernel-rules.rst).

> Fixes: f4daa80d6be7 ("rust: compile libcore with edition 2024 for 1.87+")

Since this commit is previous to existing kernel branches and you
mention it above, please consider adding Cc: stable.

> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Cc'ing Jesung who is becoming a reviewer for rust-analyzer.

Thanks!

Cheers,
Miguel
