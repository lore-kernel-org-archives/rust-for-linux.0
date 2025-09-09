Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7967D221DB1
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 07:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757402497; cv=none; b=My5qKAj1Ads9ZKtAwfpYPrKW4Jzs/4JNsMFV/7P4Tu4+BEA85RwjoFEQGr0y9LG47wJZ10xgXOfmUfaMVDY0PwaCUHsytxqqbq2gcdxacvr8cZDBy6eP3iaxeH4nI8cGSMh5XxCdQmQ/h42wwHdcnkTJs6i4NntVGqNmwxENcUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757402497; c=relaxed/simple;
	bh=l9DtedJsOYuVEvTUaq8Uosius3V8uLRiTM1xhY019yI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+wrmyVY/D/MrPiA5Rwe9Ubgc5KU5fH4Mq1KNOZhg3YVzq84z117qWdmCnw9rByxOYQyIfb115K1VGl9l7JZOCIFo/1kUaMChntpIRWRwjL7TtG8es9q1njJhV53YjwF8Yqxk74vHfLZdlc5m+7d4V67DkYGJmfh6K9yUPbDn3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEBCAKS0; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEBCAKS0"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32ba5163454so420352a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 00:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757402496; x=1758007296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9DtedJsOYuVEvTUaq8Uosius3V8uLRiTM1xhY019yI=;
        b=jEBCAKS0vH2oZPOyesatisnufSqklM1Otmu7mtZ5ZOmD5x8qN8T3yjihHcvGMzsxUr
         yV4caEg1AELrR+Gb+cCNN7bLVfmJr8T0h/ljiMj4okBzjRdxsOLR6JYJnnBc+CZJaWv3
         yf2wuBGghcWMajC4WNMXzSbGeoEqIv7VmPnOQ6JEb40Bld12eqAQddf5FEqKdGDRjxLH
         Y6sVJSM0EdtEPfIdDaTmyKgfc72i0PZyS3Dqq6ftmUfLkNZnL1rSHtsul3zyQk54Xx5+
         K9ZGd66WUzYyqDzjDZ8GIf7jP2QmYI15ZTwJMWCDPPIABtHmgSZUzBZmRMWagkDF4tAn
         Hz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757402496; x=1758007296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9DtedJsOYuVEvTUaq8Uosius3V8uLRiTM1xhY019yI=;
        b=R2/2n0QoyFMXh3dU76IhJ6jaVVDksgxEllsOuOu0WEZbFY5RGbkhLq8j9nBYwuI0B6
         n+34KiXQzB8jpm1X6+TJsNkw8AUuOvJ1IlTuG45b/6KtanHl5rGkhc6s1a/1igm/I2X2
         s9YTbYZxZ8oKGyRzNPrz3XISNP8xTIydlRu6O//3Znipo5jKVKXcYPfg/+3QEXKEDerk
         Z1IWJTLUyMLDNsYUyN2ZMxgcUKqWFY2H9WI2/twkyeE8SefeUDL4X+16jJiaF7FZ5lT+
         anDgKTHMEFlPaI/2rMQdnxQA3JWZg2C8te/3oAsyq7I+HFTjkU6f2SNTgQL49puc6aiP
         GSHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU2s3NQBdO3O7sZxMrybOpsN94kXkZHe0ye6o3rWf2PwNIbi0z/LQi1pJmxiQ/k0sknEbAOHzRdLdSoCZqiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydUffV+Gnqt4sSpgloP1Hjtg49n9NI1zpZljGbnT2dzMD+9q23
	vN7b+stg+4XgO79+hr9Furg6IIAZMdvHlYtj+fVLXjCx5OgKc1eSUa8T/lqaiJBd33F3+yAeyB6
	ZAZZ3tB33p9mPun7xMNmYbBIL4DQTcs8=
X-Gm-Gg: ASbGnct1tK7+BLdZ5iQrIZNnNAq3HCrA6h/U96Tod/atHq95XzJXJS4xy2QZO09DYF8
	UjyEyzepOrwk4yagcXe4Ug9/R6+kZfl6Ma9ay6WTkulxlS0rhV1c8I6dLju9km+Fs63JHOdClc/
	smj0TUG1zE9JI9AZGHdVIBCLWzKUO4i2X/bGN3KBOhZ8UcaXkWhk/N7kUUlJSNBx6BWn0UDMtwv
	fmAxNQjzqsZyV3NVm8k5YloLw2AynANddOcZTEMUTNU4OniqG97+zMut+HWx2gFfsw6xip7WLaS
	kfL511r6hyzi878sT1v3DaE/aA==
X-Google-Smtp-Source: AGHT+IEIXETZN1hzIMbaPZTBAMFbsBjP+gyiUTRbHUQasXE8TDSwxmd/yWLYzZKSkpfL8EimpWar9GL+cCL5u2GOr5A=
X-Received: by 2002:a17:90b:4d0d:b0:32a:e70a:fe88 with SMTP id
 98e67ed59e1d1-32d440c4cf9mr7541621a91.7.1757402495698; Tue, 09 Sep 2025
 00:21:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-num-v5-0-c0f2f681ea96@nvidia.com> <20250908-num-v5-1-c0f2f681ea96@nvidia.com>
 <CANiq72kUsG10+E-W6zhFXhexZV+O_a-K1Px0kGkWPKvMMhAztQ@mail.gmail.com> <DCO2UHSV1FJH.146QJD3UR8FVR@nvidia.com>
In-Reply-To: <DCO2UHSV1FJH.146QJD3UR8FVR@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 09:21:23 +0200
X-Gm-Features: AS18NWDo9PmPkwt5HhFhUFBw5hG52sGUJOa3FDCEs24d7ACJy4H42N2u2Jnvv7M
Message-ID: <CANiq72khp7PVeKmbvM=ima7Tp7o1zPfjNY6dRK79aAQZsOvBPw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: add `Alignment` type
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

On Tue, Sep 9, 2025 at 9:05=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> With -rc6 approaching, I don't think we will merge any Nova code taking
> advantage of this for this cycle, so please feel free to take this
> patch. We can then merge patch 2 through drm-rust after -rc1 is
> released.

Sure, sounds good. I can also take patch 2 already as a user of this
if you prefer (ideally with an Acked-by).

> Should I send a new revision with your fixes, or will you apply them?

I can, no worries, thanks!

Cheers,
Miguel
