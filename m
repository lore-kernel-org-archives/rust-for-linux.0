Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793598353;
	b=yzZg3OMweGTp1M4YN13cM6oPtmq/tq7gFmBSFzBbn5VnhEytbCTA4K9ayjAIow+Hj+cx
	 Qma9/C6WWhXqH5lxpUUhpUNYFlbvcJyEcUBalZgjVJ1z0ryYqPticB2oQu0qzlCHde219
	 sI4MBHsIa01pBNip6WDSEPlimTXlqQWZe/IquN2TBDSBV1HyaJeNmFp7WOVV3c//xa2Vm
	 qi3ixaXcn10jI2LKZ5QI0fimzJkrESAD2AK5NzH7F9rvJJyTVIJzhwMNHJ2IKW8Y1v1MF
	 YAijBWZWXLrOWJFkpJjmwuHmcWEAEbGTKHTqFmoBsJL2A+3ADg3JKlP10GsKw6IS6kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598353;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=0EWff2/RckXT/gjbZywWMm8CMyCYWgzGjOrw+JSfBks=;
	b=RvFMLicRykxRNGAqif4Xty5KEnWGFA/6LZwx23XJatKNluChONrunX0y4WwCioQ4jWcj
	 KrYQpxH57JHZh7fjE1SYwCpzr10Wc9jdG5tIq//j6fZyXOJKdPRIROulRXkd2qCe1Gb55
	 gYRmH27HC3VlFVV1NxEVLXgTRqiOjHMnkEUL42kGIUN128mODJJWdif/GptMQz+01bhSU
	 uPF9mC1OGpFqka0OCFJQMHrLdBmYPGg9sSv0vH2OMsg/txYPw5NoCyM1BPGJ4iXVIv4eR
	 whWdexr0KWKm0Z+9H8zwfxM9xdAR91Vh39BXOhSy0WqOMZuFpI1Kqbu5bxWMu1vfJUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZFfNIr+S;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F730606A324
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 05:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F730606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZFfNIr+S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793598352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0EWff2/RckXT/gjbZywWMm8CMyCYWgzGjOrw+JSfBks=;
	b=ZFfNIr+StHPksHOP1R1EhaN93iyTXILP2EOcEQ/ohHx2Vp/7bAD0xuc7YrICYRjNHGFc0E
	AqfenI3gTAVOeH4qbNRla2oRGRUHsgsRY912nVKT9dyDNvPACIcP5MXLHjlugf/v3BSlmG
	NragMVLcwV3SShYuaAcgknrp5GX1tfo=
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com
 [74.125.82.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-X7n_9WbjP4Cs77RBuDP46w-1; Mon, 02 Nov 2026 00:45:51 -0500
X-MC-Unique: X7n_9WbjP4Cs77RBuDP46w-1
X-Mimecast-MFC-AGG-ID: X7n_9WbjP4Cs77RBuDP46w_1793598350
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1aa0fb7f157so4165937c88.0
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Nov 2026 21:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793598350; x=1794203150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0EWff2/RckXT/gjbZywWMm8CMyCYWgzGjOrw+JSfBks=;
        b=071IlCGWa49LmyrL0m4E0dZCI7Kc+iRvIpisSkhaqIIAuhcKYUJSzEnYjxrpzcWMWx
         vEwf+vUTeoXm7bPhO9HIortfBEbTydjt8uLPL206+vLfnj7FQWanEttadPEP9LcThP+X
         ka+akUdLPfsTtNPw2tAAaGppqg5src4voPkXkxu6hrSmWqbrhtz+BEAvuCCpx13SUj4s
         fCLb/9UUqSOi/CaLs+FRLmyhaDVJeHaStev6Yl64x+QylNXMaVTJLahJ2TMNdKZjTyGt
         NDghx1wMDQtpFXkDXyd8R+k52zU4bDaMZJ2jaMZPq3e8oNmdZZYHYwPkLbbVfIXYmOCz
         rTZg==
X-Forwarded-Encrypted: i=1; AKwUvBwGwfa+Kqmxe6dOAB/A3VIDzhMGtsMftxim5Wab34Ejp2bfdcBjeTenj4HRMh6LGTT1nMK6Aq5TgkSvG3EDDQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLxsh4rxdHpg5SFnxmG226LAPOZJA/uxjD9iVnbMRgjn16KNeZl
	rTAbE6gEU5iGWYA2JnmcZd7ER47metMmxlPibzFzD+aEzGsD2+Bz6Um7dS2C+1GRsXL4DcULD5b
	g2xRB9pZhivVuw0n7WmNohd+vJkRn+dEWVRSeY4SjrnFHPIInz5/XBgL8dwbqcI0qINwS6C9CLh
	DWBW+OA1MG8e4xYgqjBWUXO4avnuPNWV3ZEMiULrT9vIc=
X-Gm-Gg: AYBFou14wFIy0Jt6skFkdeBDn7pUYchhhoVI+2JVuwMP0BnfelT9am54NKJaXY0An6z
	mnFsKr1JbBNrHp1G8IdotloC1LK7BGkUPEWCJ/LRqoQrqirdWH/qia4xRqPQG5D9+IeyJVTRXUs
	KlCTtC8Jvv4jrYWuWAoX3+0yY8WSAoAtGa3/IXNakJC1uZHmIgDgp8buDSknaC01LmrqJt3sGju
	Qbuq5uGpQfltUt5
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1ac5c92de5dmr17383098c88.27.1793598349861;
        Sun, 01 Nov 2026 21:45:49 -0800 (PST)
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id
 a92af1059eb24-1ac5c92de5dmr17383031c88.27.1793598348917; Sun, 01 Nov 2026
 21:45:48 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-drm-rust-next-v1-0-14a4ae469175@redhat.com>
 <20261026-drm-rust-next-v1-1-14a4ae469175@redhat.com> <DMF058O3CRIB.1C2PJYOCEBTXI@kernel.org>
In-Reply-To: <DMF058O3CRIB.1C2PJYOCEBTXI@kernel.org>
From: David Airlie <airlied@redhat.com>
Date: Mon, 2 Nov 2026 15:45:36 +1000
X-Gm-Features: AclHuK8exQT8deCs0skNOyZ9XxNBt9vf9v6qGrUakoponbSopJ5SLjaDTOgiRKc
Message-ID: <CAMwc25o22q1LT61YFAeZQBpVxmFZGYNr7Q3TvHoC+bd1HU5WAA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust/timer: expose as_nanos for clock sources.
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Lyude Paul <lyude@redhat.com>, 
	Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -4U2x0BJva2Yya-3wRRo8QOFYjUAcGxRV5crLEh_i3M_1793598350
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:04=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Oct 26, 2026 at 3:56 AM CET, Dave Airlie via B4 Relay wrote:
> > The nouveau C driver does ktime_to_ns(ktime_get()) to program
> > the cpu ns into some hw/fw, so allow this method for rust drivers.
>
> It's kinda implicit, but I'd rather justify the change through how the HW=
 timer
> within some NVIDIA GPUs works.
>
> There's also other HW that works similarly (e.g. a bunch of net devices),=
 which
> share a common abstraction through struct cyclecounter / struct timecount=
er.
>
> Having similar Rust infrastructure seems reasonable for use-cases as the =
nova
> one.

Just to clarify what I talked to Danilo about, I've no intention of
publishing the nvidia timer hw as a timer for use in the driver or
system.

We have to initialise the timer hardware for the GSP init process.
Depending on the hw platform we have to read the timer once to do
that, but we do not want to provide a time source from this timer at
this point in time.

Dave.

