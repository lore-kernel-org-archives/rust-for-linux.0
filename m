Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BBD14F70
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917075; cv=pass; b=APEdpBXv3+06iu4GXL8EcVvNc3j5kEmwSOqmOmqE8A00mVkK552MdO6uL+B1JwAC5+G5DVNCxeZ9kaPXJSN89dJRonPXxT+f6OnhAnbeOiQqa4ofdIFfiDgEsj4EoKv7nQ8ZM+VJ+9VPQAnGC7cXVM6blrk9bGBcGpPqVH0NoLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917075; c=relaxed/simple;
	bh=P0IKXXL3Qrj2oaXXRPdrTOoX8OGBhGyYOiD6C220wqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GDb62Ny97BV071t7u0eBsgrwRs3rXzGGPJgZOf3lulZjTYYzbud5qcuinexEMPwtyXnhpNozbgvpNNKi3iuphrwTEHMBOAJxisTV1pqLdfNxl8Bcs+2/aiXYfJy/LFUxrXRT2ZftMii1Ae+J4nIX50ZDSfcV0lsL9Q12g+s9kt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObnuR7zW; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObnuR7zW"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ae5283dae8so350257eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 05:51:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768917073; cv=none;
        d=google.com; s=arc-20240605;
        b=fhX310L1OJXxVGm2UIdVi/IvIABw4uXiDXSXj+QHwc0gWlP4Gj26TmwZOgAbL2ltwG
         5HXPaUxvIfTdsf+qBgMMG6NIWfYr8wErZjRX8Kjx7dbFWyUpCNXD6gnp515/v93Um3F0
         IwAy+IS40rYbLWpGPjqI/otwxf8oU2B6V1qMtycOU4Holgj/SMcptqEeh4qaJN74dSIm
         J1MjiVmXj3o8bjzNGAAJGxpukk32xVrL4i2jUPPO67tvKrYMnE/xJYinqmV4fOvoHMJy
         ulXGXvN16bgkNhgYjR7eOHWJXXD3uFFOSsP4FHXW/evcUseJB+a+lYhUaXs/CBkfpkG6
         Ndag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P0IKXXL3Qrj2oaXXRPdrTOoX8OGBhGyYOiD6C220wqA=;
        fh=8HUesk8ntrzlWK03tct1uVXA9RD8z9QpLurxgbmvtVQ=;
        b=SHYuPYkoOyXbDk3boZBkxclbjigqGYXnxs889bNNjvKTFI452LBXZojoU8YVu9BZu5
         sEniLPsWTQWYRvOjPS3dFvT6ocwHCA2paZzPRQAZuci4CZt3twQrRytLuUuDrwjot2so
         83tYfUxLoWH3M15cPN5AFgao4RAIgSU4ClXX8pwa7F0UdT+14JRiZkpg5Zp78uI6XiNP
         jACZpTjGZ+9gCeglfJ+xp6qza+DPzz4oqkDbNAEty5que1xo11aCCh+LcY6WH2XhM0FL
         8M7L/XxoOC6n0NNEPKGxdzKMi0g1+35KbrcSDMFRAo7z2BHHjbZw4cY61oyGS+cs2tKJ
         VkCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768917073; x=1769521873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0IKXXL3Qrj2oaXXRPdrTOoX8OGBhGyYOiD6C220wqA=;
        b=ObnuR7zWhtiHreNUkVvFlfULxMrCp38+vCHgz+50T273jazMCyYLVvuRFqJrxtmHk+
         Ihk5AQvbLOsk+JTZpBnV8wcsrSnxVPCF8XDsyy/6vyKyzzQDlf6jPrPSwT1mF3S1wPQJ
         tam8e0wAVg7foXKh1LYDxGJOQ0ptfUFakU9HULFNDXDrsqQZasgBZnWa3sbi3avP1/l4
         66GBMaxgW8WaLmqBs5trgFtQUIr6HMcoRpEylVvBibHntsN1C4+BTzM/92dMjBe0UBvy
         sCnzqqMH5b2P0Cq1w5T6bj71RK8whBOzOUozxjDWT1sS9AZjcKVZeK3qqSgoHhr8+6r1
         Fnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768917073; x=1769521873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P0IKXXL3Qrj2oaXXRPdrTOoX8OGBhGyYOiD6C220wqA=;
        b=sk/gBYqI6vyV2qGGMhC70UBMCUx9aPd5ijDdKaU+pd+EbesVf+oNOQ6P7eey9iptnK
         VoHubw+7/r+qITMZpz76qC1eqTPuvoFjMUM35sshy+xqoUy98KHrpmX6T/7wUJN+cYFi
         L3gphjEvxIWVq2tr66Jtl0YFY4P0X3mTSju29kWFKOLRH3qYmsD1DQbZKpPWzszbmwro
         xcMgz2F70yPWx+H7568gtddXj+/9cKNPkJYyxX7gdns2WFsYZ5/4AYmQ2lvuEYd2KT7a
         1RD0xkUN957z0oOF0OopcRkppWjLFifLKumC49tsKCsBTz5iW91mx77NVcTdzdaZELgh
         +r9w==
X-Forwarded-Encrypted: i=1; AJvYcCVhYorylpoKgO1s0cgYo//nDbrlcPE15UWOWwbFiYxMq/WmIsO4bZ0ZvfkgV5GYglm2mwjsFnUoakzQCuPauQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfk5RsSKggLD20y1fNqrFp17cJVz40T35l+6ArBwPKAY1FH4oL
	KsYqiUtlL78T+6I7b/5C5n85DjyE+gwLzJ/aYMvjlTC0mA1+SIx9lyzkYLIdBlbxi9RcnQRJn+A
	9spfdKz1HLHt7b+ZmJuxydG/CD6M3A6I=
X-Gm-Gg: AZuq6aKWVFMhmzFipvxQGD8GIjLRHyi0Yz8MvQS2DP0Me8DqQLJkVUvvl/BQkpC9Vdu
	ny2pSQNyGDNcAeaLQ6cTom0YupRktejncm0coY13TDduzNu+dx9xvfipr84rwhBpbxsMhk52Jgx
	fwLqpmFoGl+qQEoYwR8z+qS+S7ehkwGC3KqnnVtsV5aEEsu3HUl0obuHYe4TfvQOUfMpa6Tld0s
	Si7H42Q8fhNKZl6KxfnXpsPweA2CfZuOyNkdav5VjWwTqhUvMtoFwpdnbYb9zDuXhbTvDIMIxCU
	3p877e+JOWhCvr+yWPgc2ZCcKep3B/UMwEt0CjJAfqUjqD8U1EHdqmUIVj/MmcrO4X6O5Ch0yKc
	S2cb6N51KTMRT
X-Received: by 2002:a05:7300:6d1f:b0:2ae:5b01:bf9e with SMTP id
 5a478bee46e88-2b6b4121c10mr5750027eec.9.1768917072767; Tue, 20 Jan 2026
 05:51:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <CANiq72n9tSMFW1KHsLBLM-q47+4f7yM70CVFNVeg_3Q8i3RTvw@mail.gmail.com> <DFTGHU40Q7GS.2YXW1OUFRM2ML@kernel.org>
In-Reply-To: <DFTGHU40Q7GS.2YXW1OUFRM2ML@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 14:50:59 +0100
X-Gm-Features: AZwV_QhDfDI8fj08AK1d7j3x8Xrhqule3zEyo5l9qr9CBcojVOOHkNBa_hjEJWU
Message-ID: <CANiq72=PWw6MW8NiHtFPmQ5C8xjzVJf2OOpVP2YQbsFqrB4XMA@mail.gmail.com>
Subject: Re: [PATCH 0/6] rust: add `bitfield!` and `register!` macros
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 2:38=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> I discussed with Alex and Alice that it would be good to land the registe=
r!()
> macro this cycle (having some local to register.rs bitfield support), so =
drivers
> can start using it next cycle.

By "local to register.rs bitfield support", do you mean something else
than this series?

To be honest, I think this is all quite late for the cycle.

Cheers,
Miguel
