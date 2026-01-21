Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86066481FBC
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 12:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999005; cv=pass; b=Ak5p6zw4j1n3P7KVE8y9nVpmjpo4E5BO13fdzc+zfqgwRDAe38ePkc91W2NnNVu6Y4DdYUnrqtR8SQ7BdtGmskndN3i8rZxO9rTzJY9fjCj06HNlpszw8iwl15+ijgQhB8EpKzJlvBJlgzRvk4la9ttfXMYFv4iKEACKvOQpm84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999005; c=relaxed/simple;
	bh=TPCkepkHyhe5x/FmTr/qCdwm6U/nlhtllm6pFz3H7dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0gn7F9YF7YnbSMzR/ltc4BL9oPPSZ26D+tSASjevcX8AVwyBJbQvwYw/5gubuI8ZVDq76hSLPFbtZrXc9ByUBfEqRgrQ8uxQuLoTK31CXBYFca6A9FaGlnSGjgvNRTGXliHENR5Q+MJ3CNX/DyvR1Vae8qMFJ2h4qw4x9dbxBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z0bmCmN5; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z0bmCmN5"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12339e2e2c1so592077c88.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 04:36:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768999003; cv=none;
        d=google.com; s=arc-20240605;
        b=AMs9qERcQp4pTFvPlCKqj0CzMtUgCURd08hD0JgCuEMiIB8L5FcW9z3I5sWn0KtXuP
         MViZXWnlHE+Q2WL7KF2RSukfqgw28imLyrcSrxQs7y/piYHoS1oI3ZyO4IL4q5kmoAH2
         ymkAUO1JvFJJZjVAsA1o2jDmJz47pRQktH/CsMca8wRA+Kc4qVDzZ+WtWCOF0LPHuobB
         7f1fskNS4DJMZv7kD2jdk81wNcUCa4vhkDb0POfxSf2888Afb0IEi4fxLtIQCSzD6IAk
         St0EqFvhADmUMtKpTYDpu3ht7TctXPv7VE6CWyiVJJEzNMhAEYAvWgV1h19eGcWmAkQj
         C3aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PEaTN9s2p8Sn9ZSd/CWHeV/MqX0nPOxMFs3ofH5u/yQ=;
        fh=diwxegEGaCqFW/JZGcaQPxp2MnC8rOqaM4EkbObqcMw=;
        b=V3pnbQbqiw8yIER/Zfnu25dNoeRua8pRsztyKXF6S3sDnU/xmv76lAawQtkTXGdJeG
         7uAzxWgkxbUu2g7HiAzld5cAnm90KoxA77icP0a45Ceup4HghJ00WQ5qv5NwBQduHczq
         C60HYrxoj7L9ulNBcyLdDGg/sw0VR5EK6gFa0kFUenjT50NJTWP5Kuv5MwbUpqaJBmQN
         eXXEdsa/VSJadCJFTwrLRYjUx2m+WUkeSm2X5qCeoVvv6YwgZy0B6wDmGHiZAr8x5UcR
         UFRCF4RK1ZBJo3gBKs5IYHah2DLHp6v8eppIomY9Xygbp95tzf0Dj/mwbyFUQKcPl9ok
         lZMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768999003; x=1769603803; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PEaTN9s2p8Sn9ZSd/CWHeV/MqX0nPOxMFs3ofH5u/yQ=;
        b=Z0bmCmN5gxDTiJFXnLP/wLBtqE/KyBCjI4vaCATOrRRCN32YtfFYockmBA6ErZeg+g
         JaFoP+FGvxjbssaM4w7sC7cLR6DOBONfrSuH8poJ41KwAVy8a6wafvTJNtuCijO7lTHN
         dBG4K8ExWApPnb147NEwFGBNCEzX3gj4FM+kCcCGU0Nzcjq1EqwtriC5uklM2dlL0kW6
         LJQ/G5Qk/ZevhoVgNOoq0OoabBmQlF0QQSIgZ57tJgrpkmPX1dE48pU/buVNzNo8aAB8
         vbzZdrUwcO96KoOysqcushFBejy8YtnbltIF013s9qNIrTfEdCiQ7H+WkWeqadmpwwhM
         M6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768999003; x=1769603803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEaTN9s2p8Sn9ZSd/CWHeV/MqX0nPOxMFs3ofH5u/yQ=;
        b=FpMuFdJTdn8AQ8/GJJtt4cs8LY9MqaC3vT/EMYlWStqQV5vFM7ShMilEpCXyXtI/J8
         6z+VHgM2o2nrcLhhsNHN/RFHVF4IT1kdoSYo/AKDDPCSpSXBH23Crj+zJBSX0Qi9k7DZ
         44u1Kiw9OynUZvpLD23GU2n0A6D5l/qqbuEj/F4I6/WQ/6ssiPUpBnEZpaOr+/bXdp1L
         LSQSjAJCc0tygMarLYncyrQD0GXp2OANdK7qZ7Reg1si7WN97yuoTcYp/j9+VtQZjEud
         UP7EeKMJcg3J8UD8r9olwmZKAaRC30z6LqwkMbESHE7z4g5NngWb3KsHqMa/xBBC49DA
         C4Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWYe1eZQzYy2A280aJkQsELcldpaqqN1SFJYlBfKZlajaLxb5NvgauKQ+vUKkb2+iXDz8fz5+T9SD8lcHIXFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM1RLv1lOA8T4wY89H669o5NQ1RqEiO62Sr5ugTEycZruIs9rj
	AFDHOzqOU/9LAUAMYysL9fKI+nKZpi/17j0j9VD+sKhkwYeGNRM7XsN6jqNuuva0bkX7Co3tzU0
	A3ZDFYt7rN59DfjLM+6NMrLsxgHSm4e3W/z5ccpJ3
X-Gm-Gg: AZuq6aJ9JuXehcBZHGknhZ41AREnfdFH7vE9rysefHRKcvJOhcjbdvcchk8meDVvy8P
	IayldLJStcqJXUpNSnhFc8aMQET0JOR7eHSGGOVmkDJlarm3K6r/OCv5366foZKmWxDCNV7wlOK
	NHM2a+rZCiB5yCTwVTrf7/ke39SvxPqJkq6Q7BceGDr9WF54AUJWeMArch7j5OtNW4qVPiGEwvk
	JI9xyUxpg0aU2zwOOR9sTNw66/0GWwmtf6H7qoZvxn2XVBAsnzO4AGgouU3vaNnaCtExtnkY6uz
	9doe9NWEc0Vr6JLOpK27W9vEazaAluJKQGPb
X-Received: by 2002:a05:7022:6b99:b0:11b:ca88:c4f1 with SMTP id
 a92af1059eb24-1244ae9ee20mr14221247c88.20.1768999002171; Wed, 21 Jan 2026
 04:36:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115207.55318-1-boqun.feng@gmail.com> <20260120115207.55318-3-boqun.feng@gmail.com>
 <aW-sGiEQg1mP6hHF@elver.google.com> <DFTKIA3DYRAV.18HDP8UCNC8NM@garyguo.net> <aXDEOeqGkDNc-rlT@google.com>
In-Reply-To: <aXDEOeqGkDNc-rlT@google.com>
From: Marco Elver <elver@google.com>
Date: Wed, 21 Jan 2026 13:36:04 +0100
X-Gm-Features: AZwV_QgBBL7kVX6shPY_rD_ZSqxEg43eFMwlNHC3kU2drrTme4vk8R8dbzHINHg
Message-ID: <CANpmjNMq_oqvOmO9F2f-v3FTr6p0EwENo70ppvKLXDjgPbR22g@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: sync: atomic: Add atomic operation helpers over
 raw pointers
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, "Paul E. McKenney" <paulmck@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Jan 2026 at 13:19, Alice Ryhl <aliceryhl@google.com> wrote:
[...]
> > On the Rust-side documentation we mentioned that `Relaxed` always preserve
> > dependency ordering, so yes, it is closer to `consume` in the C11 model.
>
> Like in the other thread, I still think this is a mistake. Let's be
> explicit about intent and call things that they are.
> https://lore.kernel.org/all/aXDCTvyneWOeok2L@google.com/
>
> > If the idea is to add an explicit `Consume` ordering on the Rust side to
> > document the intent clearly, then I am actually somewhat in favour.

That'd be a mistake, too, as the semantics is not equivalent to "C++
consume" either, but arguably closer to it than "C++ relaxed" (I
clearly got confused by the Linux Rust Relaxed != Normal Rust
Relaxed).
It's also known that consume or any variant of it, has been deemed
unimplementable, since the compiler would have to be able to reason
about whole-program dependency chains.

> > This way, we can for example, map it to a `READ_ONCE` in most cases, but we can
> > also provide an option to upgrade such calls to `smp_load_acquire` in certain
> > cases when needed, e.g. LTO arm64.
>
> It always maps to READ_ONCE(), no? It's just that on LTO arm64 the
> READ_ONCE() macro is implemented like smp_load_acquire().
>
> > However this will mean that Rust code will have one more ordering than the C
> > API, so I am keen on knowing how Boqun, Paul, Peter and others think about this.
>
> On that point, my suggestion would be to use the standard LKMM naming
> such as rcu_dereference() or READ_ONCE().
>
> I'm told that READ_ONCE() apparently has stronger guarantees than an
> atomic consume load, but I'm not clear on what they are.

It's also meant to enforce ordering through control-dependencies, such as:

   if (READ_ONCE(x)) WRITE_ONCE(y, 1);
