Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E3E158A19
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728908103; cv=none; b=Z/8BmAAjEKSs+2g1+jLqO56bPr2NupFJny3JJR0Rm/4+w+qp5j6oIWzMcRWOfRJVERAyTQw5T7sxchGVKRfOUnsWY73/u6WDQP3Mn6ax49EAfY8ItFHX+s/LGSiX0cng5o2LOcu1C7ZZEHvDCPi+p8/AO7iW29OZSSlbE/xMnuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728908103; c=relaxed/simple;
	bh=iQVLJCrO59l+U3C8nBsH7Y/xyKdeTfY2kCaFyYVzpXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=URAzFQLUZuEwGlaWGEYzjkQuIz0pqBRDB0sPJAnfV+/sa2QNOPLmP+hcurBxrdDzAKjg7SRLEKktIOd+ACIU8lYIaM4vyhxHcIoBGAJOe3Ac2/BaSN/CxmEFn6aeTvNW8gIIC3Iqh4uTI2Ch9VxLQ6nLrEh1VTncLzI5aJXKsNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hf24hAuT; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hf24hAuT"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso2961712f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 05:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728908099; x=1729512899; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7KSNGy6l9LM1AhD6ncBYc2Uc1aK2VpPwzUYAgzX7Wg=;
        b=hf24hAuTVNQvGuNeh3s78bjmBZXsLSPIpgm0Y9awwEvB0ufFQuMFbZMA1LHUzVrpCc
         YVNSa6t8c0WcXxzUFV/GPNuyCj1b0mZ0HacoMSy0ieQl8KJy36+MtYYxtcKyQx0MLKj5
         xKvuoWtwEnyNH64Xi+c01vewkrxyOyyOlrY+rZhEmmfrrT0X+EPuDW9kNiQrgeHPPHpJ
         umbs4RMtxJAs09xU4c7WlL7v7oAN3+S9QPb8cP7aC/PQ/X2HydnskjzpV5zIa0Bzy5gS
         K2JugyGra9lqip91XNFnoFMWu2wGjG2H9QjP8Dhg7VgMXqGjNmj6h296kD+XyQSRkmub
         VoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728908099; x=1729512899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7KSNGy6l9LM1AhD6ncBYc2Uc1aK2VpPwzUYAgzX7Wg=;
        b=I+7JK8ML4koTVD6lOV1UeogEjvEgBS4+ulGqr3G6T4bjZTtkGH257vRnRxZbmBkPHv
         jOgaULcJ0ykmV08RPe6bg7gzVySsvgxQsQdDXoDK3Bybi3fba1q5ABB5iHkAQue0Ipy+
         1XKriTu5MIRjwsF2Oild3/cRKLKxeI9JEMuYptbnGXyZtDYRdXOFxDOrYAll37fgPQWp
         cElTKn5VnO4sP4nxilaQDJN0nkNpFQBRfBHvCCCWeAjwd8xLVGKg8lBH0kimISjXPkJ9
         Is18SARPrpXUIEWwduViVlMSTkmw1co7K8sKpcgbNTcjWQJfVCzBOdPskEIAC8/L5hky
         o21w==
X-Forwarded-Encrypted: i=1; AJvYcCV+e6GH3u1YToCaVsLAFk6JpikrEjW/kaV7hB9Bum9Vhtdus34DrC2ByUxOicdWb7xrm/iU4HVDC/jOxICPog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzev+5wG/JsiH7XkrSMm5PtWN8hktRsBj1YNkGTvHOzWFdp9ni
	PK0/kDQvumcPqjWWtuLmTDjh08Wrl9/CekQOdRDc1Q1BGn7/BcIVo7uUkwMh+re2c8ZhsNrMMqy
	VrCalCgTZyoy82ZKGcDVP9oMFVIor7ztg2Djr
X-Google-Smtp-Source: AGHT+IHQMN0yL72SF5rkncUiY67lreSaBexOvErTNNOjpfPJPaa/qxhsWysQojiA1+0udb8Z//rGPUkFfpXe0x5GCBc=
X-Received: by 2002:a05:6000:10c5:b0:37d:4fab:c194 with SMTP id
 ffacd0b85a97d-37d551ed80fmr6540039f8f.25.1728908098738; Mon, 14 Oct 2024
 05:14:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241012231300.397010-1-ojeda@kernel.org>
In-Reply-To: <20241012231300.397010-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 14 Oct 2024 14:14:46 +0200
Message-ID: <CAH5fLggkQ-z97O94Am=h8ObJZnC5M4PtWceu9MJfNw5pim=hTA@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: kernel: clean explicit lifetimes that can be elided
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2024 at 1:13=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> In nightly Clippy (i.e. Rust 1.83.0), the `needless_lifetimes` lint has
> been extended [1] to suggest eliding `impl` lifetimes, e.g.
>
>     error: the following explicit lifetimes could be elided: 'a
>     --> rust/kernel/list.rs:647:6
>         |
>     647 | impl<'a, T: ?Sized + ListItem<ID>, const ID: u64> FusedIterator=
 for Iter<'a, T, ID> {}
>         |      ^^                                                        =
          ^^
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#needless_lifetimes
>         =3D note: `-D clippy::needless-lifetimes` implied by `-D warnings=
`
>         =3D help: to override `-D warnings` add `#[allow(clippy::needless=
_lifetimes)]`
>     help: elide the lifetimes
>         |
>     647 - impl<'a, T: ?Sized + ListItem<ID>, const ID: u64> FusedIterator=
 for Iter<'a, T, ID> {}
>     647 + impl<T: ?Sized + ListItem<ID>, const ID: u64> FusedIterator for=
 Iter<'_, T, ID> {}
>
> Thus clean them.
>
> Link: https://github.com/rust-lang/rust-clippy/pull/13286 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> Do we want this in general, or just in some cases? There is an issue abou=
t this
> where we may want to leave some feedback:
>
>     https://github.com/rust-lang/rust-clippy/issues/13514

If this lint lands for real, then this change LGTM:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

However, I don't think the lint is useful. I would rather that we are
able to allow this lint.

Alice
