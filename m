Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA8C38552C
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Apr 2026 14:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486288; cv=pass; b=gy8vFuAWHt6y/T9rKrmmrgT33kFBMjOR7M/bw1drlswVsmdQfeJb3Er1obegRyta6I3YCDp6/BFDx9N/sCj5gwLC8OI5VQw4EMtTHZYF5lCS7DVFC2lLWzTHrjxy/E0ezPvQEoSq9sBYYTUJKGoKQeeMjX4Efpl2JOnbd+aaWNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486288; c=relaxed/simple;
	bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kk6AZY0z0UMpylOoLG8qDyf3t48aEb5azvYNmHBwxKgxzkzfWRk3K8xdL0YOJxiPhcQdLrziyzLDIb/EkOQRnKwUGmea7SLNI8afWMEidbB52yNXFmVSchXI5Os8uThbJuZz3SyltuXMNaoyaCfAy3lTvsPNnREFVs4TWHn1Cmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgwhN/LO; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgwhN/LO"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2cad171900dso222616eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Apr 2026 07:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775486284; cv=none;
        d=google.com; s=arc-20240605;
        b=MZjJXDQWG+uc3+Nzo6KScnVxh5ylh8+/HTlkcT4rqPMwuIW/SC88Lht2IIQ1SH4m0h
         w+fd6a0MwvzFTN5A7MoEVQ1Z4jQjOi9d7LzLrdO93OOyk/q64erJGYdYA2m62iphQu6d
         b6nxVxXUrKTB2ryO9oXjIFKLGXCIYde5IgCZc4anfQuGx4fxztZwcCOBhTrl4ft99i26
         FoNkNCKakA5TIgNRFgPbf1QAtG2FAETneRkpCPZtanlesrt6Xqce+QeLnX5wi2QBjoSZ
         T38FTg1eRNbkTj+B88jZMVdTB+P8S8cNVrZfvT04rUcf9X1taqO0tm9QaSk2K8fZOiUg
         JTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        fh=7grqvniPUWwEJTPI2e2jvtSYIxES3yVT6xT/AWH2dTo=;
        b=ermqSHGDZlsAS0u2f19lKfzCIlEupMc7Ny76DWCZutnnbkg683xLjnIQvGDdmupv0z
         9jC28OBMpKLauZU6mro1qv3wyF18//CNsjC+aXHnjphZiuWWtHnqJVFamvz9XGQ7fohB
         kYHJVWof7G0YhV9sYl3BBIIuwd7K5cwEotpVPaSDwwfnoHPqzgnWHc3XyvDihYfrTK8g
         eOJgZt3WxWIfL2cA1GhKnATETSXW1b3qjYT310iwAvy1Wuo13/eSSE5OgBtJYgJJeFHS
         INOFuW6VEJIO9skBdhm7Qh08Iu+QgynledYF16lBpg15WH2ATvBcCHyDlCX3Nprlmbx6
         +gpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775486284; x=1776091084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        b=jgwhN/LOCRUuz5UtuAxbMF3jgJnFp6nKylfYyZFBTJc1ux/cteBqbZhrHUpd0SVrJ6
         9hhlLqqaYpY1c0QaNN6MWPPAIwh5+uX2vnAa59YCd3Q2Ao03JARshIQClxScR2gU23q6
         1Yi78Tqo3Y4/iAxKQ+p+X62sVoaB+OFZJCt2n+9UhA+AY6ZbTDd1LWJ9E3QbIJgzyByS
         8zBdW1BmZbAb+cnapbsOd4q15lxIceJHUjgfEn/NiAWrxrT0gr1mHOyFTsaOq+RvDLti
         a6G+lGC7X5xWVSu975ZjophQliZNveh4HFzgRC1AO8zyzB4RALb+QOAALbUrIIiMWMGm
         AnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775486284; x=1776091084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hIhNt0MJcuiCREyJL4elAnSUfXIEbP8C+cm2AS/TYZc=;
        b=lUy5T+yBcoVv87Xka/lApq15kc5yXNu4xUxyQ2+LF9TCqLoZ3fMKGYSM/ZtHKu6/Fa
         3/9UsLfxy9sfRNDoN6pTCsAyjVh7KabSQ/yHvuXBp6A0dr5vj6rzp7tIBPHLw7dT5UK8
         2Omy7FsSRcYbPheWvQOan/QXpXTrRQlKlROZ67FhvqhOFWzaifgryRF8RSjshEO1HRGA
         p7rwFQ1buvD5N6aXF1B1PqPrybRCdWyq/ZdP31AvF0UuiMecaukrC6POFeePkiM2pWpp
         cM9upgGo/+QYSdObbPzFZ2Chcb9CFmPtTCi4R5nL14iBu7oOao3DGmdKo3EStDOzwYuB
         K8YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVslEtQVEAAQ7gMCZrzPFYjIuovMRBjgt1BPmABsohaLYYr7b2fnF520CssAdRlc5n89oNSB4VFoWQdk+D1sA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrgVtygkDGUvtpPQdsCvzCfPtv6FiQDEWLgAraXenE3yn/LvHR
	Q4psXAJl2CC46hobiRDuxgTCwDnLR4yMMWilh2WCAI9rKVTrzB9T5myuLuvX4/JC21Jd2QxADr2
	qItj3OL0T4V3why9eCr8aoIfQ6IP3lj0=
X-Gm-Gg: AeBDies9eLwXXa/5Sf2uH/yarUyXyZOb/yRt0qlRf//8/TVisLJWHoE1c9ugwKgUm+A
	swSsblu9gvlvI9FhMzFlHuFwSvwx52l1NR9Z0Tzy4Yz4dF7AP7TweIwU3VNQpRVKipf1hMDnuHK
	KtF/Aduhyba6YHIk7kmGEAvGekvWte36xTT1Il6kTcWxMM6R4IOLzPGAZg3htbMMi+AbEFCRHP4
	+ciRudX7Gqa2CYipwgeJ8GjoauTSNaBwgy0ipVzHoIKdoipGwNIoE+RgxhnCrfvdYkS+tB9UF6W
	dd4V2iAtunswaXU0ExCHKGcIJ8BAIoCzsScIoY5bMuo+Fv3o8rIqeJhPptOD1y+m1e9cdNzk2tq
	kSjhMlecLRWAZ2XyjxN1HRhgYfCeQrn5CCQ==
X-Received: by 2002:a05:693c:2c06:b0:2be:2912:ff65 with SMTP id
 5a478bee46e88-2cbfbc7d828mr3020598eec.3.1775486284289; Mon, 06 Apr 2026
 07:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4>
In-Reply-To: <177548573697.95472.13544191227699996309.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 16:37:52 +0200
X-Gm-Features: AQROBzAshONAZRL6Bf4qdEX94VdiVWUdtgExWPcnxvz_Z_wjuLZH7VazFmpsU7M
Message-ID: <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 4:29=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Could you add a reference to the upstream bug report [0] here?

Of course, thanks for the tags!

Cheers,
Miguel
