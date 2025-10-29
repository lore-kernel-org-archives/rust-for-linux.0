Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242A6337B9D
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Oct 2025 11:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761738678; cv=none; b=PsrdEu1r4h4BN/XBhr9hl9lINIw4Wxpl/OkbkVWNV0CXc57E18S9FOfHeH2L5EnRr0HKKg8LvFXP8UpzE39uNvxor/2fzExy0byasKaLAFf8LsFmX3H+4qWOaINWKTcr5Q71/gQnUDs2u/JKIiu5cQ1KREQg9F0SBcKyLzAWwzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761738678; c=relaxed/simple;
	bh=4eAuxRdra6xYn2AEu5URxIFLv0U3aPRV4JUn3Rr/2D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jih1vmgMncmX2Jslr6sKVYirlGqIgofdrSMHYeX2u+NRKCGfDpsBCe2OAUWtJRnI452eRndxEDIvrZIjcc0ZDZ73OZqQtVsnzcTZLfow4lmUzfkANH7EbVjewsbmsUMCyScW0aEG77rhbRBXQkZp3k4rO6/W56okEwcdPh8nmrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZNhZavJ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZNhZavJ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-294e5852bf6so618835ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Oct 2025 04:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761738676; x=1762343476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eAuxRdra6xYn2AEu5URxIFLv0U3aPRV4JUn3Rr/2D0=;
        b=YZNhZavJSqfaJP3lGCg5xmuwsDrK3PMeTIXFKOFMbd/zeYvMmNHdthI7to4fL7CFDG
         FkWYH7RX1+7ztmcKe/vd/Q8ZUI9xHAipPxMUZbYZxJ3V3KUfdrVb0/7MP2DX2EtHyL/R
         NkhxXDpvBBgnhmeozECfV5WdCtp9JEnXWnSWA4RWusRdxorBmVcWFvWjjjuf2C7Jm6AS
         Xf4VL0wnxlxu9KJtOeCdJ/prKJLXaS+uRTlu4qB2mwB6+aU/+NVGVpqxZ+tYJxLlumKZ
         9jzJtJAtpByn0VCBuBxYLEvk6gUNndUYst10HUhJVo3lF1Jjcyx9iL+2ntcg6kxl87sT
         +KIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761738676; x=1762343476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eAuxRdra6xYn2AEu5URxIFLv0U3aPRV4JUn3Rr/2D0=;
        b=rG6Yw7bZr2G2ypLWPVqCg4CFUfVMFZvmPcx/1Vr/hYAB181HopuVdvqC1EQpZyy2Aj
         UhSKo3lHWG06e9hGVmUCVkpDJVmZnm034GFdHPZdZ7gncA+jdhGB+XXNPCjdC0CMqkXr
         My9V8M9JVOLOT6Krat2dRemwoziA1Wcm3N11QMEGbNdQWOjIW4/SanQ/51evGQZPGXJa
         5Au1rx27ZNL+GxZhvIatjLpgAa7KQq4uI8/nWvrXOa6uOzQgBo+D22/V8ZsWt4AdOPiN
         kfqUINHVP4z2iwR5b4azbbE26xhlXxgOjLd9+nmqtkvw+67JOh+rkGwO5F0nXBOoQf+z
         zt7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5OzcCpMGEUCRJGKxTa4njNYYYDKqxMLVZCsm4n00bqg9PA+N1+j3AMTP5Ey38X9b8fbOS6OCUVQZHXpwblg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyruTDXKxUcE8wEj5WoNUn4azqhIM3+eD2tyxurUWLpnM6Yie8W
	iF6jhNkpwxZRWXlpj2E8m4Cfc8hY0zcl+xqQOeLFF8sh44Z/QsBse7d3boiYIhnwOtYpJrCrja8
	HErQMaf8kWwHjre9MQElvEkkrM7Ngy3M=
X-Gm-Gg: ASbGnct2OqGNrEVo5L40jGT7nztdYP1iveCjWswH24zry6ccA11wTvSK4PH664ARYBu
	Xuu8ZDiLXDqfVAx+O51U08EgiLK75TgwZPJeMxeu/IXp0LMI1qJll180hxNgR+gcKMjWScSvvDy
	dKNg6j568i0m1Xj4RUh7I1WYVTZw0fF5MAMsZqFGgFLgF4Qe2Emd28P2Cuut4wlr7Gv5WRA9/H4
	eUOTEtOm8U4+HSpgl+BnpKf4QvEfMbrVDYauh9H+HKuY2IvsbE84dhcmVPSgyZdKzxl1yiXzIem
	lixS2kxERwFwQbY7bThafqf2uwW71WG9qJZMp5995eYLpuEtYK3JUW/uEQlIJfi8Cqx2CrANTA5
	aGHk=
X-Google-Smtp-Source: AGHT+IHydl5eW0/Dx2EkVGLSZgmAKiTuqfAbgJdkgdsRFye8YTtzwH3XYU7OFAr/IP3WtWR2QZHXmGbjwyn2fqhtndQ=
X-Received: by 2002:a17:902:d4c4:b0:290:bde0:bffa with SMTP id
 d9443c01a7336-294dedef47amr16261185ad.1.1761738676328; Wed, 29 Oct 2025
 04:51:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029071406.324511-1-ojeda@kernel.org> <DDURZLGB2VRJ.28Y4AP92FNFPS@kernel.org>
In-Reply-To: <DDURZLGB2VRJ.28Y4AP92FNFPS@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 29 Oct 2025 12:51:03 +0100
X-Gm-Features: AWmQ_bmrmooyzWnmY9GxFiFIfc56zKAyCS5p4B1qi25Pm2Uzdfv_Hs5RDQeg1vo
Message-ID: <CANiq72=HhDQP1ucccLzZj0mtb5Qa8u-1oorRwCqNv+aEJfZh7g@mail.gmail.com>
Subject: Re: [PATCH] rust: devres: fix private intra-doc link
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 12:39=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> Given that, do you want to take this one through your tree? If so, please=
 do,
> otherwise please let me know.
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Yeah, I sent it independently in case I take it as a fix earlier;
otherwise, I will put it before the `syn` series that will go via
rust-next since it is not an urgent fix anyway.

Thanks for the quick Acked-by!

Cheers,
Miguel
