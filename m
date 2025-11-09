Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890F62D595F
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Nov 2025 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762683917; cv=none; b=ukty8g+ugz2+DIYAkkFssBV2uOjIxE5j9PYUQFxzEK3tkiHINpc2aOaJCAwlnfMAJ4RdUMYeOywAs5Yv6mPRMLRMYbN4qX8jpltblapcvPJrvML0dnkp0PCkdgp9EDpE/kT6E7T08/40Krm8AY6UXs7H3j2/pLW1p6uJAMboXUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762683917; c=relaxed/simple;
	bh=aTj+xi1dNvcUs59gPpu5k/cwPtbqdjHMItUzYc4T4H8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R4xmjOYZmljaWW+tx8JZEA4Y4IEem3qxqsaBA1wUrKakNp3WUteV7lRcfIGZ/bpMPnzYW86uCArgwuXq3+CwXpU0vraDGov+jJtHMQqqSb+VB3PZBIPIC0YAWu2aLZCCOEhqZ0oZY54qqmzUZmhdtkEeY5yJesNRsBgbpvLSEhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTAzi+ON; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTAzi+ON"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-343610f3990so336525a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Nov 2025 02:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762683916; x=1763288716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY4/B0HvJE+qTQFqM/P/T84yDE9f54fdQMk2u26RaLo=;
        b=PTAzi+ONCWCLiiSb+RXZBrDtoEeA4zpt+ZloHAn2PXMpf/iDBkNbEi9vhSCs1l2Uwh
         27f2qwohI9FGUwSZdzuGepkmAwljd5qGp3SKmXyXdG4/kv2F0kXy6u/M/RlAFHi7Ol/I
         JNXa0nRQHPawfdoyLvnR+3dn/gm993WiyTgCDHFz1TDTRHc0BBmWZiA4xOoJwz8VKV5f
         h3kmAD5L67Bmp8GTyezcTW4Dr9sSK7Grok65NwpC6fAfTODNBvewFWFwC8yXu26nergb
         MabqGxOlAuykwGZ+wwxA88JBsPNuuTEWp7D1hMCaXgVCDDW4tBfof7U9oSve5x7ocMDb
         UcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762683916; x=1763288716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TY4/B0HvJE+qTQFqM/P/T84yDE9f54fdQMk2u26RaLo=;
        b=AC1vYzfYLZbPhMa0H4BoalxQmfW3kZlkoCeesFIHQG9wpSGghmtg/V0yrGu8dW2B/A
         nw9Rvwb7eDoUf1BuKE9gaN6d/Kr+StAXAy1SCAQDwSCcnO8A3zuNZw+7dxrJD0q5Re+a
         QOV8DWq+x9KZ7ffckygO+3XJ912wjCTW8ELvB1sSisgqVoGz8UsmvLQSJAMtafGSyqfa
         7iJ1vNTbkFXd/Re8qxNDBvSRRW5agfAeTIKu+VWGBCVS4j0CLEV5VauOf9UO+aI5hsc0
         6wNkD5xlU0CFBnwddyU9UgvDJ8y9aQz91XGW7msz7Yt+Lilc5a23J7528U8EBtMzvR0D
         /Hzw==
X-Forwarded-Encrypted: i=1; AJvYcCWmfJVEEPgy9NeLlBtACAIwKWszTzgty9Nw+eDxCFN4cdVry0iCocZdD/4M2OIzVq+XqLMBFTE3+geNjCzh8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPQ+2wfvHZOy+xYm+bFtNqC8Tu0XbNqRvqvNHhX1OH1PXv9dz7
	3pq0u/e3Jz1+3ajRUGIaTDJkxNWsnhOfBS0QxXDGiUNzci0VKPCADvZTofwlqsS6JiSpjJoPGcP
	gavTicxp7v6M0eqozScRx19JUrKVynu0=
X-Gm-Gg: ASbGnctkMEi9oa+EO+i3wq/M49UdAj5CPAfGSAd7Q8189UptM63lVY89d04kaNNTGW1
	WW+Nmkq/hzR8WkK67Oii1ZMkdDfpuiXtFZEV5je/w/mMT/IqnoqfbKFXJ4HvhlexvjtzM36JuhW
	PYd48uX0aAcUv92SJomaBqFfMz3dirpt8dVr9B61xFFjjVLY8Dd6+dz/pd64oSfEVUO+oa+jyPT
	5rIsx4R7JrHVaO4w3j4xBc5g4xJOEWluiQZ2kR5ynxZPFR2eiHsn7YgoTkI1MnW3OaR8MGniOuk
	kaIKXkj3wNJLTYYTpH/tY+xlB2l1TbHBfH8PewgIv+4CvvhLGGVIDe8abctpXGlLH2p79QoW4VE
	Htl3L6qrlB5b3uQ==
X-Google-Smtp-Source: AGHT+IGQaikK6vNNCjPVJeuplJDKBJe3N+BOuc4E9oBGcfkuiKRHIvOyik2Rqu1v9UYf81SQNtrIpb/0+IN8q6el/3k=
X-Received: by 2002:a17:902:d4c8:b0:297:fe30:3b94 with SMTP id
 d9443c01a7336-297fe304a7fmr17893915ad.9.1762683915716; Sun, 09 Nov 2025
 02:25:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027200547.1038967-1-markus.probst@posteo.de>
 <DDVLMBC40199.2BVFYHDGQP4Q4@kernel.org> <cf50c6db2106a900f2b9b3e11e477617d8cbb04a.camel@posteo.de>
 <CANiq72nhhji-cz2T2Cg9y5AwUwcc9q1Hd=-6J=6TafaxcHZHeA@mail.gmail.com> <d0f1effa5352959191ea8525963e84a832026dee.camel@posteo.de>
In-Reply-To: <d0f1effa5352959191ea8525963e84a832026dee.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Nov 2025 11:25:03 +0100
X-Gm-Features: AWmQ_blh3zXPBDBa2xOppsa0rLUtvjo_85ItJVX54L8bAP5DoouwDP0v002pXaE
Message-ID: <CANiq72mmb7oH_3bj8_EwMA8RGg6M9TjWj+ebbaEQV-RxLx1iBw@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] rust: leds: add led classdev abstractions
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 3:49=E2=80=AFPM Markus Probst <markus.probst@posteo.=
de> wrote:
>
> Could you please clarify if there would be other responsibilities to it
> than code reviews and adapting the code to breaking changes from the
> LED Subsystem (I assume I will be notified in that event).

It depends on the case, e.g. if the LED maintainers prefer that you
manage your own tree and send PRs to them.

But, generally speaking, a kernel maintainer takes care of a few more
things, e.g. triaging bugs, fixing issues, tracking patches, deciding
which releases a patch should go into (backporting), etc. Some details
at:

    https://docs.kernel.org/maintainer/feature-and-driver-maintainers.html#=
responsibilities

This is not meant to discourage you, of course -- being a kernel
maintainer is a fairly unique experience. Now, how much it is wildly
varies depending on what code it is, e.g. how many changes go through
the C side, how many users/callers you have etc.

I hope that helps!

Cheers,
Miguel
