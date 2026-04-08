Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADDB3A6EE2
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 08:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775637670; cv=pass; b=k+jOkDeNa1ULuasPVsk1cnDI9w/UzEmtIuakmfYSwgDMHMzqsUG7/9zjf+CMCHzYG+XbRnADwM9w/NgA1OrbSW4et07dMWegR0mcQafmzw0YWBMQEK1xwFa/BUu6K/ruSLqnDU1u35weu+MiAASMERLTuoraVNqVpY1fAv5edfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775637670; c=relaxed/simple;
	bh=ds2d105585T/Lxee2FL3vcHPKCIjYRWRnrmiikWWZjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rA7cKsTiTHSBT/t5p6vEovQa5FB6yPzfB0+DbaP5URdfXSBCFu8l9WNQh/hbEopfw71gBEJ0fJLL3krbb3Ei7MOcJpnGkpWkuuGjgxaDUipXJdJBin2LVzd71o8R08M2Enint9BYk09lrwmaaLbJzwKlSA5nFzBnC5PUBGjikqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2PZQZdB; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2PZQZdB"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12a70b4de9bso205019c88.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Apr 2026 01:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775637669; cv=none;
        d=google.com; s=arc-20240605;
        b=JE1E+Eax5ZC1zCurS0xJsY9ahd4MqkOOt15eSryMO2geqMXKcvdM+pDmb2vsEurVSq
         iSpdYemBltgVwIpLGmzQvmLadrfu5eiDM0xDQZMeZIlHiY4NK302K4sVonFquG8Xw9GG
         pcG6hz24VRGo42jLyfRjr3R2YcMw58kK75wTLktefrG8CcQ3MTYJmgodmZpCBNLtBfca
         Bn2JzS0Rnzu2WxAPo1ZcUjF+ZgxChd0FvcQ7Jb3a97VQ/WDSyb3ST6q/vlnhvZfjaNn9
         SCRS3t3Iu2yV/dahvmyAHht8tIEg4GLID8C3qEsAvNSCZVDEYU2oQaoNaef5uaWB9/74
         vg5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ds2d105585T/Lxee2FL3vcHPKCIjYRWRnrmiikWWZjc=;
        fh=e1ZOoagF2vZgkG0joVXCJjSbLzYDzc3TyyTDuDtdH2g=;
        b=aDvitCXYOEOm/drgkF/cvY2hkMLz/by81BRskAWTsY+wQBnv9uEczjCcNFAWgqUyeY
         69fZIe3qr3fDLHEU1xlvrsGt559ieMWTrGElv8KeqKtJZweeZu1UOeA5tyxDM9aaVZIG
         tqvjePLpEqykndxUHplHzrJtX1oLzCNN5ue4t41nKWi2NvwZwsvf2qHaLc+C2A12pc+o
         PHW0WOT5h0azLhGfAihJYZUhyIRbT7q3hilvVIspMp3FFcDAlztAWRdKP78qxMhyUFeo
         J49zarb/FlZ34sCnq7H8YruDb2k2YqVUHPf43guMEo2JxmOQHNILcJ0FwwNUrAXua5Mr
         Etxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775637669; x=1776242469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ds2d105585T/Lxee2FL3vcHPKCIjYRWRnrmiikWWZjc=;
        b=j2PZQZdBp4WUV35SST1I05ZtbD5WmZ2HLgyib6HIn0vnlCR+UoA58QOe+5gGPMykgi
         lwT/m9r2Y11YU513bfASvP6jvt2KYRt1eNmEpaRxiDYEMLr2ANxSe9eQ9Sh/01ZD4Y0M
         gfFkaEP3UWY55fSAqtvOXdCdp/nbL+xfqfXKPEMIeRVWnnxylPkuTmn888slYe0ICD5q
         1ralUa/yO+1Efs5fG2pJ6jh/lM54WVFYx5utceRGCPLV5d5M6bPXYg1R30eiT0M5d/U9
         yH3HWM/w5alEcWTxJQGqgDpqqJANReVjSeSjj/zN0lp/uNkbmHlTpjBozF36HR/vMGK4
         G9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775637669; x=1776242469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ds2d105585T/Lxee2FL3vcHPKCIjYRWRnrmiikWWZjc=;
        b=llVtO18fUhh4mjJ7BZzEHqwiJbtTbJjXLJakanCfJrVL9LkqMMlubebxJk6M3ijVdT
         YwS2zhjR2mPep5ZxbTH+O+C9ZbKrIoWf4v7n2iriA33ss3/e0yJis8RwE7tpM014EiNL
         99S2dZtm0HNsXNNJO5XnaNSWRCTvQxpWTfK7atJfxfwWvkrIKMDkeDxeD/6xOtdBxXZQ
         DN2gb/jZeXyEt5oXQE04l2L4AV5w3ossAvHTjUlogqmedcW1b2xSvVYeICPNoYS08m5+
         /Zr5CBEuAMZGmVyJaBYJApz0KcoDzc0mXVIQItvw9tY7H5CkuhAQQle9wemrFJYoUvmf
         TrSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU5+zpyppoX7Ml2+a9BD0fV1JL7PropCVwBKQzMLCjhxvcvHqznnPXrBAFViBWM53muwjf1IsoU7xGdyfb9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRTuLMEBtIordAJvvUvB0JtkuQgnmFOEH92PVF3tjmfllaSi5o
	IaXQXhS8hVi3cIzJTxXPZvbCa5O/G+e1ekp6N00WJX4yxZZcM6J750NlUKTMcWC3H5ptYIcfWx1
	7kJD3qUs185pyJBFbPOzKhOsFLxI+bZY=
X-Gm-Gg: AeBDieuZr/lndAfcRuSe8uTtNZadjheIPyZX/Re+0twvvsgvz7Uihr/NEvIurGACxNY
	h8DZUC3YGRgm827Rm9of9BVAs9LlUDaoByo0fGzCiSkGeaYABYl1pgaiVIxq+KQJjY6QJXA46k/
	zMWlgqzHDNoPAaL5QUSCKB4HF9UXrf8DZyYGUSkgoyPrm4LBUPOVmZpg8Pc+eDXfDyVSxbxeyvG
	xokrb7Lqy7VwZdFyJ5CtZBiBylVwS6+uZk3CnfyexfjOrRvZ21IIUCSkC2QOOpYXNJKbhBNVCEd
	zguZqm9VcNBfT5JVnCBmSMw4KRjvyn2YaNdTa4Toow+auwf41iEBjctNOJROLEThiTA29aJbeyJ
	BH3bHPOF1qIrRzIL2dCK5IaU=
X-Received: by 2002:a05:7022:4396:b0:119:e56b:46b7 with SMTP id
 a92af1059eb24-12bfb6f27dcmr3976967c88.1.1775637668815; Wed, 08 Apr 2026
 01:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com> <20260408-kasan-rust-sw-tags-v3-1-e07964d14363@google.com>
In-Reply-To: <20260408-kasan-rust-sw-tags-v3-1-e07964d14363@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Apr 2026 10:40:55 +0200
X-Gm-Features: AQROBzBFKYcW2G2u6qwyXoEByJvTB9sw3RTtXdZetSya5QexuQ_pmSB9sEwicQ4
Message-ID: <CANiq72n2m0N6FaGaCF6J_bm99ysJxhkLLmLz8uwkgXV7riAJ9A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: kasan: KASAN+RUST requires clang
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 10:32=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Kernel KASAN involves passing various llvm/gcc specific arguments to
> the C and Rust compiler. Since these arguments differ between llvm and
> gcc, it's not safe to mix an llvm-based rustc with a gcc build when
> kasan is enabled.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

We probably want:

Cc: stable@vger.kernel.org
Fixes: e3117404b411 ("kbuild: rust: Enable KASAN support")

Cheers,
Miguel
