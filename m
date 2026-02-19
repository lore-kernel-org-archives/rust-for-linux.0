Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD44327BEC
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771491711; cv=pass; b=aDrtksY2wDi6nNwz0rjltZeH1ejLmbf5paFzZ+kog/alDLR4fDORAC6DLMGigqmtUHOyoRmV/dbGmFPLP77bOhYOOv9/6xCqi9OJO/lYsTtRxmy74HlNzCTYvlHHZHRZd7jR1P/TeHdQnbsv+cZgF4lptf7uBSv/fc3ZG8mj+08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771491711; c=relaxed/simple;
	bh=hNy/CEKbCuapEprA5nknNBsnFLVZtI6VVLhG6TXjqcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rALhTfn6OCp4p7FB+exIJdn8OEMpWN83goKmSvXqNLt7ZS82mDxn7jHmwI7Av+KKpe+Iu+E55ax0VsgUJkREUdHlr3OmJZpsW3Gk1IhD7J/GqiQAgcFGYvCt+XS/7bldtrQPDmqk2tJw5JK1CJc2CWW+P3XCEcR1xXoeTdB7YXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAB6v0BV; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAB6v0BV"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1275750cfadso53928c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 01:01:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771491709; cv=none;
        d=google.com; s=arc-20240605;
        b=RYyViSMpaaTYkcZ6PwGJ3sj/XgtZXeUDu2oHm83rT4LpQ0UQLYnLb1gc6RjZC7A1v/
         Uh7avAEJMHU468yjfhIPxIJfKMTuhdkWxJM/lqBc5DYrtlT6xpNsKXeOL3X9UbPcctqU
         Mj3XrrQrfcAAXX54fpixxk76OtdJl8wVY+j543YzjrW8mrD18IYMVbFozv6knE2un9kS
         YkB6QbN9S3d2fenzkqpPlvpFEQxxy1YGODogYXedSgv5e+dSqqOhuvi/49Xb0Ovb8/kI
         jTWyBcyFMwwvLuIA/4Vhk8/S235F/IX139pnELK8G7Q99PbPJM+xSkM9cYyX3Tf0w20Q
         OJbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q68l7L2sX5XalsQbPARMh6LZnZjDP1I1e8IBtyAWP9c=;
        fh=V4hBsA8DjBNGuUz+rJU5bdP/dKZXtkSAfzwDgccrj5A=;
        b=ZYo9utIpOF/hnMRqkRjPmhwY1GK6sPxxlmWvua6GEmnU/lkdByafxZi5e1xJlwBN4S
         kNMfnXQ3ARkUPtACMEfE2LNs5e4ndhvmlB9SDBoaOgd8q8I+KGxAqkmbvsh+yo63QHz2
         qoN9LfJppC32ulV65c/MY9Ah+fGIiUE8+dAxcmYGByNvC9G6SIOXSpwMY1PXsQO3Xj0G
         FSc66/6aje/8d9ovDFnMWvTeRtt9RXN3yAalNkaQv1yjkxu1T+9a+S7GflVmbb3gSbbR
         MLvrfjI+CctU+WBuXZ2nylR5ePsikWAIa5TlNp7IJpRc1xfAT+NP8Z9kYUcALsTmgYX8
         9kWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771491709; x=1772096509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q68l7L2sX5XalsQbPARMh6LZnZjDP1I1e8IBtyAWP9c=;
        b=kAB6v0BVZGKBkwCOD6tfZM7EfhEeAGAXmuTl9T8TCcUDRvUacBg9dGXZxQ4CDgUWnP
         2S/YCInhkkyE3QinNObkj0xv6l51F7+MR9bgF0yLeO7nyk4aeJ2rsQcc4iZExWLOKFPC
         80J/I4L4/hg3JHVqOoGHqw09aaNlEaEaA3UT5g6URHxh6CPjJmOuVfHCDQl+O5QNxQPG
         qvt6I6QEhidmMXee3OY6/511au8LYGZ2RpAm5sGnvE6nR1m/z/PFBkMDlKdbwWS7eksm
         mGrtL3XckAGl7K5YrWhjwuI4C522581s3uQr/ZaQ8tdnXSerdxlJHXChgDxj9XJ7n0Ch
         Rpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771491709; x=1772096509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q68l7L2sX5XalsQbPARMh6LZnZjDP1I1e8IBtyAWP9c=;
        b=p/v8X9B+7p8YG2K5PTJYapo2B0oiAC8gq+HN8ReagK8ajVGcR7Vk+sGO/0C1BCzvaO
         mfe+11Y3X0C+7e5VCikVobM/HyaAcX7QlsKMLnr/KapREhOiRukdd6Sjlsygvw07n0NO
         JSd7dJ2rDH5fT3eFMFtUt3QnpvjPk3kqq1m1ztwJZfvlyUn25yo4yPNt1hjM6LRudP94
         hEICgFMALDahuGevSE6aECq1Ncj1c95xrxBL3J0R2OcgUb5h152YX6Bfoq6hW5YAaWks
         CmS7cw6WQiXXWAOlSVlSzAv/z0uayMmJy5G6Va/bLSJZ+PpDBgrwnAesOSfB30r3e1w5
         tQcg==
X-Forwarded-Encrypted: i=1; AJvYcCWNKcZ3Q8kKI9FR81E7NRVYG/5VydBqbkgJWXrXMyFvrveNHMO4Edfk0TSe3smuI3/WKNS/nM1Ce528B7cSdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5dZiurqq9a+u3SD30WpA4j3IGUBLzBEDeyGQU8rp1owP57y9Z
	HGdeZQkFgmiVvxH2SUKHlp71ZplcWnm4zo4veSmRHSQBmH8D0YWcF+YoNLRunbaqg/X1an/9Gqx
	CoPyG688HsTKH+xoevLohi6i+A9QMCdY=
X-Gm-Gg: AZuq6aIWeei+tdXalZ2WUeDhlOvM4JzPRR50TRtdIKG93APGTVmcViuaOghaM0V7RHT
	5B5in/DZOnXOgUJQjBcythTiA8KGprHR6JEs2aC2k6lkbErfnCHo0bdxOwvBMM4OXv+AuQCUrot
	gnH8PRrFbDyIJuEuADt1t2nz2yeMpmw6yPZzo7wUnqV38dpWZT2b6eX2m/hwVP+WFF8qmqj4AQm
	HTTqc9mRe6Ep5wM084GR4VHKqscQY2ZtCnPpszXXRGNJqXSmaK9JsmQMEWW33LZ8sXQlPu8bdrF
	NJJ8j/zWChNFCSMoLqal7jBa1LP1gpqdw0Ym1FXZ51WgbYJEhXyGyJKV3mjdBaVi8n3/OSygi6N
	/XI/Qxz++GAWPM08erDABaa99
X-Received: by 2002:a05:7301:5792:b0:2ab:ca55:8940 with SMTP id
 5a478bee46e88-2baba10cda7mr3796458eec.7.1771491709103; Thu, 19 Feb 2026
 01:01:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210024601.593248-1-jhubbard@nvidia.com> <20260210024601.593248-20-jhubbard@nvidia.com>
 <DGHDW3YKM7L7.C75AZ8DY9K51@kernel.org> <f019cbd6-1778-48aa-a75b-d85cd48410f8@nvidia.com>
In-Reply-To: <f019cbd6-1778-48aa-a75b-d85cd48410f8@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Feb 2026 10:01:36 +0100
X-Gm-Features: AaiRm50yCTPUTAm0W1wjhx4vGDvZUblZQLfNd3bEDqp90twJHJyvBTvUPIp09Hc
Message-ID: <CANiq72kzFhzP_41ADCpjz8doVvPd+OBpajC2FH3gvNb-hHZ2wg@mail.gmail.com>
Subject: Re: [PATCH v4 19/33] gpu: nova-core: Hopper/Blackwell: calculate
 reserved FB heap size
To: John Hubbard <jhubbard@nvidia.com>, Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 4:02=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> That doesn't compile on rustc 1.78.0:
>
> error[E0658]: inline-const is experimental
>    --> drivers/gpu/nova-core/num.rs:225:5
>     |
> 225 |     const { core::assert!(ALIGN.is_power_of_two(), "ALIGN must be a=
 power of two") };
>     |     ^^^^^
>     |
>     =3D note: see issue #76001 <https://github.com/rust-lang/rust/issues/=
76001> for more information
>     =3D help: add `#![feature(inline_const)]` to the crate attributes to =
enable
>     =3D note: this compiler was built on 2024-04-29; consider upgrading i=
t if it is out of date
>
> error: aborting due to 1 previous error
>
> For more information about this error, try `rustc --explain E0658`.

Please feel free to add `inline_const` to `rust_allowed_features` in
`scripts/Makefile.build`.

We are going to do it here:

  https://lore.kernel.org/rust-for-linux/20260206171253.2704684-2-gary@kern=
el.org/

Cheers,
Miguel
