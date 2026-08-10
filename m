Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7C1417D97
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375757; cv=pass; b=rLaI/JdpceKH4qd8KrcIEXabSOi+m0H1jREINmtW+c3D78RS5s0bMfLwWC7clvfUTvwOCkS/NJMe5Sy7+MVOxiW3lYkCTkcC/9dcv+ga316HxPef44l3SRoWlRhGuicdrVj6wnyqO1rzKUyQJ4G6WfJYWZRfl4NlMTXWS/dUC/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375757; c=relaxed/simple;
	bh=QQcvjpFBxvOWe2H86cB9ftedEn5fYdXPQOL4eTzqGxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJnO+A64U7KLNEpDhzUMN5G9qMoSQn6bhdOY+cCWl1WmjvE5on85HqlcYabLb+nD+ujNzVFObhtwspTNZnp45O7BdrUVIV+mjE5gjdwJGmohPhqoxqN/OeocHjxLIB8IBwdzsYaQYjvOh8YPuYyXibww68qLy7jupQaTDEj2RMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0niZ+C0; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0niZ+C0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf4c37dbe6so1481355ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 08:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786375755; cv=none;
        d=google.com; s=arc-20260327;
        b=WSs6eRaVN8P3N+JRki0cVyrw1UOtp+bBM8WYnpV6/DFzfuY1bs5LYGv5KUO51zXWm2
         ZTEQFTTah7fWrhF6u4qIHrw6Lf2XYbOwRLedwYFk5ezlHtMscW5G2b0XBRmlCnOj05F1
         xpo5Ngd+ln07HKpWfUNhGDQpLNAiwwTW73Z34Xmaa0LPdS924HTWTmqQrX8WKfOGXD8H
         8uPsky7/e9jcKDTw9dLNQmEdV6vS2ZS7/YkY8rlv5ifhbtOPo6JaSp2NrE5lIrso6Jfy
         +x3j3I+Mtf3QGsZn5C2LUSCZpgSKozY4hLdwNbmEZPVMqKqEb2x4NXEes9Dl96BEYDVX
         HLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s/Fm2bHN8R9mk3eCDzFoDCiCVWfHB3t3hyd10beUfwk=;
        fh=RxXzrEqEb1aIPFlxQmSeRjt03goUh+m/NkhVMkF//8c=;
        b=no/mrkOfh5UdhHFRhyw3nvnTEKC+drgQ5V5dmjKBr9SQL/juL/vZ6ppyn9lj5Truej
         ubRgZDfKpu3/t/9Y2viQgnDEYCDpmdnd2K5Qw+BR0X7sicGAVsKy4s6FzH4MWuHQrnJD
         3jnBvoS7etZE0IL0P8QbVtLe8LKTVsrAc4djqLMnA0pHg3BPkrmPfXctxDfMjhZ4dXPZ
         G0L79NKAvAqYIyDT3A4dm+45FAX9MDywy5jvNvzfaWlYKdGal6hIUDFxeiTalyEjkT9u
         k9GXMg/oULfYt9zDSBrXleP3MTbDh4dEpvSzTEd4iwF+naoqz7DWbNk7R/pydK/soMZO
         QFjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786375755; x=1786980555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s/Fm2bHN8R9mk3eCDzFoDCiCVWfHB3t3hyd10beUfwk=;
        b=b0niZ+C0yM+iauPJe5UQpTjUt4Q3X23DUU/jnwNq/Ec1xVUSKm+3MYTfMOVN/rwz9f
         akedrlYYMOLkEpO14z/qDn+8VQYY6VZGw9cc7AbNv/ep9kWPuCNbgu/6J2sD/CFt/RHG
         zB+BU+h3i8N1X/BW5Kk8X5y8pBBVpYmuM9Nh6Wmi5/69ZeCrqvSrQPJ2pYr5y9uqGRbl
         UpHpPlUpjsjrdvrV1DNibYOJHL+rERe2fWggIZbKs4cQsQjrAcdX1ByN1cBKy3LzLhhl
         c6Iqtyx6qk7krwATubXVs6uZuC/OW0qkB4iwPiR1UAkTEt0ujbZwhi+Q1wrUNFdOY3xN
         G7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375755; x=1786980555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/Fm2bHN8R9mk3eCDzFoDCiCVWfHB3t3hyd10beUfwk=;
        b=Le5mbPbjIhnAuvxZsNLTr+VZVhCYWz6usviDEw+iKNf40V2eoRr2X4f99cchbvPJzV
         WLs2hZmuBB2H1E2Kx8RvLFxZHGb3DqQpDlzvhvgweLWea1N+IN561txJ7oFLZT5M+vKk
         XcXC5+96XDB6qPnKVcjXQVFd8qNpfOk3xKmCtEK6qLdZHhvOucDOtmdtsaP8RYVB03SO
         E1gSNfBW8QDFl4DNisPY3iMZSeRe9CZDjMvzAqzlTsRG9I0K1MIqpigvJTENmoHEHe2t
         KBc5svV4nSKykNvlgWer14ENWIvGnBOJZoNt1Bv2bYqqZOceiRyF3k5KTIzhuBXyAQVS
         no6Q==
X-Forwarded-Encrypted: i=1; AHgh+RrHC/+KlUEFaofk9ySl1j2DKcbgPN3OkhuOdwTGzVWUtonM3ITS7Hl9V7cRpHiMGN6WvVTFdZ1sg5FYrasJaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvHELmHmdzoudAD2XnwDT28fJD3/NZY6TIdXZkOmSTavaQ4f8g
	OYwzUzSHZXluswPReoFecCxy/L+KwEWcgPTjyy9OCoB6G9Lbwqhm0qePAwJ0Jrys6yOjm0jZGZs
	HvN1xyY5OmpBhQUwbgJt7SVNbyJgqb48=
X-Gm-Gg: AR+sD10yDPVUEomglzk18sZFhtH08EWW0E6XhCkSoJcNoMp7OSUlUey/y73ijmqE4IW
	kqJfKLGg+TibVyOUHolGNvwUCYRW1Z5Vrolr5wmXSY2NOFQQeX+Pinvxw42gzL4SoAq/UBk6pVa
	oK0cfJe6R3g929h6Rv3D/PnrM9jf8oFGOb5VBVFw7r8D5q1SvbdhX0zqCfPPMPwyt6MZDdMr6tS
	ikVgSfefXC6lAMSTnNAcr0qejIRpnsAcwMlALGSx1Tie2sARBppmLgVQ7RtKoH63rKsl/ZIWKMb
	sX9y22hq2SoR640CuAUZGzG1asOfqtgPoWL6aT70ZKzD8kLZf4KfMXqJ82Hors06fe6jKiMXwtD
	bkmYgMtTvbHTVcKQKXviDsqyaUdxgtLACLYRHlvKlrs45cjI9bQ2a0y+hcQTXkg==
X-Received: by 2002:a17:903:2c0c:b0:2cc:d6de:d58e with SMTP id
 d9443c01a7336-2d0cab4cf8bmr342919145ad.4.1786375755110; Mon, 10 Aug 2026
 08:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808032143.2767112-1-mkchauras@gmail.com>
In-Reply-To: <20260808032143.2767112-1-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 17:29:02 +0200
X-Gm-Features: AUfX_mybYBfAvOovDrYOcTyd1C_fVfPz5haDD5xVrOIi_oQVnqWaVcjmgOkK6Dk
Message-ID: <CANiq72nH+7P0PtE5h_kpn2oSK3-CgM-q5f3B=YemJOgQ-AfwPA@mail.gmail.com>
Subject: Re: [PATCH] rust: uapi: replace direct asm-generic/ioctl.h include
 with linux/ioctl.h
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, wedsonaf@gmail.com, 
	mattgilbride@google.com, boris.brezillon@collabora.com, robh@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 5:22=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
>   uapi/asm-generic/ioctl.h: warning: '_IOC_SIZEBITS' macro redefined
>   uapi/asm-generic/ioctl.h: warning: '_IOC_DIRBITS' macro redefined
>   uapi/asm-generic/ioctl.h: warning: '_IOC_NONE' macro redefined
>   uapi/asm-generic/ioctl.h: warning: '_IOC_WRITE' macro redefined

Thanks for the patch! I can pick this one up.

I am wondering: the quoted warnings were shortened intentionally,
right? i.e. I saw longer paths when I reproduced this.

If so, then we could put the full ones (at least personally I prefer
that, even if it goes over the line length, because I want that it is
easy to search for, to avoid edit mistakes etc.)

> Applies on linux-next.

This would normally go below the `---` line, i.e. outside the commit
message (and ideally use `git format-patch --base` to provide the base
commit too).

Thanks!

Cheers,
Miguel
