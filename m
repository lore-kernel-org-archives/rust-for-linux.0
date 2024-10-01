Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F401F1C9B86
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Oct 2024 15:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727795585; cv=none; b=EZ1RrjjR6XOAfXZHAcObqMoMuO+NBHiHbNzBC+W5P4+AT9y8uvybkxRDV0HSxgdTxiRVsv1q9b3Y4551JaQTT2IjWub8V5OURkoKDTy3PrKgKsm9ekpJyH3koAgCxETOtF10uc5cOly3wtc/BEL6+LRw+zsEVyhZ6nnDJR3Umvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727795585; c=relaxed/simple;
	bh=nYAgSONk63xOK7Bor3a7kozbxWLj4K+9v0t4icaPYyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWJX19WNn8C79I0bxto90busAmgq8Qnae1yrbU9n/m4duGUH6Mc2Oo0EH/Bz9px4FmFuY+m0xlQYLDlIsjBgXSbNq/EGA3j9eBf4BbjGCjIcmHHad+/VpBtViVR8HSNnFMZDOf1GSQH3OKybmFOwwbRGG8UkqjYg808Vt+7r+vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRBXUVIJ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRBXUVIJ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5389ef4c28eso590788e87.0
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Oct 2024 08:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727795582; x=1728400382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXScHmn8P9S4rD5O2nRTRJ+gDdKSkJpoElX+zbZagUM=;
        b=nRBXUVIJ9DOffSzxfsdti0kO6vd2bngK5FiNSrYOdHGca0BqLCCg5hSTzW66VIJUCc
         QVJB9rFDlZdfTOv9b54Gw1mJXBQkywAvO6rek1Uc4p7p7XLahRf1ouQAl/h7/JBj/4qy
         x23NvAZDHP0feUaHnEjy5KY+gwMcSo1sDx/Fqey17Ff/bZl+XD5g4MCGWWhOjrJw+TtB
         UHwOO9e86jKVBenmysqlwuyE2XQTf3gdvx1rZjy4a4fBmvgSCWOEOihkjOPVucKGtzQ/
         cwAqHosw+mg2zIAjfRyh74t8XCisMSJoWrIbOEiCC5yCFP/6gy8Vlua6iLC9CJrnkSvl
         ZEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727795582; x=1728400382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXScHmn8P9S4rD5O2nRTRJ+gDdKSkJpoElX+zbZagUM=;
        b=S2kFKbeoUWo+dxew2AvpUqAU5Cpr4yuPQ2qFsY2e7qVbMOFx5d2xA+URd71XDO3cbw
         uksSZyVMkNQE40XJYLiXJ/+4EhqcdxUH6/2ikIFWKw1zs6W1JuRjTu2A3SkROyEdHrol
         +T6LdqFVF1cWnyUl1UEwI7StlSNf/QXeReBjID/8VlXHZvN1IuCp7BHqVMAG3pxo3gWk
         hV1/AS3PGEBIvBwzZtr5nc5hwfCSSXS9cFUvyFk2bG0kXq9jhXBg54mRfiVayJdrcVgg
         hoKgUrDL4qapTHSbvyROebsQkzvuNm/eoekvInMcB70nAompZNQEJDWL3oSuatSDCPXD
         mjow==
X-Forwarded-Encrypted: i=1; AJvYcCV/KkBIRVpm0ZIOGGWmsWYlftr55ZPWdhIAEkm9gXrXor1N61j/4oiDfvfPe5Dymb3nTFKRpYRKNVnAmNdfGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIjqCKVcfhZUYK9vznZTM/wAxUI6lI4E06itjp9RyaqkAVmcz3
	xBt24J0Rzq+Bs7PB/j7k5G7/K+rNfM5TFvopKDukBoocY+fEoup51LCabFyBfcyXX7LlTeSbTqF
	3gPUohMsF3bV7qT01xcGDManPGV4=
X-Google-Smtp-Source: AGHT+IGMhNBqjZ6ijgQcOXn6JFNmxnnktPEIZeD+nygAOPZgju/CctlYZ3G0XVoXICXF9IwanuhOiZqfY4Zocu+x87A=
X-Received: by 2002:a05:651c:506:b0:2ee:e196:1486 with SMTP id
 38308e7fff4ca-2fae1010f89mr288481fa.4.1727795581521; Tue, 01 Oct 2024
 08:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
In-Reply-To: <20241001-playlist-deceiving-16ece2f440f5@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Oct 2024 17:12:47 +0200
Message-ID: <CANiq72nREvDcdMinXgkVtqtUT8k+vHap9EWzxCboensXokvLQQ@mail.gmail.com>
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 1:28=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arc=
h-support.rst
> index 750ff371570a0..54be7ddf3e57a 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -17,7 +17,7 @@ Architecture   Level of support  Constraints
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>  ``arm64``      Maintained        Little Endian only.
>  ``loongarch``  Maintained        \-
> -``riscv``      Maintained        ``riscv64`` only.
> +``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
>  ``um``         Maintained        \-
>  ``x86``        Maintained        ``x86_64`` only.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 22dc5ea4196ce..76843584960c2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -177,7 +177,7 @@ config RISCV
>         select HAVE_REGS_AND_STACK_ACCESS_API
>         select HAVE_RETHOOK if !XIP_KERNEL
>         select HAVE_RSEQ
> -       select HAVE_RUST if RUSTC_SUPPORTS_RISCV
> +       select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
>         select HAVE_SAMPLE_FTRACE_DIRECT
>         select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
>         select HAVE_STACKPROTECTOR

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
