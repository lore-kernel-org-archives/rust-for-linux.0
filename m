Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A522853EE
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 09:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022071; cv=none; b=Y018/DXknTtDG44PajbILsyarnUA+kBFH46qXiQ8xCM1w+Umu5ZNjIp+1oswDznJgqDXpCG/gK07yayI+ciOe5Q17oNCRi4BRa1ppJLkSqvp8ew+xk5MZ9lxFelBTJntDwWcoYLRdFThw3p7n//AnTPmPqW6YLhy9RJ/zunOtRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022071; c=relaxed/simple;
	bh=hLKUufOKq2/TL+pONPnhEwc3yGdP/dz3A/DBg3KQZ/k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H13aRKAURx0/PzgSEXtSWc9OstS62883OlTIz52lRWppZpXyVCyVqmxfpFG+EtOoudKhB7itIjPMvAE+jcFNTubx+z5SXIhIAHnxhKlM95u414u9XSUYwehqGmwAJGXiRojBupaPsLViU+ysb7cfaeq4Cih7QGi10R4mc5L1E5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THlHo0Gb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THlHo0Gb"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d43e09de5so4312824f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777022068; x=1777626868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSmDvRkfSjghcrtIGnXq0grda+xm9HI4mnGbjcUNF0k=;
        b=THlHo0GbGR13/Zx5CTXsKXIHLyGZDJ3J5YBN7qbf6XpcMJiGDZfDBS4ofdxF1jpbZ1
         n2f9Cek4RmVOeiFAkFjI91lX+uSXSeLL1iXDtmKNi+KV7y6SPRj/hRIdvBEhIWzkxoAy
         XnsYFVrrrplmfJQ9B3sduLBsrz7pKF8zV5EZ1JHvRs9wIRSxOfQpa5th2Pn4B9JEakhb
         CnVknD/IINyhwkiQ++JiUSUrxHSm5FcR0mRKm9JVkHvl2nHlCW2Td7aC/X9qN3UFnqfS
         Nl2FjXB4xtd3+18lDweR2w/J2Qo1moGnkduchcVN7AifnrdnKgQoPn8HRixe9h7l0ps5
         ytCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777022068; x=1777626868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nSmDvRkfSjghcrtIGnXq0grda+xm9HI4mnGbjcUNF0k=;
        b=ap3tGwjdxY60GGivT6FMwWT8OFl8PV+UPAmUHoIk3W4Ze1agF/2M3E9st4ClA2pocg
         SRrWUGYyDGN7RLYOUpXFq9z6M+jiriZon+wXPbC1cFMndtZ0aeprAXlVwMwbSWEU4KGU
         wF8TxFgq53dsmWkErLzNYWQHm6pmCS3s/R/Q1l7T0IlOOMVy1e2giGMeWTAjo8W53KBX
         tXZuM0+FaKk33qNkHg20sUyxnJOjwzs9G1jm2z0Es99dJlEwW0BHW4aAq0SMsA5YltUk
         Sb02rc5MO+ASNxlnpY7WKIMcwUXMRRU7Js1SXvLaJw+wudSwHDHKOWD0JfxKb1wLYfK2
         xtyw==
X-Forwarded-Encrypted: i=1; AFNElJ+LYF4wcm5kO+wjoyganl+jnib+3gnLml4mEuR54j3HBDJwz6qh1+meiiM+986kEnuPr3KFCn3KXI2wzUalbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCZjGShsqPfFEzVzUbpeQAnyhvmPQSLHKeyozjUcpeT3VpPbls
	Qpdh/qfvh4t2c28PE1hi1z2dIjZEsTSpyAzDLWjo4WfNco4AVWUSyFJG
X-Gm-Gg: AeBDieu20uU0Zyuw/3AHh8mQan1aMtYcH/mdq67afzbxZrDzqrpMwwRmQBOI/4jrWqe
	P8QyXgDaxqcJqTNw8TVcTjSlM2kJJFQ/wB2GldydHzE1MFiFucS3uKekRwNPYm1tHfRxEACBWHl
	vtA+e1qlnuRwESpn3oiGc1pbD/DylMs+D0fEgEvRFeNg+dn3zQqWghGUATGqQvJvbd3x4jgGfzP
	LvMnahe0BRjSW0g33TjLIqq97+BdPCiCIWTI1U/DBK1b60/g8wGC8LZ2TObcUJY40nQQt3WQuZr
	Ji4suDdl1+vMoPpjiWvV8IBbAUQYXcn1zjmbecIm294kGNpVUax3GzBQcHjZbcBKL7FMe3Lx5lY
	rzh5iLZVaG1ihvCUxufv/vek/adK/TYsoZJ+V9Hf8HV4RzOX8hIv8lMUdU9Y9l4DILE0flVzWcd
	ORoegBO7RnB7gBITQa/08higA7SKaHeYlMjcMDv3Bkns9V35EaGXyIJg0Cww1PLFInn1RH4LuEM
	Ko=
X-Received: by 2002:a5d:5f84:0:b0:43d:7783:c684 with SMTP id ffacd0b85a97d-43fe3e1e092mr49352860f8f.43.1777022067498;
        Fri, 24 Apr 2026 02:14:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4412150a092sm23750898f8f.23.2026.04.24.02.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:14:27 -0700 (PDT)
Date: Fri, 24 Apr 2026 10:14:25 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org,
 ardb@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 tamird@kernel.org, arnd@arndb.de, nsc@kernel.org, simona.vetter@ffwll.ch,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, Link Mauve <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <20260424101425.6bde0e17@pumpkin>
In-Reply-To: <20260424054742.45832-6-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
	<20260424054742.45832-6-mkchauras@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 24 Apr 2026 11:17:40 +0530
"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com> wrote:

> From: Link Mauve <linkmauve@linkmauve.fr>
>=20
> The core crate currently depends on these two functions for i64/u64/
> i128/u128/core::time::Duration formatting, but we shouldn=E2=80=99t use t=
hat in
> the kernel so let=E2=80=99s panic if they are ever called.

Ugg.
Surely you can make it a link-time failure?
Or change the underlying code to avoid the divide.

	David

>=20
> This doesn=E2=80=99t yet fix drm_panic_qr.rs, which also uses __udivdi3 w=
hen
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy, but at least makes the rest of the kernel
> build on PPC32.
>=20
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> ---
>  rust/Makefile             | 4 ++++
>  rust/compiler_builtins.rs | 6 ++++++
>  2 files changed, 10 insertions(+)
>=20
> diff --git a/rust/Makefile b/rust/Makefile
> index 2a5428a5503d..ee11fba7a03d 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -616,6 +616,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(=
CONFIG_64BIT))),)
>  		__ashrti3 \
>  		__ashlti3 __lshrti3
>  endif
> +ifdef CONFIG_PPC32
> +	redirect-intrinsics +=3D \
> +		__udivdi3 __umoddi3
> +endif
> =20
>  ifdef CONFIG_MODVERSIONS
>  cmd_gendwarfksyms =3D $(if $(skip_gendwarfksyms),, \
> diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
> index dd16c1dc899c..fc6b54636dd5 100644
> --- a/rust/compiler_builtins.rs
> +++ b/rust/compiler_builtins.rs
> @@ -97,5 +97,11 @@ pub extern "C" fn $ident() {
>      __aeabi_uldivmod,
>  });
> =20
> +#[cfg(target_arch =3D "powerpc")]
> +define_panicking_intrinsics!("`u64` division/modulo should not be used",=
 {
> +    __udivdi3,
> +    __umoddi3,
> +});
> +
>  // NOTE: if you are adding a new intrinsic here, you should also add it =
to
>  // `redirect-intrinsics` in `rust/Makefile`.

