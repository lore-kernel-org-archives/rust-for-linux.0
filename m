Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B031D5CC6
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Dec 2025 01:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765242594; cv=none; b=u2sMf1mj6O7V3ks6RrWcRNjIMUVwLAI5WlGuM4ZCx1h1Y1NMqVKY3lnRsKkFJz0V+rLThXS4syOuFPgC7XImrXMjfUiQmKLwDQ7/d7V2P/0HI9jd9fQxMWIbuEG6CPZ4rAd3sIQ0tem0uvsDEdTAwHQbFb4AE614l5PlO49fbgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765242594; c=relaxed/simple;
	bh=mEsBT/pLTbTyK3CEgFpn4Sf1V+J+71IdtUhL88rzZE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BmyxdWXCN9soMmVFJwwob29Ucpyr/WXeEr+gbeDpDbST4tlzVUmCxtMPSgzRFz8hFHdVo/hNcDlqyFfKIipgL27gdS5Wj9isEYs7qbEoZ5/xrZAEiskILUA8XlRa6YPjiRlrAaRdKym3r4aeb6k3pFmJAzYXqutY2N3PevccLZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBvifLej; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBvifLej"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-297ea936b39so12930025ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Dec 2025 17:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765242592; x=1765847392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEsBT/pLTbTyK3CEgFpn4Sf1V+J+71IdtUhL88rzZE4=;
        b=UBvifLejNNaz0+hjEWIBt1RpfkkU+B9kkaF3mqgLHbFYIdlb++9igJuSDeCNVO7BFw
         CcikptyBHu+CdHcH4gEFuTC3d2EOFja8EjA1DR7DbbrEKLeHr1yf/hhsx3HgtyHJu91b
         O6HOuSFNzKVACPf7/tSf/4WP8HcI7MXvEB9noe7R2xgr3DwuPiY80OqWy7qYMavbBXKI
         BR/AWfR6kYwpZmOVm4Xh4BSPhHD7lRHi2XgbMb7KCSEmVY928Ui66ya80C+rGlLTTBUr
         M7U7l176fDbPQCM6vCMS7t6j/mRBivMeqAUX4qXuM1d+tZN0UoBzIF1wXauhx2ME3At2
         vHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765242592; x=1765847392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mEsBT/pLTbTyK3CEgFpn4Sf1V+J+71IdtUhL88rzZE4=;
        b=sHjvU+KUtX39mLpq2PwQCKkdfD7PKWC2Nx60rMdKMybUpR8vaaaEu9ODcu2zVeUwI7
         XfLeKb1CLOxEt5SquV9QyJTFb9ei1ikgOQwF/61S2M10rWz6YYe5PY/YrKXjuLNKMFj2
         rslQLOot74lewxAmUVlawYerY/IiBNm3WvbH9FoFEk0CDLfFKqO4kLviMyOj8ZbGcR2O
         pB8Lk0m8jIX6FPZxCNTDmP2e271x2Oa+/tCwRmAugjT0SpncJlJkXAJn5RpAbp+cSRW5
         Y2dLHUOtlWJ+/ND0xOdcYUbJers+AZW8npK18i7tKQpkaB/dWyuf//24gYStQoIJfghV
         mKsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEM+rSkqco6xykrUJpOhSXX38qb5/wviYyiZhTgvT8xn80GdcVMq2ZwY7cdYcrUF+qWAhJ3tVCMEvqMaV+Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt3A57B56NMik1M9TZtsL559eoropOUeu/hIb7hc4M0vjAX2Kr
	KaT7tryHQIC1ZkMDDtLPhTegCpN1evyD8l7GfZDFJe6gQbdviV/qST8En9jXAM9aLLtYqtzO4xT
	c9QwU6jGfg0WR4WZ8L2MRrbkfrko1C3E=
X-Gm-Gg: ASbGnctXes6Rlp7XfOS/m6HQ7lHOft6d3sl+aqwvlD4exP6Kt019uX+pJnjtP1QOnTY
	/DFzAK2O/UpJCk7D21VFP+pBf+zfbkSHvq9MsIn0rYIso7tBqNTUrjg0ZoicEvSoQ7/Pt/59zXc
	gY2oNDWkykBdp7dSYsL4GdDR1Mfeuy0emm9XE0vaYY+HfAQbb9xSeQLBPSTlLFDzek1R5MfZShJ
	vTGSnpHwhWbim73mzLdkr7rr4KYfWERN2NnIHB9zwqtarkiU/SZFn1aUaE3zqx9ztbiZI18VBW/
	nWJyTSbBRHDxFe2RH5dezQ8q5N/libS7UBXi9gGUznx9VwyFkDpaTjUpja6ae5ep1Af8OndKxMM
	ireDim4WBYcMV
X-Google-Smtp-Source: AGHT+IEJL3H2CdkWL4QxEIdsfYYJgp/HlFqFDJUUsqk1LlVkWGajJj3NrPDAOyq+1dE7luFLpJ2g4+mrjjdZg1vzVG8=
X-Received: by 2002:a05:7300:bc0e:b0:2ab:ca55:b76a with SMTP id
 5a478bee46e88-2abca55b82amr3434532eec.5.1765242591987; Mon, 08 Dec 2025
 17:09:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251206124208.305963-1-zhiw@nvidia.com> <20251206124208.305963-2-zhiw@nvidia.com>
 <ca549425-e10b-4d54-aebe-278d90c8cb92@gmail.com>
In-Reply-To: <ca549425-e10b-4d54-aebe-278d90c8cb92@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Dec 2025 02:09:38 +0100
X-Gm-Features: AQt7F2pwYK4ZIpAGJ2cuBoFunByDKO5gKUgFer_xOdKdqv7XdaFLaTqM1T-H2w8
Message-ID: <CANiq72mkPMwb=3P_-fjObUC8NmY_6pzK5cn41RRwa2zJCazuPA@mail.gmail.com>
Subject: Re: [RFC 1/7] rust: pci: expose sriov_get_totalvfs() helper
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, airlied@gmail.com, dakr@kernel.org, 
	aliceryhl@google.com, bhelgaas@google.com, kwilczynski@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, markus.probst@posteo.de, 
	helgaas@kernel.org, cjia@nvidia.com, alex@shazbot.org, smitra@nvidia.com, 
	ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com, 
	targupta@nvidia.com, acourbot@nvidia.com, joelagnelf@nvidia.com, 
	jhubbard@nvidia.com, zhiwang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 7, 2025 at 9:52=E2=80=AFAM Dirk Behme <dirk.behme@gmail.com> wr=
ote:
>
> What's about to do something similar here (and in the 2/7 patch as well)?

In general, using early returns (especially for error and `None`
cases), i.e. keeping the happy path as the unindented/main one,
matches better the usual kernel style.

Whether that is with a simple `if` or `let ... else` etc. it depends
on the case, of course.

Cheers,
Miguel
