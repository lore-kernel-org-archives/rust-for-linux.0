Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450EE457E4A
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791727120; cv=pass; b=YSYM7yzS8Z2U0kxG1OxhAjraKYSizc2kTE0+i84BjDz86fOUTXnFCQx1POWeEsbTAbyuV7CVUwdBGJp5uR6maPFXdDebjcl0C0BvB+YciHhfa40n6ZLmKVkzYtTdwVZqQ/XaRkvJAU+02MVAPxTVs8jVqvUY0K/zazPZSkQyVwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791727120; c=relaxed/simple;
	bh=PQqTMWasXUN28OiYIu8PyJtOpiaTPczvB6SNcoFhwqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YL7W3LIG0NRCiVPsZQhNdgHzG6w39vO225RJFRTLrpI1Sxc1tx5k+vv9OxFsBv/YN5b3uzutwNN++7lCj/NVahYN6PJb0gtBZR423ncc69J0NXqHow3mKrnxXBnZ+AdHcF3Z2rspUU8BBmvxFXNff9pUX4qfhWvBYuwH7NxXzn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbGJZtXi; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbGJZtXi"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35159e0092aso128093eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 06:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791727118; cv=none;
        d=google.com; s=arc-20260327;
        b=am5D4sIop/zY0ER+uIdA/8KwVWYPWXcI669aD1L5toI0MlkOKEOr++qJpMSksHIcE2
         9yjRCSht2g3oJHVezPKJQhos+9qe+fchtKcg5HeLrMLhNtDV2owAkON1IRLKlqmvZaqJ
         eNJsCecJ/c+NhcnJ5IiPZhe4xALt5/qmeUFOkmxWRHdIpfG2daP/cVKE2n9WNaWGbANp
         kvIVNIadRmRjtmDi3d5sEmLHL5cKGOYPv+b+GtsVZOdyXPfOs7Zsyxm/OBq855G1CIK6
         ZHzY3lmw/oJ+6zUvtijH0ByT7fd/G6kVFb1qujG9xUYd6zeC+Q2RJ2EHbwMW8jG6WD2a
         nXig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SKxUeoIO3zwwN+w8pgZrVpsaKx7RfbD1o2NJXlZe97o=;
        fh=KTOZHE61Q1Szc19NVAz3xgK7JCbAxHpLx+KkTEQcwDQ=;
        b=MnYb0Y1wbcuyMxaL1QsL1Utm0XEGR2xX57dKG4tc6u7osaMKRTZv0yBSxaNvGOxAtD
         Ik/+Lk5EXMEczy91sq0tp82MlVIHBWaUErwv8+bw7qBudNRUNT91QFE1OX+gN9BGDjQ4
         4hg+s9WMGgq/TgmtuVyVOcFu1n9ZvhPIeHIEO6SAx74qYTrmDov3ghtqCBtL5I+USkQf
         q/v0oRJV2wLsiLpaLyPJ7iHVzFBa4MIREfgiIu/mJGYpJ/aGWBNUTXLEms8yeryT5Qwt
         /CiMaR4Hm5Pz/L8ph7Qiqc7PBYHnr4+ADQbr5oCZtspOVSS1Lmx6HHeZbnWyokL+2hxV
         MJQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791727118; x=1792331918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SKxUeoIO3zwwN+w8pgZrVpsaKx7RfbD1o2NJXlZe97o=;
        b=YbGJZtXiShcJultAFQjN7MmEYC2ftBD/VF7UMrxMK2EKoN5Egcwk644i4RQ7HYdJTR
         7aHUS8rWhKCeGxGPThOe0XElPS+0grbEtc0bV5kt3x5rCdtI0fGWJCF5mV5BKRtYCNAg
         905T3ECtkRTCOETtMbb2JmCP9EiY8vj1rF7rNfQ5p0K30KqwrGDYQHIbK40r45hjTUR6
         YVLIm3ecynTjdkOzsJFTBkVmiGyQBNHv6X4W/1E2DC/VkC2/iGfCfX1czJjtI0Ia0nOY
         MpcEXN11xaE/vg20ONZ+nsdsT3eleqy8m0Dkm8y4Gn1wECK8G35GyCmxPTn6kb8O7RhT
         m8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791727118; x=1792331918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKxUeoIO3zwwN+w8pgZrVpsaKx7RfbD1o2NJXlZe97o=;
        b=wJEL03Xsq+Kk5ZXtlTGGQTg5He0lir7EIROP8mzKBl/eNjnCwLDHGUcfstCkiXC4l1
         kVdbLDRllN/177BZ7q0wWXh1YbKJdwUdgRjCNUnC/Ytlx+q2MzHcUY4Tp+nzrp5BOZdb
         Y2oeYiVkK9i5ar/g+GdOU/7x1jVg2PRu+phQ89pI4nPhOYJT2cxd6asyHYV/uecZi8dn
         JqPn6UFF2smrSGFPZNYE3Ylw8+f84p+D2/4wRJgExkU49UwzjSmItnFazy5avMNXS0KW
         foW9/8H9If+OzBXvycykRevLXs/iVJJ1R17TzHDoLwn8z5KZ4UIJs9mXo+Rv0jzZjOq5
         vF4w==
X-Forwarded-Encrypted: i=1; AKwUvBzmpzBa7k1ZOrgtveHLDUfPNbJfZ2gzrtAwXFVleOZ8BxscOlWPHxVtmu9rShdrhmVj/UmF9hAaRWLKYJ+p8w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKP6hSgDxcaXKItXGzm7GE2K01vTW8xCfY/lsv18QU4cgB54j2x
	ko1wu+7nDPhH0BPkhAV4pEmw7dIqThdF95pYYDNdHK2xYSbiwROkD0mP10WJ07gOcjlMaS7kMFE
	/LmK60idAj+S4o2qqquWT+Wai/aqZ5OU=
X-Gm-Gg: AYBFou2OVFfnYlfqnpRouNTG6JdFD2TNZIPnbFCvHwp4q2ymzi9pErQ3M8pDZTP+2xp
	LgIVuUr+Lgc26WCLhbX34GOYmf+HRbZnc++zzfao+088WGPCwIjZUhSEhYAb8glZ7vr8LOzTVkG
	+oqZxhcNp2WZkCQ/1QzZSMM6M6Lz+oeZDo2so9fxc0pEeKcykhcXPUrppeGxSZnx4pOSrYHC28x
	+B3Ue3U9WQZmCLAaeZCg3XS31oqpjDWEQEJ4i+xQLB5USggFzpDBiP1KMqjgX3uJH7Pt9P9jdvC
	Sly0KXHXD1S5al9h5Q5YbaIW1y411QlWNNdpIzrSBn3LOCMizTxbowO3N7lDAHEsgwN50BMLN1M
	ld490/Af5uiGnsLT1IXu4RQXV50FfcJDjC1IUTB7RKGCr/cjmJcDpj2keIt3XUEVJzC88DiEmb6
	7VgQ1O+QiI7+rWDVpeDq2p74K4qGV+6/By3sYx1jSK+/sfmZM5XEDq
X-Received: by 2002:a05:7301:1523:b0:357:5c8d:55ab with SMTP id
 5a478bee46e88-3575c8d5ad7mr10718644eec.1.1791727118284; Sun, 11 Oct 2026
 06:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011132353.272824-2-blum@kernel.org>
In-Reply-To: <20261011132353.272824-2-blum@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 15:58:23 +0200
X-Gm-Features: AclHuK_0YdNEf9Mt1KyViOklEAgHvn9iYL1y3YQP7fOfshHxLhbMetQuvRACLcc
Message-ID: <CANiq72m9r1UToj1YV7ZwMGQEPfW10ZVSAgd29VQJg_mpmpXOug@mail.gmail.com>
Subject: Re: [PATCH] rust: of: use safe zero initialization for struct of_device_id
To: Thorsten Blum <blum@kernel.org>, Nils Lehnen <nils.lehnen@proton.me>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 3:24=E2=80=AFPM Thorsten Blum <blum@kernel.org> wro=
te:
>
> Since bindings::of_device_id implements Zeroable, use pin_init::zeroed()
> instead of core::mem::zeroed().
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>

This is:

  https://lore.kernel.org/rust-for-linux/20260828122444.475-1-nils.lehnen@p=
roton.me/

Cc'ing Nils.

Cheers,
Miguel
