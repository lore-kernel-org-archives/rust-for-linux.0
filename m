Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99828346797
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Feb 2026 10:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770546965; cv=pass; b=QfGqIT9WB8pWPhX5B0TlXf8TO7QmcS8Z/RoHR2h/CqP4HL/PhM1V4NIvJz3IITYyab1JVIO25Hp94aBV4yUX2QBD1AkL40ilJWFOyypQDu6/fZxLC1xk9Uyxl5+x6d8ZwGEaPgE8xpFavnInoOKHpXIu1wcGghyos2mVfwx+XU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770546965; c=relaxed/simple;
	bh=9O1wrWh3odojrrpWa3rmcifMg4603V9NZnEbcjcOIp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOTnJ/IOuVJPkIO5Kkq3QxrlZZOWrEl2wg80C1cMeX/5CEgi808b88QKLD1LBwSbd1mgBodvsHNI7v9FaLCJroaYOzQuWZED6nDH2XJtBIOSIMId8jzIGx6fHb1PTqCCig+mzF23sh7UIdGZ6QMdLVbqLItMPkrulm2xFy6wo6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WP0LvGkM; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WP0LvGkM"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ba6904dd88so17191eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Feb 2026 02:36:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770546965; cv=none;
        d=google.com; s=arc-20240605;
        b=QeBQlkEnaaUfqz0g3jtlOcPv7L8+TdwEChhFSSIYC0DfPAVSUE8YyGjIVtbjSid8/A
         M2uXgrCJHRsqV+D3FbvpLFjV5DYYz/jOXZlZBm36bgxc/EpNvkB20mLL6zhLT2YD5cdY
         cHsiW7R/tdCdu5DWvBHLhwJePYPOpNWQzC53HwjbAyr/46aMACyI1fCt2KD59buE0gaC
         sedtYBt6p8tR8ZKHU4NiusMNKhOaQDWDqjtqizhusaIqVZXZY25nCqLKDFU5IywarKid
         wsHJrR8IxxEtoXVajNXezO7lZnq3MMvrQr+SWWJiX1qnHn0lgKYfuHhfHtVEtxts0PXO
         htow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9O1wrWh3odojrrpWa3rmcifMg4603V9NZnEbcjcOIp0=;
        fh=1d2ptVGrK5vO69v06KzoZeiXzGZa1cl82G+p325mKIs=;
        b=SsaeKdrrp08JdhzcmS0uKnRTQu2yWx1CwOqYgg8yEUe7vn4koKLLwSoaMfRYAipRXg
         ScpJaa+xNQ8NgMMoJ3oPN6uRNjboaBbSPs++rZM3QbgYNfYz3lySPv52f62dQICbzGG+
         Tu/bT1pSeKZpitupQP/zCR33NggwgIHNf2crCW+UFT7Q2O+v0YvEbtLUKuOqzHPk9jJ7
         +l5iXCCMn52vEEyw2sQBOjqyD2YyG4brcN8NFX5RHroz/wFykXGnhQva+ZnCCr994U8z
         bk5sgpxKLhs+tUNEQKzuBT2YdQCrhURutbhLjsbjdTBZMFzFuS+tx8OsMi3pO1CA/Wo3
         mgMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770546965; x=1771151765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9O1wrWh3odojrrpWa3rmcifMg4603V9NZnEbcjcOIp0=;
        b=WP0LvGkMM7mVQRJhYIoXk1xKtuc467gglERL7CkEyKEZTdJk7O3QGPA+Rip8tHJXbb
         y9FKCb9ED/o0LFKD+CQSwBIN2CckVgPagXTdWVx6a/EwFhkhuO/iDrzf4hKgFNP4OT3P
         bR4X0YUgBAjAgRUd2QPXozHJ8taE3KMDXPiXHWIYv/+eiwoduHnTPkdiyPjCVh6E7ldc
         1mt6sj02lxcux24QcXESd2z1TUTCkOxfYfwwDdLfE4b4VsD4KpVhCjPSMkoV1cvBGGnz
         5a0M5LTL2txTgOHaYT87pmPP+NSa1B7XYMPgmxN7oN17QzE3eP61odYZ1m48zllAmhXz
         t/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770546965; x=1771151765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9O1wrWh3odojrrpWa3rmcifMg4603V9NZnEbcjcOIp0=;
        b=gw5Moo9DPVbuRNTKQ1PUn1K9KioL7YVd7/rnedUFs91NQIf4fSXM9e/yjKTrpEvhXD
         YL96YA1upAhqYQP5biqEkOFYWbz2edPLN6n1xBlnIWYY4bJmD8aZQKYToPA46kekQKwx
         +FE4shX38pfuUvwfFmDdFhW1cGsz9jkvTqMZSC8XEpJMFQ+UqX4jRcUerltBwchTip8i
         lVpWLvxuc+ZJSx/hnNu8qjQxrlYudiPLgY0JUQgZOo26Ea5zk5z7lxP748MSJLhlzwra
         oIp/gw9jC1cbGmT4ZHiyutubUBmGr1MovBOoidx7id2lUvDCenuMjiJFqEjOR7AoWSO/
         egpw==
X-Forwarded-Encrypted: i=1; AJvYcCVzL+HBdt9gMUrDuLUubyMA6o5l/nkGEJow/FFCEUDkEQ5Ghpn/gC8yQxyGj2zLyra7qwpMCrcawdQVE04sAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx43M6UArNgZ52ZuVMVQiraT36+Z2Hk0VLRfSVfyoi72vsuJXd1
	ERxH4yHgEuCo3CO0cnba90OkYF/qFjY/AaS6hgpRJwtAiDYTW2nNUNrYJJcQqDj+ZfNgntISzAV
	t9EoHJlb+/wbo2R1AkCyBNCTaGy9Dkxs=
X-Gm-Gg: AZuq6aInP8vBnC4yPf+fSBvl6Kh43PoMZaGiWDPgwhly6DQecoMrldnBF7BNSjwvOV6
	19bXfUl/VXTr0fSWrjebZ7QHF1J6lEom7gMrlsrn3UuSSYttGDzIq1wJC4dg3oqjSVJ9thUmw7A
	va+XKDwNH8r8lE4n593bF33lBUdUFQTlqud3fSef/pjma2HHKARAgmWl/6+MlRIPbt4cgN8SvHy
	TcZGIUh9MSA/rlzagNJCJ0styp8j8KY0yPfQzjwhS41G+D3hOISHc9mCtADeDElKqyvRuzjCaoG
	vA1fJdHOfK922QGLTIkA/yUofZCrCts0AMJgNavjPrNAowhyACm/MUIq6XHCl5ZjAcefI3D9RMe
	VoZIRN36jl4wp
X-Received: by 2002:a05:7301:2f96:b0:2ba:705c:c8b5 with SMTP id
 5a478bee46e88-2ba705cdee0mr51988eec.0.1770546964617; Sun, 08 Feb 2026
 02:36:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206171253.2704684-1-gary@kernel.org> <20260206171253.2704684-2-gary@kernel.org>
 <DG876SZYRBXB.CO3YI3HOE3FR@kernel.org> <DG87KRN75MKZ.1O0TZI77MLIBT@garyguo.net>
 <aYgmENPRTdD4wCVF@yury>
In-Reply-To: <aYgmENPRTdD4wCVF@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Feb 2026 11:35:51 +0100
X-Gm-Features: AZwV_Qj9Du_jkMva36ZyaDnahvdaMWuW_Dr2E9c8WWpcJW3fs4Mc_FBQ-9Oqr3A
Message-ID: <CANiq72k4D0ZPDzBCHY7xq=qOmERHk3e7P8CcKtVHjjjOQhJ+2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: add `const_assert!` macro
To: Yury Norov <ynorov@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 8, 2026 at 6:58=E2=80=AFAM Yury Norov <ynorov@nvidia.com> wrote=
:
>
> This is confusing. You begin with "const_assert!() is more powerful",
> and finally recommend to use a less powerful option.

The goal is that users use the least powerful one that applies, not
the other way around, because the least powerful ones fail earlier and
are generally more robust.

I think the first example is intended to show the different ones, but
I think the wording can be improved -- the one in the existing
`build_assert!` docs is a bit clearer.

Gary: perhaps we could factor out the explanation/examples to the
module-level docs, and then link to it from all the three asserts.

> I don't think this compiler implementation details should sneak into
> the kernel. The compiler may get changed, or whatever else, and this
> all will become just non-relevant.

How do they sneak into the kernel? Gary is explaining why it is not
called "link time", precisely because that would expose more details,
not less.

Regardless, that "link-time" vs. "build-time" discussion is
independent of this patch, because those docs already exist in the
tree.

> On the C side we've got similar statically_true() and const_true()
> macros, but they seemingly have a different meaning:

> Is it possible to maintain consistency with C on rust side? If not,
> can you take those C comments as the reference for what level of
> detalization is desired? Maybe pick different names then?

Please explain what inconsistency you are seeing here.

Also, please note that two of the three names have been for years in
the kernel tree, and that standard C also uses `static_assert` as a
name. `const_assert` fits the pattern and it literally expands to what
it says.

Moreover, `const` in C is not the same as `const` in Rust. `constexpr`
in C is closer to `const` in Rust.

By the way, I am not sure why you suggested `const_true` for the name
of that C macro -- I think it should be `constexpr_true` instead,
which is closer to what it does, and it fits the pattern on the C side
better, too. So that would be more consistent.

Cheers,
Miguel
