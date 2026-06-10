Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97975391826
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 07:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781076627; cv=pass; b=SSyvEKECvFJ2mcKhFu0PUs94HFOEH5psKtTJh4eh8bvZNnbKNvrnC26iF07hRUrR/2V3zWOQUWXs7HquhEzaeAs4bbNVpbtao6GPDdl3DZzsYuVk/Y9XQ2fevqzG4Om/T8qF4lcbmyRIvV1Gi1yApaBTGK2PvUwuNbli17o0+Sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781076627; c=relaxed/simple;
	bh=1u2BFa1iUX+XKaaA6ooa9MVnK/6+bpSB45oSuaa4+9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dWY+iGeXLs4fZFuaHqRyWNqpcinwKwSKC1Wg530hziouS/alsuv5rNPTrajtvzS7FaoA35bpeaQVwAr5G6HAmeDgyr041vp3m6uKb12YxMKkDncxSxl/bMG5kA6a8LlIVOpaMAVDUvMn3ANND0n0+lXoFvXbSpVyqTCxZLGon+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LtS/oO2A; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtS/oO2A"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304eb0fc233so576643eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 00:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781076624; cv=none;
        d=google.com; s=arc-20240605;
        b=ELcaCchNAP1m/5inKSYI1dc9oTFtTvHf/TdCe/xbPfeZSh459yHHBUXU4kIiO3+v6/
         bfix3RmnCNmRLxT5YFBeu2YxVEiGC+YJpKSXa3pXcE0/eqghgjZnuY0/SaiLh284aPkK
         hoGzObEsubeYCbuJHteqJyhyXavLm7YTNiG/AEZ4vwV/OwEanwQohRDdATr6JNGtizI0
         NPjLa8DNH4XW1swum9Fxu0m1deHWTOm+9/Bspq8wWAMtd81/v45rBw6SG5/6vgF/KUgT
         WTfRIgm1a3PBhHPDpxEM8MMTHXl8oZEQca9OIb/0fllY39YwLMPR2V657ibfeu92rZk9
         TnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pi1bSKu1iANxXNi53S3zpezuz21+ZWdmB0PoX/T+q2c=;
        fh=nTpG9HjhjG2HN1YxTnJaj1b+8B8jvWIXJbT4n1tyxkU=;
        b=Gah2w0bqyV79ssv/yl4oilEc444G5bE74NKr3vH56hxsEyMEzlq87uYJM+mU5Efno4
         b0tDGQXD1q0PGMADmzCe2kw7/mwB6n/Jd0605S/DOlx35QLj2IptvwLBaDFm8d1Y1mga
         a0sut85KkEnFPqbU6HBjn/Yv4IJmknEOv/jD6gwsO829QHfLfInpVXxzCbeZ38wk4r9J
         VbB/1NfLw7r2P5Q1R+GHApNokFddqgPlxEtd5CO+hu8EJURmBTfNwQgvVr9BiRHTggIs
         QnD7yGRihTXzhCbDhAEvTvEu3e6e2d5TlB6xUPRnk8og69si5uT9InQ8oI4dlkI8V5Fh
         lkbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781076624; x=1781681424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pi1bSKu1iANxXNi53S3zpezuz21+ZWdmB0PoX/T+q2c=;
        b=LtS/oO2AhvGlejR6llj8CfgGoWm7AYnGIJHWIIlQ/VSOGSskQI6PxynAicdvwjtHxU
         oR8uZ3clfFxlwoLmsGkhphasZQ5rJkXPEJg+LYvvuw2/1tLCzbCw70GczGGA3u/50nmG
         3WJ8TmizuHdRnGrov2Z584Cjq5vUiGm9llA93O8HLL8jpicEPOc/Qn7f4nsXbc10/viv
         jLMTqcb9uvLovoBnBNhhkeQ+2//n70xoSdvNO9TKjNjIaoarnz2QQy6ZxlRCSK+h2ERm
         SIz1dUTVOlbcZDH8vvQH4jrz/G10TMTCrmx4lUxXgvK2VLI83GsSAVBDB8iNbA6N62mP
         O/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781076624; x=1781681424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pi1bSKu1iANxXNi53S3zpezuz21+ZWdmB0PoX/T+q2c=;
        b=IDrOR4pPvYeY/RSn0KW2K5NxBm+bSlqOf6RD2qucaMojghDepgX3D2gGuk2dHQ/Xtd
         BdQ3SDhfZ7Rvy0VJpoUtWilyIl9gSb0d/xVzt4ez/m8kKoKbCdipFRKYiQKOe0q/Lgvc
         UdWQ3fGDbN0NrdHFbcPWqHYjK2lbyI/VBohWdD7KOWE7oRY1oLEFefjNnlr+chOsv/Ry
         KvBvBVwv73WRkoVfto+0i8ua2NNq0xXI14lPastiSob2r8DeFFlQ+kPeT9kU8h3TZoQh
         YwKPCbZGiK+ZNqd5iIt9gUqob2hXlf3fc1LTCLOIE/KreQRpAjNvCMeRh6B52jaUZPxg
         sRJA==
X-Forwarded-Encrypted: i=1; AFNElJ9r0DEOWDHWV3Hdh782b9EKY3MyquyIM/ztpreYdDgEmK3sayj7ecx1Ytkrake1juFR3tHLD5nv0T92Whwbnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzklkVqC6VrO0dQsqXBaE3jPBIEFvID6eG93tJ+E2IPUcHlYTGW
	07qP2BGuWdkQFVxqpUSNyo6ZFFRYqYYGlOL9zZVp+5f9ruwO60MUYoSEZsnwW6+WdjUYH082bM1
	lndpyPwcb1xbHj2voJvEFOWFN8r7NZjo=
X-Gm-Gg: Acq92OFgQVAISeZXEtTn+T+MbGcjDCJ2Ur/0snYq92EGSROhaJZUSzCp1wqRRNVxJUJ
	2UAwKj3cdrL+JOTbLfKr2rV1XykHknbrRe567c12e6a41EWANjZHdz8gJMCNRzcFafgHwX/IlmS
	yTLvYRkUHSWl8NJPYhxobz/J+adPmt4YDr3tkGPYXzsS0UBDbyEl8cvLxlB5AbMfoSawmta/PFG
	itdl0k48oK/GGIE/MWBCayt9d7VhCLMVxMSl14bP4puTd9EZhrHjbG0EwOnkY/GG5JETisMW5hv
	2pBD01Dlpd70/x0usMFAT7cQeJdGJSqcvU4g17QBkusCuw0bF/bfMOQKAxyPNoTuLgFeqKGPHhX
	WUWk5fU7C/g+aSIICB3M6b6ryJb5erwzbwQ==
X-Received: by 2002:a05:7300:bc0c:b0:304:8860:74dd with SMTP id
 5a478bee46e88-3077b57ff09mr6067698eec.8.1781076620726; Wed, 10 Jun 2026
 00:30:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609142637.373347-1-gary@kernel.org>
In-Reply-To: <20260609142637.373347-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Jun 2026 09:30:07 +0200
X-Gm-Features: AVVi8CfhtUOUWqMJb81Bw-Ep_qKBuU8iXg5G_qpR2vrQ4E2KJJ25x_mDHtH0Smg
Message-ID: <CANiq72=H_box4dE2aFWcENE-UY9_1cAKMWzhxLUS_a=zHsFKrQ@mail.gmail.com>
Subject: Re: [PATCH v4] rust: make `build_assert` module the home of related macros
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Tamir Duberstein <tamird@kernel.org>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 4:27=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Given the macro scoping rules, all macros are rendered twice, in the
> module and in the top-level of kernel crate.
>
> Add `#[doc(no_inline)]` to the prelude so it just shows up as re-export.
> Add `#[doc(hidden)]` to the macro definition and `#[doc(inline)]` to the
> re-export inside `build_assert` module so the top-level items are hidden.
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Acked-by: Boqun Feng <boqun@kernel.org>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks everyone!

    [ Sadly, because the definition is hidden, `rustdoc` decides to not lis=
t
      them as re-exports in the `prelude` page anymore, even if we refer to
      the not-actually-hidden item.

        - Miguel ]

    [ Kept a single declaration in the prelude, and reworded since they
      already had `no_inline`. Removed other imports from `predefine` since
      we now use the prelude. - Miguel ]

Cheers,
Miguel
