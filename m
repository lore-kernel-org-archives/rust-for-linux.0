Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24692FC895
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Sep 2025 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756991289; cv=none; b=jWzgCz9udt1aXd0U0C3WzXEIkehHJTQWqFHEcD3R9gRHzDe8n9aAaEK+8fSaOT+BW+fyLvMHKTXW+YtEZosJRYVbJPSFjJa3QWHFaDVA32H+puPryD7+veYJr2ddQOQwPlye85Tp6x2MW/1yaCdH6sXHcNqWai+nWon34OH37S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756991289; c=relaxed/simple;
	bh=4cZqK9YzKCpf0+zZ9irAoAp8vCEv1wbUaz3rjA5fNE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBN5qIi4l1vQkp+J3NFV43EFTjNATRT9eWGDbEdrsrWuByrpAfnyYOGkw2AdC3nWAT/akQXlTgxHtuzDUG0kYgf27RYEVxIFhq34NukMb8XFuF6wKIrt1APN6Byfa4QyLVR1wYjB++AMniEvHZCkiQZg1QPTlhNodRzJf2CYJcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E6hlXJkG; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E6hlXJkG"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3e249a4d605so299032f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Sep 2025 06:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756991286; x=1757596086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cZqK9YzKCpf0+zZ9irAoAp8vCEv1wbUaz3rjA5fNE4=;
        b=E6hlXJkG4hPYwLFypn3mCBhkVMicv7RpGvd7YkRty6WunpEBNzohzgsfp2MQx+WqVe
         6DKVPk8hFPp2FVY6VUocQrq86tWNTMqRQXdDJLWVCBymxivGlT1/046nQ00ld1+NJBsQ
         3NgKjqbajaqO0/5M/ANL2GF3OxU2MjHwmz4FyrN0ZFAsum87WRkENgWvJqH1tGPtc4Yt
         XyOwZX9d/nxi8lIqwPq4oho7Kril6qZuMl5uInVq5lVsJGMAMlO4DGzlyxDF4CHeZcNo
         aVJ34/ekU2+MjcvBS3N+g7K8u77833NitznLfr2vN7udLX2yGcbRwqZx4Vb95+XQZj2n
         cCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756991286; x=1757596086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cZqK9YzKCpf0+zZ9irAoAp8vCEv1wbUaz3rjA5fNE4=;
        b=WFjQFduRCS4eH0a/w1UaM6B1QGWqqQR0C4qxIfjCDEBotkUe4WeMgS6M19YYa6plDR
         qyB7HCK2BO63UTM7ObOnv9M5bJSTJqoZPUiGEpYH7QtjWE4gYJvmVGipA5tzveeQaKb7
         tAt6/qaBd9CFjGXA8zSmFyUHwwJ23sfxgI21Ax5a4mILqswUDA8eUHNabT6bjzEzY2wJ
         O+u+ibUYl7xsyZKIMNPSK3MciQkBc6/9fGO4KCi78u/ZoK+jEJQhOn3/CW4F/toWZZEY
         H4LP6V8Yqj2/qVcnHbZqcNJq9KUwo5VTx/b0Ojk4nerF+Yyh3HGg5Kqvl6bS+CTQb/RW
         QmJg==
X-Forwarded-Encrypted: i=1; AJvYcCVT6btE1Rh8HnyNAvMz0iKZOX84vHvFrc2xHhvUUWJ1cXBsTeJqJkH/lhvEMn/tKUAd/6m6OjQjNa7zCmRV0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTUwEwat50U1HTpUSZUszrwgozCx2Rc7PbTeXa3oI/i3dOAvTJ
	guqUty3dCGGM8KxGfitxHf3Kq7hZXYtxVMGAMbreOQu9zQN9RhVoFa/JKAq782XLXe5WIOnjf7G
	xbzzSJoJSJdiJz0lwobBaS5LMC1pO8Szlqa7M8Xq8
X-Gm-Gg: ASbGncuw2AliQorru+/eh/L63iEjsNGpzo6lettDSXBzj5LnU0sGLMxZ0tIY8vDxiQe
	scXBQyDaycGsj1M8QGqqjhfKTO5E6FpwnKUzqF8siwRzpRNjzlTKcMmhtycnb64CRu0dZ7AMFu1
	f/eqBIKMgL24KHn+DFZL62CgSbleOZ8D9VSVdiy1W+zoxaxxNhRpDm2N5zMAUKE/HDcsJf4I3fa
	tviPlmaUqgw3RaNEGLZngon5f9oJqAAPX6oCwFA3t1j/sbLAOybsaY4K/k96psaLxT+j7/+AJGx
	RT2IXRP2amxWgp/puBYJJA==
X-Google-Smtp-Source: AGHT+IFg6AKl3SCJnL7g0+bfVP2sauEBpLDoUNy8WCcZYED03ALkKxVTPtnNlh4mcIMrUbbycxmFvWWlSYL5Ai+IHxo=
X-Received: by 2002:a05:6000:2308:b0:3d7:abf7:24af with SMTP id
 ffacd0b85a97d-3d7abf72cecmr10000884f8f.23.1756991285894; Thu, 04 Sep 2025
 06:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904-clk-send-sync-v1-1-48d023320eb8@google.com> <CB9F3786-48F0-46EE-BE61-8823E437C786@collabora.com>
In-Reply-To: <CB9F3786-48F0-46EE-BE61-8823E437C786@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Sep 2025 15:07:53 +0200
X-Gm-Features: Ac12FXy7iJnmk3xcF8Jlr0VlqsGLW3OO3fce9tyZdWo45UwBU5P9xsN6P9IsbB8
Message-ID: <CAH5fLgjRaFjiw84_uP4N2kTs_iuDCe1vcZ7gyF4XiwDkbEgiWQ@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: implement Send and Sync
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 2:31=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
> Can you base your change on top of [0]? Otherwise it will become stale ra=
ther
> quickly, as this introduces new types, i.e.: Clk<Unprepared>, Clk<Prepare=
d>
> etc.
>
> I will push out a new version today.
>
> [0]: https://lore.kernel.org/rust-for-linux/20250729-clk-type-state-v1-1-=
896b53816f7b@collabora.com/

I would suggest the reverse. If your series is based on top of mine,
then this patch can land today regardless of how long it takes to
finish the clk refactor.

Alice
