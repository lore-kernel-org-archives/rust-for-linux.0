Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE472332637
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 06:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777442941; cv=pass; b=nDM6df6uCbGOpZGxxPKjMWNvyyNCF7NeahThusguRLlGlAsx23auRICicMu8VNaUDQenrCUpyVb17/Q99U/mYTLUnh+dcYhOUhixxJHGuqfMGbtv22gBA+jyauEXOLdbjtr5hd4b8ROipF5QRgsntQRbWkTTaq6pb61hBcLiMrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777442941; c=relaxed/simple;
	bh=uv6Xb6w93l7KObSkgCw9O8KyjoCw4kJ0ErtVeDA05iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bozuDdSo1RaMYdfs8gQXZmPIbi+jSuExxhLBjnicKSZl+kI/KnwUNVLiLPmSmdzeYtY/hXItPZA6k6tW+GwJdmM9zvyuftqqgz3bWlSNiGVh0JYCmwH3kQv6SzT4Bp+SLZGQeaYBSeg70HIs7GLyNE3yQ88+AbtjYQesPQpKlhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CnGkZ07K; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CnGkZ07K"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso5952835f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 23:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777442938; cv=none;
        d=google.com; s=arc-20240605;
        b=beP/gESbBgl9bXQcW8eB/hzcrQiVNknqAPag27c/ax1YTC8Pg2IEnnH9OZBtgRmQRK
         7EsbighWKuovOeAnNygy7SK7KasNZQOsPerYA6UW5ntvHG4C57nHYLX8DSZRlZ+3rJkU
         vt1kJ/YB8nDC683lpvZ56ex6zb/uMX2+hnx9G9bnEEAF1MBOv8Qwk3lu/RhNTDWuE4vq
         2f8WThcnE6XRTFYsU39AecFKt7kxBPfso1hzeUJ2AmEPrvD/aMjXftrUCr/1tgyL5cw2
         aixHy9hXYqkL52qFsN7B1qLnRYPkeVzEbJ37lTA1uFnCYvve1atpo+R3HzCQCcpjyfoJ
         iIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FYU7pE3gVxxvkAEdh+WGXrAzl34zV58wn+9SKSc2ScE=;
        fh=mGXrlv7j/QZihv4corIEZcEMZOLeA2z7bGqmIIkBb1E=;
        b=lnK/woU2XlE+XXqrBx82r5pzXq1MEcqo4dNqQI/AKxCGhvI75nO816dlVlXINofpP0
         xs753dlE9TDim0GP1icwvCLROk0vVRFA8uoeTcFDXHS8Kt/dwCsHpsl70B4HiKiSDjW5
         s4lXw6zthWInCNDdvGFbk4pgNu4ZM7/YbvzveNr9Bt60bd9GoS5GrEjkYSI60bQRAPLh
         svdcSTlYAQ3oJdRdo/MnOHRYYi+GgkPugg36hol4MfX6ZkmDFYNMGpD3VG7OvBFQ0Yma
         uWgwv5wSBIUFHLE1NZeYzgny7g5U7jUqZux7lzi4eqsKB9aYS9RtLoO3nJo6arBdzn66
         0+KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777442938; x=1778047738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYU7pE3gVxxvkAEdh+WGXrAzl34zV58wn+9SKSc2ScE=;
        b=CnGkZ07KRh4G8XgeO8o9zIIx9pkgSbtlkLSGQGLMUJcrpKLEeco47de0NVhM4l/FnC
         kgYpXxx8+Yddy0OW5+7fCFfQ5dX2p/BqcS4Jp74j0UZgRSydGPr0qWboYkxcxf3dGHst
         dpL23bUCDOJFGGq5wXJTzL0W6m2saWxah/+uZlqs0WMGVM3xJvurNEk/45UmJbaGLYnq
         3Duya+Bm7jlCttr/VlIDslY6t4QC6TB54lj39L0CEHnq50VlavnjaZpuDA1NKMfpjW4S
         ucSaxtKxeXe8uGx0SCadejZmqHwEqDQMYb2rksA6G2syrRFjn2YlAk4qkzKseZaolKSa
         RcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777442938; x=1778047738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FYU7pE3gVxxvkAEdh+WGXrAzl34zV58wn+9SKSc2ScE=;
        b=hEStviYAGKbRIsesbmP8H8Fj+eTqqrDiiL7d3ZIKnwIc9Ak1u9Z2wGrL8eTC+h87vO
         7Ug5qo6Jo2GvFK4ig5I+KpT1ukrz9TYhlsH+mSeciyIBPrTW0AluD+jAQUSYsbx1MNUA
         fZPP6zf7ubwyyfeMHNT8XtTgqvG5lnegXWyghEMAhRRhWRnHzr4Us93EJ6JqulHcq1Hu
         sYrY1A8Vhn448M6aMwg2jv7bgVZoqPqbWp+/GccOOgMkczXZpJyPFN3xLPN/bYfK5DgA
         DCjfgyBAwEAOdukewDL3Q8kjHASjDaU6M30Dne7xYC4wWnhxhiTGt4KUyx9StneYXSOD
         UJWw==
X-Forwarded-Encrypted: i=1; AFNElJ9P4QLPmSIwD1peqn19unWqp1uCzI41PkBh4VSivQ1Li5B5jD5HU4twNZE3UDk5rfpoO6lbu1jCca3mhSdZew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7pJkvcq6YFwfGG1XvuLNXh93blFS1oHRnVI0Wgqb8kl1Dg3Hx
	5BIioX6gFSsBUdqpo7AsqxM0npFxSGYKqLgV+k8IKkH9AkMGD5fWt4BpgauMAfi2hb39JlKc51o
	yqXnqdjH/7Tmcir5ujq5opYv6PumCtB+mlYLArNck
X-Gm-Gg: AeBDieu50bizOnW1gCHWscPzJ6d0nvUnOMNxrUc6guRpRbSNFk4FzF5tzN5zC/sE8JF
	GCz5N94Bs25u4F0ErNsApsk5kuAlVoSNaAXVvgef8rvg8xGb5gmViZ1HbPIEVXDVMRZzFCGaFVD
	KoCJUTP1KQUdaHpzmdBqgNy4KWO9I2YuxuCcaekCqlzGedViq9kNoNFHtQ/2UWVMgfEm4LA7moF
	rmwdB/DGzkSfOlAzFv2J5b37IxfECHFuxDdd5WMNPcnpgx59VJXkl0e+EWpmfDk7dEbyCt0a1Zs
	nydORxKpQnVHC8Wj48NICGZXD9rgiaQptjksnH5bqQcR0mWa/Km6TDFz9ME=
X-Received: by 2002:a05:6000:430a:b0:43e:aa88:f1a1 with SMTP id
 ffacd0b85a97d-4464a446fe6mr11181446f8f.30.1777442937776; Tue, 28 Apr 2026
 23:08:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-fw-boot-prerequisites-v1-0-c69af9abe1af@collabora.com>
In-Reply-To: <20260428-fw-boot-prerequisites-v1-0-c69af9abe1af@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 29 Apr 2026 08:08:45 +0200
X-Gm-Features: AVHnY4KpyMxlVfytNzH1PtMjfsVrbyhjVM6FaSYXLynKs8xxxgKqJH2pyxGWTTQ
Message-ID: <CAH5fLgjU+uUXzjAsa=ZaQhgNJi_Qa2Nc7mEC3HJCpr2vxOFEEw@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/tyr: prereqs for firmware loading and MCU boot
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, boris.brezillon@collabora.com, 
	beata.michalska@arm.com, work@onurozkan.dev, alvin.sun@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 9:20=E2=80=AFPM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> This series extracts patches from the Tyr firmware boot series that have
> no additional prerequisites and can be applied directly to drm-rust-next.
>
> Most of the patches are unchanged from the fw-boot series, except
> "drm/tyr: use shmem GEM object type in TyrDrmDriver"
> which now also selects RUST_DRM_GEM_SHMEM_HELPER in Kconfig.
>
> Link to [PATCH v4 00/20] drm/tyr: firmware loading and MCU boot support
> - https://lore.kernel.org/rust-for-linux/20260424-b4-fw-boot-v4-v4-0-a5d9=
1050789d@collabora.com/
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> Alvin Sun (1):
>       drm/tyr: use shmem GEM object type in TyrDrmDriver
>
> Beata Michalska (1):
>       drm/tyr: set DMA mask using GPU physical address
>
> Boris Brezillon (1):
>       drm/tyr: rename TyrObject to BoData
>
> Deborah Brouwer (2):
>       drm/tyr: move clock cleanup into Clocks Drop impl
>       drm/tyr: add shmem backing for GEM objects

These commits look good to me. I will pick them up in a few days
unless anybody else complains.

Alice
