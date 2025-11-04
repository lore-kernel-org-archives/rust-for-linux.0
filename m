Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479371E991B
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 14:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762265820; cv=none; b=u+49dZYGzL8AuXwJpWB1jC5oS0hBFivm4qFiW96CBjpjiwqZX4r6K1kkHm8AtQrfH/wb6XtDewSMS9FwlZiO/QeI3ev1vXNBN8Etf9063EyTYyJnx4t1HUIbETTzwUf0x1ZZ1D3dBVuXKSH4B7TZ+o8LHbBYNuXZBBgS7lCbOEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762265820; c=relaxed/simple;
	bh=Sh+MaVFRymsuv3mSiTuiE0T9KT+Pic0tQtQqdA3cTLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XtIvSd1mNSCqS89mxm8dlEs4XLnQVHsS8Mt3uzNZ1YDxKoFV0g2TANIBa50XZdve1NKwlWPQl0gV98BVDkTYT6g7nb5t9CKlJOfA9t/Zi3qehxdNYPXchsia0iJwu0KRQ71e7av+xU/HFld8Cj3kXfnDHTydL+tct2lWhqyFBkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+f3rsGm; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+f3rsGm"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-339a0b9ed6cso1127049a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 06:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762265818; x=1762870618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sh+MaVFRymsuv3mSiTuiE0T9KT+Pic0tQtQqdA3cTLE=;
        b=V+f3rsGmCpVM6N+1Uk3gWTFQv1luplnuwnMk0e3qAaggMF9Lq2zI1Mp+O0V7wDEXzW
         iEi2LW4ot3Es6BzZOYABq5bGzVzAi7XNVg7KzkPgxjf/jK0fPVtcBPv06feELQgAW/K1
         s8U03S8FrECv6hdAP0O6c/sthNKyzuzKH+XR+cudDcgcj/gnnNg1dkSLuXi5rT5pWsbF
         E6NxxA2/BqRbGf2wDq+JEwSIZvWgPQldd9pzYSIYlaNLuzNUUIR7dUh6oKtuz3PUr+jY
         qJCriutJMgIdmgLfCBSycQ/5Ph6iaBs0rVjMhB5HYR1bQnMv/FudoXsQkQ6KS4oIIqNZ
         9Orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762265818; x=1762870618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sh+MaVFRymsuv3mSiTuiE0T9KT+Pic0tQtQqdA3cTLE=;
        b=v6WSNbLSRPDdBsDLOBuTkwEVAc7tN3tHCLCZyfdmA1Yd2tXGuZnY8/c1Ya2dnMDGwJ
         l4QXudW/PK0hJ1ZVFuBHg3L6XDUH8cQJU34ZSbpJX94JLkVqGdfUhDnd6n/GJelNFuES
         aFBdpwChTrr0d/U3BSX+rZbOgS+BQ2bPGQX64yFsawE9iPXPoRozleTTn0Eu2e3wJvqc
         eMqfHom+JcZqRrKqMn1zBaPw67Vz6YrDhTlVu9ci9cHv8A2RXMRKKiJjhRFpnSmthEZn
         ma+KWw7VUfg6E5m9cCnVms+y4DNOXRT1/cHFu7eSina1HHIKUAoqQ4fAUPDkrTq6A/dO
         k5Bw==
X-Forwarded-Encrypted: i=1; AJvYcCV6r2AdPt+lqJ4dez55cU55j44IHb47AmeAZuslaOBrtRymbWwWRTX74HSSgxTy1rkmgTx8k/FQX8xUZHBqwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0BKxXy6+SzjopFKZCDlz5U2URSanSFwKQLrZnJe4rEG8dtvSx
	Xt5Ncwzdmc72zJ/lwpvgylqRNLyjjwcXWg9ut7TN4BGz/JOZNVIWrnRdZfY5uT3UjYxUYqal5FX
	V9g7U9DoR3vviHJwkYyNROtOA+cFIB8I=
X-Gm-Gg: ASbGncul6FAJmn/oFAiDQTQXPl0Saz3uPpd0KRkXrO+6hf99QQzUtnvpOT2Z1kFNW0E
	q9uTQC1PxFzhU5mwpJAIKew72c6JOY2m82SWf7TDkAcspdKWgnx0gXN38z1Ngt+D13lGb/L6QLk
	ZIRvFtEwCDPPYnEFqhedmflXvx29MNbPInFtO9bRG2CoazAmttDQzf0XLA0Yy1CSNsjzI9Khujr
	4/z5wegvM4xLzxgJ6rriQwXTScxyg5SsQE/dnW49WVl1sjbZeAqNig4CMTGhkXi7vWqSG15Fh95
	ZYal+v5wLKMPnNy9M6HNkvrMnw+4eEDnUo92x03JUU1uEBLzpmvhjXTqjgoLAuWPFJu4ogsQgol
	z75w=
X-Google-Smtp-Source: AGHT+IFPcCygCFpwJxAi7tzB27/U0llI6K77VjAmQGkHNUGN3whlkaQCTTO+EohRDUTXs16aDzzs2MUAPc6YS382IJc=
X-Received: by 2002:a05:6a20:9143:b0:34e:e7c0:3aaa with SMTP id
 adf61e73a8af0-34ee7c03ef1mr858167637.4.1762265818351; Tue, 04 Nov 2025
 06:16:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104-b4-as-flattened-v2-1-b042d8715a8d@nvidia.com> <aQoJUAdFFBpQiEZU@google.com>
In-Reply-To: <aQoJUAdFFBpQiEZU@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 15:16:45 +0100
X-Gm-Features: AWmQ_blfMcKn6WraSG1MbO5QBQX_DLZkGFH6c-b4AqmylsWifqNf6lbYrNe6YOQ
Message-ID: <CANiq72=ueGrFG-pj+4snGnbrT-AW16_gMAUHn=3pVCE5JX8gRg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: enable slice_flatten feature and provide it
 through an extension trait
To: Alice Ryhl <aliceryhl@google.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 3:10=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> You should double-check, but I don't think you need to list it here
> because all uses of the unstable method are under the `rust/` directory.

Yeah, having the indirection and no macros expanding it, it should not
be needed.

It doesn't matter much, since it is stable anyway, but removing it
would at least help other crates not using the indirection by mistake.

Cheers,
Miguel
