Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203EF22338
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Jun 2025 14:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750428145; cv=none; b=GiSIeUWj405B3P5qydhNQOPPd0ww9LMVHF6B/rqE+TT49ZJtHuFo0uyGXetG2zj0Wmlwj0WcSZDuLkBf9cvfviiOgQS8sDxKw9+x4W7aXus2Lymf2wLE9JFC34N2BIhGRfBNIEnbsJf1zTejbvwGWUaxzKvHHre9rhXiShNrGUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750428145; c=relaxed/simple;
	bh=wrglQsoKcEeOYOt0yvjVwUQOZYMIEJIvNwKImKH8jF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnEhvT4H2ORGOdJvB0/gQS7Mb8BMnmyqeaq9t7hbu+I8muXudiK9/ynGmOqVXNQ5b1PSykGIqV944BtrrDtlAFyM4ojXYkZaLihI2bYTDIGfu8jUka5ebSb506rz+/Q19bfT8FXMsWSBGmj56sX844p6dOp45cov7jdhQg3aZaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cRDPHC0C; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cRDPHC0C"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453647147c6so9213735e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Jun 2025 07:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750428142; x=1751032942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrglQsoKcEeOYOt0yvjVwUQOZYMIEJIvNwKImKH8jF8=;
        b=cRDPHC0CTym8PrEEOJ55+u8KjlkEHNtoXY5ENM6tLgskEGD4Pq63M1djWSXh4HWFxp
         NHIIpI/szx/Rjoe27hBjJebTe7Xxht0rCcQJfFDKmTLd9xetN+hqgDyxrcEaY+6LgNzc
         d/7zfMby5VtCbxMzna33QUc2MzAMZmEp/LEDVxBLOShaiZFtm75OTnAmwzwWM6piQxgq
         sx8kOj496OluaA+Lo/tFTjwaW+Kwc2iPauQALLWsGJdlatbYH35efcSpEkR0kjyiNtzb
         MWSczegOExsMx7r3PSb/HTaIruCyksW9ooswSl1q4tlUHnOrPbYKKx4D/IoUeNMY0nr2
         5Txg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750428142; x=1751032942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrglQsoKcEeOYOt0yvjVwUQOZYMIEJIvNwKImKH8jF8=;
        b=SzuSbkZ27dLZ81H0ujaXivddMWUMb9WCP0pAH7iBwFIAyG0YIsSIHP+gEA7bJuWd80
         38a/VFNnK9/FXb/kcyShKwBs3LkrIFbmhhAwSw/hvl6AE2C6DcJ79T1z2aQVImEPpI3i
         lBpXwXP8pyXmEmr2Ja5251yfAvl3sOQ8q2s+O2rmXWR007un69DQGGcWCpp95gVJ3HYK
         4rQ/+SHFeLWagcG53axh08VsGnl41RhFZrNpMGS10PUiYRxfYFQYUcCmaBX2CvUvh9aQ
         uUltoqpIrjbT5A6+Pxk92gvgpx7w3bcgb944KlvvFsF1OGHAcYOibxFJXwD+zxx7BTA/
         oTvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH94TgYUD4M/RrYJSi/tgYHj9XijGhy/Ui1ycfsPRjIjb6MuhJkvm9n0JGTLUOOmGrzYjRSpLgblfe/QE+3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgGVJT2s/j/PuP3NHSfmyiKbZwsom6L9RU6W4HWA8OMgUF2LIa
	ZsQRmJy6Pyr6wEJKdZ27l1J6y5JnEGPJCxQ0yBe+12VcyaMq6oGrpGupxadAEVP7KNQ3/qWDztP
	6dGk/u6CdXgk5tUQ7vwKkIY6bfSgqMQZO8JmME+eU
X-Gm-Gg: ASbGncu7qvhk01gMye8oFx/YeWjizvaXc61sT/918GXCRITUZz+O+47pf5gFkf/+u+k
	AGuescTsAqrgZzaVx5eVm35lNWZBaN0PxF49wfpq4VahEkHJP+qjjt4Z9fRiF+w69i5LuvNZKbN
	nAFlvhcGcj8qPsNFAcdYypUV/yLn8E5CuDX7MbP/6gkCbUILvIsYnCcDjlcTUQNolVIhTWC2wJU
	w==
X-Google-Smtp-Source: AGHT+IEutL1VNX/hRHqOTi+mnqSm7ws/5NToJ5fnCdAaVgC5P6bkQB47Cg6RbXBAVp8TtUFltoGDzmM/jRWhYrGYMfE=
X-Received: by 2002:a05:600c:3115:b0:453:9b7:c214 with SMTP id
 5b1f17b1804b1-453659b896emr28450745e9.29.1750428141761; Fri, 20 Jun 2025
 07:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com> <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
 <CANiq72=BSnom-nQgzLvv-cqwSknK1uJ=CXGP51r0WRj1Y553Ew@mail.gmail.com> <DAREXAUV51B6.7X7TPOJKK249@nvidia.com>
In-Reply-To: <DAREXAUV51B6.7X7TPOJKK249@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 20 Jun 2025 16:02:07 +0200
X-Gm-Features: Ac12FXwzBXdyGz8le1CMJiiIArNhimA33xIPls6XDWTBt2Clkd7qT2GytcDFqHE
Message-ID: <CAH5fLghRJ7QqGKJdUq5Nic542cJsHKX_C+EL+xma_rFJrHd2QQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:59=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
> > Similarly, if they stabilize the `Alignment` one (only) and we end up
> > only using our `PowerOfTwo<T>` for `usize` and those use cases, then
> > we should consider using the upstream one (and adding any/all methods
> > that we need).
>
> `Alignment` is very close to what we need, so I don't see a reason to
> not adopt the same name at the very least.
>
> This reminds me that I should also check whether upstream Rust would be
> interested in `prev_multiple_of` and `last_set_bit`. The docs I've read
> for contributing looked a bit intimidating, with RFCs to write and all.
> Would you have a pointer for where I should start? Maybe a Zulip thread?

If you want to add a new library function, the correct procedure would
be opening an ACP, which is more light-weight than the RFC process:
https://std-dev-guide.rust-lang.org/development/feature-lifecycle.html

RFCs are mainly for much bigger changes.

Alice
