Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6954F267B8C
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 11:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483545; cv=none; b=p+5zA8iuWpIdMdp2wpfYA6zZ0v46q4UevUKcemDB9MAhhs1KNsXXdykzQmBsi96fymFj/yqM3V31SNCYfqxvvcFEJ/d7Nsd5J9Z3yS4Z/E0BzIAwy+2PXoOL22deE8RdUXFVabz5QJFfMh3VoJ/f/tR6enkqkQLV7GaFT5g3Gig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483545; c=relaxed/simple;
	bh=nC/7usLhWji7zwCttdEvPnYiNBBT/B45GAGpCIogt6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rssmRjgYmjbcGopprbR2EVcG1DpCajvPTFJgN5RR9uVR4AQ1JMXgDAC0wsndAja+/t7YtIXk4CVaDrvDVymxzuxSHTvEbT32eUYi4730AIcnsnKLCi/EmdNFTDQXTJ4cMte9LsEMomP/4DOKiYDQLxPREyE9zMpglqw7+4t5+E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSYbXGBK; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSYbXGBK"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fc8482c62dso1454776a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 03:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740483544; x=1741088344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nC/7usLhWji7zwCttdEvPnYiNBBT/B45GAGpCIogt6A=;
        b=mSYbXGBKivXhdDDOtHwNmehsWoubbZijcMhlm8D0nJtzbtiNMvR/bmrRyWc3S3SxFW
         rTKkbt6MYFstJKZRYMPaeOCpccue3PmgS+e3CiE9mxVezR6apeWn6VVZuX5bAkbEVito
         Rt1Ij3gAHTJh/CZPEAqbMQyl672Swx8k7Yt/PDVqf2WwIwdb45R7lRRHRK3H7zEVJxyo
         GdKPwP3Mk1YUd6JERiJQuiEjwMptQG3FnVN5vs2CMp2Rd0j88xIEYE1UMO8IBU/N1mnF
         8V7c8rlQbYCQ0oCGg79/gtrPLytSCDcpW3PmX4KRCnqgrV/tpCCK5jKjhfC0KTZVXA7B
         2Uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483544; x=1741088344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nC/7usLhWji7zwCttdEvPnYiNBBT/B45GAGpCIogt6A=;
        b=uzo0z0vyLcBWduLG50nfgkXEIcf0MyBweFUvmlSqfWStcO5rbexkgOkJIs/1chw9/g
         TvOGd/B0haxH+sZBQliVlnmo5Y3IdORBVwwHmPE109oQrcU0XGh2TdRp2t1XDGJTgEl2
         uTJuI+kAm/ay8jhw1FghrkZdL//rxchVH3rEZVGZyPX2hK8vKr1MOb/EZWZdkATEsw2d
         uWLg1T+1j307ZnZqhPEftoMUhMzPPDN7Ad46+0mI12bibf+YFDv8RJ+UdRJt2ivZYAj4
         j/V3/DKIB9fOp0yHKRNyLXPgXsRsSwV0/IG3XHAIx03Fj/mTrrYIRonM3gk5c0aj33fv
         iAOw==
X-Forwarded-Encrypted: i=1; AJvYcCXb0pK90Za1zDdp4jMVPF17LZM9O7wuc8820Aq7x/fXTWD1mvzq2HQUrBQdVI24IfiyFEyoWyd2TW8qemA0bw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe4QC1J5ar2da69la8HnCTnJane93VcLWSEjmPYWmixtYWlBPV
	xF13Cl0PK8IvKNcrh7cYpn6aBdA8MEi09Pyqe83s3yvHLn8G2MLcsAw3D92wiKYiRbObLn6Dnw2
	zOPi+7DQdjUKzFGUDfmVhoY8dCso=
X-Gm-Gg: ASbGnctrJd4UARYm76+ppq1TGjWl5b1XTFMjHYVatAtZXfTCzmLmQDPW8CCQi4wlmwr
	Uctwe1BDlgiOFq8PiBLghKfxszw4ZkIAEAjaFcuGKWup9X4sRHBNbqRFg5Rt/J6hCwbt44hLMgf
	HXR3mW2UE=
X-Google-Smtp-Source: AGHT+IGAASVu6MUfmrbjblC4B22CMT6OEEEDO2GDKJdQSUHkOe4kj+FbTJoL7wKNCQrkoSfgdEezjk/iMC5IHIEYo50=
X-Received: by 2002:a17:90b:3ec4:b0:2fc:2078:1726 with SMTP id
 98e67ed59e1d1-2fce7b080dcmr10865210a91.6.1740483543729; Tue, 25 Feb 2025
 03:39:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219055516.359454-1-dirk.behme@de.bosch.com>
 <qR15TFA5w7m-em7Om-XpDqJvZbPA4T-_wgdtpb2lzfqhHWXVz6MT3cIurrB2_JbUbNqqlffrtGTN8cSUrtTL1A==@protonmail.internalid>
 <20250219055516.359454-2-dirk.behme@de.bosch.com> <87seoae4u5.fsf@kernel.org>
 <sIRpnzf3y8_6biksXe5aWklTZ83XbfdBrVhcleCmFxXzkYVbLyHRFPRGUdzN-RyQud7qXRwhZaKLhcIFWIrr8A==@protonmail.internalid>
 <CE22ECC5-135D-473D-AD79-A07510432A4A@collabora.com> <87eczmwbsw.fsf@kernel.org>
In-Reply-To: <87eczmwbsw.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 25 Feb 2025 12:38:51 +0100
X-Gm-Features: AQ5f1Jo56uKDJUz9LtankeX__8QGLskhQs1Hk0leQ6-2Y3tACjPtXE_3y9q5_Dk
Message-ID: <CANiq72=WPrX-sLfKgGKNwzP3C978UMSiqidG+5Bnqw-WVcQbaw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: types: `Opaque` doc: Add some destructor description
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 11:36=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> People who are very familiar with the rust language and/or relevant
> invariants will immediately have the info they need after the first
> "terse" paragraph.

By the way, whether we do that or not, it could make sense to very
briefly say how that is done, e.g. "... (by using `UnsafeCell`) ..."
with a link to the relevant information. Experts already know how the
definition works, but it may help others connect the dots on what part
removes what restriction.

Cheers,
Miguel
