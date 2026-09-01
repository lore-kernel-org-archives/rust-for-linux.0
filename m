Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D9031C56D
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 00:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788222492; cv=pass; b=KNzd44RX0gckvsxn5ocw/KgKcB49vtl+AdlxSP7wpm9QWi2Rg2UPWWROUx9EIVljNE6i9JEiSZrv8JMzvmxy9ZSkk9jKh/3h3rzg9EL3RK0muguaGWyNyIQ3xV8j5reN+4K/YHRXp394EC6KFogI4H3OPuisUc8ijDmKg/t6k4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788222492; c=relaxed/simple;
	bh=ePttGSzOUxOkPXkLx6jJfjzSq57O4TvHnxhip1WiLMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfksbOwDWUntv5wDl88zXNe6rfR0pbonrDInish2DZt7tew7NiKG5S6Fa6KmI6Q/jvGcS/kv207d0xGVlYdY5+3IOOfx2nLIZBcFz1DZ6voJRgG9s+VItSxJhYEq5Xhu0T1DvjoOTAQ9pzcY4eol6Jb/RnPIenEIxh4i0GMZ5d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOPIGbSC; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOPIGbSC"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d30c22b1eeso4495375ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 17:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788222490; cv=none;
        d=google.com; s=arc-20260327;
        b=GJyCBaEpCI8yLwlT7gu+PK/4yfhHH4YJANz9T1T/owQSeJn06EWPeGNp6aAQOrx5+8
         sHC69jLvYQgWXF1VqBWh2uB3zmyNAHn1wH3L2bqyQ7q9qh4CBvz/qpd8veDxhnwfxQRz
         HBMQsiLE7XZr4nys2DjRGkZ9EblnBvqrkgTCusuJgfFqG29Jh09ujlqep221811fVAlV
         2s33ki+OeaHvpaDQfw73SoteDmvwerb5hbG4wFHVIRPASPy4aFJf0pO/F25OBde+Wzjp
         JBrgV6qkYhEAuKYpmOnk4XzKgpP2Vk/nBi+NsVln/slQTqOot2MhDeahBkyh+KLgTfFW
         4i3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ePttGSzOUxOkPXkLx6jJfjzSq57O4TvHnxhip1WiLMU=;
        fh=j/kw+3x9DtCz/kTorVXClNc2sZVuKfavtRNJ6AhgxbE=;
        b=M0Sqe/ZFZEvGL+aGDXzOfqw5OsTIBJWC2qQYUGPy8ZyZuYNDRNHHsONyhPRTxoEDWQ
         43sNKpXemIZWRPWG79nhNklrvNHk3Nlxzi3fgachF/49B3T8CiChn+KlzZjpaqDs9hD/
         taQxIdvIngzPvgE4I+O9yJMISDp2FqMDP1sCVE+Rc7qJxEZH99bFh7NgdJwBLD26pght
         rsBhFUGg81v6/kjqNermI/kmUscpp1NKBwZu1Jufrsg+qUiLEjFtnSo9u/isquBexbTu
         25CGCsVeAMyEeGAc7WMDJis863qPw4rAbOaF/cyhb6H7KUe7PjkxC9LoeBklWuYBl5hp
         7iPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788222490; x=1788827290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ePttGSzOUxOkPXkLx6jJfjzSq57O4TvHnxhip1WiLMU=;
        b=kOPIGbSC7KgT8zsvL2HyhT5OjI9GqbjLif6SUh2zVruCFpAbIn3UgHqPmNEZ6PJ6Eu
         OQK6A96KUTha1C+uclae67niYdOTY5U23j9cVNuv4kUT04tzO1BPG0pE0FqQVa1/NiBL
         sA3xEFtTAlhivVLeuZFuKeqvn1wOzXHVyOMMQNLj0wnWlUEGDjrIR2OeBdmVPax1be7W
         M9t8+8j7oto3WNzBsQ+4UOiNyy3DY3EwsiSzltmOEpmP7a+YmE5SZgRXBxtwugV70Qul
         K/WkxxD6XRVAH9cmwgmPXWnYYVpvBOEKQlGeio19lcA1kprtlV+S76aOHlldo6ZRRuYu
         bOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788222490; x=1788827290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePttGSzOUxOkPXkLx6jJfjzSq57O4TvHnxhip1WiLMU=;
        b=bAzlBmhQr4dIb0XEWmfXrxvb0Xs9r0neVPtRj1Ki7l8scaUwyGd1BRAJd3Fw/iSHYe
         hInP+qD9xKEZwuRsy98/0jI6mv8/v26EeB5ZFsAN7c2PtRkKi4kYQR8GEmuGX7zYw7ow
         vYkoG6eMSmzGFZMuE7+At0/1TSPZZ9l4RR9UjF7Qu1PKCBrh9eN+FfyGFScxMl7JdSS+
         neIgVvTqLDX5NWYvgS2rEh8hWYLfkUAaPQKd7UW+aL5ZUUXVkJbXNwa4NiGi80TaPNce
         O3uqT2TgVLng5ia/EGLP15lYrXveECrAH4UDpQXMmzT9PKtP4CZ+MWFw4s3NCWraKXOk
         zl/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwYUwvtw2fXpZihIh8m/r9AkqxZLsF03ZEEiJF5i3DrCWeM/vVRtZmx532DmeJKJt1ZzraSkSz567D3QnydXQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lIJSAEEDNmz79+aO/DcVHiWnjYHOfs9xoWMlJ7Y6JhOIiO2va3
	y4jHWxB+lp8O2guQcsPvyQmrqeLYfxgHNn7WNzlmlYSOjFN03cfVHtfp/cyeCYarwaT+84iDQbM
	sL+rBBnF1tFAjc0uLKPVTADzElK+qQaI=
X-Gm-Gg: AYBFou2eGBxk3HS2JBsrx0PRZyOHK7KVOtXvNOfDTaGHWDX/L68VMOZGYc0UyhP/CjJ
	OYbSiGnO4MHLIeZyix2fWcraLtREW587nN6EpE887FNrLrIBbNJFEGJab8/sRM7WuqUAU+jbusQ
	3rGa1uLAJ4XaIeQkaXsYYdiGknmv811ia8OgbTwq4CvUqQqZHThPawrI1v2WAUECMHiGjMpxxBd
	xNKIygD1f5+H3LTeqphujBgODqahvF+Nfa3QD78lFpC/PKs4hqcgk4kTBckSQz05Yle3vEueQ68
	MZX0Im/GmxE9Tj8qtnOmq114d5lmz2clXxPO/9ZzRsHJBhGQ5567WKjYmGFnTwXfUscMQElPLvM
	BYGZljT3M4kOk0dAruIZ1xuofL6K+fajLfDJ6K33TgQbYmNGj3ZtTiXJgTmSa
X-Received: by 2002:a17:903:2350:b0:2cc:f4d4:29a0 with SMTP id
 d9443c01a7336-2d74df5ef31mr261774915ad.3.1788222490059; Mon, 31 Aug 2026
 17:28:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828155033.2101924-1-gary@kernel.org> <CANiq72nKwM5n5vKWAmSiMEtUpsL=rAKpwuSa7bxM-CSVT7+N+w@mail.gmail.com>
 <DL3JU9MZGA18.3FU1H09HEPS99@garyguo.net>
In-Reply-To: <DL3JU9MZGA18.3FU1H09HEPS99@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 02:27:56 +0200
X-Gm-Features: AcwNN1V9DhjpMSG1N0V8G4wyJ1Bogge1P2e95CZaGW7MBQZWfFtCeU6dtolAmWo
Message-ID: <CANiq72krYryNZAEy3mN-tkpwg_jLg5G=jO8yW9OxcLGLpQAUZQ@mail.gmail.com>
Subject: Re: [PATCH] rust: pin-init: use irrefutable pattern for `stack_pin_init`
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Mohamad Alsadhan <mo@sdhn.cc>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 2:22=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> We can probably just allow `unreachable_code`?

Yeah, that works.

Cheers,
Miguel
