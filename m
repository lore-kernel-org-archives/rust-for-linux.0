Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB032E090B
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Sep 2025 10:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671708; cv=none; b=Xs/DOM+KuIHCrk0uV6Spzv0fSbMu5GHrpONUa3YvaV3CPddXAMuIs743txdJ4OUfT0bnrEsM0Ag64dT7eYE1WOIXdXK/tyLWerpqXBYnlMSV1hsYKunMN3bAB7yJBewhs1VFUBClTVK5KbRmbEgI8+41DX82ePi6B4S0YRbSWaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671708; c=relaxed/simple;
	bh=1hO22WTszQUiOOn2ymdABjLhmL5qLOEUS3j8TjLksi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AVHzrxcwBFYMSF1ByTtQdvbfk6q3W0k0CAsFbtHVUrYaTNsz35/djxB7ewBMuVS2Ui6mji8aG8R4OdmPy46MFRI+yC/3og8AZ+kpdgOTJUrNXsWFCLtmpSW8C+BmyGH3zEZXt/+FSXcgm1AW+ba3lVMqI61LljQ471pmSsFRwWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUQeBxIS; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUQeBxIS"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e2ea21430so191306b3a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Sep 2025 03:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757671706; x=1758276506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hO22WTszQUiOOn2ymdABjLhmL5qLOEUS3j8TjLksi4=;
        b=QUQeBxISS3Bge0937BI1fkrBWuJbnA7g+BKHhLyS/LMtNCdY2EoObjZPs3dcSfz1d/
         4xlpB/zP+cGkZWzFU+zZduUC+dptP0CupV5xU4X4E9mQk+LjJEcA4ymEyJmLWinlnJch
         jz2vIkZKueoR1/zPJc+GUBlJYm2oLStKS8fr88fLGs3VU5SWpReuwZXng0CbbIXS0Hpg
         8Micmqib6rx45+NZ7Vb+ewa9+E9AP8Q4aCZf6cFEcFiGZBgMQffsS5aEVD7UxBgMJtOi
         9o+aLqxhN98KGh9dcwERcZh2PHSYKB+Oas7Klu7GfsVQAJzYYeAD4Gq7z9Kl3zoXQoGY
         CaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671706; x=1758276506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hO22WTszQUiOOn2ymdABjLhmL5qLOEUS3j8TjLksi4=;
        b=vHT2SXbcc3EHKg0Lv82USJKENDgHBnQJ5ERAo3oW4mYHtV3YfxJlEhEzJ+qtqDJwgb
         uZsOsEB4UfJDfhSBwVcMZM09AvMr+I11kkKxjeZDkabBQFkV27HXDQdEiTzW5tEg07dj
         JK3QWJKdpvimpEyvd+rzdcohdPBp/VuMp0utdXjmTIcut2r7RTNNGOGFjc06/hXvukkV
         nJf4i425KMZIaAk5uL7+Mv85vCd5Svs007gNpUYrrnupK+XS0i9Ax7pM2Basc57tgJb5
         HYTSUv+QwTsf1wSiK4AnMWwD9QmDurNh/lhJdi7hgQhVW9vBKNL6jGfmv5VF2b5VTemx
         /SKg==
X-Forwarded-Encrypted: i=1; AJvYcCUSPuCdOc6LYm8lBmcOFAXQDA8wsWHyqhe1pvzRSKeBTghNOYc9sGYJoQze8KSxgZAekfxaNWf4BiVHSKrMpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNDKD9tBiZCFbf+Bux234SuhLLNe3SHc1qN/jvNoO0B1ffM0E+
	n2E9d9K+9QfWcglLnThKv2IBavd6WUMZGuG56b3+F/D34oj8ZGUz1NfiQbDfnACbI9vJY5PSQRB
	IfXb56zQPSprJoYNDXe7wd9uT9AKT1k0=
X-Gm-Gg: ASbGncvAfs7KiShoMj8MPvn7Kmdli0aqwU64H/BBjez+eWl/eG3Z1siRJ1u+Gu90bZK
	rkoUit9avgXpTiCV1kDLbSmphmDeCy1PMaBaF94D5BWv9SeV60imyK36nnkrcCCiI3/gOqP7gzV
	A4Q2eVArv0KwW2YSbb1Zp67J7kvBJ7sK5HMZHGENMNEc6Q6rMvuZg3AvNWjlgBRbrx7DFBDkluq
	E5PdbfrIhFfxK+Cx4Yj4DT/y3gMqw5b6RA9zO/UGE5cO0A2Gs0S3MmU3jUh5cRIQV0uRmG3NCHc
	EWJPb5nuQ8ctYBg5uAqF/WJHKiJOiSmCDxfr
X-Google-Smtp-Source: AGHT+IHQqgeTLWd69ii0h7rl5fFlUKx8SePmbFP0D2U+jaqBaQg25KiFArA+FTLhQ2AISsw0AP7/WNmwmwYZfmun5FM=
X-Received: by 2002:a17:903:120b:b0:25c:9c28:b425 with SMTP id
 d9443c01a7336-25d2752ec54mr14668875ad.11.1757671706025; Fri, 12 Sep 2025
 03:08:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911213157.GA1039411@joelbox2> <aMNo7qRCp_yprUAW@my-computer>
 <20250912025343.GA1376629@joelbox2> <4940aa5a-18d0-4bcd-9125-80f5a9920627@gmail.com>
 <CANiq72kZgZdU4Dut3rmcWT-cujyJaP_99ekis_XdfQ-7LmgZ5Q@mail.gmail.com> <CAH5fLgiP2DRcGy04YdsWS9+N1=_CCNEtAGrCn31vUHjnDLW9xw@mail.gmail.com>
In-Reply-To: <CAH5fLgiP2DRcGy04YdsWS9+N1=_CCNEtAGrCn31vUHjnDLW9xw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 12 Sep 2025 12:08:12 +0200
X-Gm-Features: AS18NWD4HXb9lW_s1SuGtIZzZ6y8l5yEzJq-b0E0GkqyxH4Mxc2RoG_2ansHfds
Message-ID: <CANiq72=89-22iORBttRtNeMN1ZHzH=MRvqfS5qPufHsMx8C0ng@mail.gmail.com>
Subject: Re: Printing with overflow checks can cause modpost errors
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrew Ballance <andrewjballance@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 11:45=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> I believe this code is using an immutable reference and not just a
> pointer, so it would be UB to use it to write to `offset`, and so it
> would be valid to assume it has not changed. But I think that in most
> scenarios, Rust only optimizes using that information when the
> reference appears as a function argument, which is not the case here.

I understood Andrew as talking about the C side, i.e. a guarantee
coming from the C side.

Callers can guarantee in other ways, but I wanted to clarify that the
C const pointer doesn't really do anything.

Cheers,
Miguel
