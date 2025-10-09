Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27085246335
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Oct 2025 19:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760037596; cv=none; b=GHaAtTkKGTng690k0UxzuPWlFm5wZ0N39xlq1oTK8k4O2v+6TsvIKl19wqkz+kRWiVmgxSl7U12aItNDzK+8IxTMjzrIqPee7FUvWtJNomp3ZE2sfiv+kMUvQ4CDuD2kBT0lrqrOucwhLGdY/q0pK1HZmB99lR/wKTB6q8W+V1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760037596; c=relaxed/simple;
	bh=rcXwgJGTpWZU2t3OdSFiom5bqnzub6a4TGqV+K3Njdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdgO38xbpcP5S9DEF9fHyII+as8rnZ3bb5CBgPwbjYxdNE/hPU52jLfPuFr0L3Qp/fOTq1K/ueyHQaFn2elrHJNiTkSZgNFxGJBYao8ylffbHG2j08zI95OvKfyv8M/eB23niTm3UT/EcrlIk751KHxPe31pR+EqBSd0q1Y+RHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDUS1M/m; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDUS1M/m"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-269ba651d06so2057335ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Oct 2025 12:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760037594; x=1760642394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcXwgJGTpWZU2t3OdSFiom5bqnzub6a4TGqV+K3Njdc=;
        b=DDUS1M/m2NjcgqjAWe16s5a3sjd8lkMcDUmRNbQwT68x26OhjjI4mWnGkAUI1PvOBB
         dD7ud9NcgAPeI45KEEgrp1poBvR3BAzO4SYEZ/XLYQENhytrMuE7UWvVVmB+/l6Lk4BV
         XefqpoAsvmfYPE3W64i7WleBt2+yd1JnjD0hKcc6bhPRgW8yHqOzCNbYNRhTPpjNj9Y1
         WvR9C1aqOrRtE+QHG+B1NpbN+GTM1xiLk9mUpsytyPxea+o7MtGnqcpP/nJdyJ5dBaeS
         sLeLMVo+JJ2Bv90zs0aqxDB91Kk7QQS9k+MiBne///h1Ukv4c2WENbTgoFHNmseMKlwB
         0P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760037594; x=1760642394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcXwgJGTpWZU2t3OdSFiom5bqnzub6a4TGqV+K3Njdc=;
        b=SEuaufEEU5ywdFNgVA2gdGbO4hjigC0dt0SsOljEJB+G8XLZBLQ81eb1qEoehgFl82
         GU5JaIoxOHvYJYKgRXa7QFKf/0c3F1nSSpi6ji+WqdOAm1GE/GYLWdXkN7atx5Fu3J41
         g+Y71yINGguJpmqb58iIh2Z26KPu4g4MIbS+R5t8QeaLcIT4AX/NXYTpzFVlvlt7NiqJ
         8DTPmfmQy0q87Bg3zX0/1oCnLi040qCUqAb8gvgFUT41BVtsigBHjZO6HUxZJHT3DgpS
         +WqQ1oOSs35M5pvzbWaySEFIXPD/I22+X8E7w/aQweoW1wSMbS31Onbi9NWOfrv/KEHq
         +YNg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Kz1zOVOSASP+3lhTceglNxe1SAtlOmlGamkHmyapnhb09MTba9+3VIPpahDxYVTux5IZUHrGn9PprM3hCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6CNf6uuxmH21MBdtefNMzTq987HmZjcQwGdVgCLd6mzIe04i5
	LYFPmfkdRb6GEjlcXLHIfwIYx3wSUPIvdOR5/9XrygSkU1I765C92ACWaVXAqTgbIOZuVaWucnK
	LGc4p4eqOVbdVvgQTLN4Kj/p70WpTKww=
X-Gm-Gg: ASbGncvgJ/RaM+kKWMmBSkEC/ZPlINHMV1PS6gOwp4mJLTZv0oitieBjdtZUsUfIQA7
	MRTN6KCAiS3WAKqTAlYzKsuiN9Y6E6UuUjY2t2nS5nNLsurg27sk9HRc4gAsTAt45bxelMcZfvH
	azIU8JwmLT9SZG57OMYAPION6xN36A9qzfcJQb5aXhnV79Jm8t45dRwZtkiYN7e+k/IXDS+cEC/
	sXVe/VFj6hxqH1HL32eo3NbQSOfLG8Gwyzci9jUB9x6E5A7MElpvoxjBNdAdhUGFvC9JLniQKG2
	pfCUsScux4ko9Sw46YBr2qwf/ouj5xzTvW19HD+9FrU37sqUwA==
X-Google-Smtp-Source: AGHT+IGoblUKEeISrZbv72jxa9PiUckqqLQlj3DZjUWlLcO9V1Ny9+gENsT9PTdE7jTdp3qFnpKB0Hp3UsFuterm8Ys=
X-Received: by 2002:a17:902:d2c9:b0:269:96d2:9c96 with SMTP id
 d9443c01a7336-2902724dcb1mr61748135ad.0.1760037594340; Thu, 09 Oct 2025
 12:19:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-3-ff3d7fee3ffd@nvidia.com> <aOflmmHe8O6Nx9Hp@yury>
 <DDDYOBOZTF7Q.124VJDF4C76B6@kernel.org> <aOf-s-XuhbN7MUlx@yury>
In-Reply-To: <aOf-s-XuhbN7MUlx@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Oct 2025 21:19:42 +0200
X-Gm-Features: AS18NWAcMteSg_vVIc0g1AxzGZB7uiQHfY0qKY6Biz_FAtZhjrTWuqxAC8PWrD4
Message-ID: <CANiq72n7i7mpP3SXnY_opUKAm=UjOne=kECc4QdyXo4gz0qWVA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/3] gpu: nova-core: use BoundedInt
To: Yury Norov <yury.norov@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feong@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 8:28=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> Up to you guys. But having in mind that C is the only language that
> really works for system engineering, I would rather consider to stay
> in line with it on semantic level.
>
> If your goal is to make rust adopted by system engineers, you may
> want to make your language somewhat familiar to what people already
> know.

I am not sure what you mean here, but just to clarify: our goal is to
improve Linux with Rust, not to increase its adoption (even if
obviously many of us would like that). And just in case, it is not
"our" language either -- most of us do not come from upstream Rust.

In general, we do try to make things as familiar as possible, but
sometimes it doesn't make much sense, so we don't follow C blindly.

For instance, C23 also got checked integer arithmetic macros, but that
doesn't mean we should start using names like `ckd_add`, returning
booleans and, worse, using macros for those. C23 also got `nullptr_t`
-- similar story.

Cheers,
Miguel
