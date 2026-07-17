Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6773246BCD
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jul 2026 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298686; cv=pass; b=pXj2vzfU+0qScTW8d+yGEEkKOo37PnA6eX/YTE+jMBQX7XygCWrNkyhgn33Ys/BGkGyB8kGjY41EGxur9esdIIBH+XQVrf7dvPa94QANMYdgDZmvib4+xHw920XOqWYXnxW7ogZs53bHQCgwdxL6wTefpkFSpO8fkdmqYzwANng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298686; c=relaxed/simple;
	bh=bwirwPdlnEft+r0dSEcs5Z3/QF6OKfOxmp3M9eXrh0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oO65bjxI1xIAmp4pWWulpsNIJSePNcmZUqi+Z7kElN3R9Cdzl3M+BTE7EWh9EnK13JzYU7d3C1USfb8yfs5XZZZbEDYYywpTUzP6iqB8KLEwMuJ+LWdIplwMnAx0zNiW20d2TMc9z7GHdw/HuCovF0h1NqXtZj7HUm/rIlGqeS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+LTanvt; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+LTanvt"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9d290216d0so367845a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Jul 2026 07:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784298685; cv=none;
        d=google.com; s=arc-20260327;
        b=TvXFIMDDdew8Jh8MEf1WTrg5AfOqgazW7/oWC8ao1jQBdaX7OlPuOPhSV18nZoPOb6
         64gUpp4/68pvKohaQYPWzEacbVxjWAtfV5waFcYzpqOamoSWOaqzVNSWkjgVuTxcoHnn
         h9xWPSb3WoUK/fvVD1sg12xrClSsz/Y6rdtRzAXw9gT549Y501Albl8xnq/Q3SFZl+9B
         SAUxEKQXYBJF6VuYSGvFo2viPTrV/he1eNL/fofLGGCgHtlGI4WyYYDnoXVeax3E51Fu
         VSA8zHuDfPW5OY8ULNs+Ut6Q65fMKoumsgRH43wSpxaFNIAcUaezfjmCjY4yXznV/yUS
         DJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bwirwPdlnEft+r0dSEcs5Z3/QF6OKfOxmp3M9eXrh0k=;
        fh=gj71Vm6LrTk4A5aoMeo4jUg16R7L0vPts+Zf11x+yXA=;
        b=gQiwGbYlwhPUFefMWSG6te4naov65mTj2NKVWJUOPzjVNWRtOYy1dhkx2E4nM1S0us
         Kbcjw4cxwvFajy79bO3MnXYw1GNjA1jWm1R0WtlFV/P/rF2EGv0ZUvFb6rgWqzi4Qvid
         BGpX7omdN9ebgqOAr3F87RCDwZ418PIUPcHaIjuac1LzQCb9P1bc8NQIvHRLebQr+avM
         ufLCMU09eGIV+Qzwctl+UItZKgaIH0FDieDz41aIOrPGqmG96V+UDYkvSp0iegU96Czs
         2/BYRv2U+rH/27hKtTRW2z67GM1UfDd4BUroYymP38h2obiUt74bMs8znR5+rjPNfRKF
         xScg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784298685; x=1784903485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bwirwPdlnEft+r0dSEcs5Z3/QF6OKfOxmp3M9eXrh0k=;
        b=W+LTanvtmW5q7YxBOY89ouAH5RM2kJa5jK4/R1mH8/H6jEksD4P0OhJc08vSaTKWVE
         7ZKiJBC6Z4iJlplDmHhlpKrj0qPZElBX5oZYYtC1ZDAQbWlTDvU7lpvBtCWdj6m57Unr
         otp8A6y5CH2sCnI77nQGHMIqFqbbFKmrTpJOyxaVXmWVKhfYaqq0h7TnJoYCLm/BrvUn
         FWdpo0b5hJB4wbb1gNU984EOXr1rfJJPAHu1OkOWfGpLP6S510tvj1+ozFAIG54/gQ2z
         1QKRIkjhXcnd9NUCfHqWshGkIMZ5SL+9L37alH2aBwLsqOWKaxH1WmoeDosdExZWDyNg
         /w9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298685; x=1784903485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwirwPdlnEft+r0dSEcs5Z3/QF6OKfOxmp3M9eXrh0k=;
        b=jbRFXNsDoqpPTyHJfy0tpqYP05kfvfOtCr0vSnQoaleJcOn8EpGnxUFXunbssLnUWS
         D/Ecs0VJ7a2+ngFMZ9VkYahiUzBDYPJzLMeUfQLoOwXf4xsXKKddKaruurAhWVav+lj8
         JxKeT/oYI7LtErT/3VFkVuS7+vDOR2hIqK9HzlmP+Q/vyZQLr3DQxq38OVVLlp6qxB9I
         zJOqTgwrHYspdPszepFBht3n5L/7+ASBy0GFJM9MaIWbYNPWlYwHHuvjFYKmQg98IlJy
         2yOwxHXnccAK86tb4jvrwIHxejwbA6Pu7mL6ay1ZAbFbyj/IdasS+G4c8VsOHSxwopJ7
         7kgw==
X-Forwarded-Encrypted: i=1; AHgh+RpUI773XbSgNl7w6vTCiXUlCEnZARNH5F+EkkjGSei+of8Tqcf4Dnaqw7hCGi0m/Y9nAINc/Lx0ZWDgL7u8OA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY0oTJJ8tnADG7sDrxRL6tOfEegCJrFNT5518A93DsGfBhiqEA
	13GAc0BRuwMlBefaEC+HECtr+xulXj4ErHWHmoZkz/JTtUAOZuo3uprj8frWlOYzH0Qql1k2U3G
	D+x6+kpPu0ZB8COrlNy9NL9SJ5QJ1Dh0=
X-Gm-Gg: AfdE7ckD1EDNjX0Lzvr6OSDPSd4b2qCYvzwTBxbJGXZ9VAKG8c6qhK6I+5DiC3gagu9
	qXQm7Omgfeez5pUBUfE08qIYG8dqaRoSQCfecQEYkoezSjZlx+L2t1rx+2Xhf0lnMtPNhzm1SFu
	1YmNRU5BU0v7F3ZKFyElJElDkTjUnCTsF2P4my2Ixd3h1ND6sjo9td0j1qG4DeyhujFZB4pYlkY
	fIxFP610kQqYXmR8RnmdeJ/ZmrEcsr1cEJWMe9VNszoz204PaSOzGz4fOQWnpZG183doS4WRw82
	wjrDQe0+vdYyeFkOaLwguzyVqI7OkYGgBSeEO6th+uKAO8jEQc2Oth9hS5RB5y8bVTD+Li+DOnM
	7xw==
X-Received: by 2002:a17:90b:3bc7:b0:36a:5438:cff4 with SMTP id
 98e67ed59e1d1-38e4b5220e0mr2237396a91.6.1784298684865; Fri, 17 Jul 2026
 07:31:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-docs-irq-rustdoc-header-v1-1-36749192aa04@younes.io>
In-Reply-To: <20260717-docs-irq-rustdoc-header-v1-1-36749192aa04@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 Jul 2026 16:31:10 +0200
X-Gm-Features: AUfX_mz5L9S1u9ZhfFO6HNC7y3ftAjtwDZbUvDOfkx4EwYYmREtedGI9_6WqZY4
Message-ID: <CANiq72nuYjagAecdrd=w+R06Y-fRciMy1PZ1kfWOjqEhjL+NDg@mail.gmail.com>
Subject: Re: [PATCH] rust: irq: fix C header path in module docs
To: git@younes.io
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 3:27=E2=80=AFPM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> From: Younes Akhouayri <git@younes.io>
>
> The IRQ module documentation displays `include/linux/device.h`, while
> the link points to `include/linux/interrupt.h`. The module wraps the IRQ
> registration interfaces declared in `include/linux/interrupt.h`, so fix
> the displayed header path.
>
> Fixes: 1f54d5e5cd2a ("rust: irq: add irq module")
> Link: https://github.com/Rust-for-Linux/linux/issues/1246
> Signed-off-by: Younes Akhouayri <git@younes.io>

Looks good, thanks for these, for adding the Link: for this one and
for backlinking in the GitHub issue, I appreciate that!

Cheers,
Miguel
