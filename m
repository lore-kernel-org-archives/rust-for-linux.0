Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7928A3D9024
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 14:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844247; cv=pass; b=NebQhVR7rGbTEF/5MZPttXRBtI4XtGRnluF5BuPldIjjofVJuFPxuDTMWikM2TGTxUhu6QXuWS3S0lhHEuWe0MkhDy6+l61XPi+Sok9uPSFlw4UWRQHXy+nx/Z/78SrLHLek2bdxsHR8Gq49QD4OgAL2BIUtppvyIpJiWgse9IM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844247; c=relaxed/simple;
	bh=Lz2XCxRPQhc2ZncmeIQiQRFj2Y2HhTtKvhZaZiMtVkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/C4+/vkHZM0/a/ivI3VUUGjRDRsdav/siTWWV90a/Qya4XLLyz8fmAKplG55O8CFmSsvgwS836oZaZ05aojW1PakKl+HjQz5OQnt1BL2Cmy0VM66IebdERW5an303CSfvyv2V5fVdVJ8hR0L8hlPO4iGPKvtaAWRbMjNn0uXQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvLgOGPz; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvLgOGPz"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-124713e4244so474901c88.2
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 07:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773844245; cv=none;
        d=google.com; s=arc-20240605;
        b=X3VjIPNoAhUNBWs/OLnxmGnLGP9qIdSFx/EtJba1X7/U6PnFqR4tagn5699elTmtdJ
         p6Tr6+BMlDvcNa7zdiB+33McQNS9yy0WWIudZHlDTwQFGJxRPc5S5Wk6EVDsISHY0sAw
         p659QH01lNTRMduMOxaRe+UIa3neS7eLz6/uo6mkvCtVuctsjWfmMlh6rs2Al4Fa/aiU
         A2hzIpnQ8gGlZwRq/3IKxtoh1lxF9RJeFTVL5eMJ8dx4J2/Mkr6P/b/YdNZqUgxiLO/S
         qHm8i0t+Pz/ctyzPJfpWze4OLS7M7ckAeo79wiYoR940bF7//rLKqvcKxfJIs34zZ3Lg
         FfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lz2XCxRPQhc2ZncmeIQiQRFj2Y2HhTtKvhZaZiMtVkM=;
        fh=dPpWelZhc9yocyAjqkwByHVVDXAgs0YX0LFI7mzEtAA=;
        b=ViIzE26gXbDYiZ4m4vg1OPMyNOoD1aLNCxERQHwzWXuYuQxfLZshXUJrBIa09joSwl
         cwEwfnZqqxuBKUVPbvdTQKA+KmhvIDhtRAtqYQG/ptR0hj/ZUEhGv5mPquYG2HWbjzfH
         FhAYKxaRwT/LG4CrWs7tYHBajRSY8IfTHVlrDtgvWxGjaKPX/Tvka6lXw1xZ60xP25oj
         1iVvSI8+bePpyipZqcR23dqj0+Aw5pA/2umrTy6NO38pTv1J0iO+XtytYWttHFcbTtGr
         kIglva9qPGTq1SwrOesazeaZi0frquT0EaOlpMAfdNkI5symLEjj7GCeO3iCcasFzgT7
         R4gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773844245; x=1774449045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lz2XCxRPQhc2ZncmeIQiQRFj2Y2HhTtKvhZaZiMtVkM=;
        b=WvLgOGPzBVE7DbcyREPvzipwUVhh3y9mBh1WrEZZ2YvFrQjfWy8/tOqDK3DmG/LPgw
         TVA2wM+PqVVK1OEumdDSOA2AJrXy1ZeNHZsgVBFC3KIU0d2MOAEM8c486BlzCA6Fq8gm
         /WT9lH8UW109y7UeozteDGT7NcxKwRGj1NU7nPkRNADh+b8Xqo8DeocrNYe4cd+YCk7W
         BdXV51BcQdBLRReAAsjjBCQLPo8by9cd/pkhPO4L7EVfuz/yP1+aeLPQAD1zu1H2mcCZ
         aGqGFfTpIvaD9qGhcoKxlKhe7GZYZkDzWBiqE4kkesXwBH5x4yYXpuicQMEqu9pVSg8N
         f/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844245; x=1774449045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lz2XCxRPQhc2ZncmeIQiQRFj2Y2HhTtKvhZaZiMtVkM=;
        b=Fsng4uhNnLUBbnbgPHfFNViEbSTek9z7/tM8evC03xtLUOjnHY25PWa7Vo74L2Lbxw
         73tbgnKhIhYnuxRGdX5aYw6UeorIzZ0JVuyEf6g0nXgTTPFwPcU41Hf1b3VT/fM+Ccrb
         A/uKwQSNEEC7Sb+pYPxatJp0yr5yzFUD9adUSXnb4b1AgFczktnBkVN1fHwNUQ4TpASA
         4BJoD6rNr2g56tC6Yn4dX7kUTs9/GDSNIUfdfn4Nf1vQC3kWSrhAI8H+UqD2z0gcalk2
         59YfhdLid6XYp76ZkUG+1psF3qaZ1kbLfpzJXx5BoF8hjXPdgajkQuQe6ycZGGlRChrQ
         sTmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4k/q01JCaH/iBO8r/xHLUtGbXCKskPbI5+PrYWO8prfZkVRRhJIgOFjvbisedq0j0lPC8XTSp2lEETRLttQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh472Gw4PLKJqFV6yKWj/t8G2z4kN8Vs07Q3gs6tqzkdtGYn7D
	PnZTOdSH7NTg/gOCpZsrcdPgPomkGKzy8ZYWrZNF//p7DSkYoSn6YSyD39EDuWp8Lk40o50dN1N
	P/+13o4AZcGiBgfKwUfZsTWfYbQkB4cc=
X-Gm-Gg: ATEYQzyZVrOMUK3sucK4wlOLTfenqiIFjCjVM9Hn+1qDOXn6AwWijNitK7jCx0c0HA2
	EgM3kteKb99/b3D10piM7aE57LztYpcQiquv1jT8kR4otCtj4Hs/a94TlIJgH9yih50+dJ8dFJr
	jgkOU8Tc74+F/G2d0btjrhlysYoXcKyYH1mL25+5T5y5Jde9lU01xO57jianhRScj+6sJC4p7ks
	dY7wqJpGv9evV8aqfawSWtOvFjIqtGeBWSgHFcFIwPNnOCdvnVbN7MMQJgMeqfFnklPYSJtIQ2K
	K8xWZ1aIl0xSO61QL5Yj4NVWKcZNh4nNhRMcwvJ5j9WYkJsHumKBCbWUNed3KD7ZpcEDoFl+mva
	Q7MNFMdaO
X-Received: by 2002:a05:7301:1e96:b0:2bd:fa8f:77f4 with SMTP id
 5a478bee46e88-2c0e518610dmr846274eec.4.1773844245396; Wed, 18 Mar 2026
 07:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com> <CAH5fLgjUMaC5v3SERZLosdD1ajU-fvKSgNq6OgbBBcoTS21-Sg@mail.gmail.com>
In-Reply-To: <CAH5fLgjUMaC5v3SERZLosdD1ajU-fvKSgNq6OgbBBcoTS21-Sg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Mar 2026 15:30:32 +0100
X-Gm-Features: AaiRm50bVmwgAQrBl1Sd2LWxaRmG-ZY7uRxgxq5LrbNAlb0we3rijRktUCTLM4o
Message-ID: <CANiq72=GGicUCODkY3C8U53wQfsuRYeu9GiwrM5eFhkP99kiHw@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
To: Alice Ryhl <aliceryhl@google.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	Nikola Djukic <ndjukic@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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

On Wed, Mar 18, 2026 at 11:59=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> I'm not sure we have discussed it in detail yet. Both are used in-tree.

Yeah, we have discussed this several times in the list and in meetings
-- please see by other reply.

The handful existing ones I think were all created by Lina (so perhaps
some were kept as-is to avoid extra modifications of the patch -- not
sure) or by you (so those don't count ;)

Cheers,
Miguel
