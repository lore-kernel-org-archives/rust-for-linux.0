Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876603ADB9B
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jul 2026 21:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633935; cv=pass; b=ROB1e1hFkLXvEgb0ytEqYVWwP7+MhwwfAFidD82V9oRYSY6emQBiiO66URThcAQa+HvIbQKfChF80FHm8e8f4sEAWLa85OJaANvjLN7oLeTgXp5+mjpOioVh3DDrVGnXK7c6zrzpgPgGztNTC5BaZobK6ZN98cnCX4KWDjaS7sM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633935; c=relaxed/simple;
	bh=yzsGbrV3mdbNVLNWop+1sWSocBxa7orHgTv+TBHL0OQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RDyxYN7DHC8lcFM4f2NUHOFydiWa1a7IDN17z0ZANWA8Gt5zYbNOjmp0meLaBdA0cFBr4sM7Uv1s8zElJ/aYSLMomLpSqNZUGC+ht6KywSABvys4M2yhsyYeYeusYVdjyeM9mJVYe6cDvZpzEZi3b9dMpPDj7cz6DwGqsnF4eN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xiro37Pc; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xiro37Pc"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-37f9e2642deso56468a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jul 2026 14:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783633934; cv=none;
        d=google.com; s=arc-20260327;
        b=iRmYf6KnxACwMFgvL3EGOsY+gtFro0saDz9jeO/xoNmXs8XdYFgguxRrnB/cgYnl9z
         5elfGIqPmR5td1PWLZPeQPXS55ds+4VV/wvuSo9wHkvK/BHY+kDac25t+iISQgNhc2t+
         JHapaEJcisPKSJtl5sHd6/gxyDnpCcLXnVSO9r3HL6kqaM8eld8iXNDXYbUz6w3Mu8eq
         PjRsQCveo2SZBvhhcoYZdNcn1u2QuaqTnWstZW5HD8ohfXBtTbbVAak+Rl2526Utbz5l
         +rzX2tgIrGLEJYYI2bQSUbl1LuBxsX/HWeRDv+RR8UTTmeHDXsM3ySkDEQ4WEtgZWF2l
         b8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OujVERdej8Ao10y0ERjq88R9Ec3m1vVbNiRIyWvGzbE=;
        fh=wOQ0kr1QYWlvyCXCQfJbsEo8KDqq5hiABVipTvExIUU=;
        b=bKWN9do6rHFTV3lfq1WGb1qkC2nirdu8Vof3osGchoBfubeTHuqKb2dl45/f62uedn
         UUEAvTiFpU7oxrDM41g48OV6y90emhW1QCmajSj7YwUHfP3IWjpsJLC9c9zZonylVhvW
         pEYfEV6kxW8BEZI/CO5iqnXrAEYownUYxDirB62aMqtBIvnc7VDs9Y7+nyZPT+eTBbJb
         TtzI1ERKJV6URiLjmWNF30BKIJobX9K3UJZW1V/vQQjf4gcEVqURO8+AtocouRJsoiU8
         6NcN+8G9oNT0tLaX7Ilhey+V0iqEemgzICRkAQCwI5tmV47FDcd+dMTY8LKii9WCUKSQ
         OyFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783633934; x=1784238734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OujVERdej8Ao10y0ERjq88R9Ec3m1vVbNiRIyWvGzbE=;
        b=Xiro37PcuwFnSZr1Hx7Ogb9zJY8CPE+tF3SBQxePNylx1pOoT8EgXMxnL0pio04VhC
         SN0CD8sAHIeOa3QfJh6NCdnDOK3o3/qZRQzE3QYFxbyar5ctnRU1gLMxO5bKyW2Y9eNj
         jIDoFkW1VIkCBw6RcN0zon2fAD61mmxg+fBEz/gqutz8Y8vJrozM2+LpwaIWfWJ4m4KV
         vjaRrVk2FXcNaRiJ6sI12+T6Ff7T2Uyq/ZAbwTxnaoIxjSkzu3z2IAiAq28LrmztRUdC
         dBzJX1ab8BrzFs2LfFEFj/l7x+PJrqbEAgBMBS7RZaaEbFvcgDFudfSJQH74euLbqoSZ
         tfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783633934; x=1784238734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OujVERdej8Ao10y0ERjq88R9Ec3m1vVbNiRIyWvGzbE=;
        b=EJmmjNsayhonKaCHdq40965EeaKcMxTDLwKJ9/Sny2Mo7of7gGAD9Ee9p0SY34/xhA
         AsF02s+Ahae6QyIq3+7fIW42YvDuI3OTlonr4CtBKxdCK5ey/NdhqO/HIqPrLZP2kVdo
         Ijt4YJaxhiPQd5hPVsJEx2/kjr5bjh17al7SnVDEbIxJI3zVK9CyTZcS51h1K5Aieqsi
         0nLLcv7FYZhra7QdEqohUNJ61dQKPNm+OLf+qR2m20YvNbHOOP6d2Q9RTwYrl669mohO
         T/MkcUq3cN2xFfu0biWHV5/bZrYmiYdwLCa4/d+C9tvz68LWYs8mXOAiFGhDfc1Budtk
         JU2Q==
X-Gm-Message-State: AOJu0YwR9+TTKL4PwXVFLcZo8RoYhk5erq///oYJ1mqECMUPd1aPWfQa
	zdb5DXQ+WK+foCS+IiEDBg3IOLqfbiRRwcZ/pnVi9pz7d4Le34xv3U6c+yGzmpJds4vzusmKeGr
	R71ko0ovkrgUjELjsEYLy6u64hl+5UJM=
X-Gm-Gg: AfdE7clOCng5+MPJoMnkqaKdAjYBiqqHTcDpLPOnKQ8C5VVeTdOVv35E6yTN32gK3nr
	ua5ucSawk74PZGpnvZPD6afyz+KIZQ/DhHBRqGGPNs9dCCW088EisUYRt52WDbmYUzmzrofnWRp
	k7xB+EaQOG8rWPhalcLF0PD5UIAxS1IYKTt2OhBdfud3QveYmt7JdyeveqUVh8jzVxeJtG5XRvy
	bDx9VLdFotoQHxcRZMRZ2CoxduafKWDpv6kcEE82fCa4zyC5yzUMCODwfCyMAkx0siWOnJCs9WK
	nxhsQ357TCp98YCMd9vwyit5W5OE5rVNSdv1V2AqGCUPaZjGZJ5lrsKmVIaxeYhdhx0KfhB6A04
	xY0qeh+MMqj6t
X-Received: by 2002:a17:90b:2d08:b0:381:28e0:6248 with SMTP id
 98e67ed59e1d1-38a1f1dd5c1mr4861384a91.1.1783633933876; Thu, 09 Jul 2026
 14:52:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-soc_unwrap_or-v2-1-007ed724cc7b@nvidia.com>
In-Reply-To: <20260708-soc_unwrap_or-v2-1-007ed724cc7b@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Jul 2026 23:51:59 +0200
X-Gm-Features: AUfX_mwu2wRhxSIY8869LMM-JC2amc6Sh4AcwhSXYGOD0MsD-zAXWgwmX0yoSLs
Message-ID: <CANiq72mBdo3nOJffN4LJe6XS1Sm3qkLvM8MdnS5Q61=0UiE9_g@mail.gmail.com>
Subject: Re: [PATCH v2] rust: allow `clippy::unwrap_or_default` globally
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 12:49=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Starting with rustc 1.88, the `clippy::unwrap_or_default` lint triggers
> on `rust/kernel/soc.rs` if `CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy`:
>
>     warning: use of `unwrap_or` to construct default value
>       --> ../rust/kernel/soc.rs:66:10
>       |
>    66 |         .unwrap_or(core::ptr::null())
>       |          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `unwrap_or_defau=
lt()`
>
> This is a clippy bug [1]: the lint decides whether an expression is
> equivalent to `Default::default()` by inspecting the optimized MIR of
> `<*const T as Default>::default` exported by `core`, so its outcome
> depends on the optimization level `core` was built with. Moreover, its
> suggestion ignores our MSRV of 1.85 (`Default` for `*const T` is only
> stable since Rust 1.88), so we could not apply it anyway.
>
> Disable the lint globally rather than working around this single
> occurrence; it can be re-enabled conditionally using `rustc-min-version`
> once clippy is fixed.
>
> Link: https://github.com/rust-lang/rust-clippy/issues/17379 [1]
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to `rust-fixes` -- thanks!

    Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
pinned in older LTSs).

    [ Moved to non-versioned group. - Miguel ]

Cheers,
Miguel
