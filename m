Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3081E1DE5
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 08:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536556; cv=pass; b=jhm3mIOIFbEC2aY8jXiKFrxrm4POvtXAleOBwqKw4uiWIGPyRHhhDSubtHycf//F4LjncI2irXU8cgIoq+tPqyF1mw77EABQUOuTgSaI6GrWofVT+IleP0/8S+vO6BqOav2ovW1+ZEv1B3YvtUA2SZ7X8gcq0/VSDcgpOmTAVBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536556; c=relaxed/simple;
	bh=gBwPGhrgKVIT+8Wjoj1M/2ZEEAh6mBrBzfuALJ5kXbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3mi48IAsjfQSg5a4e4LGnjUjNzvbGHc6qesAKljsp4H468S/Gmz3XJ1NjHj7s6Nnh5UjZPcbEb9q/EzKKZeBfJnQK+S86XvZ4IgNhY92khBceCu3JgOzr0TEhiRwJRg21wHr16YsnDpfBUBYG0oW10AniXNBk959pRIl0257U4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M34KiWWl; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M34KiWWl"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ed12db6cadso78160eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 01:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777536554; cv=none;
        d=google.com; s=arc-20240605;
        b=h/6R3gS6a40D55Pevs/h6XA+MFiYUSvzwut81y84xosa81bh6Bm2FfgPcL+iMBhFzi
         sa6XyNMe0J8M6S3cYyK2H1T+YeHH3mpvO2RALJemg0GHrnA/1lr+uV0rLNsRzGHxr9hq
         uOT91RgaX5x+rjvyLcUCvKzySouykt0/jI6WJMSzdAIRp8kPVr2+k4kgO//wfrniAPj/
         PHMiR3POIUYaymKlbZcauCUCUOdKdm9nuQYo/6nmnmyMIbj6+3WzL5z4PHdr7eZ6Q/lY
         x+0p2qgYRmNR5oopGRK2G/+aqp1cXVohLbfv+A7jYbgCwHeunxUZPpQ+e2zR+U/sSRX+
         epCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gBwPGhrgKVIT+8Wjoj1M/2ZEEAh6mBrBzfuALJ5kXbU=;
        fh=pP7M57ZUYJdEEuTebT1JirfiWSvhLA3WqAFJRrHkIwM=;
        b=MJ8EPne1j0IBojGk4SjAXjqxvLtU/LiI+tOILG7wA1UeNMHDXSer7xNCbTOdjRetpZ
         kw7mZpK7DGq2+TWZUqIfTCAnOSQpjt8RhryyMQpRItDzDzUN6XiRmrcQ8IYjIpupP+Ge
         HgN5wxakFmADsaG7h5L3y42lpG4LS4dMbQKpnubY5D1GA8UceJBC0gIdt5YPuI6MUw1V
         v4b6/fyM8QGdDwQAfwrUJH7Hiic9wPdk7D/gf983oUS5IofJzUH5jkhxVwJyanI9Cy4n
         dAHceIQv9naDxkULLtAD7jPYCI0yQeRzToh1UYbZtgg1lkHd47fmmU469HD8oopwiiGs
         ZHAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777536554; x=1778141354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBwPGhrgKVIT+8Wjoj1M/2ZEEAh6mBrBzfuALJ5kXbU=;
        b=M34KiWWl6H9v7htK5KpJL2+VxZ7oJFjzFAvXNpAH7byYxLgFuLMNrLepKiVyJlNOMV
         imlH3Pf+Y8+n/7epdBV5Jrro71LvQJcLG8vvKANvGftvF1sLZrwBQOoBgGeFwluAD3eV
         Qua0SdRlZTFNHaHcO0UNz69TVFDepwWAlheNViYMdO6Blv8fgp9iJWMwHF87oKkXvw5d
         x7hpq1mA9Ma763rwzq7D/CjkxmrnAyKH+mTQMOdpJGe0wOOfrSEy1daaQ7oZvFeMsi7A
         44XzQfSSjJrMcRW9UmmmXm8K5B4wxPhevFs8FqS59r6y9+7bJ4FpaXZ/L8AoWQwAqYHD
         JEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777536554; x=1778141354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gBwPGhrgKVIT+8Wjoj1M/2ZEEAh6mBrBzfuALJ5kXbU=;
        b=eXbzyiuqURLHBDKuQT5VB6VVb1JAMIpNI+FwPYPMIfV5SeKGdtVGQfiCod8hRq7tn0
         AgBjb0KDUYWNbTAr4TGzBlu8PHqHzhJHIztPMERpEaJ1qHJfZWdsOhh79A0htsewAy+J
         QFXzEPQqV/jF31S6GvGvI1rjVTySYCCwn2jxU/8ipVZjj9wSPCPNbuswZhk2tB1Jglxw
         7IryhohjqXYWEYux4BDFO/iITBtxfhxxMEg8q+9i91lR3tFxDpv/qGfni6wWTj7esvub
         U+PLaWp//XP4ybpqyRg5wLWvN4EmOK1PH7e64r1uGkDTjTG3lx2oi2MSQTzPpxXyMo9t
         B1SQ==
X-Forwarded-Encrypted: i=1; AFNElJ89q/RXhXfEmbktfMNJmf5gUcna2jLQOG+CEeSmazGwQpwSkkRHuD8XoKsCQGk3SH3FVE44uC3GjhqYxU1rAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzElW3e2YmSX7fdJYBw2dkQ1KG6SROdcnI21eCtNlgituRHHWGK
	bLRe14y9g1XLQSJwKtP/sj9DpJcIborG3RKoq//vCnYqPF+cvRMwwAu/XKGJgAOEKbeqjpjXkNg
	glWdBfhuiR1jUVgnBGtfcYBkcyeFPHeRBbnBr
X-Gm-Gg: AeBDiev2h6O7aUXJ0EQYTzC0/Y72/n/ZFs+nwZTkE1OLavmhKyqxY56lshLoby2Cf6q
	QhSlcvhJ22QjhZ2VCuLEuQumK7qXibzY8IuaiV+UtGFUp6PMYgPcuwdO+mlZkLv3/cGD0GcR990
	453uFi6E7kCCxvkTMQBdNmecDhh0R1/jQmU4lvaFcb1Xt5VS9F7pT6+fbL1IP/4LoC9zPF5KVJs
	oNgoOqScFG6L3EdtUGwOQP3jR468sH29mkUC0wSFvEm9GC07TKbYZuDWVOJdyqAhu+xgikI9yBv
	AZXamuYKEjDCn1IGr0kupCcFctA99A7yEr5ItKaWwhDfOD9pFDtoSaPYHwzyBNXh8l4TW5j02m6
	p+uXla5zMC6JbR2GZXPobZ7ujH9TfKbCUzw==
X-Received: by 2002:a05:7300:4306:b0:2d9:94b4:a1e6 with SMTP id
 5a478bee46e88-2ed3ee74f82mr330917eec.8.1777536554042; Thu, 30 Apr 2026
 01:09:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226-transmute-v3-0-c69a81bf8621@google.com>
 <DI62AHDXLAWA.2ZM8JKWQALKAU@nvidia.com> <CAGSQo01-EjhXTc+jcer_5FJMwQ4cpBtyHDoCyYR7dOdXKfUFHw@mail.gmail.com>
In-Reply-To: <CAGSQo01-EjhXTc+jcer_5FJMwQ4cpBtyHDoCyYR7dOdXKfUFHw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 30 Apr 2026 10:09:01 +0200
X-Gm-Features: AVHnY4Jy97-FTFg-FaaFIZbyxdazMzlrYKZFhJ87V3OkPYvxbambWqcI-9KOrFI
Message-ID: <CANiq72nf1ngNzLEvZ2gzeO7b8mCELV9A-4f_9jA0c7cvB_LDfw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Support more safe `AsBytes`/`FromBytes` usage
To: Matthew Maurer <mmaurer@google.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 5:22=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> 2. I heard there was work going on to introduce `zerocopy` as an
> additional vendored crate.

Yeah, that is my plan for this cycle.

Cheers,
Miguel
