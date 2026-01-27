Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DF530E0FB
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 15:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526829; cv=pass; b=STQQ27AeMD5oMno5ZXoDkL0nq8h8ifWUppXlZRFn2ewgpWHzKP3tAdEBYO1ODFFdk/u6M1VT3z9sYftqOgXPpLRoLtKdLCKieWw7a6T/dxK8m8m7oPDknZyl9YvhqPMd66OSpVIOB2sVcMqbn4xdMFuRt3dWVG2csprrpw+YoPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526829; c=relaxed/simple;
	bh=mKGQDNNoQv6tNUBuSd0KjK/xrNR7FXQQvDUKS+vEP2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2JvhDy+4QgFGzDfzMBLTxwBPyCYM1/IHaXGZJqWHgZcytxIqbZFBd7uahComUPwGBmYX1/5muWFQqHLnYg4eIXtt9gU1hVB/RWyf5S8WuEB4FS5C9wx8J3MedEqk9Ptx/X6g1FyxsVE3aVFIGrPc0V+umNzMja9vLIWq7Gr5CQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8UD6Ghh; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8UD6Ghh"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b6aa67a792so447259eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 07:13:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769526827; cv=none;
        d=google.com; s=arc-20240605;
        b=fHPqTwwjfrJkvFyr832tRhROM+Y2lI+gcCfs0o1S8Txt63Z4UeJZ1RVCOi4j4ymauA
         5p7Fq0NX/1yQ0PyWpxH7ntJkciUFVH93IqFFGpMc2pqGr96Ch7V+lwsAGxw4fk0fZ8zW
         BrWHVMoVwqe+Br4Gzd9KmbNnqOa8aJsWYGQTsO4Z784vxdH5tT734EkRJgxDF/PsdM7q
         1VvhwDTOK/FBzX8Y63JI02IdJli0KZzAwC952Ov1spoedrPXoP7qj83Pt+3brJvSPlDh
         Ti4qdKOxZAFm98MFPcHA5MDcNdGQxS8HtXVDnSM6IDU5qtdw7QyU+ied7PWamPsuWNuz
         zQew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mKGQDNNoQv6tNUBuSd0KjK/xrNR7FXQQvDUKS+vEP2Q=;
        fh=iG/ZQxhp8e8ESoxJ3+ArAL6S8xS2fJXZ1DfLs3DS8m8=;
        b=GM9sAUvhUV3hjDPOk7DklwdwUqfNV5JfSCTZjR4HuqE/eUvBXS5huoVCgPkrUxFhnK
         GUNCS07bXPwbaNAU8gWzlVup6HER3H/OGlL6nC8QYDp5jkuleVkh4Tm0etMDKQFD4Z7o
         MH8SOFYopSC1rj07cb9FS/4piUDk8w/UamizhKO8XyDVUW+CzYkF93x+Do2FdNtoUpjy
         WfJfJuB07pecnaEr4VFewcnxgd1l99L0LoUJiiRbKZx/kFJD6drvanlXb/4blaZkzQYM
         CTTASTJb2HpNhZ3Ye40TAtO8I3mk33omzIAnMBtM9vrZ39J22vpkDj3g4mb+RxEwcHh/
         YQuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769526827; x=1770131627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKGQDNNoQv6tNUBuSd0KjK/xrNR7FXQQvDUKS+vEP2Q=;
        b=Q8UD6Ghh9UkrU4xAIVXeC+OX/PXU5f2e4/6p6o48SDl8TpuK7DezW0KDLlB2ByneAU
         hyiQpRodJDh71Zl7zz+sWdc63YhQ7ACfreyaXe1eGQCqCcmu1S3oL6wzH3LclG4avCxV
         dnVZprIFy+lObC45ogxKxP/KhHlQKf54Vpq4TBjVQ1MOUtiwDTkxXt3j6z61jn77ofz6
         gIXVrerOjeM1X7JV3uJ/BZbILNewMVH4oXocLe/RB6YmalpoCZq7az0UsgO1cPi9MAS5
         OSypD4MDc9R/3FexLwPzDH66fNZ6Kx7evnWI0+euyxjl9c4ZF5AHWFS4ZsrRA9gEQVro
         fl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526827; x=1770131627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mKGQDNNoQv6tNUBuSd0KjK/xrNR7FXQQvDUKS+vEP2Q=;
        b=JGsb3mU80avyqvcF/4euKffw9EgQozrZCox3dxG8JxK7BZKFNxweC3CXstPjO27fmg
         5eaOcr19YMqNP1491upXsEnPsuy8wsiGgIjkKk60Hg2p4Z8lbiGud3oy9SxvjK38gU1v
         ulQ4SAp3p08+9S4uX1AcX4XnGkK8+eLRK/qUBaTUDKOYYhc4VXnY1xKTInq0ky/VuHEE
         oFr/fge9KB8F9EipbcZ7mf8b2yySfr+GpCT+UFsQc7ooMhlmhyHDabVjfNp/omzC8ulg
         eko9Rng+wWUrb/wUK6NQ5lYqzPvNqfXx00luSg2jvVoxEFvYAZWEQsEWjfoxUc9/xJrb
         Bcvg==
X-Forwarded-Encrypted: i=1; AJvYcCUH3UAqHjNPZSHiMfcZZOygZaY/WqrQfnbR5GD82Mmw6Xxc1zCS+zQ18KfPe13wLv5CVcnc1qrxByVnzOpj/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKF3Em1jDTVhrLxFENgevuMxpE6XQpOmAcXdaPaAiovagWK2TE
	hnTjjari7vcmRzqd7I3ElhfPvxp+sElTzJotI6/9RFCJlQN/caeJiLA+Dv3uwMdShMVuxMlqDAt
	vD/fwOg+A1twbuh7LYDLHiX5mXdKplC0=
X-Gm-Gg: AZuq6aLWc1j22q/3pAHmbnMzr9ogerFG6aPvw7ImEvUorjZOtA0d+f3Eh4cFXAafN1U
	Dezi573+IyF3wzR+vcGcJBphh9DWrfI1r2P/k/565EIx1GPclqSORBYNzvK+TFdo1zHXJYLWfxg
	WqMz599ic5iNSEL7IcfjxpyjLhebrJ8G4grm0wmv6TI6ZCN9UM7443TxBR1VipFUclUG/dl4lM/
	0BYQ8v0NSumHypz9rHxckOmRQQvkYtbImdVa6EW4C4UIxUZf5f/WyNN//WRyYMaDtd2SGCYXG6r
	NBk4jf5BlmTghusN6JHQIZuWV5MbRK3tpSgXAR0H5/N9c7DVkQrYabQiIRmTP/gBlRHDUx7mS2K
	1dvCOdo38Q1Bh7VWuQEnTgOo=
X-Received: by 2002:a05:693c:3102:b0:2b0:2e6:5363 with SMTP id
 5a478bee46e88-2b78d8c78e2mr774073eec.1.1769526827166; Tue, 27 Jan 2026
 07:13:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-scripts-v1-1-ff6ba278170e@kernel.org>
 <CANiq72kkxS9ACvR52q03AN+WdFV96cK+tvejnnDXKZTKuKZH9g@mail.gmail.com> <CAJ-ks9kiWZr=82sztLfYqtp-fvsQ2QTgTYqNg5hSsZMKCsvjZA@mail.gmail.com>
In-Reply-To: <CAJ-ks9kiWZr=82sztLfYqtp-fvsQ2QTgTYqNg5hSsZMKCsvjZA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 16:13:33 +0100
X-Gm-Features: AZwV_QgjnP1PgG85dXBlLvviCUKko3RZAOhufqqIr8pT762Zw8NgNzFun3xSq34
Message-ID: <CANiq72m8Bx=1s1+_OFxE=PFOjKrtuh_uhsomTA9VwQ4=Fz4d0g@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: define scripts
To: Tamir Duberstein <tamird@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Kees Cook <kees@kernel.org>, David Gow <davidgow@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 2:53=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> It depends on your perspective - I framed it as a fix of the commit
> that added the first script because that script was added without RA
> support. What do you think?

Yeah, I see.

So, on the implementation side, I don't think we expected scripts to
work at all, which is why it sounds to me like a feature (neither the
linked commit nor the one that added rust-analyzer overall support
mentions it that I can see, though it doesn't say otherwise either).

But perhaps someone out there expected it to actually work and thus
may think of it as a fix. I don't recall someone asking for it, but I
haven't checked. Perhaps someone would, when we use more and more Rust
scripts.

Now, for the backport part, according to the official rules, I think
it wouldn't fit. But those rules are often relaxed and who knows what
companies out there doing out-of-tree work on top of LTS kernels
want... (Commits can be submitted there even if they are not fixes, by
the way).

Cheers,
Miguel
