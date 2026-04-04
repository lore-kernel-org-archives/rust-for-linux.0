Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B98F2BD5B4
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 21:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336662; cv=pass; b=XAXih04xuL4B8WqaZ7p59TU3vGQVUHCsJE2KLiyQvkYkz8fiB/EMJMn9pepf8Sqvr2H5hmv4j26AYVq4e+NuDnVGJiX7YTBKpXTOrhHZORlDmOHCt4Q/QfPiBVn1eN3hSkHaNNNzJejzBshfNgjMUH3rLBvVbLS3QZMcrFH8pnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336662; c=relaxed/simple;
	bh=OEvGM5ARxQS6grOCJs/z8BJJLd00bR6+I16kU6h5ie0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rhe8h6U7Xy2kf/3KSwFNGJ37oVtU8VwcbQP3teoTnMIv3D0k/mvSDSVNZ+CIDNtvwJ+VcT+fDIdqVj01D8WnVtxZZUMbivdGLTpSscqHTvtOalTYPRUo5pLtQbKvTRUVR5l6L4uQlcaQCSM7CHtlc9YExrmlkZJ4QzwM4YZGxw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WY5mX5Dz; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WY5mX5Dz"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2cbc50e6a36so119554eec.3
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Apr 2026 14:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775336660; cv=none;
        d=google.com; s=arc-20240605;
        b=cTeqwptUJ6MdlFRue7TqmNIK4XEYSqytzDTsGRUdyuiixymQWj0+7WZ7MS7sPRLtpm
         fkzj7DdfJQzSGz25rNTMOtTAznZ8H9HopBrg1AasuTF0LhIq3iF9179AKF7XO/obGDkH
         yGmz3rmn7d06fWdlOJtl/S+6+UdFiuEkj/7c27t/moUo2V1Yc0LgFuBobpr0aygKCAqk
         QpoL5f4H2RemvXS8eD8K7SiaehHa4dkBHJGg9uw5iBQdEhGxsUlnsGiyaq1P0o2YEP/W
         XGuL2rPTgbC+umT6rkMmoJBCREvY5lh4Gxh/vbFSYQiK9C5dva3ULBPzOvw8QKuW4tsu
         m7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cYhFiwqA+wDjtVVMvyF4BuvxXVvpM8t3h/p4jRxczq8=;
        fh=04ja2x+eRebq9FOWqX1YBor2cWziWqhueE4utiZ2t5g=;
        b=bLQ/IIvhCcfIDPU1KwYmXCC9M5Ty8DB0G7SzwD1N7dAIFZN8znmZFRsIZhqO1grQWr
         MGsPAdixMGDWNyzV1tqYyoL+EF1rFQQ3mn/GQDyxcTObH1VUp19ovraXdWsSre8bt8oI
         fZeKCUeafJoogp3jgrVGWVNERNELbkKubEInyLFE8AJJV7L2iJ7DvYEe5r34UWlypHrv
         pp5WC4rma4Nbj+O6GzSNxB45dqSvFVc36nS824vXZWcmJIzf+FQ+0jxzn5h3D5pjA5Wj
         7vtJBIXEE9XYVZgHh7ufDURdgGH8raJtgIuyO9zGw0RkNl41GXB9Zdpge5FKFqg8o6sR
         G8OQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775336660; x=1775941460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYhFiwqA+wDjtVVMvyF4BuvxXVvpM8t3h/p4jRxczq8=;
        b=WY5mX5DzUQeyefVCWOUXeyb5n8MzzR69EJbQQ9URKj+HvOvBQT7T+sajfCXbo/9ql3
         r8M7FmxF4UpYHI7rIQXqpY9Teag5XyGuCKf9lIOBMROLCjs/aPnToIelEDBM+MIbzU9p
         nR5wLpgH03+sHw56tPHjwUsENyUNshu5XO3nsfBOvRIPChuGZNlEjWGPx3jvKCsaCLYP
         rpmCHg3ch8YJ5faJBKYHxBeHc4t9LDxw1qQ8Ib7qvlcqWrmSGv+/wJrrSEMMTxmARTqZ
         wJprKO5fRrDTntHB9NnjJgtysqZmcGOK2SNyShzeUval88Rd81qO0FmaIJ1DP8+PL4wz
         8B2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336660; x=1775941460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cYhFiwqA+wDjtVVMvyF4BuvxXVvpM8t3h/p4jRxczq8=;
        b=nmhCg9ki+9TWT8PD/OHjArxkf2bWM6I7iVEheVh6RfILwz8Y2/r/eMxqR3xSm1fe/z
         jNDvPhHuVN9DTheTUQgl/dia7oyS6NFop2qD8Mh/k/i6YQ+LfEx08WHW/6o/IyeLkLOV
         BveFvRWzG9Bm21+bwmc/rmuqlrsfRpFSdxOzYTg0CTPsuXM0uWq2uOzgWGlwfrd//wzl
         ykhch7/tluHAH3XjGkoHKU+0vPzBs7/PF0ZIeLjqQdFLwRMoZiD3xrQgUGK5bMGPp+zl
         D2uC78/q+nkto84LnZpLzw4kl80G2cKSCMG3/2CUeNP/1rvBk8Je1YYaEIZ/nY/2txg7
         Efww==
X-Forwarded-Encrypted: i=1; AJvYcCWWB2QYBQyt0tMSnptkYP+mj9zBoQXD+ssZH+8Q6eDFtifcxhZtga90U+ZzIknuuGO4rjX5tO7aSptraQfvpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIksM01IxOPVqUD23U7e4aTQO5JP+EdR0XxHZScxUiyMFKoNT8
	tBZU2chZpGR5xBnccyYNbxbHkB5Sk7PTfdrb5i2G9yL59ZOJyfWo2g5eSEhPb9RM2M8RUJOTFla
	Ojnq/ZBvaRWBTTFqqKYu2DvvtCNPeSJs=
X-Gm-Gg: AeBDietvDzKO/+f6mx94/gZ4CuLe6fmnTz7OH2OXpvCNAS9qVcgqbgezbJAxB7frQY4
	vt9Le63s7yTqfhd834Srg8uZPWd+PqQZz1K+HXSDHW14zLbNbtXvWIr2VmtvORc7Ge0N93QmAh2
	JSfIDUx8beC6IT04YYplhITOcLm6LcRaMORZH+MS6TklAVzIhO6pXTtVQHdmdiA3NdXOJ1qSlbc
	PZjdZc95bUMpMo/RKnOhvXEn1MTcbmrXC+epLEMrbgspb7stSYAaA8fr/fZe4z09U3Fgx6EQ8zV
	vEUKNWmiqB7f/ijMipqx/jCRQZ6FXMwD+c+PZfwtXDWwkVp7Qiai2wm9wpVVYW//xJuvGAhoRTw
	SHDmXEscRxU0H1fi3z4UH0gNqePMc6yEb6Q==
X-Received: by 2002:a05:7300:8623:b0:2c7:8e1c:956b with SMTP id
 5a478bee46e88-2cbfc16eba8mr1628403eec.4.1775336660175; Sat, 04 Apr 2026
 14:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404121610.1956528-1-mkchauras@gmail.com> <20260404121610.1956528-2-mkchauras@gmail.com>
In-Reply-To: <20260404121610.1956528-2-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Apr 2026 23:04:08 +0200
X-Gm-Features: AQROBzCMgLHa7cowntiZYSKVuRyKGh1fP2Cda-tJiBMZoAlSB8e92ElsqLSq1yE
Message-ID: <CANiq72k1KN68wG_dh0GcTyfiXUyrVUErJ5D8AOaV6z6=sX4BAg@mail.gmail.com>
Subject: Re: [PATCH V9 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 2:16=E2=80=AFPM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> When building Rust code with LLVM=3D1 with -j1, rustc was encountering
> an error:
> "multiple candidates for `rmeta` dependency `core` found", with two
> candidates:
> 1. The host's standard library from the rustup toolchain
> 2. The kernel's custom libcore.rmeta in the rust/ directory

Please clarify in what conditions this happens, e.g. when building
natively in an architecture like powerpc for which the target (...)

Otherwise, it sounds like this is something that would be happening to
essentially everyone just by building with `-j1`, which is not the
case.

Also, since you may need to reword a bit, please take the chance to
use the present tense to describe the current state, and then the
imperative for what is changed. (The past is usually used for
something that already changed in the past, not for something that
still happens before the patch is applied -- I hope that makes sense).

> - Update rustdoc-pin_init to use explicit --extern paths for proc macros
>   as pin-init also needs alloc crate from -L$(objtree)/rust. So the proc
>   macros needs an absolute path

As Gary mentioned, this list may be too exhaustive, i.e. one needs to
see it in the diff anyway. Usually what we do is try to summarize, and
most importantly, explain the "why".

Also, it doesn't seem like the list covers every change anyway if that
was the intention, e.g. the removal of `--out-dir`.

> -rustdoc-quote: private rustc_target_flags =3D $(quote-flags)
> +rustdoc-quote: private rustc_target_flags =3D $(quote-flags) \
> +    --extern proc_macro2

Hmm... why is this needed? The variable already carries the flag, no?

> -               --out-dir $(objtree)/$(obj) -L$(objtree)/$(obj) \

This looks like an important removal that is not explained/mentioned elsewh=
ere.

Also, is there a reason why we cannot keep the `-L` here instead of
adding it in every proc macro library?

> +    --extern pin_init_internal=3D$(abspath $(objtree)/$(obj)/$(libpin_in=
it_internal_name)) \
> +    --extern macros=3D$(abspath $(objtree)/$(obj)/$(libmacros_name)) \
> +    $(call cfgs-to-flags,$(pin_init-cfgs)) \

Hmm... This special handling isn't great, and the fact that it means
hardcoding/duplicating `pin_init-flags`.

Should we move the proc macros too?

> -               --crate-type proc-macro -L$(objtree)/$(obj) \
> +               --crate-type proc-macro \
> +               -L$(objtree)/$(obj)/host \

Spurious newline added?

> -               @$(objtree)/include/generated/rustc_cfg $<
> +               @$(objtree)/include/generated/rustc_cfg \
> +               $(rustc_target_flags) \
> +               $<

Why is the variable moved here?

Thanks!

Cheers,
Miguel
