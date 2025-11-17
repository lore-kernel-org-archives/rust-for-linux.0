Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAEF34C9AD
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 21:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763413382; cv=none; b=tQiZOz1glI2gLO1mI6x0cr3z8LZ44wVR1EHpJamWPiSyR0WXB5cKJc0ciNoMkoXISr5uWX5Rq+MCAidojZXqfnvsWBMTxjkCnsTE24hstMEACffxTxoebNiBp4u67pHmK9v9+1fYon47HmD9eefN0x4WiFF1MZDVS1bl3XvYQl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763413382; c=relaxed/simple;
	bh=iP6TspFv6C7dt+qkcsFWTPUOXmBMAp/00Ut2BHL86o4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LT6YWauqpeOFJDbWbj5RAkdwuhmhYEcnVh+vjvTSig9CnrgtyFroUycuLGYfIaD3wHA2oXOPkMv491vq8aBEeZtB9F0DHcmncVHfXDTVHzw4ldPuPOmn2ihaQFEtkicQdZrVXEJrC37L39fwsyiX2oQU/WDJZgwuKSJYWy0yMQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaXVfcwo; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaXVfcwo"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-340bb45e37cso849199a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 13:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763413380; x=1764018180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iP6TspFv6C7dt+qkcsFWTPUOXmBMAp/00Ut2BHL86o4=;
        b=NaXVfcwoZa7LhmxM8NlTRwkrZ0ZZkSPcDLeurc8j2BNgbm4N3rTFMhEyl7nhPo9Dr0
         cyTCIFrOIrbGj2GVaWQkFy6Qsz0GpiUqbQ0+OLzLePXqm1UNnaOL97t/k5LP5cEn1gp/
         4M367BlSX+u/3TV9NHNqACV9VpTIprstQNVbCEXvbT6MPzXMVlvhZuHldbeHRXePRIU0
         Ajvkfu4L/inB1IIzDy/hiAaBnq6rxn5wmN5+n9ONdRZy/8q3JEZQ0zE/mVfrEVcGG8l5
         bb2E/fSeZJD3F39FIGWcZyfvqU0abBW4gPw8n2fApof9N9T6/V/lbEmsesrt/9rdYeR/
         4eMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763413380; x=1764018180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iP6TspFv6C7dt+qkcsFWTPUOXmBMAp/00Ut2BHL86o4=;
        b=OSh7L8UPzag5D0NgxfCWKT29awCWoLHWL2+EJ9J13RChQ2gt4eMt44W8UKhFxKtcl6
         qZco9IGevOdv6doiEnGBntg/RUnQuv4WCJpinHp6MsjmjI78JAnMaDWZzqq/S2NXbHJu
         Ga3ZDvsDE/xt9Es/6NtaojgldjXHX+y0bs7jCSOcSzDrYYDUePhbtrJtaUt7notjgr1Z
         s9Y2EkOdl3V9fO2gcWWGa/kWRU05bLKFtpFCdBpsGALp81VVJKSozg+BUNXDIloZ2rbR
         D0oJM8c32ZUzWiJaG1eJpUzkfELEnClpaU0LY2sZuJEQB9CMf9dsqPz9DwPrJ1qVYlv6
         Em1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUB8r13KoXBtxqXMbiW2Y1hIkATt6BGxeSyAJsDIKBa/S6iVFNr8PBch/YZLvwhHNGfugpvRzBRZxAqxlM9rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY3A7xGlvqoCOV/6AZGZ5enFHXmpMVPNZ6/fR5v29ZPDV9m2mW
	9+wnGD3L3XK36IQ3sCelYRXFpMhozU1jqjyaoIkgeqwQawC9mkZZkwyOgl4ruJugIRWX4BWxobn
	YcwXaRVXgMOYMVYAnYizOzSbgvzvH4FA=
X-Gm-Gg: ASbGncvmnCOf/azsBebJj332j6jWfPle+v7Xolb/keXWXojnFDttSUiIMK+D4Q9iqVp
	A50lPaFs8GfDpRIsRfSrXeSB3ZAGwbSqfZXFeT644+nvY9ISswEr8Y6HKtje8cYiwRg3nFFVM9R
	QylMtq6z/Pkcs+4/DMme04a0qNGq06eREiazDSIytnhrobQR98YkAN9DRZeWX+433kAsSCz5TAs
	JKC9fsvDAfO6uXgKp50YqCcEzxJvIfAduyHeK06HpaQ2Lvbl8TCX3fVwXi0jR91OoQQP0ib2UZi
	Rnxp85bgkLXpXzhXT/TU89iPF8VTWS7Z4NsoJZlIpdZq0G9K3XoXfC+rG76AuD0ANc1DhWpJqgw
	XcCay3QbHBff2eA==
X-Google-Smtp-Source: AGHT+IGlfQGUdtSox02ATWkbxSbcf1jC5YZXySUNyLmlrEZvBMimdky+/XqX+bymvXPFrGG75BWC3U7j6V3cT8HAU7U=
X-Received: by 2002:a05:7022:310:b0:11b:98e8:624e with SMTP id
 a92af1059eb24-11c796b9796mr80353c88.4.1763413380425; Mon, 17 Nov 2025
 13:03:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117080714.876978-1-ojeda@kernel.org>
In-Reply-To: <20251117080714.876978-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 22:02:48 +0100
X-Gm-Features: AWmQ_bkVH0zwZmTGtxY2a6yQt4iofNRpnQgdcxIiUj_oO7rEMvoYnw_JJyWw_ro
Message-ID: <CANiq72=-w2p8sQgUKYgPG3Tx9GSUNgcVUp24k0ck2RqYgupCVg@mail.gmail.com>
Subject: Re: [PATCH] rust: allow `clippy::disallowed_names` for doctests
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 9:07=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Examples (i.e. doctests) may want to use names such as `foo`, thus the
> `clippy::disallowed_names` lint gets in the way.
>
> Thus allow it for all doctests.
>
> In addition, remove it from the existing `expect`s we have in a few
> doctests.
>
> This does not mean that we should stop trying to find good names for
> our examples, though.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/rust-for-linux/aRHSLChi5HYXW4-9@google.com/
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
