Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D16215F65
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jan 2025 14:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736432151; cv=none; b=Km3ssPC6Y4WRmcGmE0n0qol0JRPMCi7OnEMnFqjW0xvM6fVERSz/rcFYJJPpGNu3m6rzwv8JVIsyh10wn+bxkp6LJ6trolrDfXYLm44rBLvGGLrnRw9YNH/W2xwqwuygEakXgODSFAOPan5ZP9p1/Lnr7epW8yDg1QvQ5wwTeIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736432151; c=relaxed/simple;
	bh=LLft1eUPbmzVzm9DxwwwdBGZbJXbwq1U0G7K6ODNWrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhMo7U59uEFR4RWVoq+/3fE3K2Yiz2TFnoBGEV4w34uY5f/sg9wJD1WiFpmvZV8toFZHVyAkmRJe82705f6GR081GzgpdT+zalP8Ya+D6Fk7pnZ6AuPVmVakP80HdXNqFCIwUlSYISsUM36WWxwG0ZBKcCh87zveXmjeTV/prJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JGOtzEFH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JGOtzEFH"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so624044f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jan 2025 06:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736432148; x=1737036948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLft1eUPbmzVzm9DxwwwdBGZbJXbwq1U0G7K6ODNWrQ=;
        b=JGOtzEFHe+w+TawwTFR+NQYVJZF0goG9Q6R4KCWIpVHS+ngFat6OvmQAvyEe9FWHT8
         ZYxoEQ5KjeJ020jNRv3/ik4FaXzwqFaU7PVwf+XYuez91c7PG2SVaubAX5iOKLDfPYOa
         TLJhtjoyzRJr0EnEiUItK3+D9X7435oqutERmi4nKh7Ls4qSN49N4BlPF67DXEJbL2TB
         S5DmMtehycqvglzyPw5xJTPj4ROYOzhFFN/fxhNF10Q0eIS6kwnnyYufRc3WyilzLSiK
         XAUClSkYtCQIxSRDy2fU+a01mhpMP/+rGR7xL53LaObuMBDhrJDTpXZMXcczrD/QaPfD
         er3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736432148; x=1737036948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LLft1eUPbmzVzm9DxwwwdBGZbJXbwq1U0G7K6ODNWrQ=;
        b=A4+v8rHx1MzTrG6W2mwoHk5FzIoQy5I59e2AffLm99/I4wUX5+ij/H4h9daY9DcKMS
         pXrtTN0M5131uT2aaVhf8JieVwgbedO0pjaAGyl2eOcGPpTXtZnI5PxOlbCX5ZsmlNXA
         U5dgHY/j25gy+k1BF3LRIzzkAQWukowaNU5ZRCfx/wbetIqx9Zd1kYOYo0TrbMUNqtdm
         07S/GkHyXduq4UySJjG1WVE1f++J4sDAhNX2xm1XKGoD0oxWXLSXwd6zFKtq/zNn/dLW
         laVluKdwMMCtC8Jm5oRBsh3hgtVSi87XBuGx1ZhSFLWwK1ACEUPKTfx4NmIuDGZD83Tt
         AceA==
X-Forwarded-Encrypted: i=1; AJvYcCWtfmpdJxGbQRzPwOsT1jopkStMbRLiP5aDc5XorBj4FZmzlomn/gdvzUXSPwbGwrP+1Lt7/No5FfKnf+W0AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMHsw2EQePaAYU1VbrPrrqZpWQH9k0ySb0HE8yf4p4VhZrrW4p
	796CN1ouMOpuDmP9qHk4Z6KkR3O/HvPQs9OAaN7ASkNIObla6XtJf5eWK3BzCPkzTOfu83Dxu/S
	DmLYyClTaKh3apIEf5pJ/sN4JizEQ26UKn01t
X-Gm-Gg: ASbGncuzxI/d+d7H58POBwYcbq3HYCXcliDu4E+YJNPqoQ6BirgvYiKaA0kfkcPWBYT
	YU2G0maWezPq2io5Mx784WrtTqH8R8RTa8wKOJUg=
X-Google-Smtp-Source: AGHT+IFlvOdJYB06EErB2NbD0FfUk2toPO1KUT52hGvwQmHpJni095lR9RWKiS81QHIv8GNvi0OmjU8gJFbOc1B9uQo=
X-Received: by 2002:a05:6000:4011:b0:386:3d27:b4f0 with SMTP id
 ffacd0b85a97d-38a8b0d324bmr2774359f8f.14.1736432148255; Thu, 09 Jan 2025
 06:15:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108-rust-btf-lto-incompat-v1-1-60243ff6d820@google.com>
 <CANiq72=XD3AfZp=jKNkKLs8PYCBuk2Jm6tbQB2QtbqkieAtm8Q@mail.gmail.com> <CAEg-Je8YdqYFMiUK7enjusTjMhRMWTbL837x7-qQbi4LkcRcLw@mail.gmail.com>
In-Reply-To: <CAEg-Je8YdqYFMiUK7enjusTjMhRMWTbL837x7-qQbi4LkcRcLw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 9 Jan 2025 15:15:36 +0100
X-Gm-Features: AbW1kvays3uMKjjV7WuZh67aIxFcLbDxsI8XfGrCrA96aNCY5b-KWW2yqxX6JWA
Message-ID: <CAH5fLghtCure3EjN-hRx9PT=10_E+0MNbjFACT_v+P1StWELPQ@mail.gmail.com>
Subject: Re: [PATCH] rust: Disallow BTF generation with Rust + LTO
To: Neal Gompa <neal@gompa.dev>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Matthew Maurer <mmaurer@google.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthias Maennich <maennich@google.com>, 
	bpf <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Eric Curtin <ecurtin@redhat.com>, Martin Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 3:10=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote:
>
> On Thu, Jan 9, 2025 at 8:17=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Thu, Jan 9, 2025 at 12:35=E2=80=AFAM Matthew Maurer <mmaurer@google.=
com> wrote:
> > >
> > > The kernel cannot currently self-parse BTF containing Rust debug
> > > information. pahole uses the language of the CU to determine whether =
to
> > > filter out debug information when generating the BTF. When LTO is
> > > enabled, Rust code can cross CU boundaries, resulting in Rust debug
> > > information in CUs labeled as C. This results in a system which canno=
t
> > > parse its own BTF.
> >
> > Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
> >
> > as well as BPF/BTF, plus others that may be using or were involved
> > with the right-hand side of the condition.
> >
>
> Do we have cases where something is a mix of C and Rust? I thought all
> our Linux Rust code was self-contained?

If LTO is used, then any time that Rust calls C or C calls Rust,
optimizations could move Rust code into a C object file and cause this
boot failure. For example, vsprintf calls the Rust function
rust_fmt_argument when using the %pA format specifier.

Alice
