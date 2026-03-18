Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD53A3ED105
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 18:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860249; cv=pass; b=eLjve+J7D1+tbZV46iQkHtmrmFegTTMWQHYetLwY5xqrGwf0opILTDGn8ZUBdC9oRZ4OIfU5F8FtfCqb+FqFnTa/EVKN4WqCAmaryQxeeVgXY8ST7eenYOYw+dLg0ZDhGyrWr8B97U9PMfzYTcEUgdCbpUTRjLGdU9euEJ0HolQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860249; c=relaxed/simple;
	bh=d3bcHjPGT0Fov9B4KoCksRHw66Y8wxvQ5LjIruDyWqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R13n2OUASuMFaVHMKPCtmM38JZkVwZ50Ex65l1cZsjlZv1pkPdh0UoEaaUfvM/bI7odyBBXtJZddGEZTxvAgTi+NT3aIzRSvzqyDQGFt48lClrciP87kSsqZIurMXJkakIB3XVyJXumg5cmGnwc+qu5XxFqDiaobfaCEVkQBVgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYiFswS+; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYiFswS+"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c0e158158eso6622eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 11:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773860247; cv=none;
        d=google.com; s=arc-20240605;
        b=C0Sph28VBx2CcZeLR1afN3rM3p4xc2TKPZ7qgVZAPqswOZxFk/E8RT34bk9WV4USgR
         ydH9lviOfqDXiMktxe3DSZPYMF6aAoPTN9OIWV9XvM8//SnHJBkc2uUOVks8wHJsBNeB
         QKy32BI8OF1F79Rpu3S3fv3wkLhpQjKZRVOObfTXYy2LGHkhYTeNCXwm5Vu5pzfJUaq7
         UIvVIMOOHE/mzLjz8Rpc3jyMNqI6kKrwdzbw0KW+986OPvwT9qnSkLce/0FIvPQ6/cHW
         JSEswogze98isfAL9MIIcpSfmHFT2AEkf3fZ9Sq1XWnO6WA23AhvPurVVwzDlq/hfIJ5
         7Mww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3bcHjPGT0Fov9B4KoCksRHw66Y8wxvQ5LjIruDyWqI=;
        fh=Su6i1agO8Rz7b5sNpDPJA42y9AwaMHS0eQ1Ec2dW3Cc=;
        b=kvWUQI07FZ8y9ulmJfI2HYhLdHWCDcIyzPgjbt22j3YEF6Ksu0xsdX24USs5sZxCF0
         Id2DcOvkvriYEQJ5snN9gMAcOaJA2P85mYFUL0zcAZZk/9dwrdCrBP2yGKRTMNKOsIGH
         qufKJvzXT6aJDUJ4wkEGMLfP8QHBvJ5RzmAbb/1z8PE8ICI1ec+/+axIOO0AMWugJSTS
         pyhRGwRmVKHntsIT7r3jr/t4480jfGOT4CPM/Kcm34/93oYqagdt0F9DHydJWY1TpuAF
         P4QGpeDMbgv8vtubKBUHotXFiJU3PgAwTXumieqANZjPPfAJeStnmoHSgj0UxPeChpml
         nZiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773860247; x=1774465047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3bcHjPGT0Fov9B4KoCksRHw66Y8wxvQ5LjIruDyWqI=;
        b=bYiFswS+IF473HnaBsgMKvJRSNlZN/lfwu86MtxxErFc7DcLsZHIxIQ8VwiGoz2igY
         LMN9LeIGAw02c01Ds9nr9kZrbrmMr7sm7FwmZctAlzxG19G1L2XNm76WU4GIro/1DiUc
         DCZlr+tolR9/hW3MpT3u9TluRJMPMgLgKtlXcsMNi73+V5gKzLC4ZkDjkvz6BQehoGxc
         T1K8Ja9T7lg8kQCI3VbTQb8TXxPEX0xZH/6zkapxMaNAFtrwNHsFP4OMNrDpqavYa8JA
         tAJsWnbmAEril4JoMORwlcPrj7GkzZmqGiUka9ymMiJr8EV+npcabUuUCUMYKN4donni
         JACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860247; x=1774465047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d3bcHjPGT0Fov9B4KoCksRHw66Y8wxvQ5LjIruDyWqI=;
        b=sQrc8q7t2JJ0bLmnq1DYHOHqHigI+xK9bh4+BEbWpTuyUTG9BDsSHMs9ns6mvrsgmp
         I+RQ3GtimvEv8hjQUbL7SKfEVuAMrV83+ngRRjKuSgCDA4l8hL4ryI+nCrm6mk8TflKw
         dxa+PeztlleJcBiGLQJ89YGG9Am6GIjyuioiJhMLe7mk9pWjxHHsFxEJQz0+wsAw0Caa
         dc4jrAr//fI6l/Ab28q4u05XN0fbiJUcjNMnC/BRezqRJY63at3WPX8AABYz1/k4OrlO
         lMYg1m7Jtg/OW4J6JxgheJSm1dB+Wi7ooipka5wMvjrDsa3WQBRWSh2Pq5TaaBuRiRZ2
         blxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfwl+Rh/ySQjrDZGkPMmRdPFw4qnMtmM9Z8aL4Pr+sCTZOwaANpxS5g9zHCCE5e6iSCfQGgyqqI08lu4alAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YymzY9nd6sMdwdW+gjgOIpiYEF2qUKRFZTWmzOR83dVhd56XKSq
	BbF7s+AQ/Al0V/qkiPdUdr3e9ZzP+ayDZ2fQdF0sQfWbC71H5YJgmm1n3v0AgduFuYm4/cNMJjX
	njTve2UABen89G+Bgw6yPKb45Mjzv3cE=
X-Gm-Gg: ATEYQzycwGdiyxIp9OxP86uZBemIIpnb6Tq1pTBwMYr/KLX1AbL0lOE0XyZJa1eI4+1
	n103yagAW9y7oGEIY2UlYAGZnv/A8Ptf/f4kv3P9giiCSBQUlKKlD2M4GYH3/i2FAKJcidF7Bq1
	5W7gXS4/hgBSjA41g+1JHBU2lRDjoDgUn8vh4+naHQit9yMa8UUHmOiTV0dN3CUPb7GRJivl0dS
	bADmv5UdsParXpDEX56IZmy8rgQJfWxAutyfGky5MWzYFXjhRIAudL2qu2ICydwhSQGCPNSf4se
	nghCFLxgTGsctolUwqTHlgphIo6sL3zxvQTyNHeq208VDiZ/Z87TQWCAHQjy9LWbz+HvP/p22z0
	g5byw7ao/YZH9ZPPxBXLlrUE=
X-Received: by 2002:a05:7300:f191:b0:2be:9886:d4ff with SMTP id
 5a478bee46e88-2c0e50fefe8mr982481eec.2.1773860246896; Wed, 18 Mar 2026
 11:57:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <abqdUBqchnVFo7Qk@google.com> <71b6a115-98f1-4b09-9c04-a99349f51e49@nvidia.com>
In-Reply-To: <71b6a115-98f1-4b09-9c04-a99349f51e49@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Mar 2026 19:57:14 +0100
X-Gm-Features: AaiRm52hIUr0vzgoavDmbzyJmg3hgU_AUfgRxMfUiR8zNc5S5daML4wMbNTdaCA
Message-ID: <CANiq72nZKx7pw_rZK2mHHvR=TaeGvMRvg5GTHOd58X17oyxieg@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
To: Joel Fernandes <joelagnelf@nvidia.com>, =?UTF-8?Q?Alejandra_Gonz=C3=A1lez?= <blyxyas@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 7:31=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Anyway, the fix is simple, just need to do // SAFETY*: as Miguel suggests
> here, instead of // SAFETY:
> https://lore.kernel.org/all/CANiq72kEnDyUpnWMZmheJytjioeiJUK_C-yQJk77dPid=
89LExw@mail.gmail.com/

So, to clarify, I suggested it as a temporary thing we could do if we
want to use that "fake `unsafe` block in macro matcher" pattern more
and more.

i.e. if we plan to use the pattern more, then I am happy to ask
upstream if it would make sense for Clippy to recognize it (or perhaps
it is just a false negative instead of a false positive, given
`impl_device_context_deref`), so that we don't need a hacked safety
tag (Cc'ing Alejandra).

But if we could put it outside, then we wouldn't need any of that.
Unsafe macros support could help perhaps here, which I have had it in
our wishlist too (https://github.com/Rust-for-Linux/linux/issues/354),
but I guess the fake block could still be useful to make only certain
macro arms unsafe? (Perhaps Rust could allow `unsafe` just at the
start of each arm for that...).

Cheers,
Miguel
