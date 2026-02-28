Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0B721E087
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 01:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772242372; cv=pass; b=nUIyQX+Wyje2pxeN8AmukTHMMcMVNbvO0SPZtbyY1DBNT/2WZjgmlTijtrTjUk619zGJKcGSSPfne15hrPK+Kc4AxBGUzLIYOcPlHlGKPOscqzD8AXR6Sv+4zZ38tWJO5fDymQBE3lLR3fu93yTvJgEuQjraVjCFL1/VB5Qe3PI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772242372; c=relaxed/simple;
	bh=CONkaPmD6N1p8Wl41bWFdbK04Exw+AofJGxiyObuVR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atRDfM1cikIrjy0Mj02ToXO3eEeA2vBfMyw3URByCt5E+FBw+GEttj4P18JiRGrtF4Fm2gRqes9XaIbhUlj7lHB2xg46qKMamWvvcoloXzm+SHgLGVz/u+65oqXS+w3xD0gFfDlHT5OGqTMJQQRsIBI9adV4prniwJWXRzn5hOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpUE24zM; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpUE24zM"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2bdb82b69f4so142509eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 17:32:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772242370; cv=none;
        d=google.com; s=arc-20240605;
        b=J2eASeC4X4gexqLWMtdlMDliuKbiBoRUWwtDzEhlqbo0b35CJ7bn2n1GG6gh+dYKAA
         WWymsdRAmQsi30g0B1dASPi0SkYSaKtU14oaGcETdz5YAp8x3q/8PIg+7+oQvech99mY
         7ZYXht9T4Zaj++xGO8xKHGp4RmL2RFMf3zYwPGFDQTp6gg8gGC0uxsZnRAvrpO+GQ+FE
         rlFmSABe4rdNueNhGOaFm7DTiQ4hfdtWBFpxf4GOUgUTjLxmB5/SMR1DJbhrHXp0WARm
         Y2zrlKOg/mT+jh50bHeQfIfwuAXWRDdoiPw1r3G/VPOYhTWUjoIa5D65/4jhREwB0+Ri
         B+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3nsfOyCnlIaYDY7uNCziE96qb4GjGHs75Vm15QwleTo=;
        fh=PCe7rwxWVanIq6xhJ7rBvPukcy+5sluyvAgmyNKdogI=;
        b=ZLCwT/lmQ5HbmZCiPlcCKR0DSUgzX3U3qRT8oeDyQU3mfRNxammAQDrKgmOuCNxJng
         Ukd81JS4XDb9vQQiOAYXF8F1ECIR3x89aDS3FBkyStHeRzsBUFtw2RrjdxJk8kgA1hmg
         FI/2wlQlETsNDZ9RHy/UsjnU9OKW1T4W+XY8ZSFdEs+zZliJjzAhXRdZYPfuxXhWTfPu
         AtUygD7DYqDwzPByydhbwlI2UDv+qWWNBWSHcJw3T3SSs3dlklzABrSUthE21ODsua8v
         +NMaoPQlI0bXeedQ+MvPDN5LTyhQytnE90YvMjU3fNDegbzK0HXzoz6uxzNistxDswVx
         Mg6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772242370; x=1772847170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nsfOyCnlIaYDY7uNCziE96qb4GjGHs75Vm15QwleTo=;
        b=NpUE24zMqPh/loW8KERTuXfmsZAGUxZbvyw9j2dS+DkjDnT1I5i34ThZLRCXYWAY4v
         fAiR3S3Uqr24K31a8JT4uIrgKDSokVGbo33KxL8pzx7E3QZJzWCvQrzpEYl9BnTJ2CZl
         lkDdryC+Azyp/OZcStiRKoA64n+Ki8XgEjRkbD9wSUOVAJF7uPT8YxSmAbj3ryj5iek+
         BvaCPwmvO6L25JXByxE/eHs73MvwG42ctGBpqPz8cSP42YFDMQU3/haJYlCsUICOlR/m
         JoMcxVMAMGWprycSjPMa/biQLg8QycQ8JwkWfg1ydpXbvK/3GFsS++eSQtCaTywsgYG3
         O28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772242370; x=1772847170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3nsfOyCnlIaYDY7uNCziE96qb4GjGHs75Vm15QwleTo=;
        b=WjYvGrQHRYNS0GAgcm6IKnwPJE3yrqWmMrvBOvDIMMAwLm/2Y2IXakxGWxLTR3MRqd
         2nyOCdFcnRdnxjjb1hYNc5RIJUu/LlA/0fpmfsD2e/Ac+XH4CdwkZYO/lCcSc6ZoCZTx
         k8mPR6ybFAlPhu35GXl1mwowvdsHh9S0fcdsi7EchxweZRcghrpkVE3oQ2TJn5UOApHs
         6MYSjjRa9worjww684a+eVayud3fJQFTXcOD3RGYYNuWKbrqTeQ+kyzqZRn8e2yAAVQc
         zoVacYmAGFr+R7wrVTMdrIWJFEZgFi6eGKMBKymXAH2AmKAsWEAkKr6I2RlITIez/mpB
         q+Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXzxrC11DHeBUjLf06i/NTq975Jde891JRv1FUaVKc0baaKChvxnfa4oZlnQXQk3Zvzmj59ybRy++Zs2BvWkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYFi20+OTI7FVwBbzciL+SGc4S4cI7rv/kUfMsxNVPQZjILgAd
	GwpV5HSP/bVEaPcO28L6lpRZrR1O4DCcuKkcfnd7YWpndE3W3YcgHF/UQ7KHYAMEH3xKNw8DXB+
	tQ+Mk52kEpOPsrnMssP8LanHK+P7YRZM=
X-Gm-Gg: ATEYQzx0eVAZrKqbMJA+bX8lGZw/31ZgCeXVKpLH2dnqfUF9abPTgiGAG0e2PxkXI9S
	tt7pAWmBJgspWwJktQ0XvYrxJQgXyjKoucqUACB9GcdpbEgiLxUp3A34Xyw6uLLGSLW3j5l/Tny
	du71y7vWnlLbShGh7Obwd+ozefFPQUERa9b4SmBzV01RiY26xIoOkzZlaibid6wEHSHBP4TSAJr
	DOy7Las8/ux2h+rhdJ+HM08WEVjnQqSe1HdP4JIwawARYJK40y2AG3OxRYjJ+w1+KnZ59PzqlRK
	FaADmOKSaRLV51jTiw3mELNCJY2AWcM7FzoZumwxPHRJfOQZsOA9ANGprhMWpxp2eNtVSe5Iw43
	viWQu9snmD8wTrzXPLIeGXe98hUvW
X-Received: by 2002:a05:7300:dc8c:b0:2b7:f145:a98 with SMTP id
 5a478bee46e88-2bde1b2878bmr1121074eec.2.1772242370097; Fri, 27 Feb 2026
 17:32:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226234736.428341-1-thepacketgeek@gmail.com> <20260226234736.428341-2-thepacketgeek@gmail.com>
In-Reply-To: <20260226234736.428341-2-thepacketgeek@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Feb 2026 02:32:36 +0100
X-Gm-Features: AaiRm52ur8aq7KahUBluBVKKHjAKX3SUBCaPurx6nv1CE1SejfeUH-yosDfCUvA
Message-ID: <CANiq72=d3DmqUwe+b-btk75N9r8XMxSeqaQniShfbQQKBeFRZw@mail.gmail.com>
Subject: Re: [PATCH 1/8] rust: module_param: add StringParam type for C string parameters
To: Matthew Wood <thepacketgeek@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, David Gow <davidgow@google.com>, 
	=?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 12:47=E2=80=AFAM Matthew Wood <thepacketgeek@gmail.=
com> wrote:
>
> +/// This type is `Copy` by storing only a raw pointer. The underlying st=
ring

Please use intra-doc links where possible/reasonable.

> +/// # Safety
> +///
> +/// The pointer is only valid while the module is loaded. The kernel ens=
ures
> +/// the string memory remains valid for the module's lifetime.
> +#[derive(Copy, Clone)]
> +#[repr(transparent)]
> +pub struct StringParam {

A `# Safety` section for a type? What do you mean here?

I think you may want to establish an invariant instead.

> +            // SAFETY: pointer validity is checked above
> +            Some(unsafe { CStr::from_char_ptr(self.ptr) })

I assume you mean that the non-null implies the validity, but validity
is not really "checked" above. That is why you probably want to have a
proper invariant in the type, so that you can invoke it here etc.

> +unsafe impl Sync for StringParam {}

This is missing a `// SAFETY:` comment -- please double-check
`CLIPPY=3D1` passes clean.

Cheers,
Miguel
