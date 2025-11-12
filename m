Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B074822068D
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762942368; cv=none; b=jPtJp8JVIeRsUn+Xt2XClwYHO0CGjTWTUHsQRi7B71v7McgD2nNJ52MAC29+vigxPtH+R9+SKK+8/0Ui0ILFO1i4r9ZraoJ6K2v8baUZLUGPOD1965LwwfwpRZyKKZujS/I+Bja5dDfXDPpxvn9p4TQtomybK8+LCw/hQmltvW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762942368; c=relaxed/simple;
	bh=MHWwjzyDdlPVG7Ep2giUSyYeqBp+LJwuCtg4rAq369E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z2f00hf1IXIFnm3Q9IsL/+NUPGsLP0I+3AI6qQInHkdrgJ8XFuTL6YFQOnlTeY8gAJ8rlqchbx5jYd1ikGOQHdTDv4bM1zVnd+HRhIAHnXYZM9O3Mu7AyJ74m8hTykNUpt8Yg8+G33U8300bgP1sblGb5hMxkYf39A71KDvTLvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MifdhvqJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MifdhvqJ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297ea936b39so972435ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 02:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762942366; x=1763547166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHWwjzyDdlPVG7Ep2giUSyYeqBp+LJwuCtg4rAq369E=;
        b=MifdhvqJ+tTPb55l+09TG6kR/bkYSEOysHx75WWgnuHLm0nKpxlmKNZYN9Oq3HqHof
         Idi9LIjy5A9ZujCthgUEbopWG/mIh1Bg8ur8A6Wij+heyR9UfjrRwugBBV2QOtelo0E5
         GlhmWycrrB1e8aLcGEBEPG7CbBGy6uILwpr/WhATx0ju1FnOYeWOGSo9wJcXNWz9vHcb
         mjpn7xh2OWnL6FEwNBIKNC8W6aeS+UlE9z0Fx0ugkb3NP8V+1pQrU8psLiXmBMaBZSka
         cNlu4WiJ4Z6gOxQCpSkVQE9a/NCjZoasTw5SLrICRNrdvU0MmU748ygdwxycCsaQKWuj
         +I9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762942366; x=1763547166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MHWwjzyDdlPVG7Ep2giUSyYeqBp+LJwuCtg4rAq369E=;
        b=ssZuEGunIf4Scifh9VWk1a1lLgBXCGLufZ9IirJ6RPr0Rkcc12bnJuyMQHYew7ty3t
         yCq3MaNB+bNx16DcMKueuNZ7meN8e5c8D/7FTC1C6KqU1A9VGYqHZQabFjHJXdK/+/7e
         TxzTbNlhxbUF42JYhlTj1ynjJhCHUQuj4wyLL5dtUfUdgI08Bset3BP7l+swJIwEic6J
         9uCULNNbfK5QZmyhh8GeimM1v0LKI3D+FlvoLIoSXY/qrGDyCpDgv6nCuEHLAbBe55Bm
         Yxii3zTf0Malt/2g35dn5kDUm0oFdyG54s15AFFWHoqTQ7zfAjofPfYZbeyUSyvzwqea
         pBAg==
X-Forwarded-Encrypted: i=1; AJvYcCUakecpKVbhrgNFHKGH+MyBFGVAa3JjhGT756wsiDl4NP1ddZR6doZYPWewaZsoez4MWkPNasqbDIcBWXaQzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCCizQndjNple2VSiuR+we9OnxOBkmotOXJmGT/lVhgxBuOLA4
	YKWXAm2dtCPhvsJdyR5XcVjoZpW+Rw/Fqa1D2pW04XDFt6LjPkS2yD/XxBAzUHaui7b1zAZZqwz
	EaSp/yG4vN2kHLTMD3hGqsxWikp0TZSo=
X-Gm-Gg: ASbGncvahV1y29fADB805v6s26G0bUaPGMocl1zVH6lcvJpMs4cDUkeDmRMiJtX6hOE
	PDvCp+hYjUtIgRD9Oyo901MAkd+mmzWH+9mrqnMpq39Y14brs3KElS0hlQKoVCgD9OVViTIU/gU
	3YDtpPaQdOYK9JB/kNth0bqtcTsc2gqLofpqKM1EDAjzjmRJ1B20zjb+b3Rz1uaKXPIrZvdWU6B
	JwNbtawTbr83MTcYtgr734r1ynMEIfeXgA988Ipbeb1op051L74Ooz/Is/5CjJYSgsAyJ8qCcVl
	QW4pYjd/8/YeSWy8Ez6IJeiNX8z4D6ZCkoQX3w+BzYWxL2nlGkgy8zZBxjIxbS2qpKFRzn2LwBZ
	mM1k=
X-Google-Smtp-Source: AGHT+IETQ3SzNJP38qICCbEJ6T16t3JXamoGxAtaT33VsTBIiPh7Ibrz13eIJsuaIOpzM+bZ1DzCCfzs16H1v/5wS4c=
X-Received: by 2002:a17:902:d507:b0:295:3f35:a31b with SMTP id
 d9443c01a7336-2984ec8c0d5mr19845645ad.0.1762942366026; Wed, 12 Nov 2025
 02:12:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-resource-phys-typedefs-v2-0-538307384f82@google.com>
In-Reply-To: <20251112-resource-phys-typedefs-v2-0-538307384f82@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Nov 2025 11:12:32 +0100
X-Gm-Features: AWmQ_bnuNlJCsmBmrjk8c_BTNLULhTvw28twSuVwPkKbxpTmlUU6XbLfIppmVjY
Message-ID: <CANiq72maV_j1uV=2nPGbTgRabnk8cpc7TNN_FQ+ou52OpZ=k6Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Rust: Fix typedefs for resource_size_t and phys_addr_t
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 10:49=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> This changes ResourceSize to use the resource_size_t typedef (currently
> ResourceSize is defined as phys_addr_t), and moves ResourceSize to
> kernel::io and defines PhysAddr next to it. Any usage of ResourceSize or
> bindings::phys_addr_t that references a physical address is updated to
> use the new PhysAddr typedef.

Should we have these as actual types instead of aliases? i.e. same
discussion as for `Offset`.

If there is a change of these getting mixed up, then I think we should
just pay that price (not necessarily now, of course).

> I included some cc stable annotations because I think it is useful to
> backport this to v6.18. This is to make backporting drivers to the 6.18
> LTS easier as we will not have to worry about changing imports when
> backporting.

For context, will those drivers be backported upstream too?

i.e. we have sometimes backported bits to simplify further backporting
elsewhere, which is fine and up to the stable team of course, but I am
not sure if using Option 1 (i.e. the Cc tag) may be a bit confusing in
the log, i.e. Option 2 or 3 offer a better chance to give a reason.

Thanks!

Cheers,
Miguel
