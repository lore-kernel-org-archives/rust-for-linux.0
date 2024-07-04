Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771441A3BAE
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 08:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720081246; cv=none; b=q4a9/MkZhmdc6T//MCYQtcMnnRNHPYQfa3d74T8vsianOofwXskJDZ2kocBZSodSUiBctViK912dcfOg58DxWpJamUmJGLXV4yvPkeQiMZSEDPUMVfeiXd3H9eQxWTgCGZdBaH2xnvTSt2z9TXahIkMrq+fZJ4o3A/lhbl6Fctw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720081246; c=relaxed/simple;
	bh=lWxpE80jJmqS6sCZoSvNul+Utq90SiJ8cm8FsIPCszo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5oTsJAcB4ZacvaUslMyxy0rawIBcrTPPuhAuQ33aPWGHNFC2lM9NJBQ44ruCO1C1NnKfSdn8SYy+rypkr42lbt2d1zkksNQ4XaEKyOlMcdagWe+rFMzxTXOL+Y3dWy6icnmViZ3tHsjfNrCKLq4N6Vj6dDlHwJwRPwlTnf4PtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r9eOHOlu; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r9eOHOlu"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-36798779d75so295355f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 01:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720081243; x=1720686043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+arIzU3LXYjgnA4ueWO0skmcvyTi9fBY5ba/c7i1+hY=;
        b=r9eOHOluJelwx1ZCdZ0izF6hf5o2N8eIT/irVMpi1aGDHlKlEH8KecwwjbFV8Yhwvr
         tacPZMLa/69qOWrqra2PJ7AhJUFmU8m5RbOogZ2OCKbkM9SyI0eCK3ct560ldMFrU1Dn
         5VUEVugNEjtXIoY/236/Ei6xzaRSZC16tHVdohCxjVSGyuD971mJwLTdWiLeZSGY9njw
         3E0uhq0PYMuQtaR/mgOYCd1lSNMhCbVLKR/Xb4eqOpPbptUwaUi7eYlCPeYJ39U98BOp
         AqCbn9ev3EEu4fg8r6TXcM3zYVl9sPuVVPx0OhT+hw0DeW81fZzb8CG8NqCSr+809e0c
         x7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720081243; x=1720686043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+arIzU3LXYjgnA4ueWO0skmcvyTi9fBY5ba/c7i1+hY=;
        b=Y3qqaofofl080sk+B+S1SdOQpG2i0CCONKBgk7PoSRgWBysRE3b6A9ZuKN1u9pc/co
         +hkhZBpe3tvBiBTvS1CV1KjjqETDUNDMpujj6JHcdadsBVz8rNpdbmylWcJoaVZCYwj6
         vfzKnkozb6iO7U94s9YkAr1aNXeFy/An2seQ1H5RPWJkxZPdrv7bNpiib9TNU38k+/0f
         yYyWUXrkfwe2h0CaPoiGWQemfVGJzjLCQRAM0KzPdRwW+kErERoSPxzV+CAJDCossGrc
         lxXw4MIcv+8ckfHj/TxGM6mSo/x5P8zYQgO1BwW9y8amWqy1FstnXCkqF5kgsRACiQhH
         JjLA==
X-Forwarded-Encrypted: i=1; AJvYcCUFng646doOF8JlEKp8QzHChnct3StutnytZnjz4Bo2TU0utwkT4tXkqSH9GmPgVApZb8708pCz0EentsAYDtMCSQD2DcbfLiTYCrpo/Q0=
X-Gm-Message-State: AOJu0YwiiZQUW73KZynBsS11gjS1Vvbf9M2UmEMaX46k/5MMOmjPOKEn
	BjinVaSK27LTGflLjz7eUvfnGevArF5ACwmi7t3PZFCgtb1ALL3/qVHyulPtcyVboAjCK2/E+XG
	uX9XRV35ekKX9E/39nNaFPn1uGsMApjirMk2g
X-Google-Smtp-Source: AGHT+IEUZz5voZk91pUyiEn2nST6nFZr9MCFzx9zPoVVjbBLSKdNuK1O5hinsYLKbZaQ20WAABfGIk7cKXNlhokMqg4=
X-Received: by 2002:a5d:5187:0:b0:367:927f:980e with SMTP id
 ffacd0b85a97d-3679dd71fb5mr857005f8f.63.1720081242517; Thu, 04 Jul 2024
 01:20:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2dbd1491-149d-443c-9802-75786a6a3b73@gmail.com>
In-Reply-To: <2dbd1491-149d-443c-9802-75786a6a3b73@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jul 2024 10:20:30 +0200
Message-ID: <CAH5fLgj3z4TMnXz=zygLW9Fku6N6nX0jyw2b0uvg=Kat-d-o2Q@mail.gmail.com>
Subject: Re: [PATCH v2] arm: rust: Enable Rust support for ARMv7
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Sven Van Asbroeck <thesven73@gmail.com>, 
	Geert Stappers <stappers@stappers.nl>, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 6:04=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 71afdd98ddf2..9cc10e32e8be 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -150,6 +150,7 @@ endif
>  KBUILD_CPPFLAGS        +=3D$(cpp-y)
>  KBUILD_CFLAGS  +=3D$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $(cal=
l cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -msoft=
-float -Uarm
>  KBUILD_AFLAGS  +=3D$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -=
include asm/unified.h -msoft-float
> +KBUILD_RUSTFLAGS +=3D --target=3Darm-unknown-linux-gnueabi

On arm64 we use a target called aarch64-unknown-none. Should you also
be using arm-unknown-none? Or maybe the arm64 target should be changed
to aarch64-unknown-linux-gnueabi?

Alice
