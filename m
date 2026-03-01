Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E217617ADE0
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 11:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772364704; cv=none; b=VgTasgGV1I5Qe+kKxzVCulKf48b3dSykR6xsOp4RoKnlfFKCkSZkHCkhYcxLt5QC0RPeaxDfEd2RnknEpo4kjuwlBdyLFJWil7roY+IJdnpuQ9z5Jz2lfAVBCTJ5TBWUpKEbgYJqxftuH9eSma4NAjxcEPOy9ncrw+kQ7c/oh88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772364704; c=relaxed/simple;
	bh=uMFe7uI5KQx2ifr5s3qh2c05WQVptHqAKMuxcaeOa6g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l6egfIhoawXWPWkkiIMHyEJs4NpT6+9/sRcYiQKs+w6bnXc8UsTQcytHHsA4utXXU1nBAuuRVe9OHzRP5LsB/pcsCIRBIxzCQFATuKPfaptbpDAXm/+mcv6Fp5bsTSHPTdwk7RDz7ttZ+05VUbPt5DibltF7yBYW3LYjuCLAcqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZFHZd2W2; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZFHZd2W2"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-483bcfdaf7dso34203935e9.0
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 03:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772364701; x=1772969501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MAy2CPvj2hswse9mlB2C5yDrhtQ8bradZmfDI9jvp4Q=;
        b=ZFHZd2W2LZniXfzUs6iaQUGwAKbPGcxn/xOeypsxsmYQKdt/XQ5+ZnilE/WRndv5HA
         Akc/tNAxQs5XB84jH0seeeO4kKyYOFiRSF0vfLt58YdPv5bxh24iDkFZ4BxTxWbKt++c
         3QOce4CaZ+LCe3PUk96wqqAHCZqfp++9bX6WgDlEV+npZ34UGcyPor4nhGx9gxn0vc2I
         Y0JurWCEnoHzr2xfXbRpXIrRGI147zyWhZeV6pfVqYCLx759ylXiERCFItCl7k00ds8D
         zKozr17NI7ZpKMrAnNTR6fSxLZH3bC+aK1Y3ztpqic/dWIIzjX/8ailSZMOfyHja15PS
         Dr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772364701; x=1772969501;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MAy2CPvj2hswse9mlB2C5yDrhtQ8bradZmfDI9jvp4Q=;
        b=c3lGLWLTezoGMcUzBV+PKcRKsFb7gqklCVv/lVv4wBPxlNDps3ozY3dcL//jMCgZqx
         ZLY8xa6PSHizChWue175Ix1rcg3eQag7I5NJ8QDUCMR2R5+9KmuNzg1vZsQagAs0uHKI
         /xnlDV/6g1pS1NzANrfAlBi73RISVz3aeULlZvjsVh/TfBSh9rPuRfcsta6T/1Hf/UcI
         t4KxtiIVuE0R8AJe5+tukKPqceOU37048UHD/tsPCS73e4DyBaVjwMvlIkgoAjmiJx1h
         zjB+JZS8QK6dczfB4cMhz5ycRnpNRHkw0+UVZBNh9L242TD5/gvIK/jBLltDj0ULs+uN
         4dJw==
X-Forwarded-Encrypted: i=1; AJvYcCW9RURbtzRplcDHanE2DF3kyLXMyK5J957m7pUus78jlkynEgpqEJCpS9HvPQ+pL1kkDJDnpL0gba8/dabfeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFlD+egv7tB4+ikh3nXBZHcuU7AZQAiTZvl/LNdffgCSwd9WbS
	7y6lrS21WkrNiC63F5w/RlKdyvHDBM/eLTT+3gQiF+8WjTaJIAa+k7h6Gs4y1w8Pg0PUH0bdHah
	Uk65aPX5wXZAXXkJ7DA==
X-Received: from wmbg25.prod.google.com ([2002:a05:600c:a419:b0:477:a181:1919])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45d5:b0:480:6c75:ddce with SMTP id 5b1f17b1804b1-483c9c11ef1mr147483115e9.33.1772364701057;
 Sun, 01 Mar 2026 03:31:41 -0800 (PST)
Date: Sun, 1 Mar 2026 11:31:40 +0000
In-Reply-To: <CANiq72=Y5aHc+jQc2Z5R7gxQj4oyKKKuPuuR9Uzx_LR8Ph84gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260215-hrtimer-active-v1-1-a754d10492c2@kernel.org>
 <CANiq72mfLyXNs2QdzROkgOeuQDPSEM_f3Rt3rvGcrhd44weSTw@mail.gmail.com>
 <20260228.112257.2070673836800156099.fujita@bee> <CANiq72=Y5aHc+jQc2Z5R7gxQj4oyKKKuPuuR9Uzx_LR8Ph84gw@mail.gmail.com>
Message-ID: <aaQjnM3XbaolKcvo@google.com>
Subject: Re: [PATCH] rust: hrtimer: add active() method to query timer state
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <tomo@aliasing.net>, a.hindborg@kernel.org, boqun.feng@gmail.com, 
	fujita.tomonori@gmail.com, frederic@kernel.org, lyude@redhat.com, 
	tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com, 
	sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 04:04:27AM +0100, Miguel Ojeda wrote:
> On Sat, Feb 28, 2026 at 3:23=E2=80=AFAM FUJITA Tomonori <tomo@aliasing.ne=
t> wrote:
> >
> > Should we use intra-doc links for true/flase? Currently, rust/kernel
> > doesn't seem to use them. Seems that Rust std library isn't consistent
> > on this either.
>=20
> Maybe... It doesn't matter much either way, obviously.
>=20
> For simplicity/consistency with other "trivial" items, it may be
> better. On the other hand, it is more painful to type and takes 2
> characters.
>=20
> This is the entry I have so far for this in my to-be-sent guidelines
> "rules" list:
>=20
> - Use intra-doc links wherever the link would work (i.e. if ``rustdoc``
>   can resolve it), unless doing so would be unreasonably complex or
>   verbose. In such a case, use a simple code span instead.
>=20
>   Do so even for trivial types and constants, such as ``i32`` and
>   ``true``, as well as for ``Self``.
>=20
>   .. code-block:: rust
>=20
>     /// Returns a new [`Foo`].
>=20
>   Avoid:
>=20
>   .. code-block:: rust
>=20
>     /// Returns a new `Foo`.

I'm not convinced by that. I don't think it's useful for `true` or
`Self` to be links in most cases.

Alice
