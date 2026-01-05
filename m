Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B91C31986F
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767615171; cv=none; b=c7zkyXLUaqDsG4TAvll1obUZ8Vf0CL9wYY/fDwkXV8RIuWqpkx/JlFrN46a2fofnRKn5vumB1KcJve/mDR3fm6fHwgo5B+628utp4KlDYKXRH0U3bT4jBXS/o8L3dOP91A8M0XlJyTBY4AeIZwivfEQd4t5nvBTEOxF9rbSSu9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767615171; c=relaxed/simple;
	bh=D1Z/RIB27xyJyHI9btSY977n5ioQ/Fq7HrmrhMwT5g4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eURcrvkanN0medJxN+I4MmU/ZvuWB7hfI7Ifi2xb9VtHCFTCM8YLcRqigsE5dKNOTFPmM01Pt4zZq1r7TT1MstJ4Qo13A1yxRUdkPg6VpBfEgVCaFoPXAptkg73o/XmtAXpSNSNbyL5zFjlZqu4M+MjWkPl83sHIzefN7s9aQhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSyAeyzq; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSyAeyzq"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-3ec3cdcda4eso10097724fac.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767615168; x=1768219968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5P/qqyzyQwxCeZBFy0JeQlxXvkDpVAUcklA+rwRvUQ=;
        b=JSyAeyzqkaH0lmi/ZNpJeDFMsgTKA8qgPkhVkcNVEkJAIurVEcwUFIiK13d0vFyNzJ
         Gq3TPYHSKwUR44/vPAL1EqTE6wPILKEGEN7aEfiWREUqMEssR+eaYzt7naZZuUe2lfEN
         oo69O3nbgaB64BE0bgdHsyxK9xy5fY9SaX1BUBkzp+mvmPxHo8wj4Q72Gp80cidF7lmB
         lO/7G9YqEQrKZGWyDoqbcGXfuF2wCPpr6xIdte4ArloiOP4cVl/+QHTlW3IOzJ7zWYEp
         pwRazXtElrb/JlU/LGWWTkRfIXPmeaAnlbEXx2m2exsAa8GMsrJDHgPQCDSqUWNzEhs7
         zq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767615168; x=1768219968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z5P/qqyzyQwxCeZBFy0JeQlxXvkDpVAUcklA+rwRvUQ=;
        b=pNbKFFHVKxtv3rvklD7jj2k0peUmJF+xhMDnliOaCctbtb/dsZJGa3uQ4yHYs3YbYQ
         ISXo7zkad5ltJljoSt6JgixMl8WcPv3VOBQjHggBRgArsqFEf+zd+cxJ8L4j1T9/sf8V
         nKDEd1Ew3vDOF05AFGzpmDCKm7oZYjmNiRL08NEmu7zH5eTyJYKi0GmnUNNjbZ5oclI4
         3JTKWz2uEcLMXBw7TyrxoOWiBechwHzZxnWSj5wFHU4aVDb/JA2f6X2rMmOfCIAz96OR
         z38kPuYapzt1q+Vx4O5yIEiz3brPmi4JHnv/twWnAIN0TroDELSInEo4FwevqCB6hoXd
         2g4w==
X-Forwarded-Encrypted: i=1; AJvYcCU9syQa8wzGGLpSOH1i7tjbxq3bp/ZWyYXh5GnKFY6bpFwWx9npjqnvIJxejdSwW9HixVvVpZe8yUODm7vT4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyItfFou4oLtfUfzxJk9YKvxRHkLCcLEa2rO6Z9GdeFQ4FniKVZ
	2smAJDT8wPwZbcrtkNbqzqmeJKlOMG/yofhEUnAjrexXaJ8NI6z9b4sEsfMdW0KI6lA2SJ5/knV
	m3iTtms8gYHbo0pu5RZgMUR20f2OK9SU=
X-Gm-Gg: AY/fxX5gq7gCvBDtP0HqXb6WlV4NKsJj3+OeoxE0z2kPkvZSthCWPdOw7fesu45cTfc
	MQ4GhBWrFAhSGS24sX4hY51iR0GuuGJYWpLkv8Q0zKdbxaIAh0mRMKHwr47OBFaY2Y5gjOmOFTz
	PIDl8iKB3zcfG4diLgzQU8yBF4222B+Wz2a5J5GkyaVFCrKR+dvNDYb0zJ6k+JJEtQw0JIx8BKS
	gxDQtu/NnV7IOVgznBHxkAwu0IGuyBAFE7t1P6tbhKGwN/NsvvwFHb73dMsChztHNZNxvA=
X-Google-Smtp-Source: AGHT+IGKvtz7M/3yr00psFEgCxMlF1URj5J6iQCQyosIeo+fx636WNkUwpk3yVBpfTVlNy6DJxkgJiooAtr3OA/kX44=
X-Received: by 2002:a05:6820:1043:b0:65f:10ea:4772 with SMTP id
 006d021491bc7-65f10ea494amr4029843eaf.19.1767615168471; Mon, 05 Jan 2026
 04:12:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
 <cef76fc1105481d219953c8552eb5eb07dac707a.1764062688.git.y.j3ms.n@gmail.com> <CAJ-ks9nWbu53Fhmz0Wcb4jHxwr3D-sc=BqW=gHLjw34dAxRKYQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9nWbu53Fhmz0Wcb4jHxwr3D-sc=BqW=gHLjw34dAxRKYQ@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Mon, 5 Jan 2026 21:12:37 +0900
X-Gm-Features: AQt7F2o6USGN9sVVvw8ONv20fGznelv6BztfiRNaV15qIfG3eteDYSjMvp4IZXA
Message-ID: <CA+tqQ4L1j=oy87e0DC-m9YA9wJ6fR+PKtVBcnWH9iitNsVqG0A@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: quote: make rust-analyzer treat `core` and
 `std` as dependencies
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 7:49=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
> On Tue, Nov 25, 2025 at 4:38=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> =
wrote:
> >
> > Fix the `generate_rust_analyzer.py` script to ensure that the
> > `rust-project.json` it produces includes `core` and `std` in the `deps`
> > field for the `quote` crate.
> >
> > `quote` directly references items from both `core` and `std`, so
> > rust-analyzer should treat them as dependencies to provide correct IDE
> > support.
> >
> > For example, the `::quote::ToTokens` trait is implemented for
> > `std::ffi::CString`. With `std` listed in the `deps` field,
> > rust-analyzer can show the expected autocomplete for the
> > `::quote::ToTokens` methods on `std::ffi::CString`.
> >
> > Verified the explicit uses of `core` and `std` using:
> >
> >     grep -rnE 'core::|std::' rust/quote/
> >
> > Fixes: 88de91cc1ce7 ("rust: quote: enable support in kbuild")
> > Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
>
> I think quote doesn't need std, see
> https://github.com/dtolnay/quote/pull/318 which removes the last tiny
> usages.

IIUC, to remove `std`, we need to patch our vendored `syn` as well to
not depend on `std`, right? I think it is indeed a desired change.

If you don't mind, I'm happy to patch the vendored `syn` along with
this series if the team agrees. Alternatively, if you'd prefer to send
the patch yourself, please let me know.

Best regards,
Jesung
