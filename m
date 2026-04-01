Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE2D3E121A
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 10:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038625; cv=pass; b=FWDJ0ykyYrKvrZYZM4MD8iaQXMH+CiLvBbVjibfwfktTuVBi6xaWCyXnj4hjcRaXInD2o2J/+urueVE9Jp+OsoumXItpV8Jg+oIlKOxL7g24h9zdytQHSLRIN9k6gHfF80LGeEw0N8sIwntfXh96yD6SKkCezpFb7B9mjOOQBnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038625; c=relaxed/simple;
	bh=cErv55E/b3GFdsEtQvb+4f7cbyU5xpMmTaegvVvJ97s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VA/xJOcozCuUuAzI0EvBuXLajB9lKKoweIjFRRHvmBFFHTlKuRvb3DPp6Hy9LTEktAIB9srW2Z8CEEIlYgXpdivsbXFzWkOyYOK5o4pCMmF71DDXAR2NnkUd9oDT45T8uvqfcr+GaxxuKymO2t8/5KbjjORdgGNxdH77p3HvmPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFy+5Y1i; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFy+5Y1i"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c16cdf31cdso333039eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Apr 2026 03:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775038624; cv=none;
        d=google.com; s=arc-20240605;
        b=i47fX24lCE0Hwl09V53zFTbpaYJPD+kQCz616uWJGXvT5TZO22OnhbdK/r1RU01llp
         xclPdpALmD1XMxOR1dPTjCX55CwrWL17aotfFUXFT0aQGHW70JQutpxjsxbAdGxe4bBx
         Z4p4mztE9kFxMNurtQHz97dDUJ+fVfghzm9LeIWY3pSvgc3sMMlbL5FxecajxrT4T8Ki
         0fa8EPhNwvDRwUAg943O7IPQBgv91fRwYxl2qyZwBju03pc0xZXR5/U1+j+C6scJVGyK
         GHeuMCHHMQQk3cI/rlFqtjjoOaHmt0i+3wkDVvnkwQAV48MuWOputXjyW2CnZwkkur5P
         oHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ag4Ub7VCB66zOtt3NntE+exdtX4BmoeuUzYsOX+gjEk=;
        fh=xU7N3NoSItAAX2MHvRBjRvBSNDlIOm0PeqwVVb7XE/U=;
        b=MtIDTSc2SMNWL6zMlzfkDlGZ5FE+SJZv8+Hq2CBfP63bewQs2TaanokgEtwo3WerbX
         aNk14AnwqeQ5M3ukP9JhApGO89RvZSJ5ivhUQnL8/7+irKYpzIURRKKolKqeL5mCcDkm
         SuR7/CHhXRi4X8M4CYbadZSMCGa0hjjmp2X25u0lDaYMeyYIrhNQ8s7+IT4jw7Ah01b2
         4NGAHzB6/Y+eqCOZVMUfS3TQIoawvcfRSsTpep6IpKs29LykTpiOms9Eszk6XE/EB4s2
         49RQ3P9hSAE93wJS5HlYUFk+1gpO2Tjp6DdPSaXqPZ2FVkXI7ymvx9nzo1lugDKsjbGE
         HXEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775038624; x=1775643424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ag4Ub7VCB66zOtt3NntE+exdtX4BmoeuUzYsOX+gjEk=;
        b=GFy+5Y1ibQG3M//Bh91GrkKmWZjgZYpAUtOMXfHsqOXTtwKf+Ypv6Yq31nVas+oN39
         +FolR8hsMiEnpagWuMb4ZsD3rasHHF9uF5T1MuA+xBYANEty018WcOMzRcge7uuc82Mj
         wCtFv2kiPC/O7ubPHHE356h1vtCr8KwXfYCDx0n+rBb7LqcSyGeAkwkU0KyJ/N27OIUl
         JXXFAmt/94eEOMkfhTmkQJjl4S7eQhWRLCNvIFrwsgA0qBcMNeGA3DF46ZunJZxV6oxh
         FNkiA6Pjqwnrcx2RWjv0cR5OeqXV5e/Gk/mXiFRtHWEmEk5QL1XynWgMKV4TmpwYJro4
         CG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038624; x=1775643424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ag4Ub7VCB66zOtt3NntE+exdtX4BmoeuUzYsOX+gjEk=;
        b=VN1r+moTlq5LoV4z/lhCMhdfW+fB5vaK+THrwPpVO+G3CZrdgXd6/GKGKIjRxlNMmO
         bWqX1wJm3AL7AbWs5Oz20xhwnJpC1rqH1HB6VOcjlpo4jOtJBpyvbK0Ej8tyUovADDFl
         Ck4RyBAOWPZStHSCyLpedmytAY+0nX0rWhIQacae3ACbY4EQo8khTcdCSvTrz3ofj/tK
         ZY5yBO4tHzw7h8XaZtKOKiOHw4e9AUBIeY4wdR8YR7udBj5UnCMa6MG1RE2nrnFfdVW1
         PyQ3rVuhWGboGsZnbFltUYY8vSEI0cI/KkbnBICvZmEW4jDWmRyoqVOH9yztGlpxZy9O
         /xIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYbndmLKOAvXjTySkyZpUA5uSr+cXvtJj0uiLTE/3DKCgtTq+edGzXEeUoxr3iG+iGi0HeX+qN9P6hmPg4yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQbhfe8l5C9ZWQgytbsV0R+Hvr7ZW+m9ARC/Cq5eStQUZcXu0t
	RagbeRnYYBsYEy4kvuf9qLI35lAz+b3F/UmcLIsDy/RRIWCSze96i12IL16yT1mEA8Zu58rlqeY
	D5oKfhKm85EmqD9rrlr7BJz9vvgG4T+8=
X-Gm-Gg: ATEYQzwkNL8KDGOnbx8bsXU9vVDpZGBYOdh7uaaVmRzcJFmFNKaES6lqBDAsqwR+CsF
	TgO20f2cEHQ6qi81w6PamK7IprTSSfTbbrUASS3xKJaIHHPMp+GQFF5oL5Yu2CCVfBFbpTFn8sV
	I2NTL+KeFVozh4YVVJd6U96V6J6FN83nR9uVN0lr3141H8Uen7tiCOO7mE1p+DLJyrTpkVxvU9H
	+6rL0t5HSsQrxEIr16piKINGBrS26dzlbheQ2n0eog8ioKB3OI/5uGmec7rbPsIWAOvw5bc2R+T
	nT6ZBfYF/SPvK6WQ+B4YZhUdmXNerYbn7+xc6gFq+8k958psz0zNXQIiYh3nJCWDkKPdzKyuTqo
	Key6xoiezgS5WZyBhudeJLkI=
X-Received: by 2002:a05:7300:d51b:b0:2be:2912:ff65 with SMTP id
 5a478bee46e88-2c9325af28cmr747429eec.3.1775038623675; Wed, 01 Apr 2026
 03:17:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331224319.107082-1-jhubbard@nvidia.com> <20260331224319.107082-2-jhubbard@nvidia.com>
In-Reply-To: <20260331224319.107082-2-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 12:16:51 +0200
X-Gm-Features: AQROBzBNSdLhaOELXqzxzPu1uovw1xkWubZzYeuySqdBkwsw78ks49kEDwbFX-0
Message-ID: <CANiq72mv7ZUest-yPV61Y+L-RtnYTWSKNMUfT7EGFiDG5jimKA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: sizes: add DeviceSize trait for device
 address space constants
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 12:43=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> +//! // usize constant (CPU-side)

Some nits below -- possibly for apply time.

Markdown and period:

    //! // `usize` constant (CPU-side).

> +//! let num_pages_in_1m: usize =3D SZ_1M / kernel::page::PAGE_SIZE;

Perhaps import `PAGE_SIZE` since we are doing imports above anyway?

> +//! // Device-side constant via the trait

Period at the end.

> +//! let heap_size: u64 =3D 14 * u64::SZ_1M;
> +//! let small: u32 =3D u32::SZ_4K;

I guess the resulting types here are to make it clearer; or do we
expect people to write the sizes for this? i.e. since part of the
advantage of using the constants is that you get them already typed, I
wonder if we should write the code as we would normally expect it to
be written.

Also, I always consider in examples whether to add `assert_eq!`s, but
I am ambivalent for this case.

> +            /// 0x0000_0400
> +            SZ_1K,

This is consistent with the other constants, but I wonder if there was
a reason to not do something like:

    /// `0x0000_0400`.

Anyway, all these is minor or can be fixed on apply.

These constants are meant to be useful soon, so we could do the same
as with the other patch, i.e. I could pick it already it depending on
the rest of the discussion (especially if we confirm that the user
patch is what we want).

Thanks!

Cheers,
Miguel
