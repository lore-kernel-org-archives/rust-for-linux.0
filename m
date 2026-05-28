Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DE22E6CC0
	for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 05:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779945982; cv=pass; b=OARXio20m37XcT7xzVkPgvq4H8626FK6zHJCxj4eUN+Ead/8LiPN/oWrfGTNdwQBgN2gVqh8Byt159C2BuQVeNyDqVcY6YxUS2avcvwaQ2K69fFNDtwFI0eatxVofoveHLeM2tVnrRYLjnv5+eBncoe9zMr6NrBOPFEcZwZ+HPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779945982; c=relaxed/simple;
	bh=wf88XchxCYIRzw5GxK/rHjVoB2l6TgPg7ppMUr6qr7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2lcXGqpIi/+IzZpRXLAeqEmLOVf14Qf2xnmw1odY+aP7DIDmvaI1+lHplRFbpognRA+XoXy9xKlKZAaQIW28lar1hqAMxs0/+zp8NDfrVsd84XESFOpLhsZ6KgoCFzwrCvdUYodwV7d9h4Hsf+x8hiT64m5IhiYYAe+MRV9MMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6wHK7uC; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6wHK7uC"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304559733faso509114eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 22:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779945980; cv=none;
        d=google.com; s=arc-20240605;
        b=J9Dm+YMd/ktX4jwu+OnlKwFvZ/5FW9eYl6c6YY3IiDypRWOatcLyxYYj3v9/WTwlOl
         M7HsUnxxqoL17iuT7s3cnMw+h/DDxf4xNaSB7epANt1pSCxdCgPuMZMXjxPsyUyIGLcZ
         tYWTVuBqJjx+v99NiWhceakbR5v+0FkfTEwTHY7mXDOSq9oMVdDKp00kJ9WU/BhWfiJQ
         4o4KdJvYKvKtrpsP+oooMUWqNB0Tc6Piwyx0+Ud3aAuxGv/JQocl7yRDnephEwJgIXq1
         Hz0RNosB1BbtvhLQNfu19EE5n+oK+4+4OCw2yOGajm8IdRY6oMv73FIFKaKAxC/YRTxb
         giBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZPB+UbJ3xOm/x1ryseHShdbECkKLBZAc98p8FpEfJY=;
        fh=5CLlXftt3WTaFu4jZBZPCrpw8Uq3ndo5KuIXD4nybXs=;
        b=EzlVhBRPamAHpl9u9c2LiSflQxyAdekCvJk8BElj1PqzcNQ9FzOLrmbMfrmlKXOGrT
         BvK8reMskA3nyKs/dUurJP1oQF/Kfy6FDuMJl/AwsBnpnZzozFy65AvqEpi6Na0JAMXv
         B2YhMFX7C7ceuUvk7PMFKU++aOz2Val1WY3PjLXN33kyB/R5ZE0Uhp709U3bc05cdO4s
         lvAHsW7sZX28RHPeix2lvMol6uQnaUzHzU4DLIXUhJEdFC0aznT86Z02crPT6JlmrfdV
         bx8yB/Pb+BOK6q+xgXMOKLKKoel8LxncLTtMs992VCkP9zmeCeYIKKYld9wtZ1+tZlJ6
         AAzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779945980; x=1780550780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZPB+UbJ3xOm/x1ryseHShdbECkKLBZAc98p8FpEfJY=;
        b=c6wHK7uCQG/+mBkNqGF6uWKnVuJl7yay0qo0AplZus2EJwgQyt0mBsPItAuMJDVHUM
         DZfckn/vPJMEca+Gk5UJbwEBsK1O2ls8W0AQr4zko1XewJTH2uxAE67Ro9166mrPkBrf
         4pEaF/qdAuur9L+lnbpyhTsAhvBNSG7C7aRn4tIx0jLZiyDGBqOsdc/jPO2pmTCkm1cA
         E5bOMFzXDVX1ke+P/2PykCbhwDkmxE4ygD36e8WS45etefiNE3EBJpHT9LcVk8GYz8OE
         +TpYnqCx0H7pdZSpbLW9CA/hsf5Jb1PL6Hij+g3RULvituVDgFhO7yRDNkYmS2Af1YK4
         rOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779945980; x=1780550780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ZPB+UbJ3xOm/x1ryseHShdbECkKLBZAc98p8FpEfJY=;
        b=TGlTjbhu8JEgseEwZlG/b+1/nizOgxsr1b6Jisv6RipZSlaVYBs6+TXz//4+5ePHKl
         2tvOcz3Eth3/p9Ln5HoqSa3Q9eX1X5z9h3jIfDejlqlg4l0b+5QycB6stqcOhzMXeGza
         TE4MwO4jYbogF3FlDdCo3JND3j+ariwudFBspSz/O7gNwqhx06T0s9ibx+tn9zCMJWBs
         jOQtLn/0PSk/177v0+radMMWdaXvTmSfRSKvRT43f+R9EGjwyg9GUF198S9JmMOPDpAK
         UmzNLvsjJR7isxPYzzFSFN0FIov4uJGe+lxA9VlfCEnfdZYKCZnbE/iaG5TTrWfGHBH9
         OJKA==
X-Forwarded-Encrypted: i=1; AFNElJ/KE8rbIa8ZpzhzplvrBWVWuz3VjAIvOz5JquuFu9sZ+WCpyHilN8qBuUbc+i5gJtyVzqYHQeL5kcIwojQSyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtCmjZR5NXSZKlKz3nsHY5VxR2C+r+OxryOHazLc5fTlYUp9AN
	W+/jb+jmfaIrCfT75kh+Q9q0n4ukgDdDYjel3OuYDZKkFVPR4K6lCqVrB0rB63xp5NJU8NOAFLx
	ynUn8f/wX7juc1h1ScXKYL6PgX9jAS2M=
X-Gm-Gg: Acq92OG7JBZGn1rI7v4NFcpMUz0QMTCGz9BC1/5WFPT1qNDYlytWpX+fkIvcCO7Hiwx
	QjfttCyA+GQZi+4K6uLZdAEuzeC8T0ENyXqq3bGQ7WPpakoMX4Tki/3zOJTDbcnk3+ukyLGfoX+
	yYKeA6jp8IGerD/RHz9CPxoU+NpNb1RKGAXjIqa26bDvQ90xqLkjQhltJ/Zl/q150toRwjlc5ji
	GdLuIGmk7oVbPwzSBPfnSKTrhlvLFzEyBQ2vT8mLy483nz/eOLosdjodd4HYZZjU+Uqgqm2Ii7U
	nX7CHamGY/bgwCz7I+sagKNi2RgUhLFXVD92j637sZFhLROPSgpfkU6LJ07HhDXoNvB/+dZ65km
	IsWG8L0pIQsGI3yEVH87KkCOkt4B0WjUb6xfKkOUy8TxH
X-Received: by 2002:a05:7300:df44:b0:2e6:b55a:76c9 with SMTP id
 5a478bee46e88-30448cf0ceamr5032661eec.0.1779945979977; Wed, 27 May 2026
 22:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
In-Reply-To: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 07:26:07 +0200
X-Gm-Features: AVHnY4LpfTWCciL-kun38xNZkmFlALMcz5bmeoJdgZ6qhFC5eHM3rUClaReGlc0
Message-ID: <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, stable@kernel.org, 
	Bo Ye <bo.ye@mediatek.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 8:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Once the fix lands in rustc, this flag can be made conditional on the
> rustc version. Note that passing the flag on a rustc with the fix
> present has no effect.

Already landed now, so if the uwtable one is enough, we could already
do that since it will be 1.98. But since it has no effect, we can keep
the fix as-is and do that on top too.

Added and linked both issues (i.e. `uwtable` and the `frame-pointer` one) t=
o:

  https://github.com/Rust-for-Linux/linux/issues/355

I have to send a fixes PR in the coming days, so I can pick this one
up, but if arm64 will do so then:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
