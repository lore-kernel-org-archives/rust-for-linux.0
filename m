Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEC636BCE8
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 17:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784915630; cv=pass; b=Tlgi1XGSaJ4fXY/fABld7ck+a4i/rEyYzypJNgCF/IVz4eQ5fVlvESB6pNQALj8W5T6zeLyFCGQNjxfSbjrXkyuf1/1hAlbVTLuBsL/2+LmivglOW/K2AaaOBSOY76lLIre15sK1obMbBX+evlit9uVqylHuQWiyypxtD1I+v6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784915630; c=relaxed/simple;
	bh=G9IEem2wxtFtOks28rR+hQx495hCV3xp33uzSclgE58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aIyQRpvzmcPEgDqPyiYb+ZtTqF2mMWEa7gMIBzJy82dig64In4qK34ei4umbXIlcDuPTRns3AIHIMKBueFii5B1iBOtAoVOZ1cf2L9bjSPg+DZcXlUL2OXYhyBm14IPWAGlVQB+MEuoVDn2v2nWBhcdTAnanA8ZIFW+GnEGjPvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gx1R0E2K; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gx1R0E2K"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso52522a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Jul 2026 10:53:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784915625; cv=none;
        d=google.com; s=arc-20260327;
        b=qQ4klOIqX/62A+uSuaAFZjozTk48CRUbgvEd8TNVTrg6uzy7Gsqi4QbVdSBBYFH3JU
         11p1Ov1wrE0wcLN2nHXx2tqoliS7lWRz6awkrJNtgE7IP1Ua4QBO7QvZjku+u/6lDnJ8
         SBX4s/HNE95Fd3dZ+1mLzqB51pQ+++FfZct/unHpwjGAtABGhXySg4pX561lMHIMZmnk
         gWFpNHUfkRthw+JJKPNSbwxv2BJ+CcUtCCKk8ZWcbgf1wrsiL7gNWbpEZoOexEmVoKdd
         0Qv13BwkYfycE+QQxXXWBfJQwn46PssQLDG4Oeqh+xbqkFpDr5q54WTKmnCrgILvyUNG
         oRMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G9IEem2wxtFtOks28rR+hQx495hCV3xp33uzSclgE58=;
        fh=B8o+udvXFZ7MROpKH1JSfZ0uTDdkOH5Yjm0ydq8DIks=;
        b=FWAd8NhzqhFu0vKc/NW2YwIj3MYZPOmE6xs/mMBgNz+hWNzWdkOxtNf8ZqDmOYA2LG
         uTGMm7eo8TQbmYJ33vCbjvQUmlQOykCIcHh6IkQT4Gwm9xmONUygY5HniaySRjJsgBMu
         3pI0EXnfhyATaczQ0s3fdbgV8+SOHP+iSlV/wo5uJ2tepbkZ+JZpU5X79YUTaHuFyK35
         0u4H/6pfp52XDbkeuC4Yl/ghmdvIWFXlXt4Pg6N82WdCllqk/BjPHt1WZdvI28zbpozd
         4mTInUkSaiYQ5zx4ac+Y6IqziQeq6ptCMrg5gX5aj0Z/4ti9TdfmpcnWw0DbSc0vYl4t
         fijg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784915625; x=1785520425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G9IEem2wxtFtOks28rR+hQx495hCV3xp33uzSclgE58=;
        b=Gx1R0E2K38B6qIWYDQRUCiTK+kT0pHMUECMiFKxSY8drcfo4s4juAaGHKLGAxSgKCe
         II2gqjQjYz9VDF5Guu1zTY0X1y3raRVSlkmXyhp5NsBSpgZcWukf0WE3l3RQ4leTzVe8
         xCWNvV0iKCQtGa2vYKsXQKoCdZp6RqLs4YrlAgHkf1eNO51u0EkpG21JvSglm7+nT5tj
         tQEziMMHhns1CpELpsLjz1BD3iJA/kb0P79wkdo8nHZrcl7niSxgN5OZuaAl/ZU2DkKO
         ZgCRvYTmpBqX+xJfEqLEHY6uJslWZDo9riSWJvzHYXTLXPVMUpf2UVNCRKV0lQ9QmclS
         OLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784915625; x=1785520425;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9IEem2wxtFtOks28rR+hQx495hCV3xp33uzSclgE58=;
        b=r+hYlcNXbYi+RPONPjf1ECIuW9Hqr/L2yZk3xTmioaY3tCSk9/+k12L8mpCzb2Btod
         6AMduwCBkbHXChWM9IYDe03o2uE6CQ1BlVxcPdEzroOxOfNW7kR361cgnRgd54uf59Ik
         C38bKnYCeJHKRk2C3c0lY7YGrO6NdaeSc24FrpnOsh7j3r8/iFKUO/+gtp0AiNNgWbzQ
         Gab4dyjO45fglw2gC3E578QH4A9cyBkTQsJN5DqGzO+zoqF44NVqljZ4m0as1uapo7sz
         HaNdjgDxTQ+HJ79X7HpgqQPkQ0EnPdPYSfWJoPGDYmAlHaLCB2qWFNAY6fy2/0h0W2jG
         2Dtg==
X-Forwarded-Encrypted: i=1; AHgh+RpAwV35di8n6jSW59PPpqHJLEnje9vezU7uBp2eyiw82ROaYwV10TAOu738jZ/yfiwaZQxe+Ty/qQHuKiwxbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzApHom/Jp04B+JNcQou5nrYFUQc2t4CbjDJanAP8vyf2KrbIPM
	6rbZiSuNJV4Q6XSBIvSo0sLEZYtBZx8PTztgm3tdsjJDb3ohTSgx4Am1flCy3kMUb6O+ezT0vKb
	z3XqpKA/5JhCu5D3JIpY3A30I94n7kc7UT4AQf5k=
X-Gm-Gg: AR+sD126ScEpXyG1rU+xw+aEJ7tsMhE4oqJaT+a78nXZ4x7GR5/dnVL6xiR1Xpij73J
	Wt76AHBE6WOdNRFXV3qmAWoUF7movQf2v8DRNUe96bZKOFWVxD8u8L5gmjwVwwlOAy4J2Tqnji9
	8oV4/WYN08QipH5jl+jdA2bI8pnPP0xVAMfsupRcOYU9SNNrXsVrQD+iRDIiq5QG7n+tAYxJknA
	MQogYPvtkz4PeqTgKKVZdw9rMBNZQCgC3Vqx4ftoiXn6zCMxHbvuE9zyKw+H2GwG68l+FIuO2jb
	aHeUZCVG0jrOqAj97BRBkGE+rXDyAO7w0+Z1D8mAnyu/iuuH9SHA22nsdrYfi4xfteVVJJH+iw4
	55kefS5H51n3M
X-Received: by 2002:a17:903:1b4c:b0:2c9:e846:a582 with SMTP id
 d9443c01a7336-2cfbc788d05mr37452185ad.0.1784915625220; Fri, 24 Jul 2026
 10:53:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724170132.3783816-1-murp@redhat.com>
In-Reply-To: <20260724170132.3783816-1-murp@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Jul 2026 19:53:31 +0200
X-Gm-Features: AUfX_mzaCumB9W4HW7SO9s1gtK9AU_H0NQ_9WX625vcKJ-FzUoht0fuLpYqgUGs
Message-ID: <CANiq72mEs3qJQGxGqye1MPt3Akxz=Em-Sjf=Cd4ZjfiMCM7nwg@mail.gmail.com>
Subject: Re: [PATCH] rust: enable fentry support
To: Paul Murphy <murp@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 7:01=E2=80=AFPM Paul Murphy <murp@redhat.com> wrote=
:
>
> Rust support was added in 1.98.0 with support for x86 and s390x targets.

"will be added"? i.e. it is not released, but I guess you mean it is
unusual to drop from beta.

Link: https://github.com/rust-lang/rust/pull/152122
Link: https://github.com/rust-lang/rust/pull/158036

Cheers,
Miguel
