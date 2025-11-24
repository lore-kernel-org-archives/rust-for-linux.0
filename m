Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5952631329E
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 16:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764000878; cv=none; b=rplkTWDhrQ/1cSp8KsKhbvPzsllHTrzZSNeH+d5custY27rzXletslagW9wlT2SDo1y0kzmVBHxw7KY2YXWr9jpfMptW+yqVkLCfWU+i/4tG5CvDh9CNWkKJdRntGHVrXshtY3vOS80c1OY2XqmFCVDlbF//Zn721FqYpO2sSJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764000878; c=relaxed/simple;
	bh=qRMXYm9M64Wb7j7RksUANlGBVHaplgAym2nanyHuIdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lETiVwI2FDLqpCphlHf4klrch165Ae/UeOsBfgHxW1qKDPZDkUwk2TbB0t32eGy7wPwYW/Y44nS6IDHFfORL6w2waH3tIfF0xRbAkaFNWopAdNdZHBdF46lP8lQo8Uo50XPqlWc11F5Ia2DC1ZDA59lvCStEjb/nrCxMJgZBo8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dU0xeKAD; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dU0xeKAD"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29800ac4ef3so9591035ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 08:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764000877; x=1764605677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRMXYm9M64Wb7j7RksUANlGBVHaplgAym2nanyHuIdY=;
        b=dU0xeKAD8N1odKam96Xj4B6bvbjBvcG+HVUmcxfPxRxcZfFzb3PIZNmX0wELF+XIrb
         5XKiKDnLPGiBMene8vNDr3i9eFk3hiGL6Boxq6Sv7fxnEDNE5l3vnQi9gHAUk1bfbyfQ
         CsJwsVG0sJZQWHPZ74PXwxKfQTvQnsU9le5/RzpH4kcEFPoSE1AEbPIkIkvE9csEGlex
         qoqYgAn8v3jeCiLTE60nfciLIMvoeehF4fJi/3t9tdhZUiv9fTtb77MoboGA9kskfHPt
         vdt4VzlUa91t2FLSgoGztyp5Q//jgmE6GPJtNaAi75mIU5eaAlb2AyzMpkdf1G+ssg6n
         hD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764000877; x=1764605677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qRMXYm9M64Wb7j7RksUANlGBVHaplgAym2nanyHuIdY=;
        b=oEak6lViS3+0BBLfcHdeNgfrH3zOXJklj+y0F9UINUigBYPHqHPWLKfJw4US9YYuBF
         gtynWmhs8mDdg5/jaoaj6pTxGVEsIJW467LUNRPe4W06pd+73I93v9cnx1uKvnK2shP3
         U3NzhiCANWlW6BJ+JVzoMoBburfOXCp2VFjHLMM7nKfZv2Dpq+n4DcJ79DcPBl1KsM5t
         Ao4/Kd9B7xApmcKvQsw1tABQj0nljwPJOchC/Zx2OlAAApYh8tLcu3drbuVwK+9klU8f
         +fMA24r4xA/nqUlECUYFO48iHRpCHFtO1WLfHXikXnTy2y+Yk5NAdW36tumPqQTL6G4I
         zciQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv1bbaK/YjddyDk08tyCc5i7qvOfo0CtxM6OsKsgMSo6UtyHwtvSkr4A5Jg21ayPpKGOmRTryfBTnESE0YzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhRMu0zWJoiegDUynsDBffOIB1F+BefTATIBYHsMi0EnlO5Ofa
	HdH6MUUzElb3xjwTcJUS0QM7VJEf4H+QBbDWFCgFHNVgirhwjeTk1faux+kk0GCQLLcqoQMMu8y
	K611fOaSvx3TehUDHfRi2scKEpgEkGv0=
X-Gm-Gg: ASbGncsoDg38xICxv21RjXM3etzTkJBloq95WkHWA5V7XDL8FVwMUPcf13px8WMtLL3
	5tVtEECvWwr/zMEd7hQ9mybGqnD2ZVbd++s5ZNCnE/xe0Zinya4vg8zwlDcMTyh3KYr5K1tNbax
	UsV42kV1MDnIZudUV0x6muHm2yWo5FJI6h3SUn+FSh0lQScjQlQp0EkHSfFHty3iChjq8qL0SlM
	1K4J7mJiKIWmito0KybVlcuQRb1esAJUUfnhWVNrvyLDhVHz39OQS4tvZAaivlMCLoFzTmXqi1I
	kGXG7qiwl8WNl/oGaleRluvjP5GVVOdcHxxQv4dJZigXUbpRGPyFeD0ZHvVV+r8oQml4oAKmZxU
	JtLNL/yjIHh+xqA==
X-Google-Smtp-Source: AGHT+IF78tL2MFoiUd/enSwcYfUfbOqvAGZkGtMu9D5e0NWjF4oGtatQ+T4V7Wr8jpHSgDYKQioYcXdCeTXV4WcHlok=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr7188481eec.3.1764000876454; Mon, 24 Nov 2025
 08:14:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-bounded_fix-v1-1-d8e34e1c727f@nvidia.com>
In-Reply-To: <20251124-bounded_fix-v1-1-d8e34e1c727f@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 17:14:24 +0100
X-Gm-Features: AWmQ_bn0B43lJLMGBlmCU-pfXyeb4_FiBPsseEeQcYLG8q895kTwjl-DAkJwnvM
Message-ID: <CANiq72kdrPx5uUVqnHpF88b8y0-gOTKVSfTDq2ZZVJ6B6WxzSg@mail.gmail.com>
Subject: Re: [PATCH] rust: num: bounded: rename `try_into_bitint` to `try_into_bounded`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 2:50=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> This is a remnant from when `Bounded` was called `BitInt` which I didn't
> rename. Fix this.
>
> Fixes: 01e345e82ec3 ("rust: num: add Bounded integer wrapping type")
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to `rust-next` -- thanks!

Hmm... This is the sort of thing where I am not sure if it should
count as a fix, since while it is unexpected, there is nothing
actually broken. I kept the tag since you provided it anyway.

Cheers,
Miguel
