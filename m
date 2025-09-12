Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DC324DCE9
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Sep 2025 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757670333; cv=none; b=QTh54NINo4cNAusaBs5pSI1reTyD1nOG+dCx0Xdm6mVaoNp8UysVME1536gCrlR80ZRiX2wNykuyNeamfcM1svT3HRZTnNR0k1L7Bb/2VaimpAZjSnHJNaFehDYXVcFRPysMPBoWGpqMaDiZX6Yo6vDrU6iSnlhHBBL/w4frwjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757670333; c=relaxed/simple;
	bh=Mw1tvDfrEkD0vqRhNIGrI/cTTOsCCyJetHroo+JH5ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoQjnUsdh05rnbJpAiM0DRgq4cI8ihck+cfMjzg6ZMv01ndL434LjrwoCXyayRyR2ZXxLPzKS4yA7LeASPbn3rFKXkLBceL/SfXvr/Cf9fsVabblbv+LjxC7mP1CK8i4/rlRiILe3TXhdlN6fR/+A2cCDXfJ9kfJ+Xlg8nosbiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4sVxw6Wz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4sVxw6Wz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45decc9e83dso10300185e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Sep 2025 02:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757670330; x=1758275130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mw1tvDfrEkD0vqRhNIGrI/cTTOsCCyJetHroo+JH5ik=;
        b=4sVxw6WznNHYAWEB9WZQku8Pski1E/qXfN7LzbCEutRvOOyiNS1d5iA9WTf1Y+h5mN
         SEYg/m7irnh40Nn/4tW3LbMYkKk+Y1dabeSyv+0mvmaPs6S2fd40rrUjeTZF/LIND0zG
         EdyfoPBpdA+43bePs0+m5zPZtTxi49D+XZOLyGh7qp+u9cMVGYs6dBFhYAqScT4ogfU7
         76Nm1KQnJoz1Y9rvMWQCMjR+aXmSOmdqeBerH5LgDuECX5GMHHMyTPUzsXVFSVrbU2su
         +tLOwmjvi+r5mDFEosPACukgTFGL6TQQkMgoxibP5UVZgzRF5IlmBwpbcL9/y3qLlfc4
         q/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757670330; x=1758275130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mw1tvDfrEkD0vqRhNIGrI/cTTOsCCyJetHroo+JH5ik=;
        b=U8YhQnkqBfbyM37ddKIxcxGYvGX24mmLvkKGDrSsjejDtL+Mifh9QvWRJX99Nh4Knj
         rf52ypRHXcU61Ndo8rz67NuEpINE95MKQbTLZhwTsUvJOu0g6K2elVb3JVLreQP8eqC5
         0GdXCYikTtMSMG8grJy3M0mVPy2BJNVRaQXGIkR5I5M/61WROT4FHu3J6LGvbOKGoabe
         IaMztQ4a86Bv/ODWS0Ghi0Ix8PVqtF8L1ih4sceSWEVD+N8EfO7+irVw0kgbqdBx1Kcb
         HV4CYAIDoTCFif5bTk4hzkbX5B62DvHjvHNE9FKqwrmtLsdLoJvyVhczy22iK2EpjSnm
         Gzow==
X-Forwarded-Encrypted: i=1; AJvYcCVMV1itBWbpOgQ74/jTm7LSaJQGn0xW7iAVaMrPVB22MR9tz+P6U0FCQHVBuZ2nT3zlX3OsjwADxvrx43dRdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLuCzxCcas9cQH/1OmLb/2c+fCM89GjfTlXl8KiqJ5XjC1rOcF
	zSxrH7hdqeVm0Z4inxua5hwmpYTizF4GX0sl+CwVH9WJ5letJFAipI+K6xu4ReXrw+jU5TgR4JP
	mccNltuHy70k3Dn60/fv9I9/PFWYXwB9Pn4SUqAFm
X-Gm-Gg: ASbGncsJjFNoHoN2qtC6Bp+idbQ6AeR4LS8khlrhBnv9xLZ5CU7w/fJwaenfuNqanR1
	JJs+t4dO3Hxxzz3OALIGZEKacWRsoKxFDD68RzSWBfIF3faDCaCrlQl3egZLdV1UVe/LPNDkR5q
	6TEQTejcOYNA8AQgxuFedn8wtLAVNg2PIfOgM0ZJKefOTy2sPoa8jrCOdmNoLRkSpRf4+rRP8zV
	61xYc5xbIyFenv+jEgYYw+G4/KQNO/o6L84ugLR1ZWnuMGckWYYQeHM6SKLyuvCCFcRjyGnmj0U
	3K0lRipo
X-Google-Smtp-Source: AGHT+IH8Wx7aYDSjWGUDy5HYTHvs5te6PAR8YoJQwM/9F63oaFGwqOu/DLW2n7FD5zTPDogqXwQoXh14w7BRpqq3blQ=
X-Received: by 2002:a05:6000:238a:b0:3d4:f7ae:bebb with SMTP id
 ffacd0b85a97d-3e7658c0f60mr2359259f8f.26.1757670329961; Fri, 12 Sep 2025
 02:45:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911213157.GA1039411@joelbox2> <aMNo7qRCp_yprUAW@my-computer>
 <20250912025343.GA1376629@joelbox2> <4940aa5a-18d0-4bcd-9125-80f5a9920627@gmail.com>
 <CANiq72kZgZdU4Dut3rmcWT-cujyJaP_99ekis_XdfQ-7LmgZ5Q@mail.gmail.com>
In-Reply-To: <CANiq72kZgZdU4Dut3rmcWT-cujyJaP_99ekis_XdfQ-7LmgZ5Q@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 12 Sep 2025 11:45:16 +0200
X-Gm-Features: AS18NWBwf40JnAm6-b2l4TvNLfRabNDc0CxhktLrtMoAJ2-o4_5NAjP0nqdJ4vk
Message-ID: <CAH5fLgiP2DRcGy04YdsWS9+N1=_CCNEtAGrCn31vUHjnDLW9xw@mail.gmail.com>
Subject: Re: Printing with overflow checks can cause modpost errors
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrew Ballance <andrewjballance@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 10:28=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Sep 12, 2025 at 6:08=E2=80=AFAM Andrew Ballance
> <andrewjballance@gmail.com> wrote:
> >
> > The pointer passed is const so rustc should assume that the c side does
> > not change offset, but looks like rustc does not do that.
>
> That is not possible -- a const pointer does not guarantee the value
> will not be changed.

I believe this code is using an immutable reference and not just a
pointer, so it would be UB to use it to write to `offset`, and so it
would be valid to assume it has not changed. But I think that in most
scenarios, Rust only optimizes using that information when the
reference appears as a function argument, which is not the case here.

Alice
