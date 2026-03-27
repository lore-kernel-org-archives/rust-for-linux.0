Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C973A8741
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606279; cv=pass; b=dh7M7PsAGHBh0SDz4sX+npM03x2hQK8z6bQQawp+Qm5ApjwAk/q5HXBkL0S4G+7IkvLY9SMS8DKvYSrf82nOt5zsKiBbX0kDmnQoDm4QyJiUgg7aPRD2Gxm4r3tEvHsnaLNk5zQsHE3xRFdkVTPxonMibN/NlbUyya0YVJXkhUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606279; c=relaxed/simple;
	bh=+uFnV8BoYScCWs0H3DAkHtcerzqW4bAA76yB8kYBKYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEWDYKApqANb0Vp58a+xZ6ss9ZwhwPa+T0WMmVBggSAA2vaRnCNyJsNCOBUUPShfnOkxmXqgQXgZaW0tw/VCQXWMtd/yTOAIEZVDiVIdyG4ZrjtmtVVPBox0HENVzPGTSEFazJkg9kdSUXWEf3HGR3RJtad6wElLwFh6rN2R1Fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGN+jX2D; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGN+jX2D"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12a6b260693so249972c88.2
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 03:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774606277; cv=none;
        d=google.com; s=arc-20240605;
        b=jJEeIdmfEGXk29RUAsZUyd/WOpHFKB5s7Yupqf92M11yKNsD0w3Dpbw0Np4e6bwON9
         ujqN3Zsnb4jjwvVZBQ8wNUSppG6+cJIC4kid8Oey2f1zFa8j9QDqS8LnTbigdrj0A+Tj
         xOB/1b6azw1k5OtTMOqTyvpst4qgg2dsT98+nPHUmh83hubfdAj8Tv6aj6Kiw+dww+Ax
         4rZIpTmFUG4EdpxSn+aImvH8D1XFMwLAlg1LkNjGhPE1nTS8ItjYWK3DcGB0RIVpTvu3
         OBk1MSfuX75Y2CtP8jODtbCWgTWXQNlN0oxnGGFpZLId4nGLGEpPOOjWjjljGnFFnjhQ
         swfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+uFnV8BoYScCWs0H3DAkHtcerzqW4bAA76yB8kYBKYM=;
        fh=cjoT536ZXahxiX79raV12j8GX+uU+BzM1N94qpG4LTU=;
        b=j8pD04yii5Wia1sQGehRXNHZiydi+nJaUkEcB3HefSxTxrgy8n32uF2diISSwUAEJY
         swleca0FnThvDMyRZu3KN4T+E3Y42/TdHx/Rnd0CYo7HXPLJqGsSziEIG9Wpr0HPXD9X
         nRwc1hnq8mKY9tivam5wUmhECV6qlYakqfiZAF9mKm+rjszC449Bkiwmmv0RGPPV/LCq
         jNb0yapadRmz9TVIxYRCaFOmsjOYFyDhSiSqXj67KgErsIC7QT9l5LZKZEn+mgMvi73V
         /kVe9OZJWORVaIb95tkpz4DTvE8lFTwcfZYn1/tDcsj8It9sRcuhyq7X1npRTumV3Ztl
         UGDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774606277; x=1775211077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uFnV8BoYScCWs0H3DAkHtcerzqW4bAA76yB8kYBKYM=;
        b=OGN+jX2DFxKdVlVCdMRX+GuUtXxlrXaQ6vdzlptBo5S0IqQJTSYbN9MlIivnFDqpP0
         NVup844o9FsQhtFlRXvKwQl9w9CnrjF9PoYjpp4Bao4tcCpjKSNF8CR/q2f5mAw2Bkr6
         peTaWlajhOGT6gwlC7LATrzk//cz2f7GRmwVhL7AkCBMqg1lc6tmO8IqJ4VN+uwLJdYG
         xvK5VMwrqBdsaRIo3NRG1QLjHMMciAVh13yLTY+qnYDmWoR/TYx+9yOzvtZsqsTalUtY
         EzyS5UW4rqVQe8dY51Yc5hNN7RbV4+Mj2wBsjNMXQEiCCfeqFnGwJqYkHpE+z04p1rVr
         75lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606277; x=1775211077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+uFnV8BoYScCWs0H3DAkHtcerzqW4bAA76yB8kYBKYM=;
        b=cfWFeX/xYA1AkXAcO+i7pUoV3t8PcktNkOoolELEGyOO1O2h/WTC0+BTSzwpQPDrzk
         prx4hnuBHQKRO+CI6DMUzD63Qxg1CACK3NAXVek3igEvApzEs1Srp8qkWc/UZxrETiuP
         G63/tR/ehSiBeBaKtUE35IqCG/+umAIvu9+bUGG9Iwe11ns9HpwgQ9x7sdXLu+arR+e4
         t/vUjOcpxMh2KaFc95XhSsJu97KuKwxYI9jKrh9vxJ6I+6DH2ZYsMo/06qyU1DkOZC+1
         MsWF+BFXS+P9odl9lxMfb05Lq348SKl38yN/fH6rhQwOu9Xj6yiCWIxTnPkCwT0f6nct
         luaA==
X-Forwarded-Encrypted: i=1; AJvYcCUMQRK95UNyQ/pdd5CbZ7TueCXiMod1Sw7gsrre+C6xz6xHovBp90nEzLY2Y3G89ofA9Cg0gNKGWDcWBscPOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5IeszdLCRUKEOR7diiCmRodMMb8HXaRBQlStoOLj98WovOXxQ
	VrzztLzC3c7TuYlxVE9OtolGCXzrNv7eE8xkuTtXVbyHzLgQ0xyRmqSiZDYYNTQinnwgIe3+cAP
	DPknp1vRt7RWE7mfdy5ZxQq79Ih7Ztzk=
X-Gm-Gg: ATEYQzwrk6HPfR1rkK6+bn3SCAPSOHyZxm8iPRG2X6SOYmgtS6OQEBu19Py+nl3Tyrs
	YaTd60zjEfcv2wEFwf83aEvnt2fXtimLttxofqhhyAQG7eIoovNnecHf2UElaS3yV6gdQKNbGok
	QqXPUT/tY70pUENWKvx5H2kEVRezka2q28I13zzBp+RMvTHXiJp9UKWm0NYOVZj2Sf7cOivk8Ob
	T2RBxcxQFD6FA5VVKmQFL2DKko6JvD7LbLFxDZxcTnjHSuKPbUCn3s4lqxQpElHzfbpOOmUPqjS
	saGXnNyB9Yjxc6prybU800ziiJ6GP7pLK6VMxqd86WqM/qWvqvggdIe4opUAvimzfvIMfiOHs62
	BuO6n4bPFt/i2O1BCXa9uePw=
X-Received: by 2002:a05:693c:2c07:b0:2c1:778:d888 with SMTP id
 5a478bee46e88-2c185e6c137mr515564eec.4.1774606277404; Fri, 27 Mar 2026
 03:11:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323153807.1360705-1-gary@kernel.org> <U_v6wkMtfgu8yfV2Nh5Im8t1w4KZ7mdbG3VQciT2g3DULhsKBXJgIz2psuj76-V94TPNtUry3J727gLTbUByug==@protonmail.internalid>
 <20260323153807.1360705-4-gary@kernel.org> <87ldfey8nh.fsf@t14s.mail-host-address-is-not-set>
 <DHCSEZH8M3JU.3LB4M2ERBJSYX@garyguo.net>
In-Reply-To: <DHCSEZH8M3JU.3LB4M2ERBJSYX@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 11:11:04 +0100
X-Gm-Features: AQROBzAc4vO9OJHfJtMaQN5CiuyoS_KQK7JMXrfbHVTl0wLJ7I2VVbDBNfr8YhI
Message-ID: <CANiq72nmM_L2qSZtrvPN1bt9OzMiKu7NUZQXM=TknhbCOU=wuA@mail.gmail.com>
Subject: Re: [PATCH 3/8] rust: io: use pointer types instead of address
To: Gary Guo <gary@garyguo.net>, Tamir Duberstein <tamird@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Gary Guo <gary@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 3:35=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This is a `*mut T` -> `*const c_void` cast which needs
> `cast_const().cast::<c_void>` which I think is less readable than just `a=
s`.
>
> It's also existing code that I haven't touched in this commit.

I agree it is usually best to change it independently.

In any case, regarding the suggestion, the latter form is more
restricted, which is what we wanted when we enabled the Clippy lints,
no? Cc'ing Tamir.

I agree it is definitely less readable when one is not accustomed to
the `cast` methods (e.g. which one is supposed to be used for what
etc.), i.e. `as` is just obvious. On the other hand, it also makes
more explicit that we are doing a "bigger jump", i.e. both const and
type, which is why `as` is "worse" in that it allows for more things
to happen at once.

Cheers,
Miguel
