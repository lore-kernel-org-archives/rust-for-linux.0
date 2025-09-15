Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB5117C21E
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Sep 2025 06:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757917724; cv=none; b=gnFQFAE0acMqDBqTilGuQIm4C9tfpI0C1By23rkj4WEqyxjAGAqZFV96Dfv9lxnYQSjVtuKF/MCJCEx2hoUrvD8hhijMvRyusBjO/Jg6N9C2ibqTtLoUL5PLEJ4e9SFRVKbYu6ESIkzbT3cZvsRfIglHsttelObvktmoRpf15FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757917724; c=relaxed/simple;
	bh=r/9Kn45ZUStYRhTjTOzLMQUK+ADSzSjvKa97iBsSXfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1atF5+Fm/O/MYio52rU+ZuVUaUjp+ZJ0SRwh5LTEscZB/HdihuNm7fznB2QNTP5Mwhy672Jv+OcezaNjIMBEvdzZlsijT4twjWv/gzCu2mwSfwKYbXMwHaPteFGZIwd78C25ehJa0EmDB1HzpBDpOw0DWe3oQgMNiwwpyLaduI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LflDPC5E; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LflDPC5E"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32e801552ccso8911a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 14 Sep 2025 23:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757917722; x=1758522522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmqCBgglSH1XFTVmKbDycfFQaWCzr9UXmOQ9aT0xQLg=;
        b=LflDPC5ElrIkFtQIpKiy+aQibJzVNLC+DgkpBILfdx5zRORuFyGIV9g9Jt3NpRyoRv
         K/PAw8B/1A0N6tAjIORmDo7WbbmidEN8L26lBPTRCgo/BEFu+m4zOptkCybotDP7dm3M
         TGsFzfRCILs0Oo/CaF24kGAcMwH63G2aa6fhYRHki/O9pMvYTQtrnZsOOcw+6Ek2nOJZ
         BVbm/TjpmmR/7y6c+jHRVI9j11P5ixvuy8BA+9ZN+VftUb9TNI8RlJFR9AMmMb0T5h6j
         PsSDw7C9f3rSQwlOPPuzjMeUjeoDv0B9LScjfnkj8skAUWGSAP2pOy6kmPBm/em3CIrD
         dqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757917722; x=1758522522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmqCBgglSH1XFTVmKbDycfFQaWCzr9UXmOQ9aT0xQLg=;
        b=q7eUIdtQJ3Vtb29tOoN8VLtXgc3m4IlNxkq4kTPvNu6hDSAEehHMv8YfePJJa9+5dE
         arUfW0O+6SMi2CYxX+rfl7pLcPItzNwXNFsJEcYxQAKJxTBi0igN4fQUEcSAiDZ8dNZo
         sD6lp6rnUQeX0RZLRmyKDSA1GR7jUIh9zKuEGWhkcZKELjTyFfdrf9x+xyTH0ng4id2S
         IY/yhhW1H9F26w/n0u2DLZXpzuBP8mBGct/tk3wFxEVsYHxUx1ozyFluL1huEHvL3KrU
         npxrjbsKMjqxJw+3AE42zwvZ0LHrVqIof7jaYvqkNxNU6J5ZkITwPsyInE5+9/+xCsb5
         jQIw==
X-Forwarded-Encrypted: i=1; AJvYcCUE5LV7yyufO4oncGTrWCplHQoAPDYr/yEQURb3HKs7rqrSrgQ42xrO7z9LX/wBdUCP0zgvnt3MVdH/VcX8Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxQRv5dhkFFbyBJ4V/vPk1QKvdXduYxK6UPGIC9jf5RDkrxsVJ
	CwAHaCMUdpa+lPlD8jB7Mb1ZuMo/v3OH9tTpAPLKNWsDUvfKcuM/VNVBHImvPwyXWfa6E4GBSvt
	TePTA0UvdXZC/wI2l4hQjcCS2A/NGjjM=
X-Gm-Gg: ASbGnctBNeR+XKlzV2rCOznbq4kTVr+so8AWIFKqAtohdm8XOVuZ3uDSxPs9id3wV72
	q/3nxLDFEjAwat9nq7Sfv2cy7NlkULDauePiyHg37hFcBYwQKPV0AMcNMOH4dD5XaMfBTt5gM+D
	VoTEU2hTaVuk9sGgcXLokNTXa/kSvX3ULHDv9TrKqJsDaobCafudbdJYtxQV35sQ4jzCN2qS/IE
	Ful7tT+Ws4ZlP1J/8lGmL1xV5z+1Kk3Osd3OJKkRpTMqK9rzWK8AemqujzlytpiMS9kTpHCYb4/
	9rn9oO1WCFGLiXyiUh3HkV9anjt+bU03L0qN
X-Google-Smtp-Source: AGHT+IEchiEsGjMEl1Hm6ui7MHlyoHtVT9JbiNr8xFHt1Dh/GCG2aVZ9Mc9Wk0rDlBUnhgEKt0EkP1bILsFTHX+KRrs=
X-Received: by 2002:a17:90b:3804:b0:32d:e980:7a70 with SMTP id
 98e67ed59e1d1-32de9807ddfmr6262491a91.0.1757917722224; Sun, 14 Sep 2025
 23:28:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913172557.19074-1-sergeantsagara@protonmail.com>
 <CANiq72msM5PT2mYKrX_RPXYtA4vapMRO=iSex1gQZqiXdpvvDA@mail.gmail.com> <26oqasrlptl5v4ymfkrlznltbwqx5rfi4dworhri3msme4wlmm@cclnphvwur6r>
In-Reply-To: <26oqasrlptl5v4ymfkrlznltbwqx5rfi4dworhri3msme4wlmm@cclnphvwur6r>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 15 Sep 2025 08:28:30 +0200
X-Gm-Features: AS18NWCkmdX2sBHMEVZOaZAumYceYyW3PCH1MqnX3I-KTdnLVgDBS3-v3ItVfN8
Message-ID: <CANiq72mpQO0v-acGOWUcYaBmETSTAjkJUDN4MT498imVGboYQQ@mail.gmail.com>
Subject: Re: [PATCH] rust: pci: fix incorrect platform references in doc comments
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rahul Rameshbabu <sergeantsagara@protonmail.com>, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 7:29=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> Why should a spelling fix be backported to stable? The stable kernel rule=
s
> explicitly states that these kind of fixes should *not* be backported:
>
>   - No "trivial" fixes without benefit for users (spelling changes, white=
space
>     cleanups, etc).

I am aware, but the stable team has autoselected a similar fix in the
past (and I asked them about it, precisely because of the rules
above).

For typos outside doc comments, I wouldn't tag it (but they may still
autoselect it).

For typos in rendered docs like this one, especially one that is not
just a spelling one (like this one), I think it is OK either way, and
a bit more worth it since these are meant to be rendered unlike
implementation comments.

Thus, since this one was in the fuzzy line, I suggested it so that the
contributor avoided Greg's bot when detecting the missing tag.

As for noautosel, I wouldn't do that -- they want them sometimes,
after all. Instead, I would reserve it for things that really
shouldn't be picked for a given reason.

I hope that clarifies a bit.

Cheers,
Miguel
