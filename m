Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E62B2C21E8
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 18:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775329059; cv=pass; b=bc5a4vPTc3c2L6sFORPu/rlXtfNJk3aEGfNzcM6aHcCzeM/JynxiIgvkF2b4FDz3yw8k7kYN+rba2cz7GSzqv2c4LATfHzDa91WbUHROBO1XgrwnL8E1HOpcciVKkRxZA8KjLv1GWWVMLjGvHrkwoTg6VzGh3YJf+D1CAjx5+VE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775329059; c=relaxed/simple;
	bh=Dpo1bHWRFUqXo0uNqbtuJo1O2t+g9zkQj8ymAL8CgUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5ani+8/U2e1I6+Kr5JfMJLpwr7bYCrKH2TTpd8OKpruMOA4mINF9CzQmVEobibhWIsCSi23JmQCIjhjUoKH86v6TpLguR1P4utkZ2+Tn789DdDNh7Tg5gc10YR7Qkdv0Zh6DZu12E2GviS38TAKQ+m8kzS9poAfOGuSVEezdHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hW8PckQ0; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hW8PckQ0"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-127148c2112so162892c88.3
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Apr 2026 11:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775329057; cv=none;
        d=google.com; s=arc-20240605;
        b=QEdjJqf4cYRRUXN4lifobrxnw+11xTAnm4E+ig2fZgQnbuLp7arwbjAaQjFK/8G9vj
         c1PZgh8JUKtiL6tPQ3aIQZ5dA/n+OfCoiT/ERsmafyOWR76l0NG9UTuzftOKbGuNk+ee
         pyRmWVAH6XVja/MNGspIt7wkoXjZzh4kHjxFFYfCkUVM8Irl+Bowu+qv1wvpr0wdT8G0
         fkuAH7peX+Q958Sj/ckHEQnz4IGjPErJpiVQYE8f4uGu/XVZCdsdhaVKoWdIwfXrZDvC
         DKwdeZOFa5sfE8EvCwu/jXXEFwVV8ShQJWTAGc6FjAwC4aLJIfHmINMt87me9zG+BPXl
         pKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dpo1bHWRFUqXo0uNqbtuJo1O2t+g9zkQj8ymAL8CgUQ=;
        fh=a9fjz3vQoS4wiV+w60PXSAX440s9t7ViVmz0kRvzKlo=;
        b=TE40Pvon5ldjh5Rm+J+crT79JmsLDndFM9r+IMkMgzblDMbAR1FutOaqba3xioTme6
         bUrQCfHYcpfCRqHEZRTsx0LQdRKxWYmePf6VmzdMUwlJABEPoZ0oYTe5UqW9rVt5fUbx
         dWehBfKwDxl6az60ZRYTtYEXy1ccdk3hHIV3xJGxEgFfZ9ZmgNXfkI7N1GtdoHUc9WnP
         4s3KImyjyloieVdPl/62W2686Bin8JTL85CccJZYUZxOExiDVWuMInKckul3HIGHfncj
         IUaNF1SoLLhsiV+VaGGAa5p+Z5csK0KG4MZXdFHtmNxdhAoqIW2YUtjol9FZXyh7wScw
         BTxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775329057; x=1775933857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dpo1bHWRFUqXo0uNqbtuJo1O2t+g9zkQj8ymAL8CgUQ=;
        b=hW8PckQ0MTqsuTDZEDwZGOxVEXNGMV/gd5qQOY8tXqwv47sTV2feyp4lB02F+wXGLT
         nCMVoDOJmcnaqzQP48axTlxPHtKYYdybOQmdXj+WE86yVulEUira6dR9exgh9+ENXBAK
         /TMyVPUKTDdywopNSRC8ZOsI2+020BwxKTRLZr0jLUG2nDGDCAeQXa9YMb2O9q6tpgpZ
         /btG/Gey6C0B67YiBmjeFMrlVERcCDkHhBWg8h2zZOQMwoLpEm5TeUOH7QuhZEH5dpZg
         qKIFU99hoK8OM72IO4Er/in/a77dAzQlpCosrQMumAFl2AOPXpRw81JFLX/0HRkAI21B
         JUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775329057; x=1775933857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dpo1bHWRFUqXo0uNqbtuJo1O2t+g9zkQj8ymAL8CgUQ=;
        b=sNsyAl3/I1eG9cYMR5osuDMHN139+JF0mzJ1jG7Ldx3JsEnMtyO6HNMH9oe1notroo
         +2748OszL6GEzU5mj9OfYdPi3rCp7U1y/KMXY9VzaItpkzWqSjKqP4tSEGePgOHF33fT
         a/zgEJAU9YPUwMTMBfo3CRLQMPy8QQhxvUc14U4waq74Vzbyf68LVsHwpwVifqbAUysr
         xXF2DarOw3XIm7Jme9J9gxhDmTaixslXM1JmD2W5jeyUug+DWLmUXNUJnJ919R1ACfDB
         z7mI2j8zhQ+HrzlkgR0CFfUU5eEr+Cb3NebtmH00BD1/AvNotlIWzNsjvYKpl/GJqr1c
         cuxA==
X-Forwarded-Encrypted: i=1; AJvYcCWGzDNnc4t8tRztySHcj8DnfDk7vOW61yuXeG0ssYP9EVprYLjGMG35kULNc653L/lUcOWbOOoWueiArRSC0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZZ8YLAK6YdPQLRYshEXT8fJLxt0X3Kq2bbOtuRxwZUMaTZ15a
	0keCSOlgmq2I6OesOiVzHhzQDd9215GQa4tk1ugSlFZDtym2oPkzE1dGS70kSJkFcvgk+QtiU18
	Otx/FayFLre82NChr2/7j7GvOB0Ln9ks=
X-Gm-Gg: AeBDieuGOOTOFW33bFBdF1M2y7JpXOoRyG24MIEWdqLejwWqXSXTtYAHucHkmZJr4at
	dknEX0J+ccBLdS/n+Watjr9dBpOqNKYKdvW4YbJLr1s+zjJPiyxR4jkmWgEP2ZgpVKJUdKFGjGL
	Gkfv7k8zs8Mtt9wCZTF8bhi6kGFR7JcZhe+4tVpYiNRssZI+UwesiHlJpXvWyteT1wj7EI0Xl6Q
	/Xrqt0zzDhlp1kbp/+FfdL2FKP25jHL+DvBKp5QjSNG/bgOPuFZAQQHhpUF0uYs3AA+b2hoKaog
	AHvIci9OiSpl9cEurSkxe2elyiStTBxL5gpJ6NdiEly96kABdujKtQ89Bqb/Mkk9NacUEw2wcnz
	BKQ42oXHbws9MDS0f3kKrB+A=
X-Received: by 2002:a05:7300:aa8d:b0:2cb:cc20:1771 with SMTP id
 5a478bee46e88-2cbfdb8142amr1797820eec.7.1775329057099; Sat, 04 Apr 2026
 11:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323153807.1360705-1-gary@kernel.org> <20260323153807.1360705-3-gary@kernel.org>
In-Reply-To: <20260323153807.1360705-3-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Apr 2026 20:57:24 +0200
X-Gm-Features: AQROBzB07bZJqe_QfYpU84UafC2n0TqoqgFxBdtNVi67KZHjlaS5_K2l556ldMw
Message-ID: <CANiq72=L_GtftTstEznWi908HwcWLmD=cf0gnmLcGkfN+RTaMw@mail.gmail.com>
Subject: Re: [PATCH 2/8] rust: io: generalize `Mmio` to arbitrary type
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 4:38=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Currently, `io::Mmio` always represent an untyped region of a compile-tim=
e
> known minimum size, which is roughly equivalent to `void __iomem*` (but
> with bound checks). However, it is useful to also be to represent I/O
> memory of a specific type, e.g. `u32 __iomem*` or `struct foo __iomem*`.
>
> Thus, make `Mmio` generic on arbitrary `T`, where `T` is a sized type, or=
 a
> DST that implements `KnownSize`. Similar to the `MmioRaw` change, the
> existing behaviour is preserved in the form of `Mmio<Region<SIZE>>`. This
> change brings the MMIO closer to the DMA coherent allocation types that w=
e
> have, which is already typed.
>
> To be able to implement `IoKnownSize`, add a `MIN_SIZE` constant to
> `KnownSize` trait to represent compile-time known minimum size of a
> specific type.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
