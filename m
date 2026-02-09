Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D562459EA
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 12:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770639531; cv=pass; b=tccjvV1M2XzKFtXd0x+lncR1M6kDIqe7HxpGfovH4eemSlKtMriJlin6fAYuKBoJZ9XvuCkHfNCrdKi22UQ/Ag8x2okSdt/oMQRNCk5PlqITPMAFkyD2jjP51F7f0q8Z5ozy+eUZEWk8N1b+adkavVZdEbsk23luVL7vJKEtBOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770639531; c=relaxed/simple;
	bh=7MrpdEF7VkCfyj16OKpvMsW1vNKDAG3wfTAEXikVHWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6ArNsAE46dLx5cAFu6J4D/3FjA6E8K9XxyT7KU/qTZVE0qK9Rm0dtR6Vd3p8Vw28TvQ3mtz9eFvP/SpVdgjGJqLw/tBrelBQQP40csRknLwkEHesYakgkEI9JK2Gl2sBbBVmZWv2pingkWFTXJcnYsz2wbhLSc/Ol8KUSN8ZXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQjQeWgc; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQjQeWgc"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ba6737fafbso39959eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 04:18:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770639530; cv=none;
        d=google.com; s=arc-20240605;
        b=SDEpXkdDxyqyQiS2wq4OYA4vnNfZTui0vXauuK9MKNhb28E3xY1SuKcWoteSXRMRZZ
         vosFRhH6UkhIVSgxHbSu1P4XCy0MS7ADDcXla3zApKCzy+VWXuxnYgBgYkg5lNjRCzUf
         N+Uzs+ItsNGnWm7Q184PHTwes85TeWEwtlh2STGGmUKWKkKRBnfLRUOksPd5ylxLNSl4
         l86AYiUcBlTKW1HPT/8FSCCWM/D9stkECLs1bBgPkdNIuuUNpZAXVwYqJ/0sZPXuVOw5
         UOufybIe7DkCEFwOtoA1aPPDAxzRhK3CPICLipGkzwMTxoLX6uTYv+/1WpVXK1HvIH3p
         h9yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7MrpdEF7VkCfyj16OKpvMsW1vNKDAG3wfTAEXikVHWQ=;
        fh=WYnWlZCCaw71dv0ibK3BvHs1hRLRe9FCTmdd0prw7ms=;
        b=e1kOJ3ervllOGSHdA0wOyTN6LViK3bMZiCv2vB7gdZWlbmI8LgYQPdYKOkKfIbA34E
         Cuq5MomyWNvbw4TPnAclEeJpIZlRdviUMgVd9g4rE9bzd15r32xKuB7Y0+yDAsghiwxk
         0jmFghbfcPg1eMjUnPK/Yf3dLyetSlJDHPPV5vBCi19dNahkH6R7gcg7J73ZMh8vX/jX
         32mQHK3Ws6aJLumG2SnVqf+2ORI1N5igiY7AeRCx2mxSB79xgztMjtuW73HFDQOo4ggy
         q1PBs+pJp6rrfie1yVIlsIN2ysTzHySZGeYxtx54BDzLrHQO8PDTpSkDfcbg0QYGqQMQ
         5cDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770639530; x=1771244330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MrpdEF7VkCfyj16OKpvMsW1vNKDAG3wfTAEXikVHWQ=;
        b=nQjQeWgc7Y3wOnWRIJrW4v1O2jVEQiK9ICEYxHTauwjIEyuf7r/T2pKTjKF+ehCctb
         cgIZhztL1XBXM/8hj1g1KxbHBo8B6d6MKFkcNw4mg0Wmq3Pwkeg/aOIRT1Rpk7MC3YSz
         w8zsKI80FTyIWXVQeOEEqDdPlEa1YAr+HF/0/Eh/XPnhYPfWV/HrrYEdh8UYmMN1dGKt
         /AAP1k9YqcRS3qDJA3I2ILZDX+mgbIrKUIe0N7z7JktespFO7AoG6wbTzhXhQV6SmWhN
         rKM9tSZUp3fN/ue7ic1McZsrpn74JB9EIZmQj8rKg65PYBlJoBuhrFzb5MZaXPIDXO4h
         jmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770639530; x=1771244330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7MrpdEF7VkCfyj16OKpvMsW1vNKDAG3wfTAEXikVHWQ=;
        b=ZZqFEu7f6/8+LPU+OOJmDzuHHTHfDFMkWoJUg2Rh6rQ5n4X34s1ZExRGSixD/ribpw
         nq1/+Umu7wXwg683/1/hr8jVdmnqoYAFqFxLwlERvkRcNh1KUdlN2HNO3qiMQ+fGtMsb
         ZzduwVuh292lt1yNXEJkimaBJwKr1V/KPBFykBXQf4hWpYhf+aAIa5oQU7zoi5Zfby4H
         fRY5P5lAEViPnDogu1Ok8ng+LfuJ19F3DhPXZ80rWBytBvs3kRO9g8T2QuYdzCWgcIIe
         TBHfk/XAvcNYqsLpfft/ebKzQ5qAtR3OwIJ/zv1CA/P7yfGniDYQOGWB2lfpWM85AuQB
         b1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvBbNDPnTvwh+5LiPxsPAYkH1Tb61wig1dD0QwPj/ZANRAx2JMAYjlvNoxZBa9MwAf2GsqjGP6qqZCuEPZ2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Eht/TeDwochqO5fg1jWbct8LB6BAfHN8vs9byCS16/9vqGBO
	nGXZjwDoDFyMWxfSuEqG76h116aVvfLoVtXb4+p0oEPh8Tn33zdBWatcJ0dJeTbxNwSkfhbNctH
	mjDTCqpJvJcHSqJbSouRV5sxtpGau6NY=
X-Gm-Gg: AZuq6aIiKRmG5jInwC+ot+X3VyC6NQqui63IBe00ULpl1waLKv5giDJbHApLFy92nHW
	OX0RbSybk3anFQcG7jDAb1dPg7FvmGSmnvJwvwS5TFpcv6htKQbFaopnv33NxknSVC06UQzq24v
	lXkoLYOyPN7khfWW8vuEcTByC3PGFZXKpj5SIwgnEECgQvPLjLCRYVUE/qcJfICzqjyfkW3FhUE
	/mr8fjE3c2By0JYvlDpcEpVGErI3pRxlL7UGDJKghhtzTvYHkj1TEzP4Ekyg2vEuwYqsz3OWMFd
	xw1MmqdKtOJdDEdtbwNPVGtluYSiVWv7Zea61wd8Pe0nCPoSvq9e272DcfgXfbdoI+ZP/SCD4sd
	S332MbB28u823
X-Received: by 2002:a05:7300:8812:b0:2ba:6978:2b0 with SMTP id
 5a478bee46e88-2ba697806damr580664eec.4.1770639530238; Mon, 09 Feb 2026
 04:18:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208224659.18406-1-ojeda@kernel.org> <20260208224659.18406-3-ojeda@kernel.org>
 <loMX2c-d-q0qiOw4sfLMKLAt-D5giBVKFD-iqhC7j9DJxvEGyhJkgtUfpEipAmkoLRU37FUhKkB6Mz0xz-MGqQ==@protonmail.internalid>
 <DGA6GUR58QJ7.1XZZ0P4VZNW86@garyguo.net> <87o6lyunma.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87o6lyunma.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Feb 2026 13:18:38 +0100
X-Gm-Features: AZwV_Qgvzz6KTR36NruSe0KIn6jokR70xnTNxWZVmJz7h37aUspSQi1nyfinwT0
Message-ID: <CANiq72kNXMFriYor9z6rYj_HJO=ORRsVFes_Znt-HK5NYdQRuA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: std_vendor: add `{likely,unlikely,cold_path}()`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 1:07=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Allowing `feature(core_intrinsics)` is allowing a lot more than just
> `cold_path`, like `volatile_copy_memory`. I don't think it's a good idea
> to allow all these in.

It doesn't really allow "all these in". It is just for two fixed
versions, thus other versions would complain if you try to use them.

And, in any case, just allowing a feature doesn't imply we are OK with
everyone in the `kernel` crate can happily use everything in the
feature.

Cheers,
Miguel
