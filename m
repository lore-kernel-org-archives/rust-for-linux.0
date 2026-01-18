Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CDD276050
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 21:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768771675; cv=pass; b=lQ4xlLt29TJPcI+kBJZ5svQDKFU0PdMyfPCODcsMXffqpyd4rEJn1Rj4mOcxFAt08jd4hmfNe+rVA4xukHTJRDzhrRhwhaQtJfWf9DS/KStn+v0ZsG+NK24J94RgT4dhh+471xa3lCNoM7hajjCypEp7UuXN4LOFm1lLD+4/YpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768771675; c=relaxed/simple;
	bh=g7zSa5O5MTxczPw/XaBYl7/msoeyB0aPO0S2AiyfiSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HxvFlCvfecyG71pHfhp+o1qfcerS94UhA1mDx+ck8xeKyZJC8GakOHsi9KrWjoo3WJ6lo4HaG0TsdfQCU7RU5c7c1dhnxBmSbTFJOQnJopIxCwrx062X1zL2+pgLCz92Xl8cUt4h0xzhKoorKny+FyfRkMjzryPFafhfrroyezs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nBW0N60D; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nBW0N60D"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so2787270f8f.3
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 13:27:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768771672; cv=none;
        d=google.com; s=arc-20240605;
        b=egZg3MckfA5bMd1bTx9TOp10fAUuqSfJVGm3jvZ3aV5J8nL0jEGLcF8Z3IuM2Kc10z
         kBL2uAR1HjbrUK0+vNUHTPozeldgm4IBegMZ2lMk3SAtAM9h3ORJactlFNPFw5EeA1FS
         pOJtWpYYQAbTCmeAfhloj62NQleVO5e3oXXHalDrxWzTvhdoHhcgx/nqZ+Zte42ngCQj
         fWdLmEYk3a0uSK2bjoDlT9ZOjCmrd9/PcOj2aI6TxtIUIbIj0GzrH2ndp0rYw3L4a1zP
         KfOXmWlP/ytOJuy0w4Mlu2IK3+5yt6MM22qKf5vIdK6p47rp+ljz2wUQu2lTmqdBS+Vl
         B0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g7zSa5O5MTxczPw/XaBYl7/msoeyB0aPO0S2AiyfiSs=;
        fh=ulOJUkESK/NqRPxl7Bl5hPeldOWPZ/smtYLLnNricaY=;
        b=TJpsIkvz0yS5rHt30TA7af2lHEYyp8PxuBY/7rTaY+tNjUhPGVnmd1OkIuXqi5UeXU
         c7KtHZ86O4ywMTYNPvw7kwwwChl44LjSYQ5HiBOM5hNY3rooh7iT0TmF3rea2P2ADir6
         KQeJCltcL7Z8tV9rtKpe74CDc0Hrhjc4ZzrvEFAq05RtXbtqNTjxd1Ap56uSgXOrh35a
         XmgBmaDRGOIFrZPvRb4egc7tK6ZgtKT0dj3sUQzW3og93C/DrkpsBhGvXQs6bxjBP00W
         kzujwesCPzvKEldmPjt0MR+qs+FFtWZIeBxgnwhlfNzmhDbibvvzGeK2y+1MlKlwpWtT
         mHQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768771672; x=1769376472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7zSa5O5MTxczPw/XaBYl7/msoeyB0aPO0S2AiyfiSs=;
        b=nBW0N60D3MkmoQL1rCt5U1OXkcYDIymOitbKYhneFjF7EzcyKiwIPUZrRyiHXWP1aR
         cnXrGHs4BrMXxI1U+SPR6nVKUCLcDgi4twfQGv4XRO/eiDHQtkBMW51/RH4/RPoIt2Cg
         Xp5ONsPC7eqV+USMYUiB1V+r5Gkh++IE9bHuoonUm9zHrj6HLE2FfQ90RizhsofLBJdj
         kMOiBy4l5wvNW5QaGamOSOC4Q1XFay6g2sRh5SZH2D6X47kwoKJhj4Lk3t6p5heH4UiY
         x8afvEKHlb7z9xPRUqjnoTAy7GbBxRgnS/8YEtkxwAhC1lw8HCYZX2psOkG8N2OusISb
         G4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768771672; x=1769376472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g7zSa5O5MTxczPw/XaBYl7/msoeyB0aPO0S2AiyfiSs=;
        b=fRIsMwVvgWdnukK1lc99Rf3yA723Nbs416lJuvkZ9wowg+eyHiONy4uwZPxp+nm0EE
         2P4n/cmINfxU/SzdXc0/cmlUOXzo4UEyPPMjuc+hcQXnEBnI66ohXEjobGI3pzqfAhw6
         AkKQQ3wqztWn6SM8KpxpaOUMEEkKf13RR0BVmJGri1Y/TDz192yEGvcNrxfIeklPln1X
         gJ4jK7gxJMpHlr4xBrRuYvGyhW4jZcMheIqB654s9cqe/d/JovcAgo/U6iHWVJGGAiaB
         sKIzn3LR+VPtWhN3LWNT9OLKhSxDYrMOqaskbaU29CbExSKAxstYvo+LYwxFdlFRxcXz
         /CVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU530F2WvdHBseAl7m34TQi3BmPA0o1Jc6bk7tjQSY+CyCimCQU+tPrBf87k6t9/oL90PDOg5VcfhUIXOdsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGEw9mnMcDVdChQXNdVW96UjQSVlJUW3VkimMp7DRXCGd9EC3I
	gIb4nPaQWS45z4Xtt6Vq9vJtgc4AfyeKRAkLEHWVLZgqgr96j4knekKhc93/YrWSWyp+ZzbPOiO
	v9/FPTw44mqAGvGEnhlA6tyzLnkIp4qH8k4455p6OPx+lf5Dg06RSankC
X-Gm-Gg: AY/fxX4YQAyizaAdkYDWRbzNQmLb2uH2pzYK6L8xwJJOQT6nUMtEih2kRfsy2DEYBfk
	TMltmjQJHUkysUdz7ZT/nXWFtHiuDVfAW9nTT5vILtrEjVqQOx51Gf1Vmrg2Dk6xxNPRiEfFBhK
	rIMf2R7DxkviMcrTLYSwVy37zO0yRgfr0IYKPbdFOt3wReHHC7ywHNyPnybeqWs73kkn5u+nvv2
	ABJ5lXE7BF+DLVmbVugb3ooRjhniUPlFJlHZDEP9QXD2vki7ARezcu3Sb2qH5H8lHb3Ge1ThH2i
	Wr/6VNxc/wOAOe7uMu5XmbpN8g==
X-Received: by 2002:a05:6000:609:b0:431:907:f324 with SMTP id
 ffacd0b85a97d-43569bd1013mr11577399f8f.61.1768771671633; Sun, 18 Jan 2026
 13:27:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113144547.502-1-work@onurozkan.dev> <CANiq72m_72QAehQFfdUt7HeET5rpJsK0niiWRUtqnueuiooD3w@mail.gmail.com>
In-Reply-To: <CANiq72m_72QAehQFfdUt7HeET5rpJsK0niiWRUtqnueuiooD3w@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 18 Jan 2026 22:27:39 +0100
X-Gm-Features: AZwV_QiTv9gt48ZGGHCD4gCiTn4o6LA62XHiC3Lu_GvlsIEDjqjyMqD84HAOaGE
Message-ID: <CAH5fLgjcCtLtrtjZ+y699SCFQfAFsaf-gTcRc-cWfLxz=Ydg1A@mail.gmail.com>
Subject: Re: [PATCH v1] rbtree: reduce unsafe blocks on pointer derefs
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	yutaro.ono.418@gmail.com, charmitro@posteo.net, borys.tyran@protonmail.com, 
	daniel@sedlak.dev, tamird@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 10:02=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Nov 13, 2025 at 3:46=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.d=
ev> wrote:
> >
> > Refactors parts of the get() and cursor_lower_bound()
>
> This is now `find_best_match()` given commit f56b13172382 ("rust:
> rbtree: add immutable cursor").
>
> Alice: I assume your analysis/review still applies even after Vitaly's
> refactor -- if not, please shout!

It's still fine, thanks.

Alice
