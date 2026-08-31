Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9F849CF5D
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 16:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193983; cv=pass; b=uLdbRNYJruWDq7M64Ekkn+PzuWVLrq0d/h5cgl51ZXzsJhFjyWQJmWPuRX90sl0nRtudJyBCFMHKX5cm0v3VP4b5mi78fYwRc3igeS7/SXyU2VzKNUSPl+Y8TzXyZBGyWTfYQXGVjOG06sPeI+ksl+amRzEVgpRK3uuWisyq/5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193983; c=relaxed/simple;
	bh=WAb2HioeKt8yQ4+e2mWpoQ1jc7oIFNQVMnrcZ1VNVk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/CAcnW9ceMApQDT2W3nBAdbr2c/zpiia6q74hO/VUBRRMLNts97W1e4u6LOVDVmH+bTmxfxUdE0fvCFdUNSOOHGx/NMvv8VZGgJP0ZKXoslVI246jhI/ZioYbW+F/FzTrz4s1A5WELxwVT558+kduyvpPCcyVreQQpXDQ+gI9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=refBrwGZ; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="refBrwGZ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d6fec3c1adso4472125ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 09:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788193981; cv=none;
        d=google.com; s=arc-20260327;
        b=Ji4BkOs4OxG0N05cWMUzoZ6GoVgNrD3zZFJwA4b6ac6DE4WG3VD39VOrwbpbZporiG
         tzCZ3drpFQ+flpSMd2ybSeJbI7jQHw3a6T49yfk9EiucB9e/7HCeXZJPyT+FPEEMOa7l
         hfM9EDMNDWuXhuu3FZnssdoKBNlS2HbTtU8cLfxmzIZQ3BbMLqj4t9T2mPAQX6k8dMpY
         LfVZOxgarqbLiH/ZoPaevDDCtLILppANie33WSZwLysaaf31uJZyaPR6uzmfYlk4WsJ3
         NAXb4fglcu8k09Ws+13DdcUyCxYg82F7+aLROJCxbw5eXB76YChc05xDnIQD8X4iUvUt
         4IFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OJzwv1wFVi53NEXZo+hKmNYNH3NbrWf4sdQ3Ijd6Mi0=;
        fh=mG7pZmW/Fd6aS7vmXJ6ZTd4EjFM0SRXctGFcR2S3o7w=;
        b=Mf2F1INdV7Mh9lwb7kGCjdWXtulPo2unfeviqMDsm2k7HI2/mKlQOGnmDmL51mG/mb
         hJNGI6NxW2wroZQQR/RCNMjBSEo1TWdJonmDSRNwoykqClBPWLgujgT1VT9KedgCcDjj
         GCdHwrB51pq3s8ntGLiNJE4FispVjyJXaqgFBbgZH4Bla7PFUe9+tP/U9YoMIGxqdCOi
         /eESzYzesx506Jxuy2LFo9+sYJikfOczYMeEGdgBeFMT+84Q5xD1FIPA70Vt54tWUW9y
         mf9toRmOYvobWEPPy6yQQzzOqDA62yiaXi2DZTge+I2O2GQfABxXuyLx3oirwMTR2WJt
         mJiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788193981; x=1788798781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJzwv1wFVi53NEXZo+hKmNYNH3NbrWf4sdQ3Ijd6Mi0=;
        b=refBrwGZujpvTpihy/NZH9EfEJJVQmjGZhkmcPyHkrJnQJ4uxgMRAQ9qdfAmyXc03L
         LstKISwlWnno/B83pwbIRnUCpigRdbTki/T8o4RL0DdE1mBNwkYNrwXIWkrQZ+S9+hCB
         UNdkFis7VHdX0p4bOSIFoIhPK0E8qrTrv30nvRPTzN1A4fJSUlvLDQzUWVojRbyj4oV1
         Mste31TatK15L0BlxNuCEGPhA8sNxxbmaTrjPTdJBAMEKpm1ncqMeMjRg8oCVYtHZrC6
         qGn/Zx3v/TECkieM3oZCrNErFrlwDqzajUw7EmZPLT4TMWHiJYlTF69pnx9q6XmOqawM
         Zn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193981; x=1788798781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJzwv1wFVi53NEXZo+hKmNYNH3NbrWf4sdQ3Ijd6Mi0=;
        b=EaxHjAxsS3tXNo952cDFAsYN6ZlEtPuBhIWOv1adRJotmkHdgcr4S3qRnqhEtarMUV
         bhcJgjcdxGaYugItILWXyEgurBG7ryXEyl7Uqtnm92d5TholJesKlcyU+6e5bzaaxwx+
         y+6T/UZlGSEAiLNostGFXSKkg7jiuOiJIQOYsC2JGyAPGVLeFQm630EVMtCAXHodiMhJ
         7vE3ksEiIU9sYnwZJ5HBXXQ1Pl1DX2XgDMWMvLYG9fxOAPsULFNhIgSKhKp5YjTPM1fZ
         ggUNmctA8If3AM0xmVEun+DdyldrqcKgp0MPio1w/UBkEf9rw+nr8WNS2KEq9ZLg7ffM
         +bIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlxO8gRmfBKUzvl+yxKM7BlMxJWb3hNJ5zaSEH/7l/xf7tY7EW0WLdF5/t+zIIRe4TLlfhoo7GKSu3mTbXig==@vger.kernel.org
X-Gm-Message-State: AFuF++krI9hJyFbQaWXIMpQsCjBESuEo9zMrc1/Q/kBkXbVhx1apBOeB
	e/98uYMz9qULVOT9m3Gbd+0fMxbyXFXygBfL8GCE7xaeHNs3A/gFy9sUhDvRMbpZ4wJRplFeBkQ
	E5QLDlydAnVv1GK4xbTnFRb+TG+ae0ko=
X-Gm-Gg: AYBFou0yrvs3SgA3VV4XYdYFXfTwF7GogIXGRayvlTP+E3SH9ezlKNhM2+15bvUK3R8
	uGv5jjB+cfP/kqVP0W2uIO7t/fyAHP8XeVMHz8lHwTFa54FVFEHveZ1yDOU8NdZiSxOT/QpTfXC
	Szor9ZPTFUFog+SWMd7HMT3ekxUtAQlQ37TCR9FvE8FbaYZxnJ0YhO+OAiUuwnuJ6eStvBSphnA
	aJT2tdxYdm4PnplBuIXzPmvE1EubkqPSdVq2inZocEj96ByXQPfEG2xay3bJNpDv5Wwtiryub7u
	a4kH27JWAddWedOufDfli7Me3jXGpwIMQC5CAMf2i791wqLRcMPeX7n/KSHAzPFf19aZKRbGmAH
	CbZ2bcN+luxtHbiMvcCPUB7c1J9nFheQ9inByuHcc6U4CdD0WKpByxJ8wkIWO
X-Received: by 2002:a17:902:c94e:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d74ce5e476mr224272585ad.0.1788193980913; Mon, 31 Aug 2026
 09:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831151605.638172-2-manuelebnerli@mailbox.org> <20260831152523.638881-1-manuelebnerli@mailbox.org>
In-Reply-To: <20260831152523.638881-1-manuelebnerli@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Aug 2026 18:32:46 +0200
X-Gm-Features: AcwNN1WxT2qUEpoESa1nnOxcvqd-4guXTylAIIzIEvrVEhydUWRkwim0NkJ623s
Message-ID: <CANiq72=TYcLdj0t2DbboS31L4BNrSg-0bRmHZe4SDnbRLeoy9g@mail.gmail.com>
Subject: Re: [PATCH] v2 Docs: changes.rst: introduce optional column
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Guillaume Tucker <gtucker@gtucker.io>, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:25=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbox=
.org> wrote:
>
> +bindgen                0.71.1           generate Rust bindings

Should this simply say `CONFIG_RUST=3Dy` too?

> +Clang/LLVM             17.0.1           alternative to GNU C (gcc)

Should we add an equivalent one to GNU C?

> +gtags (optional)       6.6.5

It seems the patch missed this one?

> +Sphinx\ [#f1]_         3.4.3

Should the footnote be moved into the new column?

> xfsprogs               2.6.0

Is this always required? There may be others that are actually optional too=
.

Cc'ing Guillaume and Nicolas -- we were discussing Python in this thread:

  https://lore.kernel.org/all/apG3hwaPA8f7SJeI@levanger/

Thanks!

Cheers,
Miguel
