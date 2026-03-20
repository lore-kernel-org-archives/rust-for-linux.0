Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2A23A75AD
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 13:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013209; cv=pass; b=n+jm/seD1UgFQJOKW1Kgu3dYJCn/mu/FDDjJoznmL1VIxmMc7HpqBJhQH5mpmkUj5JM63dy/aJ0RkY26iKi+/0fLb2Bu2sl2+KPVxf0pMaNj9fkKFN1EV7a+8EoUZfQhNccFN6R6cf61bLbwqWcOEZo8mjZ4KD/+gtsXdbORmOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013209; c=relaxed/simple;
	bh=lLGrXpL+y0tfSzYPzCkJ/Emn2fPjhYDPtU0FJWgqkyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Amq6+wxPsB6eXzfLM+U1a7cLARXV0YWT5Jk3kfVfW+n/sUv6bbc92Ln6Nqon4V115bn/zC4qB18+KMl3sknCPgbd6OEe/XrsnX9/sXeeZpWgM1Ap9gPf0q2CPrfHcHxEQIokd+JiJHBnLo6dDIMkdmLZy/19nmqHGwqtrJYoCfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jcdFN838; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jcdFN838"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b40fb7f95so1987004f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 06:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774013206; cv=none;
        d=google.com; s=arc-20240605;
        b=LuzpGObpdhzuC0YASQ1kOCNbFHGBHkdiuQG4MnTjA14WmCVKl/oNslnttmPK+UYaN6
         hPZzL6CrYRowQXJjHS+STDHO8jHCpC514VQ4GCOOybVa3d69i5gpiQycNu459Mt16Y6X
         D2idNk3SCgTYDPZLx8LURiUXflG54x6JwV5f5Jh9keutnZZdc/7cK3CMwnbTz11rEQaR
         bqugdVrgAHgZy5R6z4J6NDyU9ca0d+Mj5j7gJMVoEiQMULJIxAL5Y8gpz6NoJeZwWAjY
         mxe1G8pHByRQ9HI1EmI7dBX8WQy/rtm4CAU4SJDW7hFOz7JX63kmRU2KvpvFY+vDUzhu
         TbqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lLGrXpL+y0tfSzYPzCkJ/Emn2fPjhYDPtU0FJWgqkyQ=;
        fh=ONR5Qao0T6jJHRYySS8dREn9oqmBQfGWiAsApXakDKY=;
        b=IEGquSbM6ko3xCxfjBkjeE2vrFmXnJojp0xnmqwwwCd4nFxIBk2AQfczne1j3SdKZR
         2SsN2pTy6Y/WPYLZ94SMjTjIkJciHpkihkoW+bOMH/w+R2jjmDLZiUmNwvA3tO9Y1/z6
         r1JPBVedDy90zrK4dn6oRyQY2cik1CFejDY7A78m5nW8nff3ztmIfHo6Y6vaAeqMksB6
         CoE7xQ62KkWIMpkRvVHiUrU9qJaDvMYKUjSZFSnosGFbSoASn3WkqcFY6GDBZcqoDVCF
         vaLaOUQO0noEuuhLJeRzMfJDDYf/b9fmI3bXrZ7fwWx/z6Hc4kIAK9+Cp2/z0c51jDAX
         u0gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774013206; x=1774618006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLGrXpL+y0tfSzYPzCkJ/Emn2fPjhYDPtU0FJWgqkyQ=;
        b=jcdFN838k1p4Xqr1l3UAV3hJUI1wR/vvwWhpBn1tPOUVkL+ISpQRHfRsvqnuENLUzc
         jUw/fMgj7xZw3c7EZlz/pay7n5Qr+5RKfotDcWXpLT9t4KEyebyLaXT8lwaavVtRpV73
         Ccua5QDa6A5w0ZzbHKqpjL+G1clwRt/mhqgl8AnvNjamrjdaxgR85EqwdyGyLkqDmbNv
         AxbZHmLzOPcUnqvqNvfKYCrgvaB4ARQWxmz1N9S8VDb4kbi3vI5iQknbZ4k0ic4cfsNR
         +xy0YemXE0kD2gR7ZO89PpRcybRDLabXk9wmYbB4a5z8h1MAU5/5ECWhQ5FLYEcb9wMS
         UuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774013206; x=1774618006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lLGrXpL+y0tfSzYPzCkJ/Emn2fPjhYDPtU0FJWgqkyQ=;
        b=JXrCf23BbEYsV4XTKNKCKSzkgdICGaF1OiFXNA4iQy/5JBX9y0iqB3iKaKwljD5lRr
         yfZ05rrYNCdkhMJNEs89ri4uG2RBqjdzgiUMHlsFDxV4RpUFDQF4k4Si+EY9bWkLAig0
         iOsuBliCftJhpBJHZIoojzqe0x2y+zOamt941Qv9GnMgUPK7ApJq7raD+JShXO6sirtr
         4KncGSm9frBD8VCVilgzEfzqhVPT1EIOPDYIgg3MLxpZLf4wqXiKNyvkT9I+jXA8yvmf
         BGgZnt7y7e9rJrUubnATg36BP0qKmqwmpZqR8ldEPQf0koYatJqWaH7Rl2XABj/eBN+3
         x6oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlmRE3cgRU/uFoG/yI/3GMb9u2jmvVc2mOmqm2XdqunawfNB6B68KxT47z9hG2ZRPpnNnihYrbz7rDkdWt3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGVfxVHh8z7oBk+slPNRhxtNneU2SM4n9sHi7BZvkP8zc5aORN
	XsU3Pl+SJcUgRuioILT87gXNMcAjK0O4JlxJkyFlGbuJD1OxD3XgvGAP8K4KB30MMlYvr+xiyEU
	xZcOt6GvJ4k+8hmAPfl1PYn83JGQPf2nFvtKqB2tf
X-Gm-Gg: ATEYQzwPWan6TZQvovIZAuJeRf4yRHm2krtFc/LcT51uMkQ4axcHUY31yrWcwOqf8jG
	76AZ+eYN7xie+2H6K9aHR6UwlluJQ/m1pTviZ6OADd6hTQiLI322WnfCmlqqHJC+PfYQCGyXSfa
	hX/DiwxipRUdVXudtyxSA6Dmu4+rNlKENdXza0W6wTqcVAgc5ED41AsmXfwvluqVPdPUOo1MxsM
	HUPpmMBNMoZ4ufSiXOSKDQE37VROT5ewxRig8s9APp/JfusYIZBpHEnn0vrepT5a8ofcY5F2ajR
	Zqzx9Xw2YdIWcY8trVdfKwSJUfudcFvF77vpYuWFCugbkVIekaCSNeEtQNFDmKwTCYj3bg==
X-Received: by 2002:a05:6000:1ac7:b0:437:711c:8754 with SMTP id
 ffacd0b85a97d-43b642347b4mr5604407f8f.7.1774013205776; Fri, 20 Mar 2026
 06:26:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317225355.549853-1-jhubbard@nvidia.com> <20260317225355.549853-17-jhubbard@nvidia.com>
 <125cb5fd-55fe-4c54-bdda-0478f5a8aabd@app.fastmail.com> <CAH5fLgieAZz4YAp4-Y1240mVt2V_Pu3TJ8YZyMkP1ZG_neafwA@mail.gmail.com>
 <d766522d-ef82-4300-919c-fed89f2f04fb@app.fastmail.com> <CAH5fLggFsjciKKxv7_k6tXqL=_8JrgAVWq-+xVH1PkGOew44KA@mail.gmail.com>
 <6163dea3-fa75-4403-929e-8ba9ba22eab5@app.fastmail.com> <CAH5fLgh1WMaUpLGTGpWiVjrnTtgFt=hhoutQqxV5DOtrGVsfkA@mail.gmail.com>
 <c7e8c581-5072-4184-ba75-783233bd52fc@app.fastmail.com> <CAH5fLgh-2uQbd+EvV2RT3prp4LqzLsDb1DFkYgj2kWZX58izfw@mail.gmail.com>
 <a24da031-2aed-4e08-8b32-b255292c137f@app.fastmail.com> <CANiq72mHHxU3jzMG=CqtS+ACZf6gz-9bL2H717_MH+rkALn+WA@mail.gmail.com>
In-Reply-To: <CANiq72mHHxU3jzMG=CqtS+ACZf6gz-9bL2H717_MH+rkALn+WA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 20 Mar 2026 14:26:33 +0100
X-Gm-Features: AaiRm52m93w2N5mPqlloJWnilhteblwX95sVRdQ1iW4RljVrlT-0mSq9mAw02zQ
Message-ID: <CAH5fLggX7M4BEwOsQCUPG8HBfwCTcqvq5P2f2o8M8Zz6174yJg@mail.gmail.com>
Subject: Re: [PATCH v7 16/31] rust: ptr: add const_align_up()
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: David Rheinsberg <david@readahead.eu>, John Hubbard <jhubbard@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 2:16=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Mar 20, 2026 at 2:15=E2=80=AFPM David Rheinsberg <david@readahead=
.eu> wrote:
> >
> > Oh yeah, it is definitely worse, but I think on an acceptable level. I =
would argue the cmove is a non-issue, because it is a reg<->reg move, but..=
. meh, not sure I wanna dig deeper.
>
> If this is mostly meant to be used in `const` contexts like in this
> patch series, then the assembly doesn't matter much to begin with.

We took away all the elements that make it suitable for const only
(panics), so I did make this suggestion:
https://lore.kernel.org/all/CAH5fLgjbZZaxRaAvodUM4xkKY4YOz=3Dn-hcWG-JraLi_A=
cu7u8g@mail.gmail.com/

> In any case, the goal is to eventually use the `core` type, yeah, i.e.
> we have `ptr_alignment_type` in our wishlist.
>
> Cheers,
> Miguel
