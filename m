Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA66B384228
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Apr 2026 23:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775430955; cv=pass; b=KPp9l+QqkcBnDu96e3pqiFgmS35CQQylSeKB1LjbeFrC3bBwQ4sPQFAcPbZN0kLBOsbgXrbrJeRgHQdJ4pgCtXfKjnjP0ftT9wYSfqsHozJAW3izIgrEAvfszJCP+fLMCiwAmBBZM55gLGrIInSy4ut+0gdyzeW14s+t650frvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775430955; c=relaxed/simple;
	bh=DuXfeYCW4QOQ/5cD3aG7nz3kn7r2sbXuLr+omP2BF5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JsNUqP7tGJfkuA//WlRcVJQo3w+1QxEE8fmtQHm0JNOXKwwFZl44rmTQUtc0rM0TFqe8CE4/Ssv5qgNmzULLNumcGNHoPJ4/7Pfm4ToW72c4IT9vp1Y/q/djmy4pVIkBcJssatqJfqVzWfHkWoEvw/sRRrFbO1RIYpj9aRzjxo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgPU9FAH; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgPU9FAH"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bda3b4318dso224426eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Apr 2026 16:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775430953; cv=none;
        d=google.com; s=arc-20240605;
        b=N4Xg2Ui7TozbeU4cS4ufdk+x3komwo4dvo9T4hK5XowndXZy/O2TUPT7ItxK995VYe
         /ViMvbFMzP2opdr7ucwRH1Gm2jLn/Ms2QS+kfWnJLux26tceiBBbUPwaTWK5Vmm4TbmH
         OKg+jTQhpH93IjcGn1Mmyzrral6VL2z8jpAUs10iryr4wA/dvnchjxSlhSzJDgKbGuXI
         2XApOfnn9dygZb1ff68qn+GwO2cCZzvvOdD6d1BgZ+UDVJCKpkZYYWtzRvvxV0hjpb8D
         m4w5SRcNcZ7z3j7qEHI6ckh5lRH1+Q3m2oiYVEbLma6SyjleON5tHvBGMx99ljssZreV
         KCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        fh=EzhSl5sFHCBRK6uaqrTBeNHF4T1O7g4BVUIP1HnKXkI=;
        b=d+gNyBEslmoVt5pLre6lBLn+MjiHsCaE3sIBQ5KSNpg/jBm/z5fg0XrViSUuzsW0Ll
         xYMk24twQsLvkNrtX6e0i18OnucX9CVBOybdPmW9aobuG1XGKigCZiTRMlF9KlVDv4r/
         VRqsClILm0fRVDqRdE/954dpX4WQjj0AEz4tKwqqB99Lu0+u7SexDEI+VXmJ9SWyC2zp
         A8i/8rY/tdZAWNKkvDdM7dICw/fz9nEk8GeVX9NHTJYEkQiCldZ91MFYu8D+Wxt7Nonz
         pfpkXwUB9pf683BxHbKmNDciwLqiW2hdyCBaAsaa0PXGhs1XihMoqmNlk9bIHE1pNpRi
         n42Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775430953; x=1776035753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        b=BgPU9FAHd/0DkGlhrPlq+mpFnKR9NanttH63t5+ukkWgo5r8RO95uUTtwGBZKHEQwJ
         mStErKJb4FphO/b2ZSD/0WR/O+KkKxVJfDy3UeE2b1QtAHU8qWLxLd++b2mF7gvkf7Gz
         DWf7Xp/HFWYCIyuoLxxY7GaKfMM+x85lbUvItA2qG2SZXcaBwfimoBTBmCjGa41gMQfv
         9TFfzhiMWnVPAME2Go4HRHwQW+gUMJGk9H5LQGFHtyqTybD8Gss9bCdr7Mvt2zUQ08EA
         tseXLLJRLPrBlYCL0huRsKFFMe8T9ArJ8+fxn9217jpGlIoeoBdUX5p8aq5X8rQuLDfs
         j2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775430953; x=1776035753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        b=MWcTDnCX1fckJZoRcd18HiVWrrwLU1JI6blrRLOPkvmHcnjay1+OxIhOcpCEh7vcXJ
         Y+LRbkVlQnR8/IfNP+W9XLKdPFlNi1K+hNrTnW+W4QxUz+Jpt1J4gWU5ST+u59wV8kpO
         S4OBKZmKtE9GH357s+XesKPBR0rn9uziVP1DGOAbtzMdbITBNge2iX3VWOiTKbrQwyB5
         WKB4LyeXWqISpy+4FyrlE+w1nx8fGRXkWMnZCCK138YgzdWOLk0cADbDdr0ync6n8EJh
         wl+vR7LR0FT+tsyAuvvEp+MbwEwfaNwk0wWVmmjrJHsbPx4Zh+61XI57/sSU6uKHHqUK
         /rxw==
X-Forwarded-Encrypted: i=1; AJvYcCVTrcBzndWmaMmcuu4+hrYCmidOUEMWWE6/o9tsxJz4F3ZtXIH9UmGVnCuU3hz6kimeVluVnieSJMUVKOSJyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgvXkmrVOSoQTsYG9A7Z+npuRwKPdj5reo6mLKPSM2ECnrFHjt
	ksK2xoxym+21yMNz9HN6hKDq2AJkWfULPCMqcify3xhSRUlbShX08ZQOxsjLSGg3njNqhz55mnp
	0VRzLwwAyCHqWXVZK/7z3HE+sbS4GXlU=
X-Gm-Gg: AeBDietx6olr0C6Yn1lia8xH14Ki+5kwGIXmhP6RiENoBaY0Fa1JrtyF2eRXIlU3/HJ
	0WRQYnltCBhwdzVxUSd+FLeR2poloRPvZDUXNLP7bM3Zz6W+Sj34OajGlBEY1yxFb9myLrIRSvd
	L3+6EDzwYB7u1zbGfCRFhIvVluPrzeIXPvA+/mhJAB/VULyKgvtQ+OfYYzHbx62PFhzLsfdlydr
	cGZQ+hQqiOmdEfB4V741FjCGsnbHchDOvbdBc1RCqEkrXLGAFjpzpFk+hSsN0DDBAYg+l3CNuRp
	sa3xtOe7cPcVdnpRbDKpuoXqvZ1uSYO1T78dk+KVScxx0pHAPzRGDkqvQZ8DLECpWB/Fs9yiB1+
	edvwQqxVBiQ1NpbU9b78x4zo=
X-Received: by 2002:a05:7300:fb8a:b0:2c7:3a7:c795 with SMTP id
 5a478bee46e88-2cbf669b785mr2053063eec.0.1775430952689; Sun, 05 Apr 2026
 16:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-33-ojeda@kernel.org>
 <DHHX9O7V06VZ.G0N1CQ7BUKFO@garyguo.net>
In-Reply-To: <DHHX9O7V06VZ.G0N1CQ7BUKFO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 01:15:39 +0200
X-Gm-Features: AQROBzBr0aNQIDV47zgxZ35JmTq7j6zQBNm1bxMAs_nutxdLV5rErBhW_SWV5gw
Message-ID: <CANiq72mTaA2tjhkLKf0-2hrrrt9rxWPgy6SfNSbponbGOegQvA@mail.gmail.com>
Subject: Re: [PATCH 32/33] rust: kbuild: support global per-version flags
To: Gary Guo <gary@garyguo.net>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 12:28=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I think I would prefer moving these down.
>
> The current approach append the flags to all variables, which will cause =
the
> following equivalence to stop holding after the flag update.
>
> KBUILD_HOSTRUSTFLAGS :=3D $(rust_common_flags) -O -Cstrip=3Ddebuginfo \
>                         -Zallow-features=3D $(HOSTRUSTFLAGS)
>
> (Per version flags doesn't go before -O anymore, it comes after HOSTRUSTF=
LAGS).

[ For context for others, Sashiko reported the same and we also talked
about it in a Rust for Linux call. ]

I have been thinking about this, and about potential other ways to
achieve the same thing. I think the best at the moment is to move just
the `$(HOSTRUSTFLAGS)` below, but not the rest.

The reason is that it is closer to what we do with other user (kernel)
flags (e.g. arch flags come after the general ones). But I am
wondering if we should/could set all the user variables later in the
`Makefile` in general `HOST*FLAGS` later in the `Makefile`.

In fact, there is already a limitation with the host flags: `-Werror`,
i.e. that one gets appended later, and so users cannot override it.

This may be considered a bug, because commit 7ded7d37e5f5
("scripts/Makefile.extrawarn: Respect CONFIG_WERROR / W=3De for
hostprogs") says:

    While it is
    possible to avoid this behavior by passing HOSTCFLAGS=3D-w or
    HOSTCFLAGS=3D-Wno-error, it may not be the most intuitive for regular
    users not intimately familiar with Kbuild.

But passing `HOSTCFLAGS=3D-Wno-error` doesn't work, since it comes
earlier (`-w` does work, but because it turns off everything).

I am also a bit confused with:

    While this means there is a small portion of
    the build that does not have -Werror enabled (namely scripts/kconfig/*
    and scripts/basic/fixdep)

because it gets enabled in the build (I think it is referring to other
targets like the config ones).

Anyway, for now I moved the expansion of `HOSTRUSTFLAGS` in v2. If
Kbuild (Nathan, Nicolas) think it is a good idea to do one of the
bigger changes (e.g. for more `HOST*` flags, appending it even later),
then we can do it afterwards.

Cheers,
Miguel
