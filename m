Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06601AC44D
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 04:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337819; cv=pass; b=d29oWq4EUu3ggDHl7xvqQarH2rz69EoavetyPw3f3ADnw5afB6VMNXs/1z55gMf/SLMxBpy0w1T75abmtoXDD9k9s24reag8MdDdblKPTur2GmQsc0uRHWxRDaQPCV0wGf75OtYnYEMtxd02ykED6iB1UdC+mOokH8bmzBAMHyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337819; c=relaxed/simple;
	bh=PTVwOoaVfSzJB9ptJp1L7b1dmZcqx5U1rF7h2o/pFeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=klrT/LdbA23MfGyudyofISNewfx00wl2Nfaqu6NaCgoL36D0hBrrym6megg9smDi6+NnHV1I30LAQwMI1Qyx+V143q2l4E4IVKG8YY1gUppBN3AyXkPPbqqU3mRaiQzyYGUr2a35RCDuJIbK0cnxOaQGQBEbWsSLnBK7Xphxf2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEkC+wtf; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEkC+wtf"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf49dc28ccso2809975ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 21:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786337818; cv=none;
        d=google.com; s=arc-20260327;
        b=Y7Mm8G4W3LO87lgaw8udFoEKVpMMr1WsedLoqZp4h+6svg86WFx0+s+axPVsh1XvDW
         h9GvHHTx27/OGt+Lj9wsdDPdlOpGM68ju7XQUc7pm72gymFB3Kg+FCF6QUC9Vh5TWq3F
         Z9cTvmFGhy0X65CNZnYMADlvvqNBsf85uXbLCUOP4FId5UlBT5kohv9TuGsH0OqCZXnG
         /Gs/0tRKraEgr1lQ3dPif6TKtTF+TLTnu59FRIwoKll0Moh6ywyRwxmV4AO1dsoo6SuV
         2XDEEbPxKvnN7jfEXha5JQPbp6ApgMyOPejOR4rMkGWPugom89Dk7zbUTY1jHvRe+HZ3
         Q3XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PTVwOoaVfSzJB9ptJp1L7b1dmZcqx5U1rF7h2o/pFeI=;
        fh=huS3tIGZ82QJ9rIL9RqMkf3rMPnbOHyaDVzTTiiNm9g=;
        b=V2tXjv6hiQ9lI3J5qrupku5IASdivrFimczks7H8skKfI0WkVQj93Le/brOsNIIvST
         54X+MYO2+JgljpN3HZzbx8FOt7rA2vJhLo397Pu6QKlezrYByzKSYX/NDYA3BWHv7Es6
         0k7CDWElAC7Zm9TsF22zd6dV4mmvaLPczV0joWP1DbuxVKKJPtCEMuX19ZymrhHxPxuJ
         I9B8Okur/2s2kW9A6ZvW8OGrTmoZPrF8NM75i2E7ElRYY5RihowEclB12jgNopIF+KR+
         8i1dzQmTa9gPWSFlH/FUUB+UqYLHu1px/NiM9RAVT/4wHErTKX4oT7C8NRoTIetkKa4e
         9XWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786337818; x=1786942618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PTVwOoaVfSzJB9ptJp1L7b1dmZcqx5U1rF7h2o/pFeI=;
        b=PEkC+wtf5+YAV/r8I47nLzTac/kanDR0J3C1+4vTu9C7F8wjBSlmtX4uK9OvvUZEV5
         U4BsG9/I/9+kN/NAEf/CyXMDejM1IbOQ73FHd/qMXodLR8lruZ/yyrEDRXxWkiG+PcvU
         t2QbfNFakT2AHesToUcBGVH+2lNzq7eMCvz2ACbfh1D0Bb/+DkK4QzqwULO6/YfNGR+U
         5uo1wDI3D6OdkzKyclt0UJbfYRjnxIOyKF9xYfQ3E34HgMOIc6Zz+1nuOtlOXBP+1+TD
         8X7pS03dW/yv+cm6t8jxCTvkJCooBKeLexdKD/7q/Zom++HqcpBkfo6vH2RWkz7rIB7P
         qWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337818; x=1786942618;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTVwOoaVfSzJB9ptJp1L7b1dmZcqx5U1rF7h2o/pFeI=;
        b=IcbbBzX1APA4zjYso2p+ywcQYfKDkbDTZZWq/u+KBgRAX1Un8A6d5m12eOzsWKY6MR
         5mXtdYFLiIKliEpRBVF4A93awC/sCNDK60H7BxeuCznGkz+IYPwNXhpPJ1FinX5zE+w6
         IdQiZQQYVbKhqNKg9JA2bx+Ho43I2M5L8AXkemhKr0LMP50yCUGNHchGILs7FB9LSiyA
         PRH1UKZyVBKnwJoZj4AO3+txJ9tiSxNYe412X9G6i/4H6HMAgswKJwMwsz3IUh0UjUui
         0TmbAbjBg99zfMzBj1RIWY76s4qzXfoNV35VuraEuAPRsUG5tvTa4KuIzgcOIwhTn4ZI
         8Pfg==
X-Forwarded-Encrypted: i=1; AHgh+Rqwms8AM7N/uAQ5O9ompFSUPoWLE9y6n2FKyAINxfTXiJ4qxwpce9Y03vsO2CgwPX7TFpVgHcm7ltzIAhll/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxol9J1AVMsQ94AJMQnEl1/ciuKJWYCuucj4pGfVCPc965oup+U
	FFKmuLAgeILN9yZ6qMVjSmzwE/zgmPV89OZC1bf+34YaK++MCYLHWE7L5c4BiiavRGlbYm9PJ88
	Tb8Vim7GDCme9tlxXX/v5U4L3Bbf3NIs=
X-Gm-Gg: AR+sD12TDlcbd17X6+DDITGu4nqnquA0jzNpwX49c2iAhcvNp7AmefZXYujIC5k4N3U
	iI+D2DZhqhJBDRsNIlJ+a7Ok1qwFmFI21yGziWagZXpsvxCxdk9Wlq0i3ZT0ZQ+3GTJFIM0pcWi
	+dlaQ9evUNfVq2FBPVmdrLtQVQi00kTgoSPTp+0Fxtcn/YfQ3w+W1SD7X+BA8o37FxTtUCRoHwY
	Xk7MDRwC+/osu5zFcC2hvvgMQ/3cFG2ekUf2kYMixmHS6QcVxDAtgnKLxp4k1fKq4qKgllmGNxB
	KpR0wnvHwxFj6/P2ADzvJQ2d91q1xdf+mpd1Dg6EXp2rJUGtpRkpXFzHYo/kXwNZAWcl5uhti3I
	RV53/GvDqGP7ErfXkCfRZJFvjgEYTzuH8uTxsS1x4qaQU5elTCVcp2BLTqCQ7
X-Received: by 2002:a17:903:2f8f:b0:2ca:d803:5c8f with SMTP id
 d9443c01a7336-2d0ca73a210mr305827985ad.1.1786337818116; Sun, 09 Aug 2026
 21:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711082327.3062227-1-chankocyo@gmail.com>
In-Reply-To: <20260711082327.3062227-1-chankocyo@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 06:56:45 +0200
X-Gm-Features: AUfX_mwTOXxsJi5PrjSDcjxfZCC87tkpzd568gYykeZvSC5LjUkJ9_9sJf6JIeE
Message-ID: <CANiq72=01dZYTOiS4pv38g_FM+WCCDyFsB6up+xv1NSD=YifOA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: impl_flags: use bit helper in example
To: Kosumi Chan <chankocyo@gmail.com>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 10:23=E2=80=AFAM Kosumi Chan <chankocyo@gmail.com> =
wrote:
>
> Use bit_u32() instead of open-coding shifts in the impl_flags! example.
> This demonstrates the checked bit helper and ensures that bit positions
> remain within the underlying u32 type.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1244
> Assisted-by: OpenCode:openai/gpt-5.6-sol
> Signed-off-by: Kosumi Chan <chankocyo@gmail.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
