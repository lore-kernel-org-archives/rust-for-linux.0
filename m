Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793772535;
	b=2+a1RTFsy2WTcgYZc8FGsEg3tkVNIx8Z7Ru61i6QHcEl3te9Hj/WGFI313B1Es91gHJi
	 w8m8Fq6qq8DC7YAJ2Q2GZuX7YB8pEmEpJLS2WSfTk+7JBfgFzanqYIcgaWNTFfj8k/KX3
	 FaHc44SSkzVgW90SPzgjBub1xWSvXdRrgkpONpnoeY9ko0JLdaHklhkdnDPDIsaKtrw1Y
	 ha0SmESlJuVMMYLElN8aSt+h9uxJJ9xQho04Dfo5+hq3QwSe5okn63bHJNu27fybVQrLX
	 N+SPvUDpiYUPWJAPI8cR5E/e6m6yIEP11UK7DpNJQmiZ2kPINVnPvcfe10+gCeN7T6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793772535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JA5vMLT9szW5mLfY0eUYovR/EI3W6f4OqW0QDEaEjO0=;
	b=LUR+o7G/BZM632ZCJ04l+/STRrfmTbXzq9Se8dEjWM50Si+Cm0BQD6K6qJitGo0olRpy
	 zroZsI37d2ZCs+Zitm3kDHNQZypTW3infZU1xvmYF75yKFSKRm5aNXFBgq+exFu5mh0A/
	 5/bKoIpU0NbV9bPrHe3QA4H0FL+B/fb6/7rFKyJjG8Pe0f6mSEJw8aksiGNTxjGytOcne
	 ePMyMszVeqtoq/2SSzsdFVUGny6fBbqytFtw8qy3vlnMebR8TfWgsHNV9sX+gD6/hi4ql
	 MN1AzJZmdp10OZIYs6e1qJ8dK8QDNTqpJQXzPDbvxNw5WXaD1O7vIMWZYtTVhGq3DVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLmgJ8sw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6CA606A31B
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 06:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B6CA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLmgJ8sw
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so329577a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 22:08:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793772533; cv=none;
        d=google.com; s=arc-20260327;
        b=JpjObOKogv1DSS3/p8xR3eGYIYylZKOc8JwJxWkT1DmFE73wtxWU+AXCGJ/+VHhHwr
         0DPk53MZRoNKWwSxzq5dsiKHemMnDUsYIhw8M8zg4ud2F6/MoArhOhBWRiSfe8FXQ1uw
         RScfKpqWbvtQnvbdfovB1gskk4kEqWC/L2FWEGesQmYWR50z5hl2oQp45DeKyAqWydDq
         Edgq4Knv8Keu1AQ0+gC8COE0uRZHUwPe/IrDQCsGOxpy3D3pVqZ0037Ek8UDSXpIPeeC
         l6L9C03qHFlFBwBOpS6MxKNBDAXqHYoreHqjF6bMskkTN196LE9oLCcfPBXS4cekmoYS
         GMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JA5vMLT9szW5mLfY0eUYovR/EI3W6f4OqW0QDEaEjO0=;
        fh=CSAesJ80TImkg8bRlrloeg7MuYwjufpIFyQRHGmHffo=;
        b=sRDeUIWM9IvB8VaNvsabvop4VOCmK7O+X1H0+ekajmoI7I9wcgi9MJRaUhsuhYpWQp
         G97W4Tw4uOAy13E91wpY862osANasTZJ7PLFCnKqaNvg1X5JQwyXOM+VvJNra4825YUG
         IIjd3Yg7p4EdsFm/flcsaMoAAO/DE1mOGJWtcT5SwliNg5d8f7KoUY6JRut9hxdBLgZW
         0TUd07uUj8vC1RmF2mzubvPJv+ib5xQlRzQgVH/Lss0l3NwuJxMmDNxMySxKOJVcPSGc
         tsfqJuEr641YD8wl/rdc8j6dZxPgy+6WWsoSPMIOaP7EEqNVbyNipSNd2BCaog8EAWdO
         8gsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793772533; x=1794377333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JA5vMLT9szW5mLfY0eUYovR/EI3W6f4OqW0QDEaEjO0=;
        b=jLmgJ8swYkdf0IbRypo70hgc+XnzvV95AGf9zO24fj6Q0uAZt8QCX41OrrIl7c6A2Z
         noHBrpPEAOSTyghP0T/2Kjbj/BmvQoLjlltBRDKVoVhgdNNSlF+VhqVgl1nJUDF5og4P
         aiJb0wB1a5mhTv2aa/gMtoBpbaOf/F/X73AFZlMRhjPlu2T1SzzxTCoI+yy2ULhbYENe
         jo+/FZgh22tcl7RgXsGlsKiwDNuS09GVzknyMkzhxAdWeUtJ/q9ALzF7K1AKSTEppjmZ
         c9gGmrx2HDo2yxaHW1ULR6pUgL1y2x14xx0JoexDA604AurzkrJbR6d4r+Gb2yD7ASyP
         tDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793772533; x=1794377333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JA5vMLT9szW5mLfY0eUYovR/EI3W6f4OqW0QDEaEjO0=;
        b=CoKHOchTJ10G1ZhgCtCnh4NYCULIS/mTR7gyblCYCnvFdreZLJPfUzdXb+csOEUJZa
         Xo4ENOK5dIxRClpNcbr3rduJnscqnmIU1piy4EWcMaKuLX1VllxEx+xw23Rdxbj2kO9h
         6NjVFcHL+EIrXpTgTV9W959uCDc8cn1j7NtIklTu5RClCAXu4ZXr3yNlD5/IvBBzNBw2
         p/L5qEVIgg2MuOTn+Weq5dzTdsC4e5k172usMjfHBGpbYIM5PA2fG9OpZE22f4yVnSDP
         WXgrnbSK3/A6ZK6HqvCa7QJkcmYzBQILYXP43LVWMjZSJg5kDdFHV9FkwLAJ1TNQE+c6
         RhYg==
X-Forwarded-Encrypted: i=1; AKwUvBzeXv1Mi8hdPxeG6bEF8Ouosia6PiQ71HZeu1w+y96qriwKHU6F6N354ykNHMHCe52HUijM8N3VH6OcqeDPfg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kk5YTxkwuE0V7rgR4GQHQpbhunTCpyogjS7kBBPobT6EU1kPY
	ZS+0EeOsmv5ZwOq1GeFTn96+L3E1pc8m6qtyZZidjE+X3xaa7n9h3/ip9VCTFhAiBYjfcQ18l5Q
	omDjuzplsktN9w7wNV68+TGrfoUe3RvM=
X-Gm-Gg: AYBFou2N8DJn+sQSG6OubKuBm6m0aJSP6/jjVqyPm7FmHHd/tUcQDuNWFGaiJb+UJrc
	+fKCwuVwGF57jcPqdytBJ1D3H2MJdu0YJV94ui3Sr1G3BllMCux59lrXDBEOdjzpT8RyXTG2yg5
	j1RAze+U/pFWVHwplx+uH8e3uSzfLJpHHKRc8YKkqV9j8Eht7Ft9L/sx7vnCL1J53ZwdenuW/2H
	Z6wRP/SNvHB1hhwNBLvTtKoPMnOTG1KOz1zyLMi+Z+bki8tlgcm8nSbupIU777/fVXR45a6ehDv
	uKs8E/YZ+wmazmyAs2QD3Nyt1MeNRhqUDhbVwM5yswkcIuGg03TQwFyTuDh/5OrES0DFaYYI0+C
	DnrbmJXYO1b6GoJLlAmMyUDX4SCnuyJTq2/OktOvhn5pu9Va/WTixj8LtOitSsJPPPRfw68dXmd
	ttmRm0BGo4IUf1UA==
X-Received: by 2002:aa7:c259:0:b0:6b4:2638:8ef7 with SMTP id
 4fb4d7f45d1cf-6b4d468226emr8448814a12.23.1793772533397; Tue, 03 Nov 2026
 22:08:53 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928011123.450800-1-alistair.francis@wdc.com>
 <20260928011123.450800-11-alistair.francis@wdc.com> <DM4NT7TFX4X9.1GFI128LI5ZQ4@nvidia.com>
 <CAKmqyKNEup=x+bwmPD_8x0s4ssPkqFnQtSGqJ_82z9oDP=A6cA@mail.gmail.com>
 <DM58HRC3DHSS.1YC0E53ZXANT4@nvidia.com> <CAKmqyKPwirjmeBQvXgheY8Lh-M-RRq5pdbv=5mB4duhw9aCbGA@mail.gmail.com>
 <CANiq72n=eqh6W+iNWPdM+rrc+HujtZVRtVg=JB03OMS8rc5hiQ@mail.gmail.com> <DMHAUFW5V16R.20XEO2QDXIGGG@nvidia.com>
In-Reply-To: <DMHAUFW5V16R.20XEO2QDXIGGG@nvidia.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 Nov 2026 16:08:26 +1000
X-Gm-Features: AclHuK8yY3BZ4pKP3zSAvQ1_8YS2crIm1mKvYKw4mutZUrcwZsReUT8BFmZzmzw
Message-ID: <CAKmqyKOLSAFZNNhLH7hTVuTRs0Mb17jsbrjsesDWaN7CoN5dNQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/22] lib: rspdm: Initial commit of Rust SPDM
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, lukas@wunner.de, linux-cxl@vger.kernel.org, 
	akpm@linux-foundation.org, Jonathan.Cameron@huawei.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jic23@kernel.org, bhelgaas@google.com, alistair@alistair23.me, 
	djbw@kernel.org, linux-pci@vger.kernel.org, wilfred.mallawa@wdc.com, 
	gregkh@linuxfoundation.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	benno.lossin@proton.me, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	tmgross@umich.edu, gary@garyguo.net, ojeda@kernel.org, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 9:52=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Tue Oct 27, 2026 at 10:19 PM JST, Miguel Ojeda wrote:
> > On Tue, Oct 27, 2026 at 5:19=E2=80=AFAM Alistair Francis <alistair23@gm=
ail.com> wrote:
> >>
> >> That was kind of the goal with `SpdmState`. The issue is all of the
> >> drivers calling this (PCIe, NVMe, SATA and SCSI) are C drivers and
> >> won't be Rust for the foreseeable future. So there aren't any Rust
> >> users.
> >>
> >> I have improved things a lot with v5, let me know if you still want a
> >> Rust API. It just feels a bit silly to add one that will probably
> >> never be used.
> >
> > I mean, it is true that we don't want dead code, but in general we
> > would also want more Rust callers in the future -- so I guess it
> > depends on that "probably" you mention, i.e. how likely it is. So
> > could you please elaborate? i.e. why is it that you don't expect
> > future Rust callers? Would the NVMe Rust driver want to use this
> > eventually if merged? (Cc'ing Andreas)

You guys might have a better understanding them me.

For SPDM to work over a transport that transport needs a DMTF spec. So
right now SPDM will only work over PCIe, MCTP, NVMe/SCSI/ATA or TCP.

From my (limited) understanding of the kernel's MCTP subsystem, SPDM
isn't going to happen in the kernel. I don't think there is a need for
TCP support either.

So that just leaves us with PCIe and the storage bindings. Both PCIe
and the storage transports have old well established C support in the
kernel. So those would need a Rust implementation to use the Rust API
for SPDM.

The NVMe Rust driver could use this! But that would have to be
accepted upstream first. From my outside view I thought that was still
a ways off.

>
> Yeah the "probably never be used" part sounds a bit strong to me, unless
> there is a reason I missed for why no Rust driver would ever want to use
> SPDM.

The "probably never be used" comes from having a Rust
re-implementation of PCIe or a storage driver.

>
> Regardless of that, I think it still makes sense to have a layered API
> design where the (necessarily unsafe) C API builds on top of a safe Rust
> API that enforces the invariants and other rules you want to uphold.
> That makes the invariants that C callers need to uphold manually clear,
> and avoids having C-isms in the Rust code (like we had with the crypto
> APIs calls in v4). Not to mention my favorite: it makes things easier to
> review. :)

Ok, I'll add a Rust API then

Alistair
