Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A373D28B7DA
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709096; cv=pass; b=IaioCP15CWtIR9aoTbpujIVhMj8Hgw74XPjbD5WsHlKPoYAR/VNkrgx5T+DMpfAiXqEFx2VuUsIyvTH/nMUmzvPZ5aM0b2JayDf5JqLg1RKvNKAPfxxc1nuakY5q5yo7WEPyJDDApA2+t6Ql9BzXPZcN8pErJ6R4oL+/TBBDIF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709096; c=relaxed/simple;
	bh=AH6TzLeaF9pIDFr0hAkgF7LI4JXf/uaA52xkp3m/Png=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQS+l5t6Tcw4iVH8sZfpPcx8+ayALrOkNVgKNAj0Lv0F3XUEsJd444WRCvn7928zxj4Ux3jiZBh8+cN5vU38qgkHYf1yYysWRKc4NqEH5Z1h9uglvlXBzxD9TORhnyjjHicXhGGJirxD1R40yJ9fHFK1s/ivnb7dqdVYpmEqByw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwLPHN7u; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwLPHN7u"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1365eb2a773so272149c88.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781709095; cv=none;
        d=google.com; s=arc-20240605;
        b=VexSM55VWIdE+GpYt6xLcdDzLjsDWS2ULCRJDhAAa2qnsBBjmqKu/r0oqdbslPHyIL
         opxRb5nyAfsxP7I+tsZxhhWZp+ZKyjsiUT4mZvg+4KJuCrn038K0T5tyFWnDN1VCF4qX
         s5NDTrXeLvS5nGeFVLU589Eu44NhOIRee+duSgmaPy8b9VyQtX85LrZfMZCcYu+YfZbM
         suGk0p7kbs00uCAM2wC01p7QMx8PiNAiAjkzHY5d7OqzuquuzBPmC96/8zXE3MteGscG
         txCDEUiMNLxMtYJIU4/yBxF1NZWxRDPu3z8lt4HZijt0U0EqnhDf4rt1AZkAVbEqo4QT
         Fn2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AH6TzLeaF9pIDFr0hAkgF7LI4JXf/uaA52xkp3m/Png=;
        fh=NSJg4XW8GIIV2fd059A3uAsanpzXeYC+ehbUI1GyiSc=;
        b=lNAG4JOG6lOcQTVd92nczadkkqZG6Rzy4kcTqtO36WWl1GC9Vwh2Tz/TRQaUaqbKXX
         fTAEFqMaPHPzGtPxNQkpJ+VVdbZZ5BrRJYYeu2FpwvGLj6L96YpfRUadzEOt42iK45v0
         /EKxYvyFBDmTHjSKvNIr4wHhhh6SO0PaSOgY2yJJGFfOU+7FiIu9ZK6XysqLSqaSSxRl
         w14viRZW5DTLCanBV4E9X2c/OUumuRkahIOL2dztBjnfxYfxBVb4V93vh0DqkArOXBD/
         sTIzzrMcdPq+knCp5yhptp3vxBbIcwlv7qzOQgQTUn8MhDbojl8PDGw2AN36kdt5H+U7
         SU5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781709095; x=1782313895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AH6TzLeaF9pIDFr0hAkgF7LI4JXf/uaA52xkp3m/Png=;
        b=HwLPHN7uBEVNJ8nZz5W8K5dg2p5jVSH58w7K6Iy91/u1k80meywY/enmc+PbjmhoB5
         X4SvJrlGHAwaRqR4xgVEKh2EMwK8RuX7xY0cA3hkSyJheGNlzyyFiiLq6Fi3KOnuwsG8
         nE4996zSmBE3jyWZvdP99tJM2qV/vPskBmHXPha62Hp0tL96VsoPVtF7OpJ2kHqwl6ep
         OopNzFJVr1wG+LGx/vxJbcbfX2hBHuq05xaG8w940gMITYy5UpDMMc+yIH2zj6AlLeWK
         seG9V9JVzMEgPikKjfRLype8wEbeGId9seatfIO/HwgdnY+CI7bUbObO6s9ezKU0gKwN
         ABaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781709095; x=1782313895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AH6TzLeaF9pIDFr0hAkgF7LI4JXf/uaA52xkp3m/Png=;
        b=JeqJRqwqITtInA3rN9aVleDqJEUsGK0gd0jTXsb/488vW3nlHEac6FRChsbrbYk6QN
         vcAy2kc2AAjfR1UkscHNAXTNuMkm8DoJYdsS5za8aGLWdayIpBDr19ggKQRnp8fcl5YN
         a1jWbSwIzzagmxmHJdHBl89p00u58ixIGKVCI0n34EeKMKFjnLKTrc++N/KuEyTTfu/q
         r0GleGNUBSdTYhKeuSYS78R7PF03nqHUY/zM1SHIpBTxiRagGH1ydaqH3i3Ha76VmyV3
         FdSmzgHqY/HKW8osOpFtk4Up06f1G2TA5vWQdDFwL9sU/eCfQ5/OysSDZmV7It1m2snj
         K9aw==
X-Forwarded-Encrypted: i=1; AFNElJ+1ym7wHbgPedgZepNx0H6pJhKlgz4JZ0QRlQBK0pXcLK3tabTRqpmIe/yqyzgVYRrxwyDbXloQJKoSz8tfug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr/MemzoSjIo5HHY1/RApkVUBulOhgp8aMKMEu0OsBkhyK459h
	+jeKE5lubDNMxACT04Ab2mwgQgf3kqExPTGrSgKFTmvf5a2vb6+jmPzlcVMOwINjRwf8y5+cRYY
	2eZrOg7xQl/dR9nibpJnLpi1e7Coh4xk=
X-Gm-Gg: AfdE7cmll6XpwkawIJwA194bFuoFQHG+VJtbKUwHq2gcTi6WWwe/lpaE5zVWP4s+oNs
	tP5UgJ+pidiav2Kbq7TQCvJKCStETHwkprjSWDIyGcHe+OAewc5BTAjhlGYuvxUV7fXZ8boL4Iz
	y5E70ALnNtk95cjzXJKRu1JzA1bwJusnSxlv/AFCs0WJ7ZAhI3Tmbv2Hl+8LWjFqLzWJzHYsnZv
	sOn/bEAfijXLZkAxH/AumzCKX6gHMCnJuxKPZitBvN5dc9ewSQwCGtaeklj4cnZSCPhjtT4X8Vq
	MRuVadaqO4py9YkUS04ruBBc7XnAnh9XWAlJba24XoPCchZmWtROzjBgPnT+YnazrfKWIR2+YV5
	urq/RnWrOIIXa
X-Received: by 2002:a05:7301:1298:b0:2f0:ddce:8468 with SMTP id
 5a478bee46e88-30bca21caddmr933276eec.8.1781709094242; Wed, 17 Jun 2026
 08:11:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617150232.2210-1-mike@fireburn.co.uk>
In-Reply-To: <20260617150232.2210-1-mike@fireburn.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 17 Jun 2026 17:11:21 +0200
X-Gm-Features: AVVi8CdZnL9JO8r2T42R7lYCwOeoWy3VmEc9cj3VyPuVSQ7bMcrxUVbNYko7up8
Message-ID: <CANiq72=PBnUkJ6yGk-CiiR7972=oHTfv0ebw0EfRchVarwoEGw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] rust: drm: minimal KMS bindings, EDID read,
 rotation, HDCP defs
To: mike@fireburn.co.uk
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mike,

A few questions on the cover letter that may give context to
readers... (for this and the other series you just sent)

On Wed, Jun 17, 2026 at 5:02=E2=80=AFPM Mike Lothian <mike@fireburn.co.uk> =
wrote:
>
> It is deliberately an RFC and interim: it does NOT add safe Rust KMS
> abstractions (CRTC/plane/connector wrappers - an active upstream effort),
> only the raw binding surface plus the trait/visibility tweaks a driver
> needs to call the C helpers itself.

Do you mean this is not meant to go upstream?

Or do you actually want to land this interim state? If so, then it
needs to be well-justified why we would want to make this exception.

> drm::Device::as_raw() is made pub as a documented temporary escape hatch
> for calling the C KMS helpers until safe wrappers exist. That is the part
> most likely to draw objections, so it is split into its own patch (3/3):
> the feature flags and header bindings in 1/3 and 2/3 are useful on their
> own and can land even if the escape hatch is reworked or dropped (e.g.
> replaced by narrow per-helper safe wrappers).

Yeah... this sort of escape hatches aren't great. What is the reason
for not directly working on safe abstractions?

> Factored out of an out-of-tree in-kernel Rust DisplayLink DL3 dock driver
> that drives a virtual connector and reads the dock's downstream EDID; but
> the bindings are generic (the same path simpledrm/gud/udl use).
> Compile-tested in-tree against drm-next.

What is the use case? It is an out-of-tree driver? If so, the
maintainers may not be able to take the code unless there is an actual
user in-tree.

Or is this driver expected to land upstream? Do you have a link to the
source code?

Thanks!

Cheers,
Miguel
