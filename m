Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB07A2FD673
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 08:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763454997; cv=none; b=MZ0e2/2lB1zlqFHPFSSQ6rkqujQJdqApIcMfMCCAqNhgxS/Vugn7FMAnFwALjlxLm/Sxp1FMUpf+tWQsAgR00DI3gmMG5xyfBn4nHzl3YuuGFbS+GSH4M2DDvZi7RMWA5niowiawP7X0CCmuFPNoDaszwEm95Lvr4jxs0qagniQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763454997; c=relaxed/simple;
	bh=X9rgs9fzUkfFZByBzqYXIEArBtWMwWuyoZ72DlvHfC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZnDfrz4laR7F4bTKScFk6Ec6R+IgpVeyp4+qDa/StHOFmySHfnV03t2x1VczQPCnfCL1m2qHQ6wyiMHa5vokIBrxDJKjkH3vfLbbTlQz+d6rBA27kkzVCwDYOKmi3sSHJWtXLGre0X2c/y3n93/v16oP8vSbEUN6H8R715ApBkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKFrrqCw; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKFrrqCw"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b90db89b09so431351b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 00:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763454995; x=1764059795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLB8Q4cQ1Nq31DZUXPWs8y0VZzkAm2JvSOvnpf5jOaw=;
        b=XKFrrqCw6q7UG9WawZcZAGQGJHpKVgCNVskIsmXs2+rVb4foDssQMkK+uA0thUBfU1
         dRA+ui5N1ntBWOmwey8LqzHahVxVfpz0nSkiK4vFTkxoeeUHJBRYd2C2x19EK0enrOUe
         mZtZjKZBFzM/syn6np1u5ycKBVFDj1Nx1Twu//vN/yMktytOtIcf/JbOTAKgsmgNP0oF
         x6o/mPFkjotSQaaYA17g46ejloSau56gsLZpkuxAwGFljnIzZ9o7XHYG+FaJ7rlhT6eR
         f0kcPBfQMyKaXIiIi6LfJMiKWHrB44uxmvgkV6MHwZ+qp1kpWYg6iwt41Tgr1GBIEccD
         O/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763454995; x=1764059795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zLB8Q4cQ1Nq31DZUXPWs8y0VZzkAm2JvSOvnpf5jOaw=;
        b=MJ/qxdWAob18pkAj2H/pUN0WMfQPvswRWIx0E1ptzlq3gyZpj6JL3lgnOpNCDcOkMV
         JMGruq8vBBLrXk2tp2b5nyY5m48uQiVP73taqftTOe5XNsVz/2fgLaAu4D72f8XMvvk+
         r6KMV4RB5m8jQwVm8efnwd3hOvulh9M+Q5l4EdgC7YECCHCRPco69zcazSfsa7+5DlRp
         csz65zJcU1Ek5XG+u2SPdczJpjUiMgwjouSMJ19ZAm93CaTwnO3RoTig2zfsOv6H58DS
         2u4uWB/42vMZP2LGYR+shjXVvPp61bRTl2D/5tpvmSUX7xtwyxVSrJJcMFucgrj51RhP
         R2sw==
X-Forwarded-Encrypted: i=1; AJvYcCX7yhx7X4NF0HqQV0gg1BF63J+DvuGSr1LPFanqbzk/aq6bUex17rSUNrZSjZ/MThDoEo9fyiT1hD5TDW+D6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YymYTLoVa5qirHFu4vkFvLCjf812u++JjfQMnG5pt2FDreAYnfA
	4cGyPL4DM3V9uKYrAOxzWPi9F+xDMXkcIOrgJnLilgLOIBCGptZ8h8k3bS7Nx9Bycg2tggEB4On
	wSUSit2jDcmX6vQIV38zgbor1GVeDL/k=
X-Gm-Gg: ASbGncsWPFj5mx7OgE2qtomG0MXjWOGowJ23K3v7rXYmvPQJ/+AwGC2KpKE/8Bjfasv
	XjE/5YGBJToD7YRIvMZHVnDCYZyVvrqovA79cEw0mff/B71x1cLCB9BI0yigKiwf52nBGGzKckk
	P9Nwqj/yqhYPUls6oB+UnfaZJj5RkfgZ3dQN79mGETay71GQXygOiAbSGDeT51gjyIVPtfgaV6y
	tthJ5SsnJ4pOS/0sy/jI/nGSgmDKdRuIMzBWJnFjZiYjbJ1OqiUQlcYAiSkGpZQ+iKsLVkzI+I0
	jJy0KwUnFLVjkAbHjqR3uDVKGSgUUY/HE9X1TuHm6px4bP0TlxCahCf1F6UDVbxnp8dnGmSN4Cl
	iUiajLfDl4bYVWw==
X-Google-Smtp-Source: AGHT+IHQTv5fqzxNjDsjeD+gMFTtUrCgZrGHbaJGppEm/81pv+tovux+exP3E0AdLf8cAEbTyPfRuYgm9zt2qYGFpGI=
X-Received: by 2002:a05:7022:63a2:b0:119:e56b:46b7 with SMTP id
 a92af1059eb24-11c790f92acmr725609c88.1.1763454994950; Tue, 18 Nov 2025
 00:36:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117163112.22515-1-alexandru.radovici@wyliodrin.com>
 <9DC413F9-40A8-44D0-9A77-D392D25F1E82@collabora.com> <D9CBB978-017A-4EE3-84B0-1B93AC4548E9@wyliodrin.com>
In-Reply-To: <D9CBB978-017A-4EE3-84B0-1B93AC4548E9@wyliodrin.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Nov 2025 09:36:22 +0100
X-Gm-Features: AWmQ_bmkJEyfTtR_xi22-Re1pScmegHvbseSpc0kf1mL-eOKtJ7Y99-MA9cqPCI
Message-ID: <CANiq72nr0cZ8HrqdsEMBcsLnYN4i35b1aU6i_vZeF_eK6_xOvw@mail.gmail.com>
Subject: Re: [PATCH] rust: add a function that returns a reference to the IO
 Ports Resource
To: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 8:10=E2=80=AFAM Alexandru Radovici
<alexandru.radovici@wyliodrin.com> wrote:
>
> Thank you for the quick reply. I am trying to teach Rust for the Linux ke=
rnel at the university and this seems to me like a chicken and egg problem,=
 but I might be
> wrong. My understanding is that if there is no real drivers usage, this c=
annot be into the kernel. My concern is that if there is no API for this, d=
evelopers will
> just ignore the port reservation or use the unsafe (and possible forget t=
o release the prorts).
>
> From the didactical point of view, for someone just starting with this, w=
riting these simple QEMU drivers (debugcon and isa-debug-exit) is a very go=
od exercise.
> What I wanted to avoid is them patching the kernel before they can write =
these drivers.
>
> If we cannot merge this due to the lack of users, could you point me to a=
 driver that we could rewrite so that we actually have a user? Or, is it ok=
 to add sample
> drivers that use it?

This has come up a few times, yeah, and you are right that the kernel
rule about no unused code has some downsides, but it is nevertheless a
positive rule overall.

Samples are usually not good enough, but you may be able to take
advantage of this:

    https://rust-for-linux.com/rust-reference-drivers

It is something I proposed it to try to help break the deadlock in
some cases (one still needs a maintainer willing to take such a
reference driver).

Cheers,
Miguel
