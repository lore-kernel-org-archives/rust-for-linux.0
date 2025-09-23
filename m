Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D16323F7F
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Sep 2025 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758632145; cv=none; b=U2zT1DHzFUVmPofVeh1RpSbOYvphbgqek42tAf2Ehkhqfd+r9GUemGOXHjf84zRZTPKVV0scmCHJZos0apGT/leuA83pW//aOd/o6928Ip/qPwCYfsPCX37htRXB4ekqcRhR8fOxay9ueZyMYhCarNgvsH8JkFII5H1PHeLGqnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758632145; c=relaxed/simple;
	bh=bPsm5BeBlCI99myQ/NU1P5fqNGX5920h4zo3ax7qRNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iV2vWeGpVd2iCNed5jnuBLip5DMAQ36izq+XM958s0QAOtYR0OV8b2Gi41PpjYff/CiyvaHqBHuX13ZY4E4XYoAXr8XWyNPVPwhpJts56uPI5mKxET7NcVYDglFFrU6boKnbc+brg5vlrg8Gve/xcTcylsq7iDPA19XK7TVSZ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPu1TXqR; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPu1TXqR"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24498e93b8fso5767015ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Sep 2025 05:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758632143; x=1759236943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPsm5BeBlCI99myQ/NU1P5fqNGX5920h4zo3ax7qRNc=;
        b=EPu1TXqRMV9c3MkOmonYDNOUzm7pwPqZjgIheS/l365/v4CTMDcXk+VMKryE/aPC6f
         1c9Jte/mSTfShot6B9THGCB6V2z/fPSGGciuZ21zoFdcG7+aEpF73sAFRBlolzGV0HgH
         O7pqPrSvTdbZfUU1FzOdsy1Vc6ng+1B/bELxO97Ecn3P0A4+mywoUi35c0YN5aYQ/eZt
         /+k6lPXuFDOdbg7pwc+1hqKO6QbTZiK3Ik7WH4968x/fRvMD1VEdJddtQfjlgKyBeGKZ
         FC3wGPHR3OIyAp6iPcwwTyLs2qyVacXGlYHBcx/xXsgX9Fy4qEmbb5Ek+tOM/GkMk5rQ
         orOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758632143; x=1759236943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPsm5BeBlCI99myQ/NU1P5fqNGX5920h4zo3ax7qRNc=;
        b=Qh0flAxcLBFTCQOoc9oTVHe/cGTfZ2/6lGkfZB70t33HAE+oX6EzKvXXyJrbNvcH/c
         eNnhnwI5GsEr0g5bsqtSD+f0gLmt7ELw7uNPlc2NJ1A/89gjpMO7aBzLF03e7mqnbfVf
         XbPJhhggdI0rU+QTeB8EENnH0lIAVR8Hb5puB0k+DLLLvLJJ2Mj3wv73+uIfutHqZv5B
         FZxUSssed570F0rhA5VJHqoGXjWFaZInjJFwF0WwaNt9YuHphdxiIeQzi/ny0v+4VXGb
         tpZkCCPdJyRXK7/qNS9PmgQ3gCbAKbFBltuGggmgtgbC1XJ2rYYOdPure0+hjiunX5fN
         O1lA==
X-Forwarded-Encrypted: i=1; AJvYcCX84mFwvOcHdST01XU0L+RRrd23Obo1uct9k0dJiXiW2HkqAH51sK2LrtpXLXCcx3bSobBT8lAEmr8/87BTag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQC/KmYGt8TXjlu9K79xJz7XvmW/ky9exLceV6GJLUqLzxIVEb
	6BqvEVCrrPRFWYpVPvXNx/PiNaZiv9vwUIum+wWASEBWFpd+2ydBncWTVC5hPuQI1rPIW4WEl5A
	uAf9OmwxWHu5IBl5dF0vy4dyFyw90k+0=
X-Gm-Gg: ASbGncvz/n5FR4P3vfBAA3XkKLxmmmbqO3H6sOmU7psCBFlyUz+XeovGSBarDvmXWGZ
	ECBoI3Vh3reI1Sp4o4+zbBYYBvx5pTVpiKweXtJ8PIPM483Uu6Z9l2dC6K8E8JcpVU1OwFgI3ST
	HNhwmfusHLKnFcsNdgcBcN+gugpwxboMoMqvdIpl5ApA/tYwQJkxdcxsBiQosfpojmY0FKJbyy2
	4SdU/mZQYDwkmjoZZO0/4gHwgLNKIMgXcZUCF674dxXWoYQFNj38qWpK7KFD/4Pp/sxaaU+8RMf
	BfrJQekT/gfpbTkJsQu4DM78HQ==
X-Google-Smtp-Source: AGHT+IEVYX6ve7luR5GnSM4eICjSDTUTZRS+D8hMwmZQRsSzuaYCoXRh0iyJrxTjeZJZllU7L9GVHzx0ugS/+Ydl4II=
X-Received: by 2002:a17:903:110e:b0:269:80e2:c5a8 with SMTP id
 d9443c01a7336-27cc94ca027mr19378695ad.7.1758632142902; Tue, 23 Sep 2025
 05:55:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825-b4-usb-v1-0-7aa024de7ae8@collabora.com>
 <2025092338-elbow-dash-373d@gregkh> <CAH5fLghm-syjWRrj=G2==W4PorPq47bkAPfkeJ1UAsGbbRhPfQ@mail.gmail.com>
 <B4D07104-0A10-4B04-88CC-3F138A783811@collabora.com>
In-Reply-To: <B4D07104-0A10-4B04-88CC-3F138A783811@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Sep 2025 14:55:30 +0200
X-Gm-Features: AS18NWBm0VpH3EPBG5YoC1bxFDVvYN6YlJxnFunV3o7Ts-fF_Inb73M49AabG_c
Message-ID: <CANiq72meH4zKk0P3y51+EQ2gZ2miBCmWSPYEJqVt2bBSrZ8t7A@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: usb: add initial USB abstractions
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 2:34=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hmm, but the USB module is gated by #[cfg(CONFIG_USB) in lib.rs, so not h=
aving
> CONFIG_USB enabled should not return any errors and instead skip the USB
> bindings completely.
>
> I wonder if this has to be CONFIG_USB=3Dy?

Yes, the `kernel` crate is built-in and it is trying to call something
from a module.

Cheers,
Miguel
