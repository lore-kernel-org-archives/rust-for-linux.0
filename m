Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C528DB5C
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Jun 2025 07:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146859; cv=none; b=TsA27so+fJtGXFTzJ/erKYcICrOv+/osvoNJJG83kXIQJaIIYSkpiLnjTMDRcIhVSCVfOVKAFE8/At0k5bCsjHaRgIjCrPWH24VKV95BC3r9Mm9mGL6U4VAvsov5g538T1RpYcGHLLbURIAFHsI4ssci6eaEUAdHyWAJ0qayw5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146859; c=relaxed/simple;
	bh=xnw/nt81DquCvpSGviFCHVtHoeCGqGv+BhrLruSqwzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pG/JYyuZf724eig7kzhgm/dBvj3FcQMjUqfWbjnqb5YNgssYq/RsPKRzQgvtBK1e8JyU1ZrhbiF97XDbTeaOUIe578u3g0mDtV4HJ2pbQt5DebfViTiVOcIB6tdKXISUpLwVzkdnxY61FNpDGZciIRBes1thEN8HOzw5MSmACUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSp9WTXD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSp9WTXD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313fab41fd5so625432a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Jun 2025 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750146856; x=1750751656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnw/nt81DquCvpSGviFCHVtHoeCGqGv+BhrLruSqwzw=;
        b=OSp9WTXDlKtOABWZGb+Oclehygld2/DKQ25y7cLl4Cc4GULcKRNYibOZL4lCU23K2x
         un7Occ3F72HYxf7CDsq4Sc7Z5xpeAHI1654YAursolyC6uItKaVm940+KMnyQbiik2yQ
         REIZgX+XwV3upj7uRjqcFNSnnoiu5k3ot1bePhpclRemCjkWEL79mfMjiu7QmH4f5Cjb
         InXjSgBQU4zkjBTVYM77uyzna78pskdBFQv4WydnWWE2k47ehLKC6jOmTeAxJ5hyNYnj
         rWr3SQO4V+t+hN3qOjgGZLIVS49E4wgLcEjML0EbqBNfUvUiLBlClv7N6t+nFpWfEkn5
         dkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750146856; x=1750751656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xnw/nt81DquCvpSGviFCHVtHoeCGqGv+BhrLruSqwzw=;
        b=mAZPzD290YhybheBklAxU1Ae1PaKxDiW9YmyG3KqNl33KueAMm77bJAn18e+xXsKty
         S1DzmHFAkUMZv3DZTjU+gcP26UHq05IyyDGhEgjTNVNlOmAE8Fy8I09rhhQMygQd5lcV
         CTsB7sZ+LDhCSQ3VinbitE16I2+JYmq4Xobi09YcTfBh9aUCYWG2sCHvQOAs1tWA35ed
         SyihkRx9ln6R7XSg/yAlDqxNVrkfvCOjzUIkl+elfAnXfLcDRdKlS0TGkFWbLq/UZf8B
         F9b+UodF60VZFPdETVN556O78fTPs+tShlORkJ8CVaAdbgTSsi0W/Dpt4vcycytWncSV
         cJJA==
X-Forwarded-Encrypted: i=1; AJvYcCVr/vEjYaua8ybRVvVq04nDjwUCtW0h5c3A6+TJHVFWvJOBzZ5ngoyQjB3VRoB4xgKl5O/Z92M0zgZqKSCe2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHDIsTW5yS8JqirBKqeefs7wZ71LsZ6JwFYbreSDS1gB1MpsZ1
	QQyvG8TmE4gRR+MXfVLjaELrSA2/p0WlXcT36z1eNo5UDSccacNWNau2jRheXmPbbAbbwAT3xaj
	9UgfqOVkICahctnP2n2mEPUaluTXGhdhUtp6a
X-Gm-Gg: ASbGnctA1wWfFJM/ePIx3rX6eTElS/la+feMmRr7DEz54x2fva5cPd49OqkvU+u5DUw
	K67yADxkRgTqVHM8vUibWo1cHEsTzZjV7wcHXKSAkUCu3GpdnE+1csXGtn7whM4HxD+pIK5o2xi
	1CYEfv0DmDu4ab0KXzbLU5pbiATLeD4zeaIikXeUZ2zuM=
X-Google-Smtp-Source: AGHT+IEdsM60w2VBC7EYCTcouigWBRvDNe+kCYJXNiYcKgezzmGxu0y5tdkZCynMUK//zuHtBktIMIDC9Kq5js8/NnQ=
X-Received: by 2002:a17:90b:35ca:b0:311:fde5:c4ae with SMTP id
 98e67ed59e1d1-313f1da99damr7232436a91.6.1750146855630; Tue, 17 Jun 2025
 00:54:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616193433.2643407-1-ttabi@nvidia.com> <CANiq72=cDk5rVEiAoudaQZUhNL_rne1EEjSEfiNuo_gkL3HOZw@mail.gmail.com>
 <DAOMQXNTLSGR.U0QOV8BU1I5V@kernel.org>
In-Reply-To: <DAOMQXNTLSGR.U0QOV8BU1I5V@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Jun 2025 09:54:03 +0200
X-Gm-Features: AX0GCFu3HRseUG6ymhOgPK7EH6VhF4cNByfYfMq8rRxvqX7nDOOxCCJJzyaXIyM
Message-ID: <CANiq72moqFBWeS9RL6y8wzpxURvhdz4D0J8WfjaOBp0XSgufdg@mail.gmail.com>
Subject: Re: [PATCH v4] rust: introduce sfile macro for succinct code tracing
To: Benno Lossin <lossin@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 9:29=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> But I don't see the value in the macro being fallible. Then the macro is
> less convenient to use. The function can be fallible, but then the macro
> should use `Result::expect()`.

Yeah, I meant the `const fn`, not the macro, i.e. returning `Option`
(not `Result`) so that we keep the const block in the macro with an
`unwrap()` in the macro (so no runtime panics).

Thanks!

Cheers,
Miguel
