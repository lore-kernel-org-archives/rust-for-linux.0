Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EBA430BBC
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772360133; cv=pass; b=kZFTxozV8UvG0/3JhYJ5/WkakELXyGuV8iBB3vIcpltFT4Pv4v1LkUs8cjD3N85VhKg9+Whlpwi7/MSUJxk6ji2lNsRVh9LssEs9PII14kdTfhuoJ1JKJcR7eRbnOUP3Gkms3VMY3sXQHVY+a8oHp6JCgPpwBGel6re3o03z4TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772360133; c=relaxed/simple;
	bh=JVws6GSJpK2zno2cIcBXKTh2COJC0r0bn+N62fUqSUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olY88oRnBwE+VOz9xl3e4m+SPsRe2NEJQmPN5rzxCK0Gd5fkpqEccd5/tWMKY9QUrtPFPpStH9mb9kbSTfEz+qZ/CLLHQmCwcElAjsUGO0DHirIX11+rGA0JNCqeaGz8WefVacSPYigF3jmOxSuphz4svyqzUv6sN2rnzFCNKOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrmWfKoJ; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrmWfKoJ"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12734af2cdcso133193c88.0
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 02:15:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772360131; cv=none;
        d=google.com; s=arc-20240605;
        b=CbqhxzCh/gCtGJ5v1UXZfKIGaCGVTHj3vvw3oyk0wKnHceZ7u6KmZeuvAUMnvUjmlC
         mFm1JWFXfHsTWjtd5tS+y5NsvvXCuNJoKNSSm97Q2pGzRF9TJaPcsTjIIN3yyOHi3JXb
         t66wxmJBLrjQ3dFs91Z/BuqJsujoSeg7GYJxbEA3AT/bqXtnyG7Rqz+zxcHE1RHNo4dn
         XVoFHTZN6Ec++PH8LRaG0FD631kO2y6b18gZ4ZTX+2HfxC1pnWpY4JeiJXlCndjjOYbd
         +iqP/4qQzJ2NvSj4RRrMwQmrLeF1xN0MLexLm/SUDb0X1iCm7Hbmn+7jMJwWID281a2t
         A6oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JVws6GSJpK2zno2cIcBXKTh2COJC0r0bn+N62fUqSUs=;
        fh=3gw/+YjKvpxBIV1fbnnQboKZXWdbv0dlBb+0IeVSZBo=;
        b=LzCE+sTUgJCNXN3xzO9Uf171wz7JDZVp5NwlS7Dl3fH45en6KwZXWs48ZrRnIstkHO
         mGAYC3FElQgRvTlLdXgcp7Wzx8Bu0ccgD2GSzG31ZId/RId+7QeguiOHW8OPbs4y4Qv5
         bbMz4qWg1kLtzn/MelfYxjrlT/OspiUZzyIIl90MW53Hx0hw8GrwcNr9dHgTPgdVo1lF
         W5P1b1YuLYHp8TDAhClE6z2Kefps81vOlyDocqADVQyHLls7T6mZne727+Yi8kKwfDoO
         5eCZUOYxoStoxKRfeytn4KwkiFAxRy+Pd8d+BT01i2a9YG0bfijtahwV4P9RVKlDSA2E
         SF8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772360131; x=1772964931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVws6GSJpK2zno2cIcBXKTh2COJC0r0bn+N62fUqSUs=;
        b=JrmWfKoJb+lX2xHc7HGMvVF9k1MLtUVkDzrXOCc9EEI95rcDFALzCnD6DSZ/KIRA4E
         wbo8xK+7WKBe5Z2Ge8xnxPZe1wBds6qw02/9b2weVy66ounzeuDHiWtlWxGQtdvU6WZl
         vDszUYG25A/bg+eMHTdzdRawDNZ4qMAXi4+R9qvbAmhfHDuqD3/C6DuPKOzqjWHdJ2uo
         5gXeWf81wIlekkZpClZjZo0WnoBdvRQU0VaXNT+zCvG6tfl6aR2e5jCViIKlioBBIVAb
         ocz13VA36o+HB1czU7hg75ll7FfxMfdxhTNP2e9nYnJ4MPItcyauGaUiwQBVtCkQXmqf
         /5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772360131; x=1772964931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JVws6GSJpK2zno2cIcBXKTh2COJC0r0bn+N62fUqSUs=;
        b=ukS5fASWMRvXbG0kG9X2UPIUxbuj6xSolxrSXk5hG8a/fSINzBNJ81EVp5NUyr/3AY
         Wyw59moalUE+j+/9Laspj98gX4vr2R9A4bRF55CRCPPAVrLI1uPPawHDuX4gNg+B0oyK
         cwFhB62C5pf4EVKPBezkQOjBGhpOZlwjfMr6jLl4+WmJb3uoneZTcUrj3W5h0OZ3SUJr
         MzxqivpKN0NPaoZhatmEp4nEIfgTQb88TbMSJuXPyVCofWf1oQrUAlaBEApuKTNulyoi
         CEBVZ6MbBTwVBeJSLTYykeYLqysLm5M2JL2m/dRg4vtBbGNPlAIJfGTkAarZi3yLosXu
         j84g==
X-Forwarded-Encrypted: i=1; AJvYcCWuGXL7g51/sIsACzEM78BkJ7aEaj9FjF+z0K4b6CAQGNHvg49gpPpnv4P8NWOuzOtxfRgtBlSJAUoKLtlkJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbXd+w2pGt6yhIGlGpj6eohuwqkWZncey+eCevcXL0wHgtJN+G
	XRITlAkaE52jYXDHHH/XapmcfOV5+NY41WCRUHgtgzW7J6DcAtUoQ2sqwcN6qCdZLbZl1PWJddx
	FcDP9O6EAMoIJYMenyPz8r4+I0PER5Fo=
X-Gm-Gg: ATEYQzyZMeUZhvwMVlscajlDkV4s6kAhrvbdQYLeeqTXE7f03oH+VZ7hfhDKmKnJwWX
	XGdApJGfJCE3/5DOvFqXtz19V00zZgvF3E+gZiXFROyhEpyxWJt/S+tcgLvLjdyYuXwpMy1Xn5+
	Z4lNFC0bpgvyLlephS5kIA+DHssLP9aJf6vAncuvaDSIoHO/r9sp1umsTRpzJnSZtZ1DN5qG+eq
	Hi98+mpWazkvF5MaR8V1h2dpTNIRJ0zxeQdWj4q87zk1Bi8MxoNapZzx21sULPpmXTrNnk3jQjO
	xgvkkRLH9FQBW0q6FPm2cGf7YJqQMLROw0Djxr6A6Tyv/yS/QVN85IMviun9odt+RunbFPEkCJ5
	yhqUsPcDdwrsOpW3aZXbcwZUUOSwQ
X-Received: by 2002:a05:7301:169b:b0:2bd:c883:5f90 with SMTP id
 5a478bee46e88-2bde1b34c6fmr1344804eec.2.1772360130992; Sun, 01 Mar 2026
 02:15:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260301014640.1709697-1-sashal@kernel.org>
In-Reply-To: <20260301014640.1709697-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 11:15:17 +0100
X-Gm-Features: AaiRm52xdwuiOcIQSI5afTqgE0VHFHSLJ6CMYdId2A09dixF9pKlBpIZH4n6RYs
Message-ID: <CANiq72kvP4in0uCQC2R82zzrZ9862R2-F1mqGYUpYBFoGLRvfg@mail.gmail.com>
Subject: Re: FAILED: Patch "rust: kbuild: pass `-Zunstable-options` for Rust
 1.95.0" failed to apply to 6.1-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, ojeda@kernel.org, David Wood <david@davidtw.co>, 
	Wesley Wiser <wwiser@gmail.com>, Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2026 at 2:46=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.1-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.

The Rust version is pinned in 6.1.y, so this is fine:

> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).

Cheers,
Miguel
