Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C916B4F3EAC
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412915; cv=pass; b=ucWJqCUfonS5KdQu/3wGgcyQLrTGce7me/82tVED/YRMrQl/POWyFDfgcxsaSNKN+HF9bvCfuHM/BtBSWHmvozxSul2/NGY08GPpk9L/JyCH3HkWqw0xfVK78kAHOehIexx0kkliQZ6luqxBIO9H3ahVO1A5DCcwKTNkOS6PoVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412915; c=relaxed/simple;
	bh=U7umcPnTuetUb61c0kax6ahrM+gWE7/8BH+V2Fuxksw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHICurLJV+Se1vxz0d2O3znuRK4zxhbaW7ws0L0Dm4rVePLu7qXo4sVhVOcYEEM153h6uxmQJoZWweQ1SJNoqf8+FJyoAjDpePSVq8LWtM2RllaB4kXZESK4DUQZUmVqh+6TAWFTuEZAueaTjBIEyFyq1YBniVzhvex6IPRXZyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNZs5CpF; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNZs5CpF"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-360bd1d1f9bso218118eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 05:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792412906; cv=none;
        d=google.com; s=arc-20260327;
        b=at9BMvo0mUqdpjf+i7JG3ZBWG403PeWPMYP21NsjClPc9Ex+kAXYBQiElIBuiVnkqP
         4YcIPyMG7L3jTWfjd+1v4afpPzQRGOvtXtSt6NX3dcSzDdcD398dIRvVNAv+eVi2BCnN
         yQpQ9W2I237APoT0TQb//sfxIc/Iei+kGSQ12iiEYSd3hAY4y1Y9ornI+ddLJJ7LZT1V
         JxHql6vt1CgaWytFsDJqqfV3qp7vo9IwRKaHRdA8cTkRSzrSDogdcVuqtqVW0Sjt2Jc7
         PE7ZQMd6fHHfQXkXo2SjDzfSe3Anqj+hk2XXceNC0vOb9z7SjOELwiQyvKPAOq/K3yeH
         fRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U7umcPnTuetUb61c0kax6ahrM+gWE7/8BH+V2Fuxksw=;
        fh=t+tbL6n1R7prS8lSZKvaF7PsOuVi+CxnJGmNYi1OYbU=;
        b=Zbw2D9BRfoP0mLqFkUo8oOHyQb5R24+m6htgUjB2g6pGQiRn6KHtxw9Ms81iESMGWa
         P34Sz0eLZJDFVRjhlnpktvdTllYPWTly0Nn0sTFpkHCtjdjHCDUiDyDzE03Y7uystt16
         1rTcIctzYUTm50Nfwb55P/r/1iEMonw74ql8RaxvMEf9iUxu+9w89QaMX9cmC1t/Vwr9
         7yWLB3C8NuXBcfdWaITEELDgSrqNp5qcg6M01K4rcTQUhY7roHR57eAStB8xOWDZOfSS
         1VAQaX1hRDXmr4nAs+v+H9A7YtCQhgS2pBFcvq74pz5WMSyXGgHH0sYEYwkloqiHZtVj
         T9/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792412906; x=1793017706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U7umcPnTuetUb61c0kax6ahrM+gWE7/8BH+V2Fuxksw=;
        b=kNZs5CpFk3vX3oFVIWFX9GONdsns+IJu+gIV0vwvz0xWDGpCF2RG4Gypwa4r56Ympa
         30KHUZUSfehrZESyKhEYDHQaapDtManDmIuDnE0/lbXGM3DPpX6GdtIKOTIHTatkeLjb
         OuMKdkgDP2T6e/tjMhJQezLpdEDk61DqgTSpjpfm5ZB/UfzAKl+zpgxr4YdYkAzLTWK3
         YMc0OGS8IOwIQvJCVpKc4IjFYzGb2Sr/2Cbw1A++CrdgTHRQOXtS5S8mkXeYn5ed/r+G
         cvfVpxEhZ3AQoZ5jsN9NGRzSi3qKCKPvVdcOoxBY/sUNKRvj6dhkt5krBO+yF/fcSljd
         NFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412906; x=1793017706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7umcPnTuetUb61c0kax6ahrM+gWE7/8BH+V2Fuxksw=;
        b=eNwBWa5KyFDBnDugSUoMtZgmkheU2PVhatUnpggiLNMImOGM5eZe4QpLncW7xS1N1D
         XvB5NREE0aaxyY0C0lpL5oFtKQpxkQnqlhtVMRQ2v1CwDH712ICEhACJJUEtwLTtA2Kh
         W7uhV+ljn4yGwkIIyhfV+t4tpJYJ7EWQmKZ7oEtu9SO8N3WJLFYvSP778dR0ZZ6uC/mY
         VM7nsCzCYLSHcU7SutDY0DX/tGbf4e0uPp1hrcmdi9bS7R/HV3VJEwYV8C2etkg50cm6
         eZknaWhnJ25PgRGgA2127Hf6zvk42O9KriJcVqSTRqkIU7PpKGpWy9y6CX5R79b7/GHy
         LEpw==
X-Forwarded-Encrypted: i=1; AKwUvBzSXk4rfdul0/oaLZBVabxIB5dT98QBZjWuPySMYkxkOmJHvBpqrbfZk2qFcS/Bo12TeNkN26aokeZVK827eg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKgGO1Gq4EYs2FPs0plPC2TcioZh9rb1glYaAr8uyG8K/Yg3j0B
	W0CfCGPog0Fa72CD47h94VdoG66BTY3TXuhDQQjBeUp7ubxgmmS3p5p8lBHn+quig8Geo8fr7EC
	0AeVsFKHjQLi2aUU6DkoFysGwcMwemBI=
X-Gm-Gg: AYBFou3uchMDnQCvzbWvnYuqWMY7ru6ATmGeyc6oZNn0QDg0EHEJjCOr6kJOamEPwW/
	b3P8ON8MpSDYUJJ56/1VgOvSKfmJCQBFHsdI7N90fQyaMyh/4EUkRAIoSNcDukZGJL0rexF5wpa
	1T5+46Ir0BWG6R1NjvdqB9hW+1eyK/F3jEsz6mo+zP6t0U1mnExtA8waewZWaVGbvutWGWZjUzr
	aJo64Y3ovNeUnpvTsep7HMpBkxEJCZ7CfjgYJMduY/+P2VxtIxdgtNRdnR0A3Qu3yEKE0J2yOsY
	IQXksE2bboVf6/WOHORHuAlo9wtyByVDQp0ExR3mX9fjdi6DGKRLSxl6YKy8FJe8TAkoWg+S39P
	bxUYTFbCypyNY6u4vVR0wzcYB9By93GksbUkpkFpUAwKxV737aSVOo1/SWgAz631BJtT9vt46l/
	ma/5komJG9310b1qE0MUjvbrt/4RW+xkkgfJnzTm8DgBP1w2B+sEw=
X-Received: by 2002:a05:693c:65cc:b0:35e:9cb2:b88a with SMTP id
 5a478bee46e88-361a136a601mr16547289eec.2.1792412905593; Mon, 19 Oct 2026
 05:28:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261019114811.1105192-1-gary@kernel.org>
In-Reply-To: <20261019114811.1105192-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Oct 2026 14:28:10 +0200
X-Gm-Features: AclHuK9vRqGefEm-YOizNzCmm-q741mpOyzFUsHDlEPJyQMscn_rCkwuXTkP7bk
Message-ID: <CANiq72kzVouV2GmeFpmZS1PNPDo6gZsmG8MMrrovvETUxVSVsA@mail.gmail.com>
Subject: Re: [PATCH] rust: doc: mark `Io` as notable trait
To: Gary Guo <gary@garyguo.net>, Guillaume Gomez <contact@guillaume-gomez.fr>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 1:48=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> `Io` trait is the primary way of interacting with a bunch of types, e.g.
> `Mmio` and `Coherent`. It is hidden in "blanket impl" section which is no=
t
> very discoverable.
>
> Use nightly feature to mark `Io` as a notable trait, so it is highlighted
> at the top of the rustdoc page.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

The attribute has been there under that name since 1.53, so it should
be fine, and we can always rename it or remove it.

Having said that, let's mention it in this week's call with upstream
Rust. Cc'ing Guillaume so that he is aware too.

Unless they say they really want us to not use it at all:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
