Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F43B47CF
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 11:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774610730; cv=pass; b=nJJVBAVyQBSUL6KKsm6EblRpqL21LpKSsv9RmGxOd00mNfz6UTFbdGpYdXNXp8yUX6sinytwSJLqKalY/MYwwFqmaOp5DyjEwwypJr8Kn4yZ5Zg3azNHzndAH+jeX47ZkhWtDoDHY4rHldIJjuWoq8UqkRSRl/q98E44e+WCQVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774610730; c=relaxed/simple;
	bh=/t4BRqx1/vQQ+Ey0/5xKTqHfVj8NazOB6mXoc78JnSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MzWwcxR0+31h+xuPCnK8N41cQsCTFz6nzhelC9cPtmUcS/tqniWo3ZLMt2n9q+Otr6c1ef9asnBv7U2uImLm8WHdVfKCDC/k3E+Z08P/7oFlWqD8sazLyJHH38aj+UitCA288dHnwp1zrSpibPEpLc+1uYoK3R22scdE8p0v+WM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZEK3eMN; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZEK3eMN"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12a77005d69so195619c88.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 04:25:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774610728; cv=none;
        d=google.com; s=arc-20240605;
        b=O6lcSPbM3n6e5vTiCekomilfXQYLxjfrm6MYeOqo/punk3qcxSCpPx72F3krpBsA7R
         rwp2PqCOzfoSLuFV1nCfJWeOGiN/JLhp/KuMrjnbCFGunlYtYsqMp5HwNVnzamk1fMvf
         OR5IHmEatSF5g3iKVaaw6cCHaEskJs4R/Tddlta+zBMbL6zw+onh9NsoWeJzVN2cKRHK
         biwoiIxH6Tl6AUnXycemuU1CTt6UPYU9UcJOD+z2exdvwciHW45G5O9S6d8q+Zxdz4Tk
         HVQ5MhwfdtpKpKFkJ5jEiBwsAqLdWVHYcPgHY0ynl90+h13+dgk4GOfCVeIVRA159QkG
         HOig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/t4BRqx1/vQQ+Ey0/5xKTqHfVj8NazOB6mXoc78JnSE=;
        fh=cFeB2qLFRpiiwTXvIT+7S5hWJluILPdY1kLBj+4ZWA8=;
        b=k/Llt4MP0mSgqw3ksnRAdb1/i6d2O1jv9peEl+g7JUnoqlGPjQfs0YlEUDnW6rGCAA
         UMB9hZIKziD+3nGqG1BEDv2yfIPg37mYSr8pvkgnN0gE9T2ey5PJdxn0jT2KmJ1C9nWc
         ViWU5GG7dDWX4aZM71rF7gJZYDSAkbKTYsK6wQ2xthB4RO2+TKyQcDKKxScniy5nPdkg
         NSfg9UmNZ2dvIvOYB/FRUXgbUuvc+dWwRRYN/TEf6G/1h5ip+W0Vanq2eEkQFuKToM2y
         Qxb18d20NvUp0ny4e9fugNTxscihLpIeoQ5s66uP62JvmaivM1h842hnajbM/apJRD/p
         7PGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774610728; x=1775215528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/t4BRqx1/vQQ+Ey0/5xKTqHfVj8NazOB6mXoc78JnSE=;
        b=QZEK3eMN6TlPh3jwRqRXiVEExfn4MYUxXtBxK7si0ObzYT1LZm0E1S4t5xR9a7npNx
         CatXiR2L3oA0HvdEEFW9LzJrUH3IEgNEv/KnKVwpI378efPfDRN/gdi2iF51BUeODgLe
         p4YbG5uC8dp7q4/0yVseWO+S2XOn3sa8YUpX3W3v1jfJOgI0uZ4UbBJdjLLVX2aMSADy
         t+X7w1lVJ9nXFXKmsbBlhLkFD+ekKpQl8mbRnygYAsmDkhGwQgEyoMQz+0SurkSwkjuk
         233gGZMYoz9azyVoEVtecIbT2fFMMXSt29bb5HdIzrPrZ5DYoEC6Uc0NqX4/GclhzQqn
         Fs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774610728; x=1775215528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/t4BRqx1/vQQ+Ey0/5xKTqHfVj8NazOB6mXoc78JnSE=;
        b=E+LHoFpGhNQSm67cqKRedoOIei5pK54prbfuHE/oNEP1P47fLrbnJE6zsredSPJKcV
         0SLDJ7yXvTp7aNiQW5LTMYNwxagEFhla1XjgIkpQJhnsqU1ftUU5DFd/9SRNjjAri/c6
         Fv8FyV3OOjt6RweQ6TLB17O4cSJXQZzqIibMq+z++5IdNuH6DXb+SmNCydfAMwXfX2RI
         aDX0I4iSYBn/x6aDO33yTftr+PtVhzqyptsTS2bIaw3hGdbrviI1u1DuPAz4OnCKJ+HL
         pEMCQmLehuVU1ZNDOjDMZUjAkLw7hNaEELhT/sytyV2INzEbrEomNDcxk83luL+SBuB/
         znOA==
X-Forwarded-Encrypted: i=1; AJvYcCWAAssED8kSdqKz7FkDF9xFF9qnSpLKQq4/aLw23EzNNkSnlwS1CdLRGdBz1idZulRx5tZioaxl42/GObQeww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZtHV5+7XMWG3BZ6E5lSQKkL5GDClnOOoNsorgbjkWD5wOWwrN
	56pim1GVKYgvOvSa3QvXhACRlPsMT6buO4+nuY19czsYkl5MhkIi58ik5IfygIs8IHeSOz8Zc6j
	n3HNEMLEnDx59PgYI1SSWx0FexUtshdk=
X-Gm-Gg: ATEYQzzkG3YalG1017Xc4xuTQStro10VVB4FHOBdHe7w2S5YSgORGd+TwzPyWF6WeZ/
	V4f351ZlDjyUg7jNtJfZw+BEYKBMOaqfxXwPwYpT+6MxieE/7PDPEPuLzj2fJ8YEWz4eYTufvYO
	emfFceuVYW1P/K3N4B2QDhQy6NZ1ar1sPw02FQGNiSdmgsQjE5AuVZbcHygMyBDPU9SvOqn7uHV
	l7lMQ/WrlMN0m/cx1XJPjYneNrVlTBU0q2afaq2jiBRwYA7XRKDAXWzl/ntIDV3kYcuSF+kGF8M
	I6QJcoDQ2Z8bo9s3dA3oFOVBWoa4Omiwf+gec/T+FSkuWypCjevxqIIN3rkJcE45WfwZVOvIDmZ
	GsggJRU/8YOt/bCtoo8MKoJQ=
X-Received: by 2002:a05:7300:d512:b0:2be:2912:ff65 with SMTP id
 5a478bee46e88-2c185e18e0cmr557082eec.3.1774610728065; Fri, 27 Mar 2026
 04:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312174700.4016015-1-gary@kernel.org>
In-Reply-To: <20260312174700.4016015-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 12:25:15 +0100
X-Gm-Features: AQROBzAo7F8QBHGzpPueGLhFTyTJkHfUxCZu_wIvTgy4e9tFpvc7Zr7plUWo7dg
Message-ID: <CANiq72k-gN_5sPjYi0PHVY0FyfkjHzw+CBg54VA9o7Y95Hw6-Q@mail.gmail.com>
Subject: Re: [PATCH] rust: list: hide macros from top-level kernel doc
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 6:47=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Due to Rust macro scoping rules, all macros defined in a crate using
> `#[macro_export]` end up in the top-level. For the list macros, we
> re-export them inside the list module, and expect users to use
> `kernel::list::macro_name!()`.
>
> Use `#[doc(hidden)]` on the macro definition, and use `#[doc(inline)]` on
> the re-export to make the macro appear to be defined at module-level insi=
de
> documentation.
>
> The other exported types are already automatically `#[doc(inline)]` becau=
se
> they are defined in a non-public module, so there is no need to split the
> macro re-exports out.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks!

Nice, this cleans up a bit further the top-level macro list in the
generated docs.

Cheers,
Miguel
