Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E541A6805
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 06:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773209782; cv=pass; b=uU0qwGUKbAkWFT6ZVxHC6zIYhweAZ4g1uDT1lKjQNyQYNAo+uu4eTA3Nf39w6DM8gsun0SsTQJrBp7zG/vKWvzH5O9juK9B3Y+9BXlKQ6Tg1b9MwTYYRMM2hf809Qlc0U/dsCXi/miHLg83iCtvWy19hXDmiiwP1M1fT3wiFAHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773209782; c=relaxed/simple;
	bh=8G25HcW1flqdrZRRez+7qlx1EigBzeLc8ElCdZIJZdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=et4LQIqtyqyNKfgf05ZbWKRT9UIJu62hJyqhEC9oVOsq+YP2r63zek0BCXrj8qe1VPWRHJg0DjsJ4nG9dg5GCmmFZZxCw8D0B03uyL8XRl7VJiBIUtP+itymyyS5Cv9FrhBOnBtI3nvrKkWa87Uckj0W6YCka19Vam3BHjE2kAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0X9hLjR; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0X9hLjR"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2be0629f76eso402680eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 23:16:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773209780; cv=none;
        d=google.com; s=arc-20240605;
        b=difxA19Z8wWNSrbmU87aUIz91pSZYPe0uft1GWcM321/w4HPOvvyUjaFuZfuyybk4X
         /aZFTj4lJpvC9cLLczFtugDOIF71kvDwT+82V2cPaTZ7U5zQiChjkMJFgOeQorLHWADh
         Jws3mZL8D/iIaXPs1xxjg2jRNOIQaxgM3N1gWlitczx5EHRDBn4GmtFxawv+OMUTQS8p
         0zn6nlmA26QlVDW3q1OT9HstHpEOOqcrReh8VpDlP/lskAfJG0etFMmfqmUlJtIfw8Xi
         ZODiyVCs0DZderYDEsYxp+tpjCeYPkiOdA0tFAwYIHFcQoYZlJH4B1wNrZb1nr0UORk7
         DREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8G25HcW1flqdrZRRez+7qlx1EigBzeLc8ElCdZIJZdo=;
        fh=e/Y6O7jNP0qy4Ic9w6zjt1og7tTvXPFpyJWoMqbTATQ=;
        b=RV2Nh47dWa7/g8Nl943Zrmd2amrGuRti/onvDsjGhu3RpNnJzf1pgYl7H9PNZ5MB8Z
         ieH4VVXpITtSOXazJeeFy9PCcoimk3oUKLvzdnsSdCVPYFGHUWCQXcvcTXgXSxS86y66
         3ZvDqyRTYuk6Dfw2Lcl1p8eI50wfJH73Yuh6qJPPpVQv479Or1CFQOc9aAvOQ5HqWcts
         gheQnY7LFJRq/lS4oOjdyDGSKoOIHDSNGLw33XBfzFdvt/IXyo7QXRsbBokHg5ONX9ip
         S+ZgReBrR5ATq/XEssX9yoSo5nBThzy3hIZJd6XrnU507SNndPZWd0Z8fUwlzyhhCaD5
         Ohiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773209780; x=1773814580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8G25HcW1flqdrZRRez+7qlx1EigBzeLc8ElCdZIJZdo=;
        b=e0X9hLjR36sO58PFVfXFRun2tG4pbLQR5eNdtPInnOdtWKAxNZ734E0fPLUdPaS/fc
         8acFrg7ZbwWLrB3OqgEWXtid64qgE2eYjQw6/kRZdFI6Cjn2coTfrxuyCIngeUJvnhk+
         6g4YSepxRNMNA6/pjyOP/vjBPKei4YUKbkPoSN7U5d0gUu5cGYaiIVhvNhxcPhb1B0rP
         pYZt2TwVX/W6O8L3JYvEbOKMedUEQrO9uAbrCS+q0v8rSDfa4Da2dUX4utuDbr+lcRIw
         I1hg7QuOXTEuzYKLnj5gGFsA1Ipj09eUOtCK2s1hpa7RXajGwXeE7AWUKDxUSrV+yIK+
         FWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773209780; x=1773814580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8G25HcW1flqdrZRRez+7qlx1EigBzeLc8ElCdZIJZdo=;
        b=IYPmVY+0u404CS37nXw/kU91nqS4TcjQmoW5mERKSXH1Twqt+7rz5PXW2s+/nndl6A
         qjP85UI7BNUSak5ZboX69f7RvbqgV3Nujj0CTCCgb868GfZ7ZL86F56OOK7LZLbnzeSI
         ZYXjwTHydq7geL00DrCLM3ecQXGfVJv7OfJZJCpcUR76rgFtt2w9Ac33U6codxsrR3nz
         Pe4A+fYFyyw5A9LSkb5FPZjHxg4LKSZfoS5M8ThULvY8YRfNOEKfC62tK0LDUkVuIEsB
         kdwzF0M/JDI2c9LbK0tfu+2HBcWWG93dg6mbHmkPBOrR5setzaRS5UlVOBuXOErTdCxp
         bygg==
X-Forwarded-Encrypted: i=1; AJvYcCUSnXP8MUVekMx2mMvELmuAoF+az2RUoL2TsNE4qyVScRGD9ar+uDfCbRXwwHPp1ltTLRpWzbo/ktcp4+RSQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwizO/0Mw4EVWMNQQ5ZOnZPmG+C+ye6Bfqgvwh0wsxae1qUeO8C
	OWKGIn98UZl9UGTidMbkVEPVH5WmMUhLTcRRW2S0YTG5R7+I2umH6PIVxdZYDKFs990VE389EfK
	S7sXJHJbKNGLZBRKogs+BWJl61BZ2oPY=
X-Gm-Gg: ATEYQzz8BVW7TqdH1U6ekH4+fVbk4zAyb90m2ziwQSJ11MX3XDV3laAbGX2MkjBRhvn
	PAQ/PAQ+0N0d+MWPDtt6NU8dPwgK1LtL2w/kmnrCoP5bMz7jV9oOmVLjXemQPqEHD57ljAU9zzN
	QyGEa5SGeNC4AqLwBjj+HvvOzXo3yNAuusIyQmfGTr0VMh0CvBS9Y0PY/Z8iqMCVAl7j1hi+dVt
	KuDE7g6mToHrcIv3p2kgDdMsYc3uVDJjoGhBytv0UCfuJPH9QoO0qOihsxcvO0oZY1HxhgKz2aB
	XQEIZfUiiva0jLd6MpmHVl9BCIRzuq3/wQEn2wtG325gazu1BIX8JidVCkOwyUj1vJRx/CHnpiG
	IAMKDHKtE+9vJtafA/L3RdaM=
X-Received: by 2002:a05:7301:1288:b0:2be:ca4:e136 with SMTP id
 5a478bee46e88-2be8a25ccb8mr322072eec.2.1773209780312; Tue, 10 Mar 2026
 23:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-1-424f80dd43bc@nvidia.com> <abCzp-nH_60rtpb5@yury>
In-Reply-To: <abCzp-nH_60rtpb5@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Mar 2026 07:16:07 +0100
X-Gm-Features: AaiRm5198PjYD32UB-6lrP8wLKqUqMQfI_zYU78h1rKDVsypLkpmk__DYViMNyA
Message-ID: <CANiq72=yXbEQ3brK=pCLg3_Xq=f2bn19vYXQNs5ra_xY2_kUNw@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] rust: enable the `generic_arg_infer` feature
To: Yury Norov <ynorov@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 1:13=E2=80=AFAM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> Maybe split the line? It's already over 100 chars, and it doesn't seem
> to get shorter.

We are about to bump the minimum to Debian Stable's, 1.85, so it will
become shorter at just about the right time... :)

Cheers,
Miguel
