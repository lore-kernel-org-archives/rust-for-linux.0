Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA62B1E1DE9
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 02:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771381103; cv=pass; b=Mx8nYhsqyn6s8IaYd/h50ZRtmIyt4VJn3VOQyQXafdCskIOZcaIoVA7miWV8Nwh4asmMjxF/qOPnR7ApNUSThoAHpPNbMhXzSzDQE56J8CS0kZDJWayOv2tAWL7jTD+GMkDon8/JK5bgQ7frc+uBPLENhebhWxQo2zfRiXnXQ64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771381103; c=relaxed/simple;
	bh=oisk5RNGpe9X3B4rnNrrpIM/YAw2CyQ7pCGjtBnp3LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=askaL9mFaUz+TmmAxTO/AkEpkLW8W70GRmN87HomY2nvAJeCXxxcV+Y89ibcekmAUaD7zkQIX6s/qjx7XxP74YpHEPLJOA0JVicMrtrlL2KuccmKzfEg/kP9Wxby7zyWvQn5AuNFB5mJlGKezGXApUabynymEcIYbzATrUN65Wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpByvxaA; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpByvxaA"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65a1970b912so661822a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 18:18:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771381100; cv=none;
        d=google.com; s=arc-20240605;
        b=XhPrh55D5ly/RSv2TaFtywTOgAWVVTztga3I+fj6OPilhZTIz8tki2GPCQ0rITDGn9
         DTMoD5QsFJmp7SfNz/g3hvVEMs58g6LPRhaixkI1ZUmwUOAc6XAO5pJ8IWcJAyM89ZTz
         nGScQ950rRwFNQrtnDeuB4xgs3ulg/Qi3RLGnp9BrtvWy+YmQEGGJaORFoiD9IZ1Fdw7
         Cts3KE5kfFKId+WSC+1MFO0kHwPRQOO4dnifVxrPdU4gy3XxBvRuHX3QhSVNpIJwOP7a
         jHSIu16HEkHpp46ezV03qZbeByoZ4902ht9GJ8qyNjVQJzx/+iet2DxbIp4uNYTE/l61
         3kXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oisk5RNGpe9X3B4rnNrrpIM/YAw2CyQ7pCGjtBnp3LE=;
        fh=fFyBg651HbkJ1lyFWgihwO5v+NocEptsVsvl9tO0kp4=;
        b=SQcVLvNbAJ/gP4XSywDB5U/fLjPapBej1aCGglvdtjeS0AsWD24QDK1wmmTF0bZG3/
         pf3f+2kcG8OvkxGurkYnpbWRJxAsuVH7MW6Y0wdI5dg4vffGO3cZeU3LRwvwiuv+ogAp
         QMLCt2BV5nf+oRgfO8SnjjoPbRzMbxFitsp9Wm1hlNZ7zCx7EWgDilbyCON7+wUqrI6O
         YVt0EAQyaZzJZyGoIO0O6sU0ap4pYabzjU6IN3UQ3o8kePlcvq87LVaPhyxD7xFhHR7Z
         4q3CLEpRFsRX51wcKJkPocXmGFbkvr2cF2hw4Pxh40MyjOmK5wswyc9Qmc7OunsOqlDx
         IW3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771381100; x=1771985900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oisk5RNGpe9X3B4rnNrrpIM/YAw2CyQ7pCGjtBnp3LE=;
        b=jpByvxaAdfjRsOfPiOQAodpAVVLRxR2MeIWdlW005xLzXoPH5BcC7s2D1ShgO5j5Jn
         /y5Wkpb99qJui36tSejkvEPumsE+akubQsBud21XznDpcTLook5pCeIQPhODlaJFxxhJ
         r+EVvQc1hq30dbFr5ox/aoFhrKZNckRT9SpUEfjdQ1mJo6+AJhoE5TS1144JAAAukZI+
         iz32grPxYgG1OY79JknQBUr7T3ctEPqWcfhq/0IzYo2KauXMC2J7oo/ULaWvjzoEhpdI
         lAvEiCrzw0hCw+IGQgqSqV8b4plqrYbBdblU8axZlfnmaIRASpTgkIw3hDesAIMOytlV
         WCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771381100; x=1771985900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oisk5RNGpe9X3B4rnNrrpIM/YAw2CyQ7pCGjtBnp3LE=;
        b=POl9yXKWAJYvgz0c0ZCphTfBkuGWhoMLKV4K+9vMEbGaMI5A5yJv3p3CpcpRYIKn/n
         MYhiCfs88cIZVPrhbTCU+Rx5g9ZqRHAVbVKsGVmS8GDFF3r1vZ/D+QCjMSIoBQjnEN7V
         o8NQisAUJVtJc1Gw8eW4CV40ycD4+nX6qj+wwre031WEhL/p/pmuq1LjmkmWdk2JOSE4
         5X85nXH8qVWKl8iHaZiscar7JB7m/eQsLzq0l3zUcvvUrUGLGOl04bZjcVAEtEamVo64
         dHV+E+h7kBrWBCH4kPcRazDV96MVrFaCwTRziMvodKVGhHnVJe8idn3Iz49YbBn8FAC/
         RRlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7iv45ey3jcCGLLZVYP7k2Tltpy6RTwPuZ3Cf0hDZU4Ix8rSur0YKkoBoYHQIG4QnCWIanl0h/aoIJBlmcCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjd2ATCkcEGsjpxs2l1y9nSVPh2Tmx+RW2IiMaXi26ynogSJ9n
	Ailul1c0hOUvzQ2v/2mfEA1Wbvm7wR/U0UtobwFIiYIx4kPEeGJw4qN9AMasXdSSTMflCoqpTbL
	lXPHSD6dxuNSJ7nJNq0yYuA0ATk32cVo=
X-Gm-Gg: AZuq6aICAPXgbhekBqrOkQwO9dGRXyYX5n87hbTYX7uZ2CVNz3WPeEcpWHIfVO9ZrNo
	d56eYahKp6zVp0TDdzkpH9bRWTAIf2rD6lUB5EvFkGQ6PxKr1xO4Hvevr5zzc2cbwQqyR2SS14I
	9FeGp7vObDJD/8jTwRq5cZAltn3uxDDj5y7skqnpXNAf0yWOFJnrQvrifhZTJtq58OYbi6x+pcg
	ubS+u+1nXxZK6CwoKV0DbCjjA7v7agotOtelAYggmEjCfymE3qiZdK8eRzLsoxiRYRkPAR2pkq3
	MVrxxTebzJVLKKaJYUjfbT6R1HgPNxrK8cKYOg==
X-Received: by 2002:a17:907:8e95:b0:b88:50ea:f64f with SMTP id
 a640c23a62f3a-b903ce412bemr23014066b.11.1771381099947; Tue, 17 Feb 2026
 18:18:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211032935.2705841-1-alistair.francis@wdc.com> <20260217235604.GA1595019@nvidia.com>
In-Reply-To: <20260217235604.GA1595019@nvidia.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 18 Feb 2026 12:17:53 +1000
X-Gm-Features: AaiRm51IyO5p1ZFm7PemT4PZZF2gD_mhc5e0kBVSJ5OU9yRJy4LX-SjwiRKMPKk
Message-ID: <CAKmqyKNeyEN-h9tAnfM9j0GWiFU9idXheGQ1COCqT9MVZgsZYw@mail.gmail.com>
Subject: Re: [RFC v3 00/27] lib: Rust implementation of SPDM
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: bhelgaas@google.com, lukas@wunner.de, rust-for-linux@vger.kernel.org, 
	akpm@linux-foundation.org, linux-pci@vger.kernel.org, 
	Jonathan.Cameron@huawei.com, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	boqun.feng@gmail.com, a.hindborg@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	wilfred.mallawa@wdc.com, aliceryhl@google.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 9:56=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Wed, Feb 11, 2026 at 01:29:07PM +1000, alistair23@gmail.com wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Security Protocols and Data Models (SPDM) [1] is used for authenticatio=
n,
> > attestation and key exchange. SPDM is generally used over a range of
> > transports, such as PCIe, MCTP/SMBus/I3C, ATA, SCSI, NVMe or TCP.
> >
> > >From the kernels perspective SPDM is used to authenticate and attest d=
evices.
> > In this threat model a device is considered untrusted until it can be v=
erified
> > by the kernel and userspace using SPDM. As such SPDM data is untrusted =
data
> > that can be mallicious.
> >
> > The SPDM specification is also complex, with the 1.2.1 spec being almos=
t 200
> > pages and the 1.3.0 spec being almost 250 pages long.
> >
> > As such we have the kernel parsing untrusted responses from a complex
> > specification, which sounds like a possible exploit vector. This is the=
 type
> > of place where Rust excels!
>
> I was arguing for exactly this at a recent conference, so I'm glad to
> see it. It is a great meaningful usecase for rust in the kernel.

Woo, someone is on board!

>
> IIRC the netlink was my suggestion too, it really needs a careful
> look on its own. It is much better than sysfs, but comes with its own
> pitfalls.

It was!

>
> You might want to try to break this up into two parts, one just dumps
> a large text file in debugfs where there are not uAPI rules. This
> would let the rust work proceed.

I'm currently thinking of splitting this in 3 parts. One for the
ground work patches (crypto), one for SPDM (without netlink) and then
a final one for netlink support.

I feel that this RFC proves netlink can work, which is important. For
SPDM the authenticated syfs attribute is enough to provide usefulness
to userspace to merge that while sending the netlink later.

That way hopefully everything is a little more self contained, but
still has users and value to justify being merged.

That's a good idea about debugfs though, I'll keep that in mind

Alistair

>
> And another to introduce a proper uAPI for the data.
>
> It will be easier to get the right people interested in both parts if
> it is split up I think, given the size.
>
> Jason
