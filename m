Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EA12236E5
	for <rust-for-linux@vger.kernel.org>; Sun, 14 Dec 2025 06:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765692433; cv=none; b=QqzjFBViPTAeLTWu34JrwinJ2qWN2SqSkogfJ19A3mDZhinZd4YJrzlyGbm4ND6gjrAUxUJWAwb3info4VS44P6aIYHlU88kbYpSaPuIESuP7ncOF2XN6eTKO+pSOdHB5PRgCefPVF4sNF+2hwxi2rworKTQhx6WdJKsr2dtkyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765692433; c=relaxed/simple;
	bh=r92Q2V8e+U0OW5eFV0h+0q8zFYT95BWs+m4he6KpbxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/1Obs9StN5sDjZ6SKzgJj8BsDY4Xkc0X+RE3fK2WRSNp8KLfPKHnZsFktAuCXt4/b2EQ/p37BWKMUZ45AnzbY+uwaUOVaCW221ouHkct4J7lrVVJfYDCi8xHzHXfPSJ4wKBPoVH5hX5HggUPrM/BNmZvwfOfdaWRoBx3pM1O60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcEq3ZEe; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcEq3ZEe"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29e619586deso3494005ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 22:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765692431; x=1766297231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r92Q2V8e+U0OW5eFV0h+0q8zFYT95BWs+m4he6KpbxM=;
        b=VcEq3ZEe2lNcBy66Aaco/nt4c5r6braSBOG7csTn0PJq6fV3hv/2KIQozooas/n9Xt
         E0F68YHeAR1YZdxbAXorpQ+wx1HQJMB54Tk2FgyTM/NuhLUbltrVFVZ3cCQQ/yZC4ru/
         NrmKIbg1ngGu2L/mpHAgif3gAdpJDoFg0OofszxcijUVhwCtcP3Mk/DrkhS1Hjurgwmi
         cgOo+FPdnPFxZ4pw8osSs6B/fEchaY1+Rn1drSbSdvi8rOiZtcab3EqZlkm7bWjpm+Ol
         sm8yYcywgOV4zZBerLoVAC/Vdd41NXjPjQ62E1P/c7e/0yh4EzAg8BEL9Fl1AFtzm6XV
         dNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765692431; x=1766297231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r92Q2V8e+U0OW5eFV0h+0q8zFYT95BWs+m4he6KpbxM=;
        b=iK7Jq2LadqpAaaw4RttTVzWl7Oi89SQT8E9NnalwvnZ39DKLRgY4gFhcHDbIBbZct4
         L2jr9vYkbxoSRGXgdleTzt2HlImVX30xxqvFTeEAvstLyi5YC4zNg+rrKL51vjd3fkD0
         PBWKHMd1ZcQBBzW31SjTrs/tHKuq9pDEnmSdXqdHhj9fUQ+l7HHhApTlIyK1S+1r4lCh
         MTfreOjYUnjuQl0uommDg5DKxjE6PlQwiP6yPoa6zFKPBmc4aLdo3FeJ+FnkhESFAwSL
         qSxBfD+2aUpjDTy0B6IXhcjoghxsk6kRQIVXOYDyD50NOq0KlO9sMVcQ8fboVJtijfcb
         t5ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWGMhnBii/Cj6UN7U/wUeVdkp3f0FPpDv/VQ4YmPyTM3Q4SnmK1Te09OwjLqGKl1z6P3lNlFf1msgOct6W6uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUobPrVTqt9SVqk+8oecx9FvXYx8oDQQYYC/EvL0c0evsdPtik
	BqnYrlG9J21XMlW9ykfZE6cYdR6qRJxcBMc6s8SLV03LT6LSlu1qBj3A7WvQ/6S0r9qrMrpxWHf
	b8pNPhSY7Mm3UxxayeMzF1wBMHjVQRc4=
X-Gm-Gg: AY/fxX5awdEMGtkEJO4DakP2ijqgVIEAtLOuL+ND+jODRaArz3y6lPfzoNMYoGn3G2K
	BJ7HZYzaV8zoMXOaL/nsq9kz52OAbxbHb/mBx1XO/Oz8bE38TYhWyZCh0bXpildR8KyR1PJoapg
	VeNzs7tT4u5z0xwHdHPXFlrtrM6rdN+ZgzmXF6yzpiD0EmMmNlcgaAGUGhEidRDZI+HgivZ88/J
	AjgI+yFON2K8GxCeMdgKC5snEHHIpQQkScSDh43H3Tdp6pVPCQiSSnkRXpiuDqVZqMJ6/MQHBEb
	d7gZPCu4orIxvxuVi8dq09WwoNBfQdkZlNQ+G2b/vuVrZokyttc/0oX6h+p60lFPcDyjzK1YH8s
	AXXx5fMlPspr3SJDUfAEfw+o=
X-Google-Smtp-Source: AGHT+IEjx4XmV7+QKdE4whfVgNEnoL/VMyWdZXt9WX2oOApywhA5AcUs+0KOuqeEhQKcom99245S1CriwR+pNcC4S4A=
X-Received: by 2002:a05:7300:2405:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2ac30185d3cmr2189860eec.3.1765692431485; Sat, 13 Dec 2025
 22:07:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
In-Reply-To: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 14 Dec 2025 07:06:58 +0100
X-Gm-Features: AQt7F2qEeevNyJki3CDaXjdPegHadD6h80UJghjzYTaUz_sRuaFZb1Mi4GUBj6c
Message-ID: <CANiq72kYjNrvyjVs0FOFvrzUf7QYe8i+NpBS6bMEzX8uJbwB+w@mail.gmail.com>
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Rudraksha Gupta <guptarud@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Benno Lossin <lossin@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 14, 2025 at 12:54=E2=80=AFAM Rudraksha Gupta <guptarud@gmail.co=
m> wrote:
>
> - The kernel boots and outputs via UART when I build the kernel with the
> following:
>
> make LLVM=3D1 ARCH=3D"$arm" CC=3D"${CC:-gcc}"
>
> - The kernel doesn't boot and there is no output via UART when I build
> the kernel with the following:
>
> make LLVM=3D1 ARCH=3D"$arm"
>
> The only difference being: CC=3D"${CC:-gcc}". Is this expected?

It depends on what that resolves to, i.e. your environment etc., i.e.
that is resolved before Kbuild is called.

The normal way of calling would be the latter anyway -- with the
former you are setting a custom `CC` (either whatever you have there
or the `gcc` default). By default, `LLVM=3D1` means `CC=3Dclang`.

So it could be that you are using a completely different compiler
(even Clang vs. GCC, or different versions, and so on). Hard to say.
And depending on that, you may end up with a very different kernel
image. Even substantial Kconfig options may get changed etc.

I would suggest comparing the kernel configuration of those two ways
(attaching them here could also be nice to see what compilers you are
using and so on).

Cc'ing Kbuild too so that they are in the loop.

I hope that helps.

Cheers,
Miguel
