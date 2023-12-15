Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3705B1A706
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Dec 2023 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9wXNqXt"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5d3758fdd2eso4354417b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 15 Dec 2023 02:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702636994; x=1703241794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ubVH9S3UTGCIi6iqZ6MrB3WsFCa9rA74HRRYfWvgH8=;
        b=W9wXNqXtu/Vex9uZe55/OSBLI6TUL4vv0mnBtyjVUGZb1AgZzm3V7ng2EP2mwIRKUg
         Q0pCJTVWFF0rL1jZr4annNTLgwMvlgqSKnRXCVU9P6KSy/fVjNv+glSzHTyoUF0yAsoJ
         VotTRuJW8xujPEudBiycO3ISFmJ6U2fvAH90iFUslVwCDhUukkKqPt1BkiqHkZ2JA+D6
         J/5ex0H/l4tieM0vvm3y+/3I0H+rlmKbYnmkcDyKSHyjrYt8RJ7rJhgRBbUzvCBjbbtQ
         9hMntPiZERNRCWL3NKhswPMyr2n8m+E7DOtM57VPuM8BH4Y2uPXzJEvKA2HFzcBI87ZR
         81cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702636994; x=1703241794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ubVH9S3UTGCIi6iqZ6MrB3WsFCa9rA74HRRYfWvgH8=;
        b=uM78INZ2peBon0jyl5J1Rz7rrfrVV46ikUw9hVSXmKpRPg91WE7ryqJ5Qe2R0N9Sqm
         JEKmXB+YgrUzVMxeSeU2Om9iIVSAKDYRQ/4mBc/AAI5dGiRm97miqst/xF5h2oHnGs9V
         veg0E8rK6feAYtv9iS4hL1IGCHmTOTv9yHTC2Bj1CEv1A/5k0MJDzWZIgQSJaGZSSDt1
         m2KsSLUYWmcXwNQoAI/BCDFv0mocxI+XF2FlKnI7y35fDr77N3Zf5Mrqk9Ac3lnukKw8
         1z+/ARzB3qBuJivEfKGC+kdXR9QbzyhPR2FE1Q0sSnHEKZzSSRxLUd0DMxZnwvMc4/fT
         fhHA==
X-Gm-Message-State: AOJu0Yx1bW1OhiUulhx0yRJp46K20vhIbuD1jOO21g8QmMVUamIjAYlE
	WtKkctJcVsKvrqvy6EMf2/9UvUaYdX4ZkezDXxA=
X-Google-Smtp-Source: AGHT+IH/o6wvM/xXlAUCxEHzx0SXY10hpC/yC3g2NNJKGednMqGmknT55nDJ24pR3NBjC1oeVv3RUphzbJCou/0wPMc=
X-Received: by 2002:a81:8307:0:b0:5e2:ea4a:660d with SMTP id
 t7-20020a818307000000b005e2ea4a660dmr3681158ywf.16.1702636994047; Fri, 15 Dec
 2023 02:43:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211121613.3489513-1-dirk.behme@de.bosch.com>
 <df0d8a01-eac3-43b2-8498-e237a0fe6eb5@nvidia.com> <CANiq72n5OB0X9sHoNf-htRY9z93gzdg-BqdrOUDTqTEvUytoNA@mail.gmail.com>
 <6df6e8e5-8d5b-4d3d-91b5-bc0e90c424ea@nvidia.com>
In-Reply-To: <6df6e8e5-8d5b-4d3d-91b5-bc0e90c424ea@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 15 Dec 2023 11:43:02 +0100
Message-ID: <CANiq72kQYS2Z-tRwaH6SJHM5RY8D=TSsdSgufD9YmX2GfDgPeg@mail.gmail.com>
Subject: Re: [PATCH v3] docs: rust: Add rusttest info
To: John Hubbard <jhubbard@nvidia.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 2:44=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> ah OK. I appear to have been slightly misled by
> Documentation/rust/quick-start.rst, which made it seem like CC=3Dclang
> was...a thing. This excerpt made me do it:

Yeah, it is the "old way" for many architectures, but nowadays
`LLVM=3D1` is the recommended way for most (in the last couple years a
few architectures got promoted from `CC=3Dclang` to `LLVM=3D1`).

Given that most arches are `LLVM=3D1` nowadays, including those that we
currently support Rust for, and that perhaps by the time e.g. s390
supports Rust it is also a `LLVM=3D1` architecture, we should probably
just remove `CC=3Dclang` at this point and perhaps add an extra link to
Documentation/kbuild/llvm.rst again just in case (the link is also
elsewhere in that document, but I guess it does not hurt).

I will send a patch.

> Anyway, I wanted to provide this "how does the documentation look
> to a newcomer" feedback, in case it helps.

It does -- thanks a lot!

Cheers,
Miguel
