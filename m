Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF4A3B443F
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 20:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786998086; cv=pass; b=BMKgPLz1xk65cT6YwJeST3j5pPeZaq2WoO7NEQeeFhD5SylQT3x73vt2M0+SPH+YuAy9cvqBfIhM1x6XiRm9DfG5nsrHI1u2dLzaNvtJSqzoAiRlq01lTgd6uVT10X22bKrknI8Esne2U6U3G9O7SDR93cYFUDU8kZQP3FOrgYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786998086; c=relaxed/simple;
	bh=lwvuQfJxe+jzb1AKqFkeSinncTSpOJtuzhCaTM05Xok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E2Ga85cs/iMBNA2RGm7NiNQPASN316IWnLxiJF8KmtzJrJBjjuA/Zyn7T/20VUdxr3jPn7bR91zAv0umFx+qZZvuIezxDW/kCxIacBminNhRBas3NDrdXMjvIrqL0t/fg5qfFmrnnLxhlHYoVrYCl6jHam/zqnVP1t1Y9jwRNtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HjFuIOlc; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HjFuIOlc"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-383cb94f742so4744241a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 13:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786998084; cv=none;
        d=google.com; s=arc-20260327;
        b=f9CcQ0pcZstMkQxgy/ZaNi3dkiGpe2rwXJrxfiuAcTL7Dr8H/uJG9Z4UWGqEWkwUXw
         AhLUlVTE9SnyTIjlv0YEJ/LXp0gI6/iGMuXqNgLX/oh0MzDxzsmuPs3aesQhq+Li57KA
         AliuFZemNkqr3QBvOnL4zQVrizT06jAXpC62rRHpeY9T0zw6HdoqQ/Og8RjWghEC6BBu
         xGcd5bdblPHQJbJwBH2lSYmPkgVI2mvLSW4VZ6NWv9OXes541S5ZapIR4sKXk6aXHfiv
         OorScoUPQOgX2P5CZkqAN/Um12Her8+RW/PK5mhLkDxY0kLCiRCNy5QS2KJdr8C3/ffO
         155Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lwvuQfJxe+jzb1AKqFkeSinncTSpOJtuzhCaTM05Xok=;
        fh=XFJg0njfSxM4/XC0vXP2Y+Pi/+KfksnG6ak3QNLESjY=;
        b=C8zpOhjizTumOPgrUPyEEbvnXfIQQxT0vw2qsKBTl5gjd5nMBD44FqzFlKFR9Y+6wB
         ib9U4pVTQDgh8Akjssuu+3aOxygDX6vQzREtMxIc1PrQScZY1i8yr7oUjfkeuZfNvs/h
         fN5VlfXtSsIdsA/ARQCX8tZlQlJRFPvamtJN1GrQs/cY3/+XRjHIFmD9ECEIkjoWMzMB
         OESm120Nyn6iFNunGJPYff5VMW9LEaODQGLK2l/YwNBtmYyv3LmDgfunhUa4/efbet36
         Kki8uzCXdzRZVeJq4dhedhzKH+OnKXkCoUAqmohCYD5CgpwAmBU9R9eHSU4eEcD7dlQr
         yRZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786998084; x=1787602884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lwvuQfJxe+jzb1AKqFkeSinncTSpOJtuzhCaTM05Xok=;
        b=HjFuIOlcCLbP88Id0NJ09dob/kdHkPBiz9mV6zOYRGTfOirTC/tGEtWu3zTsbN5HKk
         VGu/Xv5sCek1gn7VvU/jX/zSfc2RuyuNBoMKKeltXx5h2B5RUgw3bo3sr2xvCdu5CqVf
         QbQeBCXzFDk5JsG71FTAOseCYcdekUqjdHiJCTdgoev5r3HSmUN4jf/hJS1URVIDwiBs
         FQUsO3u+hi2qWzqyTk/RAnRC+hlD+wf9m9GhnKLOpf+BVwAL6fR+n7I+FhIsk8eaAH+K
         giFURSgVtfhnQbWSBoM3fHG9F0S67CjJ71ka9p0ZMgqiO5Rg22VyqUDo1vA1SIY238a3
         +20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786998084; x=1787602884;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwvuQfJxe+jzb1AKqFkeSinncTSpOJtuzhCaTM05Xok=;
        b=dFxkkg8PTQBzXNQiBipT14cGtkY81mpg4fNkPGW3S7+wmYcoT550pl13r0rl3R2wEq
         a0eDOh7DslR8y07fUQ+nhMywW0qC1tT+6ZGfSMJ83ZNY4UDJi+3TSQCnOxmDwgkylopa
         AGm54P1szfucfdoNviWdCsvfmFLU2Yc1/4XXj6MfilLvYzfuGQywvdQ8nEkQU7lhBs/u
         Wqn/JTbxWvqNDlxpe1MKDf6jEFVrmxeXhRncawlUF193+1S/0rCc+oHkh8GlJxNfgKvy
         0Ja9/NFkK2uAsS7cM/jWlU0tyVOm8zVKTV2vcBMhtwuEHKyu3tQWJOEmSQAo3M2aoVZJ
         ID4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpo5egDLPeF6tTMUnK68iKik6e9++xzMFPAaioPljPzUC/tOYB/lq/1SsLugdtly/zcxRpscd219h06wZudow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR0Cr/SQv5mSQCJPJCstbrR20lIj9k9PZBimkEsi6yvttVdH2L
	79rOUhD0ikDf6FY8XXnKEaDoIJTm/fWF27cg/NzSrD4NL+zYmpRDmAVi/sqtmprp94jn0qMOhMY
	0zsVrOPmagzflyV6ytUS2cGD7mxokWHw=
X-Gm-Gg: AR+sD10uJicxWZ/0EdiRpGiHbzAsmQvtcsD5hHh0jUDIWTC7xeXVeTjfCcs9SOBHrzW
	1k/w8ONR1DbJe8JCl7ASeFyDCqs44MQODao9QONuF+au2jJ4JQQWXd0bKR40ptHRHjUF6ylqJoT
	bM1JE6t25VbycNcGXqt0wIyo8Y64VVEb+Q9ObxkytFHqGDTLK3pL9fqX1SuBEdxrflxa14xB3wh
	dj7pmXGWuptM5En5c5N265Qyvy9Jov0jDImTOUtdefcYNOrbYA4USErdfqXGFR4+zBYxb6V+rYM
	I+l+GmdG8CPNaACig2G2oSuU2BzThnfLHZLDQ4/C/za9oi2oaPKQFGA//1LIWP9p6lPX8eL7Iaz
	hYQ63/ESjBVYUGEQQ7wqQAVGhRVbB6Q==
X-Received: by 2002:a05:6a20:748a:b0:3c3:a9e1:a819 with SMTP id
 adf61e73a8af0-3cc71fb5781mr30510652637.24.1786998084370; Mon, 17 Aug 2026
 13:21:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-7-a5872e64d8f4@nvidia.com>
In-Reply-To: <20260817-chid-v7-7-a5872e64d8f4@nvidia.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 17 Aug 2026 22:21:12 +0200
X-Gm-Features: AcwNN1Uf6g_nlw9gnlPOPGW_J12VrUV1D6JYzwR-ziAxwEvca2A9VHgurt9Kvbc
Message-ID: <CABwQupP+YAvDQkszHWZ13GNPer0j8XSDL3j7Eo1Q233Vd1vW4Q@mail.gmail.com>
Subject: Re: [PATCH v7 07/10] rust: id_pool: add contiguous ID reservation
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 9:04=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add `IdPool::reserve_ids` which allocates a contiguous range with the
> given offset, count, and alignment.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Burak Emir <burak.emir@gmail.com>
