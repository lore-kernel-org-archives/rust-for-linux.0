Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A8124A051
	for <rust-for-linux@vger.kernel.org>; Sun, 21 Sep 2025 10:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758451603; cv=none; b=VDO7FzP9YBIH08jdBNBxzXjE9GKzVGWykixVm8jUixOnXHsxZZ8/fqToNgZEGWJ5OID/htZ+iHNxM1R3+0eLPVUpk5Y74Hg1LrEZ/+kiD1VCyMnh7B32Pz5vbAEU5S7n8/lCWm8n5nFgiH2mdHIvaTh+n/r0X6jjPcZ/yP9isv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758451603; c=relaxed/simple;
	bh=ejJ3R06kUm72MB2imXL8f46b/ReyDQSXYyYGUPqSntI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mko9Ng1hJZSzNpEt1zMzaKSFJGiP0l9fk13GM4SHCuU2DghQRDPr8OOan+VNb/FSxbVT7GEZqi6aqGsgC9cgbRcRrMqw/rpuKRxMlbLzBvOTQ8eXGFGxknqSfmNriqqo1UR9laPJ0D6YJeAMryCENCyQlzLA28bkxuU4tM26i5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uXr0itZS; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uXr0itZS"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso898553f8f.3
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Sep 2025 03:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758451600; x=1759056400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fut8Mzrft7AcgsVh5x5LQBkL7Q9ZuGUoyrZTtc74kos=;
        b=uXr0itZS0ezyg4QsvvPh7UpRFexCxkRw1Ehq0InBgj3hHDx60GQNkGI7KwdLUPmmZn
         TgNpL1F1uVL5VqT1UdKTKQ1I5X5kNtXPE3jwGttIoCVPPzlKeDGeAW8zy0l3hvXIEzrZ
         wPCPV8Qbp27BKF0Gi35bojMEyqa1um+kbNO2tGfi+/ZAzJTNkzRaHz5F0LpPWl0NPv90
         CdVDUXbneQ4o8v9P5H6/Oiv0OG/e+39BrJkFjxFDkGG6eZwiRBWkhgzq8M+sBGmlHG+H
         AKdOW8QmDeQXiwCCnX1yy/mhv0NNFDLIy5CMEwOrUCYUJIjsS7xFFszpVo1oYDDtOYMT
         TF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758451600; x=1759056400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fut8Mzrft7AcgsVh5x5LQBkL7Q9ZuGUoyrZTtc74kos=;
        b=UzYuMFZ1r8MmB8v1MsKY6cWaK9+f/RX/YgbfKsOiXdeSnBOYC1aOhp8fLYmT3MTSOQ
         ufb8bokp5fzSRN/tGfoufmJTlW/7vJR8gSbvisoeBuUmaFYsZexcB9PivJmTSDb5TT3y
         0YxglaBTbSoEH0JWDRUEs7EgjvW1uI7EmaAMYnEYYQNUxayQgZ7UX2bYd+JK5rQ/yHbA
         0SfbdnL+rXBv0WkTnnFQFMTbB3fsO45Ynwf6NXDE85gtaEDcpYA1+jYEV9OcP/eqmapw
         +S4oLqBum/8rHDQHDVoHDMUHvpUkY/UhJZ+kCmbHgCnBCmms9XMVqYfmuPeuieweJY2/
         LEfg==
X-Forwarded-Encrypted: i=1; AJvYcCXHAjO/KIPcLJQrTzNh4m5087VIvHvIK0Lf5TVMPq4HfvvMGE/UTcAYTwjVAbt6RDRj888Yinaowx0p3U0yfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmOFPdMMDJ7pWREGAYjhOAUOm5EUnzQV8LPQE+2RMk+OW3lu6i
	BMc20T94XFEQtEiWWJUKjlvZFyHL30qjA6/GdCFc+u0PopgmjuI6tPnu2dW54BTIRDHKmq9iTLr
	A2K9xBmUbELglDu+JgwCTMvCs6AG0JGnmbQIea/U6
X-Gm-Gg: ASbGncvXAeX0Mm4wnkHgwmoqaqN3cN2tGb6SDjMkxznzTro75CGC+q1qZpyHBY1T7x5
	8aaMZXltGoRYfqCD+F5n+/RbjEJGVYBEbT8q5+YpldcLinQbIqS5zFOv+3i8/5s/6q93my/FyiZ
	zUI/5chD0Bs6rusLGx+Q+4fgKaba5ogIhd4KGChpMGI1mQW7zJr4yQviYXpIXm/2jMz67LwUIOD
	fS9uss1
X-Google-Smtp-Source: AGHT+IG+ilMcacJzrGfy67Gt5SnyIG3oRn1w901jpk/xQoevubQ1rvd7vOk9clCmbKV5svvHYfPvxAprCcCgIdzn9Uc=
X-Received: by 2002:a05:6000:1846:b0:3d4:a64:6754 with SMTP id
 ffacd0b85a97d-3ee888278f8mr7584321f8f.62.1758451599361; Sun, 21 Sep 2025
 03:46:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920161958.2079105-1-joelagnelf@nvidia.com>
In-Reply-To: <20250920161958.2079105-1-joelagnelf@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 21 Sep 2025 12:46:26 +0200
X-Gm-Features: AS18NWAQxPNKNG6co6Lg1atbGPV5cDqDMJUHPiD_9mntO-WWhUhMuYW01BNVl8g
Message-ID: <CAH5fLggXGMHM1bhmaUb94gDu_LiUbMGugARpOZoUNSTU3phm=g@mail.gmail.com>
Subject: Re: [PATCH] rust: print: Fix issue with rust_build_error
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, acourbot@nvidia.com, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 20, 2025 at 6:20=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> When printing just before calling io.write32(), modpost fails due to
> build_assert's missing rust_build_error symbol. The issue is that, the
> printk arguments are passed as reference in bindings code, thus Rust
> cannot trust its value and fails to optimize away the build_assert.
>
> The issue can be reproduced with the following simple snippet:
>   let offset =3D 0;
>   pr_err!("{}", offset);
>   io.write32(base, offset);
>
> Fix it by just using a closure to call printk. Rust captures the
> arguments into the closure's arguments thus breaking the dependency.
> This can be fixed by simply creating a variable alias for each variable
> however the closure is a simple and concise fix.
>
> Another approach with using const-generics for the io.write32 API was
> investigated, but it cannot work with code that dynamically calculates
> the write offset.
>
> Disassembly of users of pr_err!() with/without patch shows identical
> code generation, thus the fix has no difference in the final binary.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

The actual bug is that write32 uses build_error!. Trying to change the
printing macros is just a band-aid. Someone already mentioned that it
breaks the ? operator. I think this change is a bad idea. We should
fix the actual problem, rather than making random changes to other
parts of the kernel to work around build_error!'s inherent fragility.

Alice
