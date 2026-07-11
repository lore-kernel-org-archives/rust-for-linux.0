Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9D438B7DD
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783762090; cv=pass; b=g80qLVi50IhKyUQ8WJ7ZrhOQIDPnxSHJ1cyDpAyCIo4NyVnPmLN6iDNM6F881l2ug/Eer2K9ccOEphNUwFEJ815mRC3U1dOmM3sKwf76M92rp+JJzMzddUrAbuyfxz79j0h9YYogohyZDIdYVxpOmyZBYdrqlE6QT0c3DxODMBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783762090; c=relaxed/simple;
	bh=JVHhR/KG+qqLo/4P8TPgskU+Qf4ZcEH3S5VPpBXd7mA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbSv6dGzwIDhCJGNZTa6gOIhwJXt644grfQbEnr6gCH1NIPceEhjk60pOkGpcMvTYli/7vkSbDhklQoEVA492i23RAHtaXKlU5Na+yhJuzPReIFxyfU+3iB/4XThjWcDfaDjCEHHHdmN1ggxX5k6drvg1OYSKeXOGh4TSYyzWH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qN2QoMYh; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qN2QoMYh"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dd9c4845dso2347a91.3
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 02:28:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783762089; cv=none;
        d=google.com; s=arc-20260327;
        b=BXY0/8gFNy1di/GsfYU/0F5IkoqxQ5FiUe2IHnqaTbM52GyQd9TNkpoJcPaBfvhZra
         NOPpMpda4BuqtxfbS0cARTexI1ozbaNG1EP0EE+2VBioFFtGsTy9vZwqtyCsjRZxr4ir
         mX2cYzVNYynxXp/0vNMDk3Z6WE6sJvZOM+Pp77E0CDbR0UJWT7pi+M+Qu3trDUKRgWV8
         /DhSdrw2H3z588QUh/IXMPmkGTeDwu0m5USuALggabMfzZszysHyVYOsy3d/j0E1nSqi
         cDSMLaYJ9vjSmA5XYQkHga4HEkMwdhCLvH0uY8U4Lgl5D2PjLC/3Y5Gqoi+KPBHSyXR1
         jOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JVHhR/KG+qqLo/4P8TPgskU+Qf4ZcEH3S5VPpBXd7mA=;
        fh=pDGC2gfNOsA+VhB86PCu10wC4U7bwh3Ih0XvY54dM/M=;
        b=GlhGKZupe9fCQ0xCf43rxjAsAw8Nk3Pl3sxVPv01OPl2GafOhuUwfl3GZ0IZ/+z4S4
         ozM8LzM93eXwUgJHT4ldoFGrbTWgPl1Tv3Tk4Sddt/RdCRB396UOvTljN1+UpuJ03YRN
         C6L52JpLbbAcyalV1+OBTUQ65zrhUswz1Rq6xtMUFvFlR2Ro3yUjDxkIyq6Tmm4DDZME
         Et9hmwK2kvJjEc2999QcraxYjN0W/X2115AejK4lluwCmeWC/SfWXoMkSjicSgrYdWwC
         B+Xg7vrCnfeqTv3DLN4NTgr0KRC/Rey/RolXcz4/o8VbhfyRWP0B3RCgjkNZeQ3LtSeo
         /wqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783762089; x=1784366889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JVHhR/KG+qqLo/4P8TPgskU+Qf4ZcEH3S5VPpBXd7mA=;
        b=qN2QoMYhFdCwlzAgPjKKMFddMao+FSU+Kvm8LQOnU+3f94/8rcdrg7pkVL6ldtJfX2
         i0/6j5JLPGhmCEl+hh0exf3n+Sg+kEZOs9RWSbK/a+ZNMFDAaAMabRPDH3gARE4va2UF
         ue2yHvy3sIJHqQ98+9Eqvor8ISFG2NL6CYi/7jF0yQzsDwnAN8GWMjvcXaMoQeVBG23q
         IUEC36+Q5oKE97dWItFWKcffhP3Q0JawRT+YAHFQHpta19umVlvEyy12ibsyx71SqqsB
         6uluGhXZ+3Gi+2J+ZmJyzPlp49Vo7CqobQ5UbCcGaPeBB+37XRkEsggHDKZR3FFSoTIo
         S5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783762089; x=1784366889;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVHhR/KG+qqLo/4P8TPgskU+Qf4ZcEH3S5VPpBXd7mA=;
        b=GcY0/6c2fYYWO+TZ//rPBg5Bdbf9D3pacXaMDXX5MfMJZ2V8HJR9bdwa88Spn0Dl59
         9PguP8mscoTCaBa3xQZZos8FBgLRbF+u6ylPIvhCpogah8vitBD4j76+7ESAQkl89Cxh
         591C8oGa8Oj7v+IwbXBHR/k8SOE2yJQCOft8TgF5nPtpev/K/RI5q+wH71W5rOY544KR
         W2Dm8ZZJoaxNG0A5I8B+wve2FjWGYk27+QcoBXX4Vnw8Py1bcsY/iStfDHbUXRUQ2nPk
         8mBr001YbL6AltAJTPlOpPve14UmLSGsBycPmwy4Ludbb/IM1onVj8jy8HA7/r0S3VaA
         IbNg==
X-Forwarded-Encrypted: i=1; AHgh+RoATjBlBC5B/x13wB5f+0hpSX/mHp7xAk8JCMPgvCsPSa7OFrAvQKvNkAWDUfGWOYUDF4kNAoroMm0rGePVIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFrqsFcASNsRkTiDuXbIbqt4l0QU4CsLcZDj00Jbr1QjdPT+e6
	XTPohY7UFYlJfaNJcNM43aTg2TfInhKh/STs9jaoJ06427/lNunGeFAXOFfNXf1Y/79PgeG0zp3
	a4ck6572Vuoxa3RNAFxLk7Zyq47q1HU0=
X-Gm-Gg: AfdE7cnPlncM+coox1zLjXzYluLkNKDm3ARuuZVA6sJ2z+ImZfBIOjXDNIdWt5PlRCS
	Bf1uJduRa7YKEW2AbhFirAJ+x3ydw1PjKb/yLgCVz/FqxrzolI/9kL5jaM0JJFd3gCfWkNXZUYn
	qsrwRf/BQWO/7pqZB7ZMTGDMZTJS3ysXHLHfR5duy5VVBDb96RVrQpx1jijOc1uetk2UvAg+UJo
	kDHKuSmEzNCz5yIIg2kbK5UgRP+0Renlv81lls/jcb7wSoJrbPPQ+ezn9RQavUoXy92GcHRXPrI
	HjzGFUOORE/UM5EfHYoRI/K1bhYM1M1jJrgBbWysx14jKhImZR64B0vxsRB74dCfqUkGzhulFDP
	jp8oV5BklnF0O
X-Received: by 2002:a17:90b:3890:b0:383:5a16:bd67 with SMTP id
 98e67ed59e1d1-38dc7754e8amr2121879a91.4.1783762088889; Sat, 11 Jul 2026
 02:28:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711082327.3062227-1-chankocyo@gmail.com>
In-Reply-To: <20260711082327.3062227-1-chankocyo@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 11 Jul 2026 11:27:56 +0200
X-Gm-Features: AUfX_mxJJlEIaqcNk7UQHFHDBGwkPEX3sgoypJKo2CkBiMFfMOxxNiSdWhMaVtY
Message-ID: <CANiq72m5iqy+_D4fzxM-i3AZrA98VMXP0V7EtBN9npN5akVRRA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: impl_flags: use bit helper in example
To: Kosumi Chan <chankocyo@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

Looks fine, thanks.

I think I will add:

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://lore.kernel.org/rust-for-linux/2026071054-hazing-antirust-8e4=
0@gregkh/

since Greg suggested the original change/idea even if not the one here.

Cheers,
Miguel
