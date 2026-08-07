Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D996C3750A9
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 16:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786121921; cv=pass; b=P6sKApw/0EL7fBJRhPAWJbeXvT8ewoK7WSPpB+dg0ww9Qv4gaO9PD7ORgoVp/7fDjI1/1dZ29zFYHupJyYP36hBtTcTzBoYoUaPn8KXsswpS7VjduUqepg9wYnf9Nw3/ZyeM/k02OSt4JTu/XG5ffvJ080iV2byBDiI/95DvVNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786121921; c=relaxed/simple;
	bh=+tCnoMwAZEVH6hwh/t816bcFUV2OI7xzKPLQHdVVPMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tttk6HXB5ntchNvdcTiMcLdnZ6QC3UigJxc7yXR8BPl0eSaIQuLrC3qKLqZMIcwUWTgStpyAkBSd29tgifhjeYSvvQbeFFIFgL+d/gA8x6vwvxbJWh9pgIYolVPTFlWTGsn8rlRwj22xP9bVOd5DMs/bxBirAqZ1DkWkpgnLRRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXI5rzhw; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXI5rzhw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ccdce28edeso4790715ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Aug 2026 09:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786121919; cv=none;
        d=google.com; s=arc-20260327;
        b=dbCWDikuYVcSGuWn/d5EjFKaQyEKfcd/yU9hi2udqiqlDosedf6/LAKdsPlqtV2VFY
         rEA5T5JMj7Jf0zPjNFWNa2TUuc80rGFyNFGdSW/X49XyompN2ZJZ06U/8V5TbTrcoQAZ
         gu6wGYVlM11REZipawLiLctOsrf/alK07jxxqLVD39DamZXBnfcoxw4RkBpDmXIGeqy6
         T1GMN/yjhx95HcFGlifOscwJhSGzMzpQfuTSpL1IxBc56QfD/l/0XvpKayH80Fb2+esm
         u4EHe/hxbq2xX2eOJfaH+LEjwY5TJBUkI0rpGZOeFuA+B1dBeXcbp1DGXdhhpbWww7zk
         asQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t5/8EoE3A4Oj0hVOSm9+FPla2LLANPRLURLGqzSc/qs=;
        fh=PdqyO5XngU0XGhYf0t7hLansGS+HuHjFAgMuVwhbGJA=;
        b=C87eErhk5WJ6quNRmEge79X4W/T72afLWSRsK+Alhfc88RWP7ORebiO3oivk84SY9v
         qLfd5yCD8siSekeGNwFqMGwfl6Zi1QAbGwpgyyaFn7W0A+h/Yxa/InVkD9RmFN2WSBpG
         mkyI6EfJvea48fNLXbEPdv0ZNj2LbcJgUZ9zK1vsmJDilBqQzCNNs03CWIOMsWWOd40G
         O+UWmoFH6duVEzzW+JxTOaW75vz773NH4NkCkKCHhC9mOp4o4FXcQH40AXmkrU8sWGPs
         ALAj7L4Eg4YMMOZ4TlWJ16DwI9BnBpyI1FP4zCn00gUhl9iGe4P/ePCrryMfTwBGa45F
         q/8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786121919; x=1786726719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t5/8EoE3A4Oj0hVOSm9+FPla2LLANPRLURLGqzSc/qs=;
        b=VXI5rzhw3+KHlnZ9ng+7Al9FT+sv5GOO4owkoUjl3x7nX0mQthbzdav8d2OtcdJrPX
         4qmkJTVQvUKEzD4Q0/xqqKM7F+4d2WppTp/jZugX1MpaTVu4jkjC2Cm3HDRl/QTsZZws
         EvyFfiHpJ//gmti+nybh4pUMlr4L/4XwzNRKdlkatNslHqX+zmcq9yFQ4Z5QKTFLwZIv
         r+Bkb5JZgNstwFrPbCfFcMY7jD69Jsuq0eI/h+3sNH/r4j/PuRqd/Yn60/uWSoNSZSup
         yobrExJP+PiN+RdpY/uNffjBHSg3hJOdO2OyfG54xcfy6ELjOIF3IbmiiKSAOHqmFvFn
         gO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121919; x=1786726719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5/8EoE3A4Oj0hVOSm9+FPla2LLANPRLURLGqzSc/qs=;
        b=o4Xs2vnc7l3AzE5Zgvc0vNRp0N6SqCMvOOCYfHjghSaMXEmU5o93AuXnWAqzxyE5ak
         epeL2aGrKpz/Y7Pxl63/CX5TEFnpBb/BZYUYpxFOCSDEhyPKDdDR7RytcEDqumg5w1VL
         J04rXoPfbcylv++M9xH6H0PnlRS2AK0wX6gIZRSAnlHQk4YDjdoWfrDHqBVIdonyFaE9
         Pt5rwWBRBYXReZTPSL3Dba017khI1mi7ncDMqbBbDG5+iBQPf92E/6+RZdex0B/BrcZz
         eI4GIJ9IKlHk5C+1Q0ntOKF/aLxhsZv5dVQUXzlzEGP+UR/9U4FC1WfILOHipx0ehAVv
         8XVg==
X-Forwarded-Encrypted: i=1; AHgh+Rqh5Pxs0r+D+GiHZ9v500gYUahVOS1MtMx/w4anI8+YN9ESz7a3uCgJb+OesGUc79Vhpzt+NoSXNgtZym7k7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+UFDsW8odlV/JYSzJlQPPV6OXOjKV6ZcwwmfSbmP/IWOUAym2
	ej7DZv32pSqcPzjB4w4WZ1zLEue/xJcDteRbJpx2IQ5NwDckfJaOZeEZjW6/VY4JAWIiT8wOj6c
	Cn2+tDP2ASByzMzA3McBWzbVxIpYWJwQ=
X-Gm-Gg: AR+sD11xROD6LFnpzzU4RACGZoa8pw7+bFBgzoLas6KcztIyMC+SY4yvQ3UzgJzKAcX
	qBJWwt4XVhENaWghGC6t4tg/Gub1s3EYyvixMGpjk9sf8WFy24JZkv/R/3TFxC8YClVX2crsNZY
	aVi1LAoAwfsVxQ3daZ1qLwyT7qOuqfuAUB9jxW1LkDrvPtauM6zfSiOODBJ8woPbFZirEPNXger
	gH6yQIUKgxWJXUPONGE6OuoL0h8yDfoXMCW3DeOx4GAt3ST6sEfpFjmjWnGC9pS7BZzI+ugfEUZ
	/9iy7mbw4p65hEMpDfj79bcjfEwJv4kz47td2dqgjWHbxcD/jo6KU1/SdpVq6HCySx8werT6r7f
	wUGaEDINd4K0W78x/125Ek0fY0loOjuw1yT1pYWqtJFH/7d9X91bOL9JS7rM9
X-Received: by 2002:a17:903:19cf:b0:2c9:fbde:ab68 with SMTP id
 d9443c01a7336-2d0caac211bmr212771735ad.3.1786121919232; Fri, 07 Aug 2026
 09:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807151715.7247-1-chang.seok.bae@intel.com>
In-Reply-To: <20260807151715.7247-1-chang.seok.bae@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Aug 2026 18:58:25 +0200
X-Gm-Features: AUfX_mxB5cUeTLsklAcFAEo7uDCbOw1Ap5yy1mkxNcthyEJAuCZGMoHk7dyfwLg
Message-ID: <CANiq72=bEB5-GvvroXigiCVtHjGtkhs1ARkk+mDbvjNAR4XKVQ@mail.gmail.com>
Subject: Re: [PATCH v2] x86/build/64: Prevent native builds from generating
 APX instructions
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	rust-for-linux@vger.kernel.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, ojeda@kernel.org, 
	nathan@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, Omar Avelar <omar.avelar@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 5:43=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.c=
om> wrote:
>
> Omar reported this broad concern to me, when resolving a separate issue
> with his custom module. CONFIG_X86_NATIVE_CPU=3Dy allows builds to
> opportunistically emit APX instructions when the build host supports APX
> since the commit.

I think this sentence may be cut? I guess this refers to the commit in
the Fixes tag.

> For Rust, APX must be explicitly disabled because any backend supporting
> APX may otherwise emit APX instructions with target-cpu=3Dnative. Pass
> features=3D-apxf through the generated JSON to avoid unstable-feature
> warnings.

So, just to confirm: is Rust 1.88 (with a new enough LLVM) enough to
avoid the warnings? Maybe a link to the tracking issue would be nice:

  https://github.com/rust-lang/rust/issues/139284

> Support for this gating also depends on the Rust/LLVM combination. Rust
> 1.88 introduced the `apxf` feature option, but versions prior to 1.93 may
> emit an `apxf` attribute which LLVM 23 or later can interpret. Restrict
> native Rust builds accordingly.
>
> Fixes: ea1dcca1de12 ("x86/kbuild/64: Add the CONFIG_X86_NATIVE_CPU option=
 to locally optimize the kernel with '-march=3Dnative'")

This looks like it exists in 6.18.y+, so I assume this should have:

Cc: stable@vger.kernel.org

Thanks!

Cheers,
Miguel
