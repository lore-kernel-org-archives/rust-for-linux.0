Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E371FA169
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 23:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736812403; cv=none; b=UYBEEgZ/llSCMx1sgHYThURC/FvPIgYwTROZ+2TzDu0jo2dqnl674l/BCs1Eic6B/0zCZz2oieYQDYukehDT/9wJo7OdOv/DnnTbfKND5wjphUMwsVJ+pUJFBd6WLC+aKeQ8srLRlQPJQSiX/+3SGJtJDC0SK/6PnDxMQKUFYAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736812403; c=relaxed/simple;
	bh=7ef6OD10JTh3ZnfedK0aQbEiunn7aEuhufJ7+ATxyYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hIXIXfhgsuIx2sCk3FocqDT1XuzSzGFNtV7jKlmvSx2CfoPJuyEc9Pnqv5ox+vbt31AC5bBE/UsN33e14km4xYe6XHUFlxXaQcusHWUNYUO6Cb5DoRJfa0bMPAz+SFBY6z3wdrbKujG8X55rQN3GjYIyicJ6IGuQwG9XdzxZQro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgUgvRq+; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgUgvRq+"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ef79243680so1049179a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 15:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736812401; x=1737417201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HP6epL229j8ovbs4byFlvSmhSPH8Xkv7Oi6Q1y10ELs=;
        b=MgUgvRq+nQwMlzEU4V2Kw1yueqE8UkH6BjzZue/PpMWEMqOk715+Usr6hyEjNNXZFw
         igSteq2bTOgFxv+JPWi6xRLE+6NEDTG1ouOA9QQoMNFMJmO9QSSBGVkTAPsLvgUEs630
         a58fTRR0/tlTnQ3U+en09scCdDE7aTL7y5CAwE7YqB+0nwPFYr6E+yQRBYgM0ntZrkb4
         3fYiuzSiU+2oaFI/QXMavN2XsZlTLjkdNuXyLGr27ymmup9ll4PkmrRcKHCazY/kYzS9
         4wuap5fAR1Rqx5j/dnqeRPfzsz0P/glcustDNVhuXoggzxK3FT4lCE0MejyFAtHxBKRf
         OzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736812401; x=1737417201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HP6epL229j8ovbs4byFlvSmhSPH8Xkv7Oi6Q1y10ELs=;
        b=weLleADNp2y6AfCI3MF9fJWt6Hps+7P76xuyu0Ha1uBFrwpNCi7aAUO/e5nt7vcXTG
         i4PLuY17C0tWAPM1LflkseZyLeS0y6LSNnB9hmccNuOGr4fGRNMiKHglvgrASD7kFRUC
         yyr0yaXkKsTFGg1g1ofEO6apJInoP+61BrMRRfdWyNVFgpabQ4a5JZbVqyU/VAgoQkdf
         7AEiLPpbuI4RooXM3w4EI/pOnQgApy7LOkJUcFXl3Ht3dutkQkwy1pGJYuhPvu5CACNv
         Lj/t3VajFD+upXaDYqg9rlgciOMev0I0FjMuDjRtmbcXsO1UwzseVObmeteyViOJSNLt
         By4A==
X-Forwarded-Encrypted: i=1; AJvYcCWUNBBc3PaaHBBXwDcjT6qEEyCPpciCfbW0vZys19UlZnX8WOpp+tcFYZu1kjXTZ8k+o0oOBWXU3Bb7tVXM/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvXEcmlKH9h5sW03VfNpyFcDXmN/rCemhwTIv4owdXwO8wHB0Q
	2LeCNeKz26zDPP4m4rZ2yFAVmHwLjN4541Ml5dGi5kDdPpfQ/MYV4SyZjk+eet8csSBrjzdQ70M
	uiKwznUF7lChhfGe8ofwLYCfkX1w=
X-Gm-Gg: ASbGncvBM4UyOeGCMWCdC5qsiwGBjESsbNET/I97Mn1rIUx6kk80oEqy3/CLe4Zknys
	R4x48QhNnYA6D0gSGxqveRXcfSDfTntX8KplC/A==
X-Google-Smtp-Source: AGHT+IGOhSPTCYU9w86RhCdfpr0ZFbuIQHedB9djReg/lNYygmo98GV87fMxsHxEEqihH/yaxz67FEt6mkGflfFOBmE=
X-Received: by 2002:a17:90b:2b8f:b0:2ef:c419:6930 with SMTP id
 98e67ed59e1d1-2f5490dcd55mr12520715a91.6.1736812400856; Mon, 13 Jan 2025
 15:53:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107-gen-userslice-readall-alloc-v2-1-d7fe4d19241a@gmail.com>
In-Reply-To: <20250107-gen-userslice-readall-alloc-v2-1-d7fe4d19241a@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jan 2025 00:53:07 +0100
X-Gm-Features: AbW1kvZgEV7ZhnN7YR1cAttyn4VIgW-vicy4JgruyluClAqWldkM5pGFUFsPKJU
Message-ID: <CANiq72nE0infU-REbNHS6TatmB2AMnRv194Ghgx7Sd7dkpWeGg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: generalize userSliceReader to support any Vec
To: Filipe Xavier <felipeaggger@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org, Filipe Xavier <felipe_life@live.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 8:25=E2=80=AFPM Filipe Xavier <felipeaggger@gmail.co=
m> wrote:
>
> The UserSliceReader::read_all function is currently restricted to use
> only Vec with the kmalloc allocator.
> However, there is no reason for this limitation.
> This patch generalizes the function to accept any Vec regardless of the
> allocator used.
> There's a use-case for a KVVec in Binder to avoid maximum
> sizes for a certain array.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1136
> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ Reflowed and slightly reworded title. - Miguel ]

Cheers,
Miguel
