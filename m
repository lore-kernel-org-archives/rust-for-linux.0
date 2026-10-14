Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57DA4CDA3F
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 11:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978939; cv=pass; b=bT8U5OzG1HvkT17UbAZZP7nFGwBUmpNwpmI2j21CK+JWeIBIdNB5slGGvNwyMwXddJV42Pg2I7EgKGTUwzQN4ozb37ZnqCAAiUZeo44emLPatJNoKeuc7fw4gmIE2sqjG3eWlZq3+Db1HIt6CiQUnAE1kAXZUsxglSLoV6wXfz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978939; c=relaxed/simple;
	bh=UOEweZS6trAcPbfFLnePxXLvJnCf37PYAyuYtBQlhiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9IBzqoBdw6qIhKIZZYyVzoK5SnDFKA75o/PD3LEgcqzjJo7qeR3zREX/IxeVi3k2kMdm9vVou50tihCNsarqh+PNmi0EaewRhxVNrazti7fcO4dK09rX3Vq4bxLhlK86YancMkhR7tGP0FqcLafdiOWkUs/eTYDBIzPoMaUajI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtvNPgrs; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtvNPgrs"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e8ad5b2f61so2049905ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 04:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791978936; cv=none;
        d=google.com; s=arc-20260327;
        b=RVXL7mHdDxelQdxz2Axgr0vQMZDTlkyqswgsiGqDjmNIFIVjmU6Pws+T3Hd3iMgSr/
         YtqkWuZgBClBXJKadLkURH5Yg8qqygqSrRxX96p0m2fzLG47hqFanimsRdXzhKppKU8/
         3XhgCndnX6h3AB09iwLQ6OQn6+2AZsNB5GXjfpwp8dLWN5m5CB2Sbe3jW9uEy2QgowL+
         0iSG/S49ZTyuOt32tr+b15qQf3CHnChiGAInzWf0TGL77s4fvXyh2DFN3Qfn1D5SwSH6
         eWBoe9nAquqoq9/ECw7T+glIe7v+dyaF5gbnd7wuvGkEMN25wDnOqGNzttuCBXkw+95Z
         R36Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZL1VcmCEoEc/E9Vz8+yrrGu9lFYnc+yK9DwPFQPT4FE=;
        fh=pt+2Q9ioC3MT+hjXiCmTXeK3V+4Q8qjXv5L0eFAQyYQ=;
        b=m3NMfbN67ixNH7Ptcm25ebtufZStbZLaHy0AGkqkynqT2tMNePsDJnyNCbONbZ1ceA
         yrnIqbF1GDedQtMviD60EVkWBUtNaCzQuOlAOYnHpY7E4UxDapRCB3f5Ui9Uz5TdiKrm
         dVnud3oe3w3PZ0TGCiyuqQUyjWKmUYO24jq176u3GoJQnQkii/53uechdCcWQ9x08jR0
         VgjxYNaO/Is9Ozq0rsRe74pUVHPvWffnPq684Z1GdpZgDcItZETey6KWYHJOsqoZBdBy
         FzjqNAKL9WuLDyYibtPoGN8N9BgyJpkA+JrVHdsBGg82JaqQc7QtW9l6IAP7BG5whYYd
         ZDYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791978936; x=1792583736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZL1VcmCEoEc/E9Vz8+yrrGu9lFYnc+yK9DwPFQPT4FE=;
        b=DtvNPgrsLlaTZt94Wg1Lkua7UEEQwBtd1N9hZ5T1wsidqPQwwtl0JocKxVoBZlLcUT
         5jHRwg270YMn1//rYSeRxViKEaWe6BovFjFaJh1D9pThxCGPY9Ms7bCPvpazj2vGdZT+
         5rvH58atv5vBtE9ZCaPm32At3iy0Q1R50xa8TSZt8NemeLuSHILXVenLaDYN27bfa/bg
         4eyKLlDDlBQ/PwLsEgdUYiSwFAADh4fDwjB5ENI5lmgMy46CWtiiTCwr/pYn1JRSf+AZ
         zAHDuoZVrs354QFaU1tBNhuDdhHe/9gNAYN6fUpN45YsuXj1rbZiOx/RV+8I9q2urBFd
         QKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978936; x=1792583736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZL1VcmCEoEc/E9Vz8+yrrGu9lFYnc+yK9DwPFQPT4FE=;
        b=llzEoALtMTeYP+gO8OvZYLiiLkTsfqUODIpKCicQ0h5reGJ5VzzXEU4eLQNtqHjon+
         fA0MroI+2DjM9dM5Euuozu5/kXLRcjGvN0Avg7YMKI+UZ0pBy6Sp+lU15CIxXSdwU9Bo
         xL6BUN9DufFPLIGy97priEf25esfAXwUw8uemMNGjqXxdDlBdddavR+Mii9mElfUKrfl
         SIpKJtydIqlha83pJVpJJcvr6G2zGaVWj0vEUclCBHBXuB8fQtM5+bRXMAhsoZhLhTX3
         oJ9f8ovaZJykJvnLm5zlutDQOi/q5uM+nOidTNP6VD6ieda9ddXohMq8sXBOm6h8bG4P
         vrAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDt1+4aiyhBkmUzKgg6rEm/L8iPOvGnECrJc2ZFQgHe6p3JnMarKoI8iSv+uKM4+KbRqo7mpyJCbQw62hz8g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLeWAQ6Rzm3dyBKpBqQUzBN++llgKfRF60H/qRpHU9WDz2ZJ2IF
	vAXd06FadVLJb3DGeFHWi647gtIyh1CbSC8QE0qHdcEg92Li5cvF4gniAbtKTOEppt+gntvTl8Q
	fld2BNkvx44tDIfs++IDpnQbta51xiHw=
X-Gm-Gg: AYBFou09r9rwYhNP7d6iuSDke42Iu8oLkoVP2C4TdLEEuegh66y7AG+fvDi3fSR0MCy
	Lkv2duzb89JhVjDh7w9RHjKFCDVQLsX5mj1eFWr1ZpndSkHwNFgZKT26A5S75S+dTfWLZ2pJEjh
	NHsHvG/LwxBlRBWJWqp2Cv0LK3KJf1qsNWWtd21w/FQznTkbHHHbJHy2vCrPKVBC6vXt4TklOre
	xDuxI0AJlNYrGZ3hdRksYiww8Cjo1h1eLwaeVlnOLCYja7VZnwFVsdduVI4WdrDdv2Zc1KAK6PC
	DNN29fUxYhj+lTMDVWm5ETfH71AcR8wtTsgxd7QlOSJLFnM+7W0ziyhESPsHF/yeaIW3giu01xY
	MXCH5Aw2pcmsX40QxfY8dMwnqP4He2eDkwm3k4Lkf5Mdp1D6iq4w0nlMQOoS74Y+pKR8tZlwm8l
	1iMLQX9R/rNCAB/y8o1eF1E2K3Ty221KYOLb/ZAQdwdF00qViblKjUzNSxvbsp2Q==
X-Received: by 2002:a17:902:d506:b0:2e8:3cf2:49a0 with SMTP id
 d9443c01a7336-2e8427fb16dmr237846365ad.1.1791978936024; Wed, 14 Oct 2026
 04:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me> <20261013-nonempty-slice-v3-1-4463cc0338f8@proton.me>
In-Reply-To: <20261013-nonempty-slice-v3-1-4463cc0338f8@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 13:55:23 +0200
X-Gm-Features: AclHuK8jVYMTwJgR1e5g8laX5EjRU5EDlF0P9l1xC7Hi1ziIp0lW76BgKAVcJ_k
Message-ID: <CANiq72nok4xoA6j1SXVdWKLEKAqj3MfzCa-Sse7NNbkrn2MXiw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: non_empty: add NonEmpty
To: Lorenzo Delgado <lnsdev@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 10:30=E2=80=AFAM Lorenzo Delgado <lnsdev@proton.me>=
 wrote:
>
> +/// A container that can report whether it holds any element.
> +///
> +/// The result must not change while the container is only reachable thr=
ough a shared reference.
> +///
> +/// Unsafe code may only rely on the result for a container type whose i=
mplementation it trusts,
> +/// such as the ones in this module, since a safe implementation can ret=
urn anything.
> +pub trait IsEmpty {
> +    /// Returns `true` if the container holds no element.
> +    fn is_empty(&self) -> bool;
> +}

Do we need this to be a safe trait? If it is unsafe, then we can
simplify the invariant and more easily think about the type, like
other `Non*`s, no?

Thanks!

Cheers,
Miguel
