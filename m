Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED0A37B023
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 10:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506114; cv=pass; b=W69J+fKxVlHY+3McIwh3O8gi9+fNnb3/KyHkDdyPvrdf1mAN1KK3Zoj45YbnmzjJbeCp5KmNJQN7wuhIsZdbzN7oRUydv0zOQV3YMLCer7fWj90kgLIdhhNafHz9j+LbWetHtCl9NBHGouuxQXL4hK1I9+IiJRjlwtzMPM7NRu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506114; c=relaxed/simple;
	bh=MKuzkLYQDFewYVwPpewpGzFZCiCZRBmO/7iJG/ks+ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QoHispczhmzUEUpDnxtSc/bsiSFCPKavsRwqXJvQ/bjPwKJjG/TvXPhC1RptRwh+n7fMkDElIz6zcLYKABomW7M3BcCHccT6DT048p+BCOKN1gijXzXWKQlHHAdnXGkskMlEZXU2bjUnccJo15fk//8wM/2cu3mNK6Dz1A7bvIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERazlVXU; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERazlVXU"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-32be7127c64so234274eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 03:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790506113; cv=none;
        d=google.com; s=arc-20260327;
        b=dKZO7xJAqqMxOmTvJt8BYwr/vqbPqpWF+wqflIsTsbQN84h1Zu06FBhkrDKUlEL9FI
         FI4IzosmR139j/58N2umnLoE+r2rmt+YG043MvucTqaHEIXEFf3CpqstmWGf46w/V3tn
         w45dk95VswOQsPc7Je48nu1SdUFCTlkOi5QmUtLhaUvPOo9rJKFZEm1B8XZ2E3bRTUrM
         RLdJ7s/TJRhMF6YAHoX8AhO4PmDWKU0KwhD98oL4hrKXHxe2uajLgrrrCOJaYKvWVAOE
         mZViVKmnLjD2aACyGGMeanN+kxL5z8OfGZqXb2RfU2RylOcuRsmhBBa75Pxwxy0Gzb50
         TxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MKuzkLYQDFewYVwPpewpGzFZCiCZRBmO/7iJG/ks+ic=;
        fh=z5/SKXNGSDq2T35h0BlReg2sfC6uKVo65Ko14U5RWH0=;
        b=HhO56DqVJOdSvqQp/5ekOybazd9KKNmnkRK5DeyYsymlB6n+BKvGOoQRZK1ClmkkgS
         dS1NknEyM9H2YfXrTYUzrNaafbHGvkkHCGG4OpNQ/+4G6abg3mN7AMRkQtfpLT05vn7v
         onxklu2i6rdpQqPL0TZw8meY5dkiBHgSFAGD8SRWeSVvrfABJJc3Shq7MZsfrNMzab7E
         T/773N23kF+/gkHQ6JBKVO2vqVU1O2x08A61QdPMsMd6aGWhBauRw7W8BhqL+tW0Tdk/
         lsvHrXrm8EScvhs8WUKUqH3e0A50FLH0THjWWH7ZIpmK8d1BY04uLgfrjfGn7VN7qXxa
         v9CA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506113; x=1791110913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MKuzkLYQDFewYVwPpewpGzFZCiCZRBmO/7iJG/ks+ic=;
        b=ERazlVXUAkPzxr3Oayu3BPW454HNKkeXaBRDkautfzZxYuvWFgc+TOndcmq1XCAkXy
         eiWni4nOtiMJmDoeRBVVqMTW3TqwRHcBfMlP2ejnR4rBCSispB7KPDs2GgGbIFToB21K
         P4ROW1jnh6/G1a30wBdrSj7Ca57y12EFq6t0lAvxPeBjW3sVqMa/bVIFZMPPVa8eWugE
         bNAgPNauENmrfZrRXXNp7G5JEbHM+wwQDqhkNoC36Laz0ldUwVQd4epVHHVM4PZNDpzO
         4/6RIdHwAAJAU4NX31C1jPTrYMZmaPXeOF1x6OEDJy9cT++px40WgZWPes8nwAQf1uWS
         Nulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506113; x=1791110913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKuzkLYQDFewYVwPpewpGzFZCiCZRBmO/7iJG/ks+ic=;
        b=CGX8UF//SZ9AdkubB2oavpPRSzcy5dQGZN5cZVeHehBxVkaYSUhO/Eo4N+MMwoLps3
         W6XBs3vVknWxetaxEQTYwwUhkDQo4GYidhmJDSIpiZPK9hbeZecCRHRslY1crGjoD+nY
         JeOwZQRgDBabDHsj7KqBu18BCSuMIWg8gh2LIUn2zhqCODP9fHwk3Ljy6rSKeDEhL5KT
         RGpxBqptoNZoAr2E7A3v1nFbb/0pj7DTwRJjOwqPaAiG25ABtpBsVlOVpFcrJ7dDhP7i
         e8RLFZrtlmQD3T0Onk46ixH78c2MDtkjXa6H2QDJ28kZaoXjYp1Fymzw5dCx7KSCvEHW
         GGoA==
X-Forwarded-Encrypted: i=1; AKwUvBxKp9+zqAe6RIaMRiA8P3Uwyky2Kowl50QfKVhsd+FSZnvSdD5+2CbdAX0f+ujPA16giX0195IJYrw90ZegXw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIPO2Lm13YhhaMHrV+lDFiCAL/ovrtgwwIYniUOu7YGT79KCCSp
	PsnyvDoWH3d9k2u65w3m4EEKFRs0aUvJb8ZyY0YyinmCDNSgGQ+6ZSW8IcSo8H5/J/FygPjdD1V
	z8YJAn7DVQebYnVri8ZDEhmNTkQ39+hA=
X-Gm-Gg: AYBFou2xAKX+LJA4SyzqZsnT4WJ71y4vDCeIfZtD6F1X/cozYPzcQDel7i+CqR5/NHu
	3PmwXC6A9NfT0IVTaQRTailyaw8yD2IEJ5OTIWyO9mRHj4+yZ24+Vk8bpdB/lblOBHJjqMC+xdx
	V8WD+fhqNAeAf8BH0VoGiz9fCE/t5GG9yW4DixrnPSniiq5RWIfMNzjZ5MTDnRgcztc/2OayJCG
	siuPfVqVaGi8IWOQPl3g4nkLHlP6FQnuX0JWrAJ0d9mq8INK2is2HiJTCa6m/nfHFdnoO/+VNrn
	WFPlMSIqkB1DCZACLMEV4+0BN6gN0XGSEmGkVFMdYonk85NzTFhXKT9jN8E4TvJxZjnDFIZe4OC
	4VlU0aG+MBznbrb19daWOcYeelrA84THt6FnfJ8KrwTUZeI/+dNnNHttYT9G7yi/B5tgHDkASO8
	XY6Uvvc9MLjkJWFD+CmUK8kkwC+oEMq1xDM5H6/KIMt60+D5AX761GS/GOMzqDzA==
X-Received: by 2002:a05:693c:4099:b0:33b:ee8a:2061 with SMTP id
 5a478bee46e88-3427169bcc5mr10569991eec.1.1790506112570; Sun, 27 Sep 2026
 03:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87v788t7xh.fsf@kernel.org> <aC94ccT3un1EKctso2G_kliI1gc8wSausWGU_X9r-V4YAhGjsYXsQCgdJxkzK8r17dZZlWTNqshNIMN3xs1LBw==@protonmail.internalid>
 <tencent_5449081195EDDF5726C709CF648DD4044A08@qq.com> <87ik3w2igl.fsf@t14s.mail-host-address-is-not-set>
 <tencent_C5A4AA0891F6F42B9C63D6E7AF460782A007@qq.com>
In-Reply-To: <tencent_C5A4AA0891F6F42B9C63D6E7AF460782A007@qq.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 27 Sep 2026 12:48:19 +0200
X-Gm-Features: AclHuK87iO5FOOguxgTW5oV-Lw8OS_qDSXwVNiSFWHJ9NydHmO8J-Jz41Ja__rI
Message-ID: <CANiq72k+e1c1ZvoziA9bFed=JFFg5aGqOHGHqzmVyW0sC6pOXw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: configfs: require thread-safe callback data
To: =?UTF-8?B?6ZmI5oCh6ZyW?= <1479826151@qq.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, ojeda <ojeda@kernel.org>, boqun <boqun@kernel.org>, 
	gary <gary@garyguo.net>, bjorn3_gh <bjorn3_gh@protonmail.com>, lossin <lossin@kernel.org>, 
	aliceryhl <aliceryhl@google.com>, tmgross <tmgross@umich.edu>, dakr <dakr@kernel.org>, 
	"daniel.almeida" <daniel.almeida@collabora.com>, tamird <tamird@kernel.org>, 
	acourbot <acourbot@nvidia.com>, work <work@onurozkan.dev>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 6:27=E2=80=AFAM =E9=99=88=E6=80=A1=E9=9C=96 <147982=
6151@qq.com> wrote:
>
> Hi Andreas,
>
> Yes, this looks good to me. Thank you for your reply and complement.
>
> Best regards,
> Yilin
> =E9=99=88=E6=80=A1=E9=9C=96

The mailing list drops messages using HTML, so you will probably want
to configure your client to send plain text only.

Quoting your message here for archival purposes -- I hope that helps!

Cheers,
Miguel
