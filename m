Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16C41D0795
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Oct 2024 14:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727879252; cv=none; b=a7ydzaGLjUMy5AemUqnR1WTGPYapzz53tOH1yR0p7amYKxRiBsmY2lcV7nRsdVWaXmqXPnOMiZGTKGx1VXn0JMBnPAJJYdIo7DKCB5kWNkFsRCsa2606AnEI+2qilDChiUyZGnGlAZXRN7efwjDlLH0vrJeklfg8HjrHXzgCnSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727879252; c=relaxed/simple;
	bh=6gZGtwXT0UeHa4PCsRrEyrA1BaUn/tinw6lXWkQk/a0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTDoo07X5f7W43rVtsS75NYp9/QgF1mJvJzJ72LVgyo3X4ZXAK8m/rSrLf9ADR2hJ23+sAWYQxGNPdivkjGkpB54S9VTPKr/YWYUt3eg2fTVUtqKuikRPy8IycAwCRtjd1Bws6C6MS9r7E8kNuUQ0VfEgHbv4D3wpBNUeMbm550=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K0NdXQnP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K0NdXQnP"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37cdbcb139cso3922953f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Oct 2024 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727879249; x=1728484049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Vome0jBYeRQ880YVIwEIz5cqcUYdUm5aLZDCRbiT54=;
        b=K0NdXQnPQeVOE/MhbS+419sJN1b5Ak3tpwoFy5r7xYvgE7IKcgJxff8s+dJ7bwOs/y
         eeM50L9GfHdMFv9sKnUwsnk3G3U2XJ9ix0H8agBk54P9PUHHVBVgSZrBEa7XjlZbDAUv
         RrDci5eQfxL/6ecHMUDa9+GwfV2StZnSAByEFHaShZDIqREbwNywsbWMeNjKxCA3VpOi
         hnt22Z5jePS/lv0CdmN2UaQeu7uzvz/JbWR6Zf/1AU+fDgSxui7d2jemDRX6/qcTpa+h
         OjQM4KbTmHTNjwlp20FnTJ/NTwbkjQkPAoXMR2u4XaN8K7ItyCHjkoi6l59gg0HiRYgy
         yrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727879249; x=1728484049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Vome0jBYeRQ880YVIwEIz5cqcUYdUm5aLZDCRbiT54=;
        b=k+gsfybytmpirqIuxjuKtdBvgKj8lq+S10j5dbTwoSr8GHMLDlCB7OM0BoCWWSnpNc
         WR6bENUDV2KKGCsCsGw3/5MrySU8J7+9dQig36I+46WL4P7gk0tmBi3BSCPFvFtYSmh+
         wxDoa+zPf1I0N5WII4fMX5FbAhTNVWWZpC1V6KUKgbTH+s9NRNC48OVElenGOexpwWAk
         8MuBa65LooLl6zB+MqgP3Gcsjnupxx+MRrQt5YaRmpOxh10HxHRozbM8Hgm0FsYeZ4LO
         JFPoh7QklN9WZi5IUP8nqByDSfQzrWpQUfkN8Fn0EEB4pgdGju+jZyD+WzVaBZKYsdwu
         /Q7A==
X-Forwarded-Encrypted: i=1; AJvYcCWCDkg84bCLPyMdlJYsxN4b2xJO/bgCuh8u0ldhfl9FohEmShHIAlauHJGAOiL5SYAi7bZNJNXwFelXgYePUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS8KpWzS022LUX9hpfuPVLKi3pf1gMfbH/l/3e5arJFFTDEJfQ
	+Bky1Al988flv90Q46Kk2dOfFlveixMH9oX276XzXJS7oeK5mfnFwSKfXxlsQRbnBV0wQRcrqYV
	1CpcZ/RweWUGbb/tkBSXbII96+b4BN9v0bSM3hxAQ9sy2ZKUBIw==
X-Google-Smtp-Source: AGHT+IGukuBN9cCJnVsbKBYae7JrAL7IzazwuaA/viB7RcfQC4VkWNFvvdb7cwNkh3i36oLMPb9Gx6/8exNHfYwBlkM=
X-Received: by 2002:a05:6000:18a1:b0:37c:d569:467e with SMTP id
 ffacd0b85a97d-37cfba20c94mr2763175f8f.59.1727879248680; Wed, 02 Oct 2024
 07:27:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002.113401.1308475311422708175.fujita.tomonori@gmail.com>
 <e048a4cc-b4e9-4780-83b2-a39ede65f978@lunn.ch> <CAH5fLgiB_3v6rVEWCNVVma=vPFAse-WvvCzHKrjHKTDBwjPz2Q@mail.gmail.com>
 <20241002.135832.841519218420629933.fujita.tomonori@gmail.com>
In-Reply-To: <20241002.135832.841519218420629933.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 2 Oct 2024 16:27:17 +0200
Message-ID: <CAH5fLgj1y=h38pdnxFd-om5qWt0toN4n10CRUuHSPxwNY5MdQg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 1/2] rust: add delay abstraction
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: andrew@lunn.ch, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	hkallweit1@gmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 3:58=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Wed, 2 Oct 2024 14:37:55 +0200
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Wed, Oct 2, 2024 at 2:19=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wro=
te:
> >>
> >> > > I would also document the units for the parameter. Is it picosecon=
ds
> >> > > or centuries?
> >> >
> >> > Rust's Duration is created from seconds and nanoseconds.
> >>
> >> How well know is that? And is there a rust-for-linux wide preference
> >> to use Duration for time? Are we going to get into a situation that
> >> some abstractions use Duration, others seconds, some milliseconds,
> >> etc, just like C code?
> >>
> >> Anyway, i would still document the parameter is a Duration, since it
> >> is different to how C fsleep() works.
> >
> > I'm not necessarily convinced we want to use the Rust Duration type.
> > Similar questions came up when I added the Ktime type. The Rust
> > Duration type is rather large.
>
> core::mem::size_of::<core::time::Duration>() says 16 bytes.
>
> You prefer to add a simpler Duration structure to kernel/time.rs?
> Something like:
>
> struct Duration {
>     nanos: u64,
> }
>
> u64 in nanoseconds is enough for delay in the kernel, I think.

That type already exists. It's called kernel::time::Ktime.

Alice
