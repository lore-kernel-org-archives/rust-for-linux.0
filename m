Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE6E33DEC0
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384022; cv=pass; b=WxKqkpdzuT2X7nWcXyZ2Zv0Pr2BpCISf/omMvvEwa+oI0zaL9E6MogOYrhhogkZAsYJScHyG2e6MQ5/BvtiIoczVd0UAc8LcnBoc8CyFmn+X4SVl1QbNI/fD5MqPqlxntrKMtpvxd7P6RezB7fR7PT0sCPEOP9Pid01QXd5nKmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384022; c=relaxed/simple;
	bh=mQf2QLV0AOTOBRRP2eJEVNn6uQeg0zDVuwg7hcmXByY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBIFHsqN5aX08U7sPnsVQQVe5G45a/aXxQF5VYGTaoarkMcSKH1/4mt7D3zVh761NJO3icAj0vuDKNwd6v/YfuY9H/MHPeawMpTdakJVmPHto3umWmL1C0NL/wpLHPQ06yw/LkbgAYmCsluu0RQGA6aY/8oWup0XJ1JtKBr88bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uBATitae; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uBATitae"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4362aadaf09so622434f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Feb 2026 05:20:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770384021; cv=none;
        d=google.com; s=arc-20240605;
        b=Vjpsryg7sW0fDRlNQ6CI/vMF40jRstTAOc7U/BRZp/j3SO3YnaaM/NehXQgOzj6h5n
         4SYPSR/l8ekCzp2o+1OjiPD/oaH9u+n7dAKhU2n4dQju9vWKJVa1ADB1dpbGf2EzfEEu
         VAPWJZNg169+ib3RclKu6tHo7J17M6ALnq28Gi8zILshBRnpllbj6dabsObu9fUw0Uhl
         ldMhA6uRPQHzGdPwPq+1B4fzWLk5PtFE7KyW+fB9bPcMd9zStu6OzC2/8FSHNoF7OOOG
         qL44/qSTY7Do+AxzEfz/Bvt2eTox+jCTdziJ2LKbQuk25cW1DLOpCUMzFS4YPKHWKzW+
         kyag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=giEB9d3mcvaw2rNw//LsrV0vaK9o6mJRCg5+UHz3c/c=;
        fh=NrwB8l5E4YIF5C0GhBDkqa9kp58q72HWPRWuVcrRkQk=;
        b=hb1COQWQA11fQRU7mXaPaGdt4IihE3kB7A2/SMuTeIDn+iVS4ih3/voYPNmDqojjvE
         dZ3umgu5tiG4QISZREdiouyPrOZJPAx1yvpzr7lErgoPpJRSCLEgbDl65waIEueiYNeb
         mLncQkn3igKv26oOZkdXCWiz7MuUDwsTKL1lD0ayTMnWlAofUGwQzAjlloHf7O4FKV/A
         8Ep+0bwJq4MTifPmiCl/0MS6fHkxKf1BSdonrKqNxB8wlLb8jtBLZJMCbNtH3a86f0lG
         +JU5Kvp/wgi059/mP/rjujpus2c2tGTEkY/z4nfw1zxoUxEtbCiyh8N5AMcyDfZRSbWW
         MGzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770384020; x=1770988820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=giEB9d3mcvaw2rNw//LsrV0vaK9o6mJRCg5+UHz3c/c=;
        b=uBATitae1E1w9XpKZm5tZignO90/hzJufP5fhgfdajNQ0IQE7Zm1MaI+wQwANwtstL
         M9yUnpEISE6U9/fF6B7Uqkm5mQJyBA9cb00a5hnVqS+k+DYkDEp2ElxlFPYspMo1ek0u
         eIRdXFGOQOIRJjSNbpMoHdZ81u8xgEigOyD8RBn92gIGnZOtMQn3O0jfHW/l/SNVnlL4
         rXlTXucAXwznZtUlDOsVsJIX59cxWEIllYgv926YX/QCYxEi6Mh6skCMn0r+isEQ40Vq
         Re+5Dtoy+L3T5T1xQ22k5eadAnTJNLvN8Ae9+PLEXXPkywfIjU0PpAZrfRrnu0Ze8goF
         L6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770384021; x=1770988821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=giEB9d3mcvaw2rNw//LsrV0vaK9o6mJRCg5+UHz3c/c=;
        b=RbUM7hNpYYyuzNpCzDtRFvgz7TTQAFejkTQDCDMJMmPoeSuqzPem6lvfjQnooaqA39
         uvWYFHs77ydX0FzBqI9O84bzTzTN8pE54hx0HTQi7VIRn2Sjj8EICfBywlU+waP+lncO
         hCpsJp2qIe7U8N84P+5ER2Qz7WSjrh9kscMiOGw4kBUQO38mXK8FclyT8tK6LuPFwQdn
         DYGvY9t/ZLllSzUd1w9Pi37h+oi1IM61F7N74HR07ZP33rm2YdXztG2s+GfOBJwkRZKX
         T7qrogkQd8WiOfwEVcs3CBnx9gtG9QSabORxV76zJ2WYe1JCxCFvfOtZaT6X9Z5btE1p
         i4ig==
X-Forwarded-Encrypted: i=1; AJvYcCXZePeliTP6JhJWtIro+TEkBqx+4ApkhD/BG/x9Uv75pseMVNWk0TKKcEU5C6zOEUYMsdeL+NZCMaxN8dYVbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQon4TPJiAf/2R5D3kh/NkZcebLFKd4DT4sTAn0DVKmKxwOjlA
	jOSh2l/lApvJxHTuDTFgLgovkQ0MulDHzBF93cFD2fVkzDn73yXn84LNi2ewJyq5SX3PoVgccme
	t6Q98ja8kqacdcfugskJqqT3KRNBSST1LqMgtNAeU
X-Gm-Gg: AZuq6aLgrk74AgSlNpOh7laosucYC4CgCkoddLoPqwP2WNE6vhBCgnVvTCcmN9cxnEJ
	cxoWM3hHHHvFDknt0V0+X0UgDpDAjIEu2auNjZEg39P25mYJwylA+SNpkISsQPCGgwrcBCEQt08
	otGNmggbsH9FEoOG0sCwLlasQWKsH4pQzKZ1IQ8LLsJmTmRagAruZrXA0lZgGb9XmEdjNyk3//J
	LUuH4laZXXeWAJsXLbGierf9ezuTA3qtzBQzLc544e5FyQ5QvTlZ9bnfOz4EdoRSkjgmah92RKx
	oGljBK5oXgYxJfuJR7aNeQr/Dw==
X-Received: by 2002:a05:6000:310b:b0:436:1973:3b05 with SMTP id
 ffacd0b85a97d-4362933bdf4mr3662885f8f.2.1770384020241; Fri, 06 Feb 2026
 05:20:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205224706.91996-2-dakr@kernel.org> <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org> <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org> <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
 <2026020642-consent-showman-25a8@gregkh> <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
In-Reply-To: <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 6 Feb 2026 14:20:06 +0100
X-Gm-Features: AZwV_QhmeQoam3n0jzo1uBFXlqRkMsie5VCc-bSVoXtcXTIAOau4NBdt9NeFGMA
Message-ID: <CAH5fLgifC=K1wssW-nWR3wvL9OHEQ9x2hPd2+ENj_mqtgEhyxA@mail.gmail.com>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and devres_node_add()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 2:16=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Fri Feb 6, 2026 at 1:34 PM CET, Greg KH wrote:
> > That's fine, because the rust driver core code should also be built int=
o
> > the kernel, not as a module, right?
>
> Yes, but the Rust compiler may still choose to put some of the core code =
into
> the module.
>
> Especially with generic types and functions the Rust compiler may move so=
me the
> generated code for a certain type instance into the module that instancia=
tes the
> type.
>
> For instance, even though rust/kernel/devres.rs is *always* built-in, we =
get the
> following error when devres_node_init() is not exported when the users of=
 this
> built-in code are built as module.
>
>         ERROR: modpost: "devres_node_init" [drivers/pwm/pwm_th1520.ko] un=
defined!
>         ERROR: modpost: "devres_node_init" [drivers/gpu/drm/tyr/tyr.ko] u=
ndefined!
>         ERROR: modpost: "devres_node_init" [drivers/gpu/nova-core/nova_co=
re.ko] undefined!
>         ERROR: modpost: "devres_node_init" [samples/rust/rust_dma.ko] und=
efined!
>         ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_pci.=
ko] undefined!
>         ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_auxi=
liary.ko] undefined!
>         make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error=
 1
>
> However, sprinkling "raw" EXPORT_SYMBOL_GPL() due to that is not great at=
 all.
> Hence, we could do something like in [1] instead. I don't know if there a=
re
> other options that may be better though.
>
> [1] https://lore.kernel.org/all/DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org/

You can use #[inline(never)] to prevent this.

Alice
