Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B351DE4CD
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 02:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761098953; cv=none; b=bDuwdqxAaFlXubZoEqfZJUh42q2JHd+LTax38GE8onNVMGgLLcCy1bG2EOXkR6jP9naNJO70YyTkR93P9iBM/uypGmVnyBDwHs07ZBVpDVUf85FpoBHEXWwZxwanL8vmadGeQ0ebhKAg5TrQWoOLTetiT1BKmr+CmWQu/o+bs4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761098953; c=relaxed/simple;
	bh=J/kA9zA++ImiS6Iw4lypA+VtjeUDcyGzn0SVCKdDy7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuOCWRWmSyDqDBObIeuI9FabSZljqHpsJ09F6liU7yvM3Zqml+gL2p2l2THvwiCuHkREQDnAnhCWJVOyeOTNH+jlZcQyNYOo8X5lwaU+K2x+lFmZ4vJomqxGp8Dye714MBZ117MjyIC+M9F0ux5a9jHhDSAelkO7oOZSAwrct38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCNqKUKf; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCNqKUKf"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b5526b7c54eso4052477a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 19:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761098951; x=1761703751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=af9vNF4/pOmtn3q/j2U/NQMJF3YjAHP3FBPyaTm2ZTY=;
        b=eCNqKUKfNxJf6WghsQgQEi6jWzJ7xo1PF0jriw7LbMfWlXuxksp4IUYr4F/tMd4mB7
         yG2Lrx0nJKIev5ez0xmHEkfeZCzS7a2ioI875l9ZIxoF3r6VMTAuqOihQDWpblwilPp1
         C+LpRENppq3liiz10oceTQ19rmgNa1xmzK6KthIUxkKEWR6lxzMohUfe/c7QaX2FRH+4
         V8AXH+G2OmBxgyct7P1IL+s2Oi54u2fi4KJfeqnX39u2kXdI2VEPBcG5DMHysmdLbHIF
         6ZbN3eHOmaUko+WPEjMy5CNU+C25RqRM45PWPEoM2YniM8TIgBW2U+/fHnllhUGxYu0F
         0//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761098951; x=1761703751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=af9vNF4/pOmtn3q/j2U/NQMJF3YjAHP3FBPyaTm2ZTY=;
        b=nMD5xoEIB+AY5Ggz8gdEcnPu4x4nk1v6go6iTKIPWCqJCHyWATaDSCEoNu8pX4jGe1
         HXqhxE3mECZsMJP+TAZzTEFRSWxOeCnxs8Z6Hrk1PBgWkxoKy3JJ591k6oMyLPq7eL+z
         1Hr14SPBCuqFhxG/F88mln656GBmCu2ZXyqLRiz1pv7OzPeG8WMkJvU/cVes8Befh1M3
         mv3hEh1m6s6W4iOm1fIKF8OGUFnFy6ck0YXfOwaD8fgaCeyQQsF/Ji0yDtoAeD4zC9ff
         41JdYJ0p4sSXhJUVBcBA53qdhVP/EQxc7GwctDK40cx8Hx2A92/ts77JDes/zviqQcoZ
         AY5A==
X-Forwarded-Encrypted: i=1; AJvYcCXS5Pn0rKkFwRhn0+EBXbbfj3yBm/R9BTFdrR0/dgBYKwXndB/5gzrU61rx25wO+uox5Qwhu1L9nNas5pzwYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYhjIfDHBoOAXrGOOcIobllVex9lS6EzgPq2WYGueAZjkqIyro
	28V+YLU6VczhoVCz/owP+S7t+wy44SYOLom58EuVi91Y3BIkIYXJbWFu
X-Gm-Gg: ASbGnctplNI7akEltyPYHPhS/rYXQ6tDZjvcbmrnIeXCUY5ouhSeRjthyJcBV0VANC/
	8fkyHS7cNBhxJ6NqHWvZaDgMOl3ddo8ZTMcdDxoUZaa3LoBum7P9S7C15FPhpZnVwHS4i6r6wcl
	WzTyNvlKWHpvvVEkvRXZn8SDlZiFuTb5870y0bisg4VR+Tgvjox3tocIJz9jk8ht4f7J5V3p9qc
	qsyh0UwwclPfyl/ldAWcItZMr7sPL7G/wHNkYFnM8OLRgFUZ3N01/zQ6jmQh14uZ5p1R3KsjR38
	9CcdTSOPRGfNOCsHCB74WofDR6RVPyyFTp6MPY3PuOib95Zx1WAPdvDQdNCHHwgqAty+m6mub0J
	ZS2D74RnJI/4xdoQ1VSnbZf/pV2Mme3biPUn4fBRhf8Kz91MnwPtDSi07f/SdbrdNpRalRsOKpk
	JdeiLvMMFTfWft
X-Google-Smtp-Source: AGHT+IGoV41dxt0PTAHkgRAIyZFYB8ISFOdcqUyCiizLarhiL6pLGFIW2lB0KpZYTkg47fD50y0GNw==
X-Received: by 2002:a17:903:b90:b0:276:d3e:6844 with SMTP id d9443c01a7336-290ca1218cbmr205757685ad.33.1761098950545;
        Tue, 21 Oct 2025 19:09:10 -0700 (PDT)
Received: from archie.me ([103.124.138.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471feb99sm123086345ad.87.2025.10.21.19.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 19:09:09 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id EB4D34209E4B; Wed, 22 Oct 2025 09:09:06 +0700 (WIB)
Date: Wed, 22 Oct 2025 09:09:06 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	nouveau@lists.freedesktop.org
Subject: Re: [PATCH 4/7] docs: gpu: nova-core: Document the PRAMIN aperture
 mechanism
Message-ID: <aPg8wuF5ZodLxOH0@archie.me>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-5-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WWOwYHGjzVps0pxd"
Content-Disposition: inline
In-Reply-To: <20251020185539.49986-5-joelagnelf@nvidia.com>


--WWOwYHGjzVps0pxd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 02:55:36PM -0400, Joel Fernandes wrote:
> +The window position is controlled via the PBUS BAR0_WINDOW register::
> +
> +    NV_PBUS_BAR0_WINDOW Register
> +    +-----+-----+--------------------------------------+
> +    |31-26|25-24|           23-0                       |
> +    |     |TARG |         BASE_ADDR                    |
> +    |     | ET  |        (bits 39:16 of VRAM address)  |
> +    +-----+-----+--------------------------------------+

Shouldn't the TARGET field cell above be fitted (extended)?

> +
> +    TARGET field values:
> +    - 0x0: VID_MEM (Video Memory / VRAM)
> +    - 0x1: SYS_MEM_COHERENT (Coherent system memory)
> +    - 0x2: SYS_MEM_NONCOHERENT (Non-coherent system memory)
> +
> +64KB Alignment Requirement
> +---------------------------
> +
> +The PRAMIN window must be aligned to 64KB boundaries in VRAM. This is en=
forced
> +by the BASE_ADDR field representing bits [39:16] of the target address::
> +
> +    VRAM Address Calculation:
> +    actual_vram_addr =3D (BASE_ADDR << 16) + pramin_offset
> +    Where:
> +    - BASE_ADDR: 24-bit value from NV_PBUS_BAR0_WINDOW[23:0]
> +    - pramin_offset: 20-bit offset within PRAMIN window [0x00000-0xFFFFF]
> +    Example Window Positioning:

Move the supplementary explanation out of respective literal code blocks,
like::

---- >8 ----
diff --git a/Documentation/gpu/nova/core/pramin.rst b/Documentation/gpu/nov=
a/core/pramin.rst
index 19615e504db9d5..47abe539e32a81 100644
--- a/Documentation/gpu/nova/core/pramin.rst
+++ b/Documentation/gpu/nova/core/pramin.rst
@@ -70,23 +70,28 @@ The window position is controlled via the PBUS BAR0_WIN=
DOW register::
     |     | ET  |        (bits 39:16 of VRAM address)  |
     +-----+-----+--------------------------------------+
=20
-    TARGET field values:
-    - 0x0: VID_MEM (Video Memory / VRAM)
-    - 0x1: SYS_MEM_COHERENT (Coherent system memory)
-    - 0x2: SYS_MEM_NONCOHERENT (Non-coherent system memory)
+where TARGET field values are:
+
+  - 0x0: VID_MEM (Video Memory / VRAM)
+  - 0x1: SYS_MEM_COHERENT (Coherent system memory)
+  - 0x2: SYS_MEM_NONCOHERENT (Non-coherent system memory)
=20
 64KB Alignment Requirement
 ---------------------------
=20
 The PRAMIN window must be aligned to 64KB boundaries in VRAM. This is enfo=
rced
-by the BASE_ADDR field representing bits [39:16] of the target address::
+by the BASE_ADDR field representing bits [39:16] of the target address. The
+VRAM address calculation is determined by::
=20
-    VRAM Address Calculation:
     actual_vram_addr =3D (BASE_ADDR << 16) + pramin_offset
-    Where:
-    - BASE_ADDR: 24-bit value from NV_PBUS_BAR0_WINDOW[23:0]
-    - pramin_offset: 20-bit offset within PRAMIN window [0x00000-0xFFFFF]
-    Example Window Positioning:
+
+where:
+
+  - BASE_ADDR: 24-bit value from NV_PBUS_BAR0_WINDOW[23:0]
+  - pramin_offset: 20-bit offset within PRAMIN window [0x00000-0xFFFFF]
+
+Example window positioning::
+
     +---------------------------------------------------------+
     |                    VRAM Space                           |
     |                                                         |

Thanks.=20

--=20
An old man doll... just what I always wanted! - Clara

--WWOwYHGjzVps0pxd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPg8vgAKCRD2uYlJVVFO
oyuoAP9SK55E2tSNnoxS1S+ANBUsz0CHN3jIoOgeS9ZQB8q9dgD/diBfYDATtQIi
6xSU72ZYmtPwjX3snJKLeHqpNqruDgk=
=zVnz
-----END PGP SIGNATURE-----

--WWOwYHGjzVps0pxd--
