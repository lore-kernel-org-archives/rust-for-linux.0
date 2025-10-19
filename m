Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39631FA178
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 19:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760900486; cv=none; b=tcUJ/Xy2urG/dfberirUlfqVUN2CRHawN8fSaBA5khtYqIQ6Z0xZHamW0PB4DVSZJ6vEuY7vg5jO6ATEQGXNbm+j7ykE19WX/2s+JfDNP9OnVeJ1ndt2hN+EOZjFnE90f2anOACNTxJxegbIm3OMm9qWrZWxkqoA0l74wFZfS10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760900486; c=relaxed/simple;
	bh=N6oBlf88V+X4V5N7lbg0Z2/a2FgY0X2uO4yeWGr/fH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hNWH0nFeQIUfY6s+QgSHGTTIvzehoszo+th+HZIh4SDZGViIKkrAG5OF2eH3hvlUmpNdqqCnYK/bsuEPJX39T/9a3VTGPhVq9C8WrTgfb2R0DDROWsk99ACsv4nm/NR/cEglDU/GZ9FSon5WjjI328H8EYVPTgGjIqWerc0WhbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQsLGpmC; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQsLGpmC"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-33450918e4fso506348a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 12:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760900484; x=1761505284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EJ7gzHyhyTuLiaSvoYLggBrx/bbuMIAVpkTav441jk=;
        b=aQsLGpmCdv4WcIoXK630QD0WMYCRFVHE+CFTs9LfjIK7h0LnYloDSnUtqQCyHc3jg1
         2SrkhSVah/04BB9puD11J0YtkieVUdxQ4qLxF01IHCxTcKc2FMjmSvcm23Bvc9g8o5Pg
         gasxOq/lKhIRpCnvvzKmEgYZKvjY6FpSFGgl7g8guPlVcEKranZVxDd2nRLwWrntKBwm
         NC//4F50fV3VggQf2NYkH6LGGD1XuWSOfHhMEmv65zft0moGjMCBGXb/5dnAn+o7JKjS
         tTp2tFGzTJ1C+hJM/lDiuwHyN6kE1Q27kpOsR3PYb+v4TdDbokoNBuzVUrSbYgsLd73l
         lJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760900484; x=1761505284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EJ7gzHyhyTuLiaSvoYLggBrx/bbuMIAVpkTav441jk=;
        b=XtNFgxNly9UzIkus35HcJ6Y+za6karsDBK7Cuat43lRFdq1a/dYPApwK1kMoEC4BEW
         UiIaXX5ozjsL+KVxqZwR9Ml2SrgREfx1boJvsXfJ3Lq8BLI0cp3RbW6UGPsEXJ47DM+J
         0mceAkjPPo0fRmEUo0zeBp07Uc9GPpAO/hq45HeDftHLhXLQInIKzwJt2dTRRDVNvOwa
         67lOPxy3l5nEmOv4H3/B6FnLWJ4ndBydRSlJFcz57wsgGzUwSstimtIFiCboyo+d4C6a
         Sf0GefLarGZXgwDPUxSUxOK73jhenYgfZZBI+J/OtjGaSWOMxR9leENkLKPLjvim+EPm
         c82Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIlIbLsquqsxoNjGII/IxDpriJbrgq7Blk/wLoL0ioHEFwSuvCa1nzhm60eezrskQps9ROaqjh9sAtF73T9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTWXrK1Esx1juBF/jUj97Yc7ooCv5XBzgwHrhK198a5CKb6mo3
	KzVgwgJI9PIPM+MbQ9yD+leXgrdUIdFU6Wqtg+hJPxVc3nGyOeoyM+53K4hJlthLQ33hisK4uYY
	WUrdUOdUMY4v1tg/2WDMa6tKNVQU/zA0=
X-Gm-Gg: ASbGncvWuQ7S7JUMwK2CQHiSHy4+nPwjUTKF9Qz/xIAipyz7WSBBF+PstfifZuU4lqc
	tv1POoZt85Rof/EeipJcvza/7yzVKeD0w8lcXEZyJ0lwQXaexWIhJMmymjEs8uE6JPTxM1kvJGh
	zUjTvLHORLGU/p/TkD7PitgCZfyVL25GqKPGQvReFWy9IU48LMNM0+8zkjN6fayjW8/XTIr4VwT
	gtZo+zX0HE8pDv+5a8aHkvTUWE2+KBAhpyW84OVPLP2TXVWjB0iBJ5h3rwNDn1bzuPB6TZn1D11
	FQUnS4Ge5bChTySt82cjC/5e6QfEi2EFmhuUq9XksEyWahlYfGvqqmBbjio3uwuDPwNJJKhY6Mg
	+Xg8=
X-Google-Smtp-Source: AGHT+IH01Zp7Kv3YR610YIrHBC7qgKnb4bJrOZJOKSp2IPxLyP7uL/gDGXWoA6wL1HkkjvVFr8A00rAVeHz/QkcsVMc=
X-Received: by 2002:a17:902:f550:b0:274:506d:7fe5 with SMTP id
 d9443c01a7336-290c9cfec04mr77331165ad.4.1760900484175; Sun, 19 Oct 2025
 12:01:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016232118.1419895-1-ojeda@kernel.org>
In-Reply-To: <20251016232118.1419895-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 21:01:12 +0200
X-Gm-Features: AS18NWDyESJna8eLVVdolUWQrhFdWWW4rqvJ2M-P6m9yEz3NGpLoYYFNiU5MU9E
Message-ID: <CANiq72nFr0rfNpGfXGMrRVnvGtk0RdeLowvF1MciJbhbTQwLxQ@mail.gmail.com>
Subject: Re: [PATCH] rust: bitmap: fix formatting
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <bqe@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 1:21=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> We do our best to keep the repository `rustfmt`-clean, thus run the tool
> to fix the formatting issue.
>
> Link: https://docs.kernel.org/rust/coding-guidelines.html#style-formattin=
g
> Link: https://rust-for-linux.com/contributing#submit-checklist-addendum
> Fixes: 0f5878834d6c ("rust: bitmap: clean Rust 1.92.0 `unused_unsafe` war=
ning")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> This one will go on top of:
>
>     https://lore.kernel.org/rust-for-linux/20251010174351.948650-1-ojeda@=
kernel.org/

For completeness: I applied this one together with the others and they
got merged by Linus. The tree is now again `rustfmt`-clean.

Thanks!

Cheers,
Miguel
