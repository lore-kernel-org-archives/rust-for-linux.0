Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67537218AD1
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jan 2025 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736427957; cv=none; b=cFoh/ne0OePycvvFst9QTPkJxpZDhEFh7oZ41CDLHkp6iWhKiVSUoMisT1Wql6yJ5wAyUui2KD1ozM5IcmnD7pduCNG8WLW1BztVz9DaHcQnlk8tk8wfTkyo5ubRFun51/hk/FpZZQk4MVlfJ82GBx/DQPDcGN98AKai3a6XIB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736427957; c=relaxed/simple;
	bh=wcyljLGB0krE0JNfa7ndZksptakxRSS1A2IXtKqZXqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Poeb+NQwzfs5mazaCuu23D8KD1DFnQ2HpO/uSUivl7eySOO/R9wEKZhw3g0v/FXEqlMpfurx2V6c28SgKFrvSa+I/bnW85hgAI5xLcoHbKdguw8N/WE7tTsUngWb2sgf0wGSsTBZhb3SXl1L/2a/FV515gfOauXh4tsPr7oIT0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ilu6KV61; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ilu6KV61"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so506591f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jan 2025 05:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736427954; x=1737032754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcyljLGB0krE0JNfa7ndZksptakxRSS1A2IXtKqZXqE=;
        b=ilu6KV61Z5rq1ix1iYSz7YgQxIU9+iF95PHzaOmn0/H9U63oKXJXl5IbW9mMJ4SXUL
         1d4Bpym/+UAVp3jwqqPTY5KzCIGN8mL4Rzs3aF03dvHr8jhEkZjr2t0is0ITCBtlldHo
         sDWa06uml5MTIE/qf/TXY2auKBzHonNT6VowlPYLyXRpOpS7QmHjfJgxG+DsBJqtPvmS
         dHmuP5PySaT4XD+EuwLM6kpDm1Ov/ehktaOKjMfeR7G0B53Q51CsEDP/oAr1Peh5w41R
         Gb8pEsTHVVqOiMaB9SUCwIdbqhV4f6nw0AF4+biIBoxddj34LuNNHmsfd8Ar5utgpAJL
         yWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736427954; x=1737032754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcyljLGB0krE0JNfa7ndZksptakxRSS1A2IXtKqZXqE=;
        b=hvGpHRn0d6BBIYqRhSs4xAOkiZL/Q4bDUWPV0T9xBP9eWuA9rQwfZv8x9F1QngXLOH
         FolssdZzfSkARsKB2mknGwbPizCdic5i/sMIMvqygTbZ3ChxwldOQxxkcKZ8x10e8fU0
         HXjSzYCsXahomQbgFDmFXzWuif2BG8dC5IoN//AxJJLP5pMvgF8AzomDMg7Hok3fLp17
         XKvplzZqly5yd2G+bASemohT8wLT7jPh3ylNCcTj+s55pbdWHsTCudsu2y8lNalEeGIO
         +auDV4NmTkCgnBhdUpfLuzJHa8Xm//B5dK6h4faNoMoSFZ7cofpXRN9REdxBuG34Bdds
         X45w==
X-Forwarded-Encrypted: i=1; AJvYcCVRh0YMlppj/vLGZMD+vToJRrGt+kQg3O7iGfpr7YTMvDbHjtyH/e2SVLSBtR3FfFv09XzzFL7zZTX5WmGdIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcAkgq5FmooGf3i8kh98gELE3oq8nr7cFqpa5kd4y7t9v9LYT
	y4W7OCItrGT7zO6TfkWCGM2NC3cs+IzfmIYSOQLVISWLSy5NOuLMRMUUp7F7skDQ1R5sbMHqw+E
	ttwq49v5o4IDCo23kmxnctZkl3CH2AZ4SvYkg
X-Gm-Gg: ASbGncv5QsGcCPC2+M2aC99ZVDzHvjKu3v3qA31uaZawCWPwEzth1RmhJpNTjlX4kQX
	MDNZshQcBtZKEZ2PEunrluNp9zWwsGPepTzRx5CE=
X-Google-Smtp-Source: AGHT+IHMG/dEQ/3rRqrd4StJPzdDHaCqFO/Zp5fCKML88EUGiZQQH0Bvl1FHBSy2C8nlVyjyiZ5rwh8xsKlTBm6Y4Cs=
X-Received: by 2002:a5d:6484:0:b0:385:f092:e00 with SMTP id
 ffacd0b85a97d-38a87355760mr5338588f8f.50.1736427953216; Thu, 09 Jan 2025
 05:05:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
 <20241212154753.139563-1-dev.json2@gmail.com>
In-Reply-To: <20241212154753.139563-1-dev.json2@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 9 Jan 2025 14:05:41 +0100
X-Gm-Features: AbW1kvaurPBehdappN72Ctcs0Cmv-uaoDu5BcIsB6omSZvRx-z_z571z4tQRNCk
Message-ID: <CAH5fLggqU+58A0c3btSkwMRHZ+=X=cHnzy3cHbB5Oc6kUi8Z=A@mail.gmail.com>
Subject: Re: [PATCH v6] rust: sync: add #[must_use] to Lock::try_lock
To: Jason Devers <dev.json2@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	boris.chen.czy@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 4:48=E2=80=AFPM Jason Devers <dev.json2@gmail.com> =
wrote:
>
> The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
> currently does not issue a warning if the return value is unused.
> To avoid potential bugs, the `#[must_use]` annotation is added to ensure =
proper usage.
>
> Note that `T` is `#[must_use]` but `Option<T>` is not.
> For more context, see: https://github.com/rust-lang/rust/issues/71368.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1133
> Signed-off-by: Jason Devers <dev.json2@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
