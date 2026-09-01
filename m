Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F118A3845DC
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 23:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304762; cv=pass; b=FFNAVHEfuGQDs5D6cFYYkf0GknwZ+fh0pFONT4ZdbWmESVu66Ib+/GsRLHD473Tmv3M6EV95f2VYcbd5kqLXwdd71x6vA2rOZrEc2v97Jd4VvpWwzl7rnHrCVFem7p6oXBfDFXRoXmn839MsblFIWBvVugXjicuTWfeimqQF9s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304762; c=relaxed/simple;
	bh=e3eIoE3QbpFgDPEvZO1d9sR5o5XokHbUYC1b4+KVcrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdMrjaIX/zJkRbyT78LnqeFhQjQk2f3pjtMdxbaEtZL116vZAIzHe4QgaSpxrhMMcNFUnn+ax9yQMH4O6nkgpUyCNVB+yYFV0ZjkbMgX3CuUV9KsERDfa9+410YGejrfggtzjCIbbqiwPeFsyb1LYm5yvoNSgIDBwsK3peEb5iU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHU8qZJJ; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHU8qZJJ"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9d290216d0so31087a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 16:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788304760; cv=none;
        d=google.com; s=arc-20260327;
        b=Vqz3TLHSBNk/9EDciINX+yIfARxJMRDKXvnHhkcUCrWIvLJAJeigpyIg52sswXJgjC
         3UG7d++OVb1EeaosPU7vPv33kbEIf0IY3Es5TTvXKYlRMbh4EvIXDOVnCjuJ4y3BZJUk
         C3pHlDRhbtzfq9Y4ajEoIfCrhjHIpg2+vGejoJs87iHVPnBzTzXDrp742KQiurLG566O
         kqYKChkhv25fuauzcM56P5v1bDuas7pZNZNe+UiraKZX/jUIXJ6DBfuX7LJIKFN/xCeY
         Iw88R5QggsStf9U3RJ+jypw3b0KzMCNU48MjuYHsy9cHYchvzuw7ee48+pC7uXr6xSgJ
         sPIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iTO9Bl1A4M4zo0TJ+YJltBWqZ51NBQa7Q62ZAYSv+dA=;
        fh=HVIbcwujVba07UNMU2GsjRcEDtVncGYYP/UiwBwlyxU=;
        b=LAGIUd+km/E9bmTkJFyMTBQqGcBw8Fi37JQ6WCJsfbaFXPan4oqVwkPkuVo2qpLdkQ
         C4SqlCeYElJ0h5u39pYRNniISbsc8GC5NV1QCJxjZDEcs8yJaeYwg0yoObKHBsx4P4p0
         TPTGxOzKbkbsf3R5VEYWdytjbahbj+DlAl9qvzVGHsyPBxr8pT3bIC+eEk/jleGJs8C9
         Nds6PZzwmOovt/LVLQkluVGXo3s+VLvjx8/1h02lKl6imYV4KkakWIbcFFBMxk6LXbfp
         aIVKDwCrl89FStt4/fPi1CjQS+AAZYyf42meZDfeVaX4I00dUb1fjpXirLps2Wtty9fv
         e+Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788304760; x=1788909560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iTO9Bl1A4M4zo0TJ+YJltBWqZ51NBQa7Q62ZAYSv+dA=;
        b=NHU8qZJJsbIovzacun6W6j60DPY7qC/RXd0032SvchbEznI/C25s/BGi6LVhNSPHVw
         pCNbirXlyYGTAsW+KiVzX8gg6gUXkxFX85/qBwQEG+ASUOKBK2Z6epFKEcK/A87eQYwm
         ELH1MLG0twhagHxVRbSC2Ezbl6JD289wSpY2lqvAQUyqxbAtlVaWBvqPHvOszed7lfUj
         /FpgPOfIRvo6qgbGwXGleOvFWRd+Qc8r9FbFhDYqClumx4BwCWSjUtJiqWL2MOHbZa2A
         /j6Nqd3tbwmFJDg53ApOFI50wz1yP2vYrmrn+r7MSHcXFVf5ALI/O0xElePXWeF0HBSr
         OcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788304760; x=1788909560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTO9Bl1A4M4zo0TJ+YJltBWqZ51NBQa7Q62ZAYSv+dA=;
        b=renjvO88N500Eayht4SFGl3tH49SdJ9Xzvff8fdMNzF8coL6o/TfdsEltSh8hvkrAI
         YSFp0rgQOEtNrLIAUC22ZvYFCtdOIjIKUSL1q3BUy3KSUWNM2r7mzqa7X18+6NyVxVc1
         +MF+K9yWiEPwsKx1kh5bb842TrEgvwkXpbOWkEoxI1Hgib85KX1xZO+P564iWg+uXLzs
         suA5fPzlFpOChY/PO211hKq/PUGRLuoL3LCoGp/Db2CYRWPjrO3V4Ieuh+cM2Slpdl8q
         JQthiVOVIfoX2ahIVYJsgSICLQJ1naHOf6ZYprOfUjYEVsdszRBuofqOJXy9hoHrRYSq
         k07A==
X-Forwarded-Encrypted: i=1; AKwUvBzlZ9nug3dh4J+5ZjiQAztBQQ30QbtYVO4LNn+8/7oowG1FsDiMrYp4b2Wr/yBPIjbRVpxNTWH0DGci0b51cA==@vger.kernel.org
X-Gm-Message-State: AFuF++m/NSTpDWh7Reib9M0ugno6aWvLT3L+CwhSsKHG5UPGMoQDRQ38
	+Bb/R/Td7D+6GRDGv5uBEGYLJ8qQiu9oXsAiPFUNXzTFoVMmB1HO39sDUJj0J+BkAVgWgWvn2Qp
	aC33vhqzouzq5b0X8FXHwmCs+0kqZYUY=
X-Gm-Gg: AYBFou2NEyEcePodPmzTC15poUAS1zDXXPduOhDm/fmOnpkf/peGCLpCCJa8Om6nKgu
	p05iV4qBf9vSm6EbQlvjFWQJqS+6JAYirZpuRFmr9mtIvi3wFqHqbdsnZBCmPu+Qe0xG/x7Uy/E
	yx4FuGItMl8jHudNegRlEe/4GOLkEfntwiBBNWNce5uTATEGDV5zNzyT/qKgcjt7ixP2G8yecDp
	lB56lqqQDulC9yrpsNXyDL+r/KrcoUZQRuaj/KGTI04WouF5K5ykYRoehl36Kz+G+EpVvvMqxpk
	RW/bGJs/bedBOz4mCboKZESJgxZnQQ/hqB84d6F8bM1081X1TH3NjsPKItgo4DNUJVjabaJW5zT
	SGYGUrXvqfg2EwxDOfe7kTupzkKP1IwiS7oEMAQQ7lUQocOchrVe5/i9HHWvk
X-Received: by 2002:a17:90b:4486:b0:398:cee0:67dc with SMTP id
 98e67ed59e1d1-39aee22219amr330724a91.5.1788304760234; Tue, 01 Sep 2026
 16:19:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-cv-v2-0-446bc69d2ade@nvidia.com> <20260901-cv-v2-1-446bc69d2ade@nvidia.com>
 <a796c716-4db0-4bd4-b69a-accfe0d382d5@nvidia.com>
In-Reply-To: <a796c716-4db0-4bd4-b69a-accfe0d382d5@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Sep 2026 01:19:07 +0200
X-Gm-Features: AcwNN1XNkEF1AhN8yU_Q6na6OP_zes3C1-Rjq21wcY7gsKXPtUmdPm79OvrMDS0
Message-ID: <CANiq72=k3O03vh+2EbTamAZHOZebOZ1-X8=qiyHWX+YhGsocfA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: num: add cv! macro to create values from
 constant expressions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 10:19=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Remarkable, in the sense that it seems like an oversight at the Rust
> language level.
>
> Alex, Miguel, is this worth mentioning at Kangrejos?

Yeah, it wouldn't hurt to discuss it if we have time, since we will
want an improvement here one way or another.

I raised it to upstream Rust in our last meeting last week (we also
discussed integer casts), i.e. they are aware and they agree some of
this can definitely be improved. It is of course not a new thing for
them, e.g. this issue:

  https://github.com/rust-lang/rust/issues/69329

I also have it in our usual lists ("Better `NonZero` ergonomics
(`f(1)` integer literal coercion, `1nz` literals or other
solutions)"):

  https://github.com/Rust-for-Linux/linux/issues/354

I hope that helps!

Cheers,
Miguel
