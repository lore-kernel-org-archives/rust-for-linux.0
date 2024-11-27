Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2A71FF7B4
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 20:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732738695; cv=none; b=PHdG+Fl15T1I1zxna6gZD+mVm+Kl2RnWTnLo2JlGCmm6WvYb8ZFuZIeqRJyRFpI30JoiX6q/KjlujtxBTq2U/WMkavqHplmlyR2xT9fBqHzxtshfZy1DZ6ROoNl1u0qdMCF5Ac51xO3A7r5rKc9hETmlZuQjWpSOSelSv4Q7Tlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732738695; c=relaxed/simple;
	bh=iWtkanQFn3k+fKIRSNxoYkPRygqwiMfMeBcnm452Abs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BmgbGAqLLaBO7iRQEZ67vTewk8++hSFFqvoeOwg8Q95QdkFuJxLMTfrbDsNm3I31VqNs8mB4wnY4Dx/Sjmk/sXmMl88wj2NfF3qR1k0J7M66V1w6M0koC4Z4Ie5yha1RavbS0FCV7euBlzneSGstrZyPC/2E+GjVRmTGi46cifA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AMeMUaKt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AMeMUaKt"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a8640763so512755e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 12:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732738692; x=1733343492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWtkanQFn3k+fKIRSNxoYkPRygqwiMfMeBcnm452Abs=;
        b=AMeMUaKt3QsFa39ogSqPp6Oc/AcKYoNViXooYROSzFWcpO3jP0tDrttOBTWsF1mwoL
         TafuVeB0jy5ft1IZGIzIIggtse63RoOvBghFUWbxovjrHtxjBPGfcCbtwIVwIMXXYe30
         JjHPbzy9XZ8AuLhAJYlHDk6TLigBah85mhZt9rZbdPmd9Ok768zGEIdsrIfiHp+fAhgt
         Ue9QFDIUzSf3i7r62QDyYPn4xMEImCeKazkjm1gkPck/RqZQBh+AKFUz2mJ1sFF9EDXl
         rBTKdh1MJlyNFG70t1fX03dAehZPJuG+hWWVipCPlrpgaLT+n26QaF/5Se1S1X23p21Q
         Igww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732738692; x=1733343492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWtkanQFn3k+fKIRSNxoYkPRygqwiMfMeBcnm452Abs=;
        b=wa7FCfXMQ4CBBKOFXNq4qNSeynQ1O8fPArZg4Dz7rMxSt1Td6/b7pf/7ygR8anBYl4
         +8Jw+4qOrjRkKzCduHgtZZsqDHB3UFm/1e37aL/1wg8jMZde321EKCPOEVExk82crUHU
         4gIdOSbC6N7vez6E0AQ7xheDzY0q6wN7jE3oBpVZOTP7xkugp/dJCz7uYo0u8eWqp12B
         xg/7n+xZ0R/XcNW5hwBjzBx4EPJkNucQqWEUN14kjLMO9mxjAA616wMSA+KjHzKCjLfs
         sw7aQL9D6s/9WUe8iPygKxQOszQn2CYaQC7sexgXZkvZFPDTbwHfH2puDoBRvdYqjwWX
         iDxg==
X-Forwarded-Encrypted: i=1; AJvYcCUxx5B3l8CDKHMvFz+l6ekocGCKZOSp18m/x4dggltmMUtbZtCMzBCqJPGcsQq1dZx0xsFLTWh3CFN4AyeUPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoqbjDSQ/mrwlALIhPP0qPgcdsgT4s4u2FWLSaMX+EiCewu4HA
	3yVddQ81RpNIcuT1F2LMetp3RR13aHj0ZUPr7eD2xxgh7HWJCu4y7FJ8o2rB2e3H4d226dT5PA4
	7D8Ykw54VOzjBu4UuY7EZQ8jeFoPIMHXoekXx
X-Gm-Gg: ASbGnctn2z2BLQXyY6wW46VltZVGdHGG75jOBEjuelT8B/bcA4aUnJ+r+9pGq8EvoGE
	9JubjxQFec6CwzZJ9vVOdk2RITe+7vbER
X-Google-Smtp-Source: AGHT+IGD3V+zmlg4ABEyFcJfFxdiSI3Xa9A1GIeQcefTQjzHie72TsmbhflHR68CenkvJh+FNnmRJuABJwSXf+d4wUs=
X-Received: by 2002:a05:600c:45c9:b0:434:a196:6377 with SMTP id
 5b1f17b1804b1-434a9dbed9bmr45626625e9.14.1732738691743; Wed, 27 Nov 2024
 12:18:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io>
 <20241126-pr_once_macros-v4-1-410b8ca9643e@tuta.io> <CAH5fLgj30AmuobugAgzG9vOhSOrk5SqWwguOoNeh3J2fmLRHCA@mail.gmail.com>
 <OCjFF0---F-9@tuta.io>
In-Reply-To: <OCjFF0---F-9@tuta.io>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 Nov 2024 21:18:00 +0100
Message-ID: <CAH5fLgj2qHjYj=heYi55qWz7=LxyHeUPyhbgVe0QLjzH0S34bw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: Add `OnceLite` for executing code once
To: jens.korinth@tuta.io
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Rust For Linux <rust-for-linux@vger.kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Dirk Behme <dirk.behme@gmail.com>, 
	Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 9:12=E2=80=AFPM <jens.korinth@tuta.io> wrote:
>
> > What is the use-case for this function?
>
> `DO_ONCE_LITE` has very few uses in C; frankly, the only other use I coul=
d think
> of was initialization. But since `OnceLite` cannot block or guarantee vis=
ibility
> of the side-effects of the `call_once` expression in other threads, it ca=
n't be
> used for this case, either. _Unless_ there is some mechanism to wait
> voluntarily when this is required, hence `is_completed`. (And it also exi=
sts in
> `std::sync::Once`.)
>
> `DO_ONCE_LITE_IF` has more uses in C, but this is a bit harder to do well=
 with
> `OnceLite`: A `do_once_lite_if` Rust macro can't short-circuit the condit=
ion to
> avoid the evaluation if the atomic load already shows that it has been do=
ne / is
> being done rn. Maybe a
> `pub fn call_once<C: FnOnce() -> bool, F: FnOnce()>(cond: C, f: F)` could=
 be
> used to simulate the effect. Thoughts?
>
> > Why not just have one atomic?
>
> Do you also have an `AtomicU32` state var in mind, as Daniel suggested?

What I had in mind was to use a single AtomicBool and get rid of the
`is_completed` logic entirely. The purpose is to use this for printing
once, and printing doesn't need `is_completed`. We can have another
helper for other purposes.

Alice
