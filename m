Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B921F09A8
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694529; cv=pass; b=rY7Pbc6QKfbchJY/Es0RuSPNj8Yc4cItJrMzyADHZpnE37mBZ+gy9xIfOs4cKF1qucHYQespsw1TK+pD37HS8kHIohR4plMRirHBO3sRoIVEOsSvNGbI+g8omskgY19Jk0RhUB2dNE0y/fbHglxLJ5RzhZcdinaBZsrcQSPUAbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694529; c=relaxed/simple;
	bh=fZnRJYjliLTSIR68GfBioenoxA13Fxczmz9EFPFDm10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9YAtN0WT57COZ+0f8zomq+sQVEbwFU9MKnrypI1i9N7Rd0oaU9RBXSRyVriYsWIw0E8c+ScY6eblO0DD73j8s1jrVt1U5sZW50q+ZNThjfF+J0Igz8oSH+e9VdnkmD/ngiLytJwsk21Lynmk2miS2hr2AT2tNOFEHFapT2Vm3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnMKl6aE; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnMKl6aE"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38cfcb507a3so137289a91.0
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 07:42:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783694528; cv=none;
        d=google.com; s=arc-20260327;
        b=lBt1eioTbCkBaHHWrbyBYTggBjgjHPHr6u0jLf7LxAmafAKz0vToF7gDLoTwInC8+e
         Qjw6S2HpD19WAB5Di/ZbxZ1OFwTeo5TxXlyaBQMusE8aqmICYFEEuwpkZjUvBa+Jl4DT
         M5VQLCH7DBoDyroYNt19qToqP/DWIXJnCMpL1zOe9O+PZzvx/q2aGVido3McGnoRTVrT
         sEAFrY21Pavp8LnWt96iT4q96D+NpbI4Op9mxsIFkc19BynIcueSmkt2Gr+lf6RtJhXg
         MDt4N6n3MTsgGwuknQKOZ7da+CwE5q43os++ZoFn/7vfkEDVJ6003qcHNT7+pgyP/lwP
         SeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fZnRJYjliLTSIR68GfBioenoxA13Fxczmz9EFPFDm10=;
        fh=yvsMSd6yAImi/VdpEs6sOdTt8nzK94OctmiE26SWTC0=;
        b=O+W27RNs0cyc798enF35xvQwN2a1Mu9pzgaL0xYoLCffe8iv31D0/9YBaZ82dOU3/E
         PHKoUYe5w9I2R+0c+R0VNpYj08bQ1VgrmgL5lHP3+5zIPT+7eFD8yzrbcAge1fFzoAlL
         +RFh2ygOVFrEOePLZr6gd3iDHPPMjE2o6aqQt/44espLphsdZdCUWU25OMqmICuaUxib
         ls6LdNGzZ9W2sKgLHzt3Ka0eZjktV3PToHFKwOSrZbDRuso+NrBn6tDMTAkHy/kNRKbE
         JfpnTVC1QBT5/qVQFtXvZGSc8J9zGOwlh5+i0kPpGPfCM6uDuAxwIMHa/x6zlTLQGHRF
         M4RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783694528; x=1784299328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fZnRJYjliLTSIR68GfBioenoxA13Fxczmz9EFPFDm10=;
        b=hnMKl6aEpTf/fCX+Eg+VEcD2EZfXBOh3maQET7xNf97/q5wz95sC1ujgcxGYpbFsG4
         +r27gvAkD0ewsfXtgEtcDPura/pzyqCzPGXuJMOokTOk2ZUbVoKZHdkF+nll/JqaWtaI
         oFgFtmId3dmTgce7XotjaoYz1kEXVR6PKCIr4Ap9o0vIWitvW/S7dVIjkJYgc0dcK7iq
         qR8pKngS4UmH1zxynAGVP8s0If/PPFYzU63fXD5ThcenJbkm5NGUCapzYa/uoTrBTkJd
         Mvd2N+QSr7QZFGMgfF+ImLc/SnecUZIt78FvrZAKXdEQaPyvpE7gvEby3tE+qmcRMkor
         eOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783694528; x=1784299328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fZnRJYjliLTSIR68GfBioenoxA13Fxczmz9EFPFDm10=;
        b=bZEh6Ou92K91lvJdNynD2mcZ3JKCxNeBiYSwXMKfKUdxJZbvwL/4wqJi+xEhJkjPpL
         AIV9zzUmMjP5fk+iFCELaTs8x1rrPJML+nKMc9+97U5q2UzE5JLxPktMBoUXyJl5nt+A
         y7XjWnM0/70gdson626/632yNQM3miMYmR27Tt9/siHU743cPjwHOTXb7xMG4bdTaE+N
         Wp21IsBrLBmc1o8bFHzKc6wS8ZtacZDl41BL/q6IRab/V7g/UaBsK2lG9PSpwdGPdbYy
         fshRDxYdEDULnpb5pBQuF4/UG4W4UCoJZwZTKINn+OFS8LsfUYedxFS8vhWPkFokPiBR
         ickA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3SBLYVaaoQRMlVZewWDOoD6sWTxO/q5Q6fU9ENAF4jLZ8X6l8pRmCFG8EjZXTQK5zG16d3+CqMcbCm21MoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg5WCsl0kQmJ9srSWN/DU3G6RV3gPs+3evCPY/EXl3lnKcSD0a
	uSDXrJA0p+WwS9ojjARdJq0ZJVoz1ceBCPOnn+7H5649yDCXcKQ3tUfhDrgwEpD0JN2+zZk1fH9
	Bn79WQ5AQ7m1HWwAaUG9ZAErV2Kcvj0Y=
X-Gm-Gg: AfdE7ckNgXqNvycfBSFtF2HodySPztb/r66zVEEJpujxG8v1yt8EFiLXJ7XYcSY0pqj
	6Vdq1xmSiKWAEfOLv0W8pP1pGisy0FXNT/XXfTrDilGKIk47VpS5ONcscbnS3Qb7pAgcvhBXqbm
	St0RybtaytVgRK55EZ9tz0QqmLkpMj9xuFwx6jO6Hr18wp1gQQS/kC5Stlz1fYUs3HWIFeSn6Cs
	5jqOVmjUvgHG/JYuMel65kz0/n7niVbhnvK80mkSwKtoBEaB8n+LbbsMxcUzuTNSMyBHwkDFhvT
	sfclL87pdp0Q9MH1H84eKwQFMoSd+931TflySvyUkwHp5fpiAWKt80quG5N9/oDtKUG/f5mBAYh
	dnIzFe328H89/BmGPPs2dDFc=
X-Received: by 2002:a17:90b:3881:b0:37d:f70f:fbf8 with SMTP id
 98e67ed59e1d1-38a1c1b0a81mr6904214a91.0.1783694527589; Fri, 10 Jul 2026
 07:42:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-modules-value-ref-v2-1-12ebbf0510c9@kernel.org>
 <52feb9b1-2073-4fcf-b2d1-a7f42f1e72a5@suse.com> <CANiq72m3w7L5CmAsFvOpSh_jNk4jL8+A4vz8GEp+E8FY=TJcRA@mail.gmail.com>
 <30e500ce-e9e6-43cc-bbdf-ded7c0ae56cd@suse.com> <alEBInX9gD1M5NAr@google.com>
In-Reply-To: <alEBInX9gD1M5NAr@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jul 2026 16:41:55 +0200
X-Gm-Features: AUfX_mwgK6QohPOXWRFfZuE1sgrPdYMmuLLdDx_yM4D0tdqeJa0YzC1RtoqfzLA
Message-ID: <CANiq72=J=5KGq_+nurjBk7nGPeP5iB6sTmZFBdRd_QbPSMZm7w@mail.gmail.com>
Subject: Re: [PATCH v2] rust: module_param: return value by copy from `value`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 4:26=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I understand this is probably due to a new function in Rust stdlib that
> is no_return, so probably not caused by this patch even if this is
> triggering it.

I can take a look and perhaps push a patch via `rust-fixes`, which
would make it fixed by the time this one lands in the merge window.

Cheers,
Miguel
