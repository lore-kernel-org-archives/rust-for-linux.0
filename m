Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3168C30DEB0
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Sep 2025 21:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758578390; cv=none; b=LdWAP1wJIioPFDSvl6y9/bT2P1vOCqODZZE7rwVUjJRULEjs5XQYeeS7ZnQ+rOMcJPAWfPs0TxLrinB6ZQGBIHadXFQACpwEXe7bumW6TszxkM9u/CHHkOvm4o9ZSG2vxD6MNGrpVrB+9IGBM2yK7CZ4MBn6cwW0LvDLySfXcfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758578390; c=relaxed/simple;
	bh=jKUVSnXmSn4FKANXfjyYLOIiAg89nB994b8rJKbFokM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKFPmzHC/J2uIlu0N88AjiYH+qPN6HDMUdaaucvB9lPxs7QdIoRpi5L+nNqspE5Y8yRV4XRbMKKYXQAGKqndBqtLjq394W644pJjTO3tD8rZUszydkP72KVZtFeS/lP1COjGK70qEgcDTUQ2ty9xps3FDoE50a6CDaaZWNiZF+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h32Lu0BG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h32Lu0BG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-269ba651d06so8651885ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Sep 2025 14:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758578388; x=1759183188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTVCircg+kesKPnjuiU2zmcPm3Wk8hx0LgVUotPUxPg=;
        b=h32Lu0BGY2SAoAMqZEnKFslOWEhtH+8OrSJx2Lkvuzk+ZQ3K6BqOQxq/uJYzfk2CjD
         NVxNIJ0hjjUsBZmsr6XQP2r0m5/RK+VSt4GaRc4CWSBnCBP5L4BuuKq9o9ub1WOQ/fty
         TyP1+OsLaLOfoKIS/6IRcRXZaRW6saWZL/ZnLDf4Jk2Pp9TWv1WF66Hi95F+hCdjQ1QO
         0Udp+ZWgzdxHMAfAJ1X+Bmcw+Zp9lVJWsWX9dqBZ0GxLERIWFaEGJEu0lG5hR2vkd409
         DN+ocLfyZKKreyR0ziuRKoxg/kl8acEWhr8qpjVYslAMGhYs1vWVszkCYOQTCUiILyNN
         UtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758578388; x=1759183188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTVCircg+kesKPnjuiU2zmcPm3Wk8hx0LgVUotPUxPg=;
        b=AdfdwplzCzI8VEUqqPR/bdVDAKEQ4JE/bQx8g9WZYAPxSrLWrHCikc4k/I62bxsF2J
         gzLJ4AmIVJj8aCU8H3454Tvuev6JJp6rl7g6WNQ/nbN+VeELg0aE76UReKglut+xsFOM
         spABh8gSMHHoqm0EazML0vl17assYdVUpsoh3hXizKNr25JxuhMeu7kDUgnUxh7IStrb
         tMyeiiQDhaPe2W+Fm8Ld3QZV+GA1FT21VhEv05CX72Q4KmBrZWzekXbLBOg/ILaVn5c+
         peJV5YOJ52U9lHX0xjdhINh0RVD8Bqvl+G9SCSvd4zsc7Nl61OCAPQDKMsRk1c1L2RhD
         v1JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqKqm/mL7NXBXo69H1/rcoh+kcPPa4Wvse109DHaIw6wBsdRZrnk5bPY71IRVlSzjzZ3XxNwjnkIH9S8Iw9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNJe2XA0LJIOobcRhLzgQOfYyAAOCUNE92BMKlDwmTJsJ73qX1
	hfxq2ztOq4dr4MSAvPI/w1ne7208j+L+Qs1zqQjR/ngQwAYeXj7/UsBLRcuuxJVG3n/2Rz8LKoo
	PjW4djm5aVZbhbrvIEcD/+CyUQ6CwB4U=
X-Gm-Gg: ASbGncsUDEff7OzbqP0J2SYdxXeN1rOz/FiuP+dYqj8D2jkc6bmbhEiK957ptW0M2EP
	kKtLz13Tau2GBHogDqAO8/bDfsfYj6wu6ljeaTo0DjksXTyEKSgWhZI7USUI6VMxDRAKXvyUiRN
	z8EnE4bKtrd7gEiRc7359lJrof5SIMzLH65wli62UJf5Er46ovNPPtW4Qu49HH/QYu6h4YQKMJQ
	2BL1wGTDPqmErOjjNCi1CncoofXfK8yDXiBq4nFSyIJxWALCAhMQWAbIvDiKjvDj7zzNSLuSjBp
	iS1G37+8vDfHgWekkl3dJVoVCA==
X-Google-Smtp-Source: AGHT+IHO8cJKGFmF6HkfxzDA37dCzzF2eb1sWGALw/BM92tVXUO+gzQ5qLlWsYCyw1t7RNfA8rfVA2phVEot6qjLLv8=
X-Received: by 2002:a17:902:ec8d:b0:269:67e9:4c20 with SMTP id
 d9443c01a7336-27cc41d582fmr2476225ad.5.1758578388477; Mon, 22 Sep 2025
 14:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
In-Reply-To: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 22 Sep 2025 23:59:36 +0200
X-Gm-Features: AS18NWD8TsrWVNTwE-9v0GFvv0Ifjza16a049-IVfVsrSbDAQ6mxb5XW5HdMIaY
Message-ID: <CANiq72nP_VwSnFzyM4HKk5GTAwJw+MeX5JXqA-yLBa9JLe9YOQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] rust: add `Alignment` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 3:26=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> The first patch makes two additions:
>
> - Bring an equivalent of the nightly upstream `Alignment` type [1] with
>   an near-identical public interface,
> - Add a new `Alignable` extension trait that provides a way to align
>   values up or down according to an `Alignment`, and implement it on
>   unsigned integer types.
>
> The second patch makes use of these in the Nova driver.
>
> [1] https://doc.rust-lang.org/std/ptr/struct.Alignment.html
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to `rust-next` -- thanks everyone!

    [ Used `build_assert!`, added intra-doc link, `allow`ed
      `clippy::incompatible_msrv`, added `feature(const_option)`, capitaliz=
ed
      safety comment. - Miguel ]

Cheers,
Miguel
