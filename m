Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BD01527B1
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 17:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737565633; cv=none; b=LkYv2sCOo0KwHJUcEz4huVlT7edvcNyKdgkcTIGq7MlRgjajPb0Yvi6HE6ZIJJ5urfwS8loGPFl8xtMDxukGVtWKpFxOOAUbbzkLPBVGDiAOWsXM9t0t4XVEgD9scndWUoRZlkq6vmWB25Zi2eVc0bY1jSKdi5kbtVRvhvRWKK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737565633; c=relaxed/simple;
	bh=JNLfOH2aw7sz7Mhi4i5wKbrYE0THrHyy8wbZWOqimvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uofs7MlAxmqmb9NwCKoww3lJZv5NEu4PzieGCdyXzFMLAEaokbo9h46wG7ogOEBLGuS3CsuIgcQrE+fZPX00xLp3xOB5HfqjNcWaxvE/0MY0yR78TI9GSCFnvZG0Bo1iToFQ0bWR/V/8g+4CdgqZ5gl6KsV77FRrs1R9BpQr7og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WWOUPjRt; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WWOUPjRt"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so5550903f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 09:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737565630; x=1738170430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjbbvIvJnn+F42E7z2PwvrYdTyPTjvfdjZn3qHYBHrA=;
        b=WWOUPjRt7XNJyqqqB59mk7D0us2lGq9SVJFuATIKcpbIFl6R87t0xIfUFk/jwsauPW
         QYDxXFFreDZNgYZ2ntwtK9g47wBfv6Qnskg2/lbvS+rVb3vZ4QNZSJXx+bZT9rrvqn48
         ddqftx7bHREFKvwoeiaGbAkYWtlsRMj4E9VExung3xVlxTm11gdL5+Mpuo8RtkMGDqV3
         WXcl2roFjVp4tXDPjIwhRWvyB9c0kE8JmHC+BZZvjXjMfqba17gqbjHl6BGtMc3DOSVZ
         MYf1C99YBBLScrthPPgOzB2/Ho7tuzJB+VKcTbxs3Iym8G/rXngM90QRfJ3oAexPj6GT
         qhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737565630; x=1738170430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjbbvIvJnn+F42E7z2PwvrYdTyPTjvfdjZn3qHYBHrA=;
        b=lLncb49KGokkMyFWx+cc8MLoy+00P7ZWzQoIwYzxBnNvrbjYnnzsNERMN8EtKSzap4
         WrvW6LOWAxzz42MmjVZgrY/pGG0Hz7WYyeqJHEGcomj1IB1BviBIzyVPr+BL2G1VpBAI
         bk4iF10Jvv3rKnCpVo5Xz2X7vLlmTKIZithtVZccznkAH/QBlU1wNn+cfaXmfhN5BlsF
         Uzmn4rUQ3xlpkrkNaRoJ/zI854o9zdugHOhzw/gkTLe8EXrmQV1MVwroFZZgypZNbVez
         OsXJtVWJmQGT9Ch+SpxZ/mBvvEeU0MZHNRpWwnsPLbKrwtv9loCeS1UdU6jdu0smSbnK
         aszA==
X-Forwarded-Encrypted: i=1; AJvYcCX3NHcO5I8YX/3A99jmG6fKgHNcD+GczWx9uHCXx6tUZ7RaV9Kd+qVJsS9c+u+bJuT9PAaMsLTz4Snj/rcZ3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4VrVwC1yo0s/gibqRDY4a/mHYkTwbpSR7T/b7TNIj32weeJcZ
	Xx/QoCMaTdZm/7JtsuhqvefVnyzNHbU2INaOocMjae3LIKjhjoMsW9QWWcMecJPEdDRGUhCa+YP
	dAkwkl04XHWLOdrbGDGbW7Zk9BDgtIQM5VYjs
X-Gm-Gg: ASbGnctDBBcgdFDW4v1+HUx6jrviXnMWoozmZRLCyF74770Aw9kiuskka3ARRtGDAIt
	UqWBwhpADXoqoAiWsbhfBmncmu8lzrbshSyOqZKZnuqAIxd3N9mtm
X-Google-Smtp-Source: AGHT+IH6TtBLgKrmRaEuAzXOid7fbYxQlKAbzpwzx1uSou94uVrj8sOvdmqZwkIgQNpxwgf91vHw3VHXDN5R2jcADck=
X-Received: by 2002:a5d:5984:0:b0:38a:4de1:ac6 with SMTP id
 ffacd0b85a97d-38bf56555e9mr19777380f8f.6.1737565629943; Wed, 22 Jan 2025
 09:07:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116044100.80679-1-fujita.tomonori@gmail.com>
 <20250116044100.80679-5-fujita.tomonori@gmail.com> <CANiq72nNsmuQz1mEx2ov8SXj_UAEURDZFtLotf4qP2pf+r97eQ@mail.gmail.com>
 <20250118.170224.1577745251770787347.fujita.tomonori@gmail.com> <20250122170537.1a92051c.gary@garyguo.net>
In-Reply-To: <20250122170537.1a92051c.gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 22 Jan 2025 18:06:58 +0100
X-Gm-Features: AWEUYZmQ38ItMMuP4jNhT2eiJ2jH0mWYg_mL8dk2ga5-CGUrqvDz4IBv-_0ZZi4
Message-ID: <CAH5fLgiEn27VMUfrXcidu0rUpM7MPZVCOjywa-vQBO7dOdQrRQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] rust: time: Add wrapper for fsleep function
To: Gary Guo <gary@garyguo.net>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, miguel.ojeda.sandonis@gmail.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	netdev@vger.kernel.org, andrew@lunn.ch, hkallweit1@gmail.com, 
	tmgross@umich.edu, ojeda@kernel.org, alex.gaynor@gmail.com, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	anna-maria@linutronix.de, frederic@kernel.org, tglx@linutronix.de, 
	arnd@arndb.de, jstultz@google.com, sboyd@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 6:05=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Sat, 18 Jan 2025 17:02:24 +0900 (JST)
> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>
> > On Fri, 17 Jan 2025 19:59:15 +0100
> > Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > > On Thu, Jan 16, 2025 at 5:42=E2=80=AFAM FUJITA Tomonori
> > > <fujita.tomonori@gmail.com> wrote:
> > >>
> > >> +/// `delta` must be 0 or greater and no more than `u32::MAX / 2` mi=
croseconds.
> > >> +/// If a value outside the range is given, the function will sleep
> > >> +/// for `u32::MAX / 2` microseconds (=3D ~2147 seconds or ~36 minut=
es) at least.
> > >
> > > I would emphasize with something like:
> > >
> > >     `delta` must be within [0, `u32::MAX / 2`] microseconds;
> > > otherwise, it is erroneous behavior. That is, it is considered a bug
> > > to call this function with an out-of-range value, in which case the
> > > function will sleep for at least the maximum value in the range and
> > > may warn in the future.
> >
> > Thanks, I'll use the above instead.
> >
> > > In addition, I would add a new paragraph how the behavior differs
> > > w.r.t. the C `fsleep()`, i.e. IIRC from the past discussions,
> > > `fsleep()` would do an infinite sleep instead. So I think it is
> > > important to highlight that.
> >
> > /// The above behavior differs from the kernel's [`fsleep`], which coul=
d sleep
> > /// infinitely (for [`MAX_JIFFY_OFFSET`] jiffies).
> >
> > Looks ok?
> >
> > >> +    // The argument of fsleep is an unsigned long, 32-bit on 32-bit=
 architectures.
> > >> +    // Considering that fsleep rounds up the duration to the neares=
t millisecond,
> > >> +    // set the maximum value to u32::MAX / 2 microseconds.
> > >
> > > Nit: please use Markdown code spans in normal comments (no need for
> > > intra-doc links there).
> >
> > Understood.
> >
> > >> +    let duration =3D if delta > MAX_DURATION || delta.is_negative()=
 {
> > >> +        // TODO: add WARN_ONCE() when it's supported.
> > >
> > > Ditto (also "Add").
> >
> > Oops, I'll fix.
> >
> > > By the way, can this be written differently maybe? e.g. using a range
> > > since it is `const`?
> >
> > A range can be used for a custom type?
>
> Yes, you can say `!(Delta::ZERO..MAX_DURATION).contains(&delta)`.
> (You'll need to add `Delta::ZERO`).

It would need to use ..=3D instead of .. to match the current check.

Alice
