Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F193817DFFD
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Sep 2024 16:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726848072; cv=none; b=Q6En9jHv1v8xtuTFmrCr3MivkH1E7zo0y0eXNDG52fyAMGv67ipqmLCRQpvHIXtlQgrBaA4RVk08VYpcxLLooi4GIyKGY9lwNDIxZ7vYZuaVXISmOdE7MJxwoigx1pMlOSoXRpcBMU+EB313tqwx9JfRZHSUnusQMq/Ye8nlaZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726848072; c=relaxed/simple;
	bh=Aadv+WVJOL5YKLVHpzuQK5/SKFly90PnsKtQr4hQEz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XsDhom6dASBr7hPMlbvSZFDxLgusU7ghhInBNsNEfSPCJ7kBfBnWCl54A6TdOHL7evYfuLbWYujXQ60EZ63kxvFYpGx27UUmkIG3CLBE6MsyQc/k3OuLL0S7USm49c9tj7ZRaVf63bnEGAaoFbMAawSDUQzrcrAU6NbviKp/RNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qMBmzI+x; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qMBmzI+x"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso26599895e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Sep 2024 09:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726848069; x=1727452869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngbpf1H2oOMWCm7WIRS8wPynVT9K9JZ7WNr85g36C58=;
        b=qMBmzI+xehjFI1tDdwUSOWidIdaQFJnpExz/Pcuc4U5qJshUfyB2X51vkcV2yvmoYX
         F5fBqSL+8kg/RVD8sVcdexr4z0bKFPMh+TaufJmYEsjFjEE6+2Kb+P9fQuQFyDRph0Uh
         TuQUjXEdLN6m7rresPBbrB9b091Iw2kpjCbGC7FfD3xcLuuDO4fx3SjE6jqo8ez/l1Ym
         I23kD1EMISWfnYuRecbZxSVwHcOD+Shm2BjEwWRKmoPfQrkC2rnoBv3At9pKO8FKpnEs
         EIZh1zNjUAf9K2KQRdWrKsK4r06jiQRQydUB/Ob3/u1muo21vCVHMXevglzpJJEr8SQZ
         y0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726848069; x=1727452869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngbpf1H2oOMWCm7WIRS8wPynVT9K9JZ7WNr85g36C58=;
        b=wJa36JcpBqb105gBEOn8rYS2Kxm7lT+seP89yhpzPqLvUHKdKpPxZg5uv+muMIZyHZ
         78iWFxHUjVMaX9Rq33CDh1ljAujZECwFxL+ZdDajUqafNBp5f3vJMIB+buaCrZIZ+THT
         acHnhjTo9uebRhU7I9d8xE4kRyFFz2Xoja0nZhIqY763bUXrdZj/DJGju84OWa5VzD4J
         1XNqmLyspKhxyawNI5dX+86beb2Qagda0Uth6U2ljxU0gc0mXT/IJrFlxN1YNfqQpGcA
         7WScP2X0gH1BxjmW1RwgGe0/YkulV1YZr0iTJjAiDL1Z2y3/8DKIxRzAnlq7Hx96bZAX
         RxeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZXpCRjh9sl5J9qzsJ4sehVTujitC7Wl86kutzC5cx7s8XqnptRBidXDwTwCkvdG+tpcw8XsGvBX2chjRX8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE2TizMPNq5VTB/Azx0JsiAWQsUDAIck4y8LlQ0ib4qQkXo5S8
	ZAw2IVvCv1CJnBxFSNHUckBqayxDkhwCfGJnEzWSwKHbVEKfftCnjbiikpSpu5d1Ws7udrixKss
	Dmx8MaEHRSeb8ymuX/1nNiWyEwVSECqsfcoIx
X-Google-Smtp-Source: AGHT+IFb+uga8lPSlebxMkehvketqPPa6n3tdmsrqncmSTOMTFNhlH/cEJI/LrTcQ24/vn23T4+wRrMEmx5G38HFCAw=
X-Received: by 2002:a05:600c:3581:b0:42c:aef3:4388 with SMTP id
 5b1f17b1804b1-42e7abe3d77mr30942575e9.6.1726848068888; Fri, 20 Sep 2024
 09:01:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240919043707.206400-1-fujita.tomonori@gmail.com>
 <CAH5fLgiJyvSztvCDz8KZ4kF0--a0mqi7M4WowB==CCs2FmVk8A@mail.gmail.com> <20240920.135339.42277957091918023.fujita.tomonori@gmail.com>
In-Reply-To: <20240920.135339.42277957091918023.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 20 Sep 2024 18:00:56 +0200
Message-ID: <CAH5fLggzkjHE+NY_gLzcmwSeQ5MFYXMYU-nqX7=R7RF4WLosug@mail.gmail.com>
Subject: Re: [PATCH net] net: phy: qt2025: Fix warning: unused import DeviceId
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	tmgross@umich.edu, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 3:53=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Hi,
>
> On Thu, 19 Sep 2024 08:17:42 +0200
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Thu, Sep 19, 2024 at 6:39=E2=80=AFAM FUJITA Tomonori
> > <fujita.tomonori@gmail.com> wrote:
> >>
> >> Fix the following warning when the driver is compiled as built-in:
> >>
> >> >> warning: unused import: `DeviceId`
> >>    --> drivers/net/phy/qt2025.rs:18:5
> >>    |
> >>    18 |     DeviceId, Driver,
> >>    |     ^^^^^^^^
> >>    |
> >>    =3D note: `#[warn(unused_imports)]` on by default
> >>
> >> device_table in module_phy_driver macro is defined only when the
> >> driver is built as module. Use an absolute module path in the macro
> >> instead of importing `DeviceId`.
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Closes: https://lore.kernel.org/oe-kbuild-all/202409190717.i135rfVo-lk=
p@intel.com/
> >> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >
> > It may be nice to change the macro to always use the expression so
> > that this warning doesn't happen again.
>
> Like the C code does, a valuable is defined only when the driver is
> built as module because the valuable is used to create the information
> for module loading. So the macro adds `#[cfg(MODULE)]` like the
> following:
>
> #[cfg(MODULE)]
> #[no_mangle]
> static __mod_mdio__phydev_device_table: [::kernel::bindings::mdio_device_=
id; 2] =3D [
>     ::kernel::bindings::mdio_device_id {
>         phy_id: 0x00000001,
>         phy_id_mask: 0xffffffff,
>     },
>     ::kernel::bindings::mdio_device_id {
>         phy_id: 0,
>         phy_id_mask: 0,
>     },
> ];
>
> We can remove `#[cfg(MODULE)]` however an unused valuable to added to
> the kernel image when the driver is compiled as built-in. Seems that
> with `#[no_mangle]`, the compiler doesn't give a warning about unused
> valuable though.
>
> Is there a nice way to handle such case?

Put it in a const. That way it doesn't end up in the image if unused.

const _TABLE_INIT: [::kernel::bindings::mdio_device_id; 2] =3D [
    ::kernel::bindings::mdio_device_id {
        phy_id: 0x00000001,
        phy_id_mask: 0xffffffff,
    },
    ::kernel::bindings::mdio_device_id {
        phy_id: 0,
        phy_id_mask: 0,
    },
];

#[cfg(MODULE)]
#[no_mangle]
static __mod_mdio__phydev_device_table:
[::kernel::bindings::mdio_device_id; 2] =3D _TABLE_INIT;

Alice
