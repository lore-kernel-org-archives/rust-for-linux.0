Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45572AD03
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 22:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767135571; cv=none; b=rG4NGibObBnmtA1ejouL1Lp0b7VbgVZBAq4ayB2IocYwpJfKt0FwrjwbjnHN1zUR2oqGbG/EQXOOkPTClizpcVRrrca/KlEhQAh8IfTKzMfz9wyilJnje+pI9eje7RPOi+a+VEanCPXTzsHfOPepR9lsY3HUwxXZhWzCKAK7xIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767135571; c=relaxed/simple;
	bh=Bvx1rvUrexhyOryiQyG1S8olUmd3BFlrYxDc/BKrQ9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SbYvg++97N3EJ9giiF1PLvQ3Pehj/h2MnRnD2xw5TZKVyAelKd27hS3D5q0EwNal+itKsW3UFVw1lW3vfGdqR/e0BAX7Uev0dHHMouwYBdeHsAJUObkpCbhUNXl3wIAW0pYCKRJOS0qQboCbK9EIWlGHcYuIWRuVTZumiBG5x8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=reXqpdGM; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="reXqpdGM"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fbc544b09so8000742f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 14:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135568; x=1767740368; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwPlf6GBXqy6DTcPU2lffeV8La2f09M1ZRawKgCJ8hA=;
        b=reXqpdGMOuY7AAUhGMx17KSkmndMP992owVV10GWwZ6cQaHfgJ1/K/U9jT4frwPUBj
         tCF6B/jljQUHrd/872oJycFwLHr6woSFHCn4T+UugNeiE2IaQ4Ie3VAAa4EJYrrk7K/J
         v2dA2tN402tUyKYL7ZoVE36s7sUanJvoTN3Yc3nwnooSG2jhAQZA2UAQZ6HhupCV2OJ5
         vlVENO7o0/DEb1fmihm4S3gEgY8C+4xey3j18uEptFkD2z4SVgF/S0gHW+vCstmtIfcW
         FewPP7DvgpiVnrKJqVBexvxmnVmJEMnBpV7Z2CAubluMP+AhAVUwb+u4Smff2WnFNJT6
         /Cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135568; x=1767740368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LwPlf6GBXqy6DTcPU2lffeV8La2f09M1ZRawKgCJ8hA=;
        b=PB2Y6xekv6JwavNz7GqtLRZi8k9WfkS6CC0a6ETvy7sHpEkSos+gZeEz0v3Uo0PYNL
         x7F0BzNoktsL0EGMm2XPunL9MY7aHAyGHBt5opKq2DHiXSSEhtMNzS/vjIsN/1KLwVFT
         4Z5OkBPXqeRNoK5fpjfpIntY+1ChdrSdnxnTqRQVitSVNIK2CRDo/5rFDKtky6w0emKh
         z0PLi9kc0lnfeXFiqKeVFV2gfJiqCDjLxLWEx5ug9ACtTutuqPuW3gQtDllmne0usQMM
         U8CTzUuJj264X0idKgG0TxTt8phNeZeCRDT0lePNArwhaJFeTId/NNG0i4WcweYkBvUJ
         K1Uw==
X-Forwarded-Encrypted: i=1; AJvYcCU53J7b8kZLzNaqa8lKbCowxVxG9LgAUwQzWkoIPtqTdcM09oMed6JP2Z5CAip/DgAJH4xy9IMB6M39ivpLQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwurV0RrBflt7KHmrhV0hTuyH40WbHno3U4EB4I/zDcg3jTtoQj
	c18SMlvX2yYBunq7fQ3bTqtQCUZhQ+/6EAtSuyH9CsSiEir6mYKcCpl+/BWpGJhSRd3bgwwixTs
	Wco982FoUkr6QZe7qomBuzicxjIuVYd5JgP4zdwoG
X-Gm-Gg: AY/fxX4u1SZr7dVhs+6zjinLJwFleh4oP4iTFIqKVt0mOHu7YECG0NQu2CUa0Un/qYD
	LxYQKseG+sfYNcB2d8G0nxEfdXeHc5eErsj19g0VkrjF4ZqJX5TxUCdT4keFvGqf7PdgkA7BWDf
	ob9YiR3QDknhsZHbijVqdqQNVw16CLTnAVrjXSQfM/1X0rJx8WiFS6upkBXVp6dlLvIIlICib0t
	x9s/nlT7GwFq9rKN41FDo4PAw8xtlVpq9+ZbC6ZEhtvF6tXm13M2Ses99ILhiZ10gXSvTxDyNTc
	kcOh3mcRqL8J7CiJ153A0uVkOg==
X-Google-Smtp-Source: AGHT+IFjHGJQpa9Ox0SuAYtMwDaPD3gPciDStM8oBVj7uG6DxpI8L7ZB6pMttzUx9iqF5WjAF6yQ1s7ThbYPAsaWxvw=
X-Received: by 2002:adf:e74d:0:b0:432:84ef:715b with SMTP id
 ffacd0b85a97d-43284ef74a2mr13106333f8f.0.1767135568046; Tue, 30 Dec 2025
 14:59:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251227-driver-types-v1-1-1916154fbe5e@google.com> <CANiq72nScSLkB0ix6Rw=SfpqDirx_GgcCzgHLucKd0d=s5aZ0w@mail.gmail.com>
In-Reply-To: <CANiq72nScSLkB0ix6Rw=SfpqDirx_GgcCzgHLucKd0d=s5aZ0w@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 30 Dec 2025 23:59:16 +0100
X-Gm-Features: AQt7F2r7VXfbozrNCx9iThcYJTFsVB5uk7RSqPhdbLyAgnNGLmcB3hgt1Lo0ofk
Message-ID: <CAH5fLgiXMZ9qMT=hi7F6XFxYkPcoqZAbqZqCPfvyS24P6nLhLQ@mail.gmail.com>
Subject: Re: [PATCH] rust: driver: fix broken intra-doc links to example
 driver types
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 10:18=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Dec 27, 2025 at 4:47=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > The `auxiliary` and `pci` modules are conditional on
> > `CONFIG_AUXILIARY_BUS` and `CONFIG_PCI` respectively. When these are
> > disabled, the intra-doc links to `auxiliary::Driver` and `pci::Driver`
> > break, causing rustdoc warnings (or errors with `-D warnings`).
> >
> > error: unresolved link to `kernel::auxiliary::Driver`
> >   --> rust/kernel/driver.rs:82:28
> >    |
> > 82 | //! [`auxiliary::Driver`]: kernel::auxiliary::Driver
> >    |                            ^^^^^^^^^^^^^^^^^^^^^^^^^ no item named=
 `auxiliary` in module `kernel`
> >
> > Fix this by making the documentation for these examples conditional on
> > the corresponding configuration options.
> >
> > Fixes: 970a7c68788e ("driver: rust: expand documentation for driver inf=
rastructure")
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Reported-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Closes: https://lore.kernel.org/rust-for-linux/20251209.151817.7441085294=
26448097.fujita.tomonori@gmail.com/
>
> Tomo: do you want to send the other cases in your diff as a patch? Thanks=
!
>
> This patch, together with Tomo's diff, will likely clean UML in 6.18.y
> as well (Cc'ing David).

Ah, I thought I had seen someone else run into this somewhere, but I
couldn't find it. Thanks for digging it up!

Alice
