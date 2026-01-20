Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2C0451075
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 14:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921077; cv=pass; b=ip4siDQVdN0TmBrFQiXgX2GDWuXA7Ozh0dLvAPSLGByR5vUAZOshNNaM45UFmRrqwz7PoKZlD36ULLCq9P9yxeDsZpnQMiFEt7v5OyPFPvFzsjZTWSepxa3F1b7+5Qch4QAjIOyV1eb7oDDV49dpCXbhsro92XEgnpRhbrpuRgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921077; c=relaxed/simple;
	bh=kWO7IjaBfpehMqyrl1v5rsNG8VjYO8hSKhqZWNHNHqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GqqUL8VzmZFmZmDsppPghbeCa96Hc60x+PNbWW8dwFV0iNxbc5cuRUU4Y4Pg/pbNLdBVHo+zqFqX7absV4LiXFYVeQCbqrZZt2X7VvUYOQggORX/EY9WAn7u/JUc7fnmLcn5x7RTuIW7OLWBuNyuE3yQ8cfBX1JG9B5iI+QOOAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtW67to6; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtW67to6"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b7063004daso34456eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 06:57:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768921075; cv=none;
        d=google.com; s=arc-20240605;
        b=boLMHJpxTwHxuF+LQLbqM55No3op4slNPG077wmd3/HBI93qqFssq/FjPv4EsN/LqT
         X2b5mmPin10t9kJqesNFOzmYt96SS8mlPUR8WeVI0FunYIvc0PZOFKxQdQfXH/DN9IC+
         UD/V/zFCRw/ESmB0HSqitG/1yv+/C4ZQgzisVNAwi8i4WBDGOU5pBrqeDW71l7HjOjcV
         mItxeIXwMLH6l6ntIA7we96vHHEVawn8W1oSQDszKQkAMvwPxfspNYFPAVzD74KdNjgk
         QXMBSa38Nm6a3lAyUzQGMcm411v95UdW4s2V/cBA171wjPCwyQviL9Th/TdTCxhNoXK8
         54LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kWO7IjaBfpehMqyrl1v5rsNG8VjYO8hSKhqZWNHNHqc=;
        fh=mrMHX7Ok9A1vgq7GBGCtC6aN+nzgOvjyXN7rPkmbAco=;
        b=MxyL19yFJxNXsvSKDbnYHBO/2xz0tkruQ8fgqstKLGpPFazz47ThbvQp77XF46Kmv5
         0kEhFk5jC+cboWS7+hb6++MPp+P9wbgydIezVS2TVv62MNjC+psNUORjT/Jl4hLcG8FE
         8fZlmrHDkfjTOcXMSEE/GIiL6/Zo9LDW3RaCvKTZqFkulF5j03T1nXlN+LalJdUvUHJU
         yw7/A94tXZtJX8lco6vvMGU31qQq9sPO2lnsQ87YxSReBr5dSPmqOw0hY9rR6mZA8jeF
         4lZQeQLSjynr71cUk9D23MqQz3gfyfnBa5bl0LNQ66zL39Jwt5iWktsLukx3ZlTpZvGF
         TnSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768921075; x=1769525875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWO7IjaBfpehMqyrl1v5rsNG8VjYO8hSKhqZWNHNHqc=;
        b=ZtW67to6ZKLjS/qwbxzg/UPq+GqWnEAFVqNdng86ZP0p5cjUfw3PexT/qboQIATA7r
         bPxS0mHe9KoEJV0EylcI0dK3Fvg+V6Th0B6awhlo0TzeSimJ9rSUH3Ba+es9/xuM//a1
         q0L7MAe7x1VfITy7t/7sQzFmvcYZwsXOW+R+bYhcSKFQCEkASS/LA2EjkTvF7E1mELAa
         55FJCNRuyRmjOYzHuak228i2r3lbY5t+QALm4jr5dm7Qrqwl1IVaJk/9Icd6cPW199ht
         ayMcamcf2Gm9ivjlfZYo0EAViCfUTzx33SCIdOSGZ5Mt8/wm4AJw6smDYu58uZ2rHglB
         kynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768921075; x=1769525875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kWO7IjaBfpehMqyrl1v5rsNG8VjYO8hSKhqZWNHNHqc=;
        b=X4nk+Yzpz5ELd7Khn61ZCtjmtrAdgy6aFHZAgn0T1I5OSZ3V74a0IUJJeZWSxv2sOu
         R8gu0qufoFbJ7aHYOyjIklW4lgTPKfn3qCIQEuxbmytJkTL6gySaOhnUFfd3HaJoioo3
         mgqDJOyvez8d6cxfntDXpvt0vA5d1erdcS2u4/xscjEhkoV/IAVoz7s/eeGriQ7UOLgr
         IMXr88GfmB+P+fczantAbMMzmjDeggPL3FtcrJRQ6S7cbbtBVME6Kr9xNR5Oupxzf7CM
         TRAImh3NXwuycX1Ga0O9mrlAU/LIcmb47bNZk8VyI4pz3RxMbvIUiDbiC8K3uLbskyhO
         QPbw==
X-Forwarded-Encrypted: i=1; AJvYcCUvPXDJtSsQkiZLYqNLjeSndPNSe9IkDr7gckdaiIE7/KbbilACM0tngJqZY5lVT3SCW6WBhWwhU2DhU4fziA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLdCNpFXt1kKg+iZnbq8v5gfEKN+10E/6+qUGAs0xXM4Dv6JVa
	B9qvLAObC/e/tBtQ2SFHe2Z2E4v4RCo7sOUmqhB/260JYVfh/qUY3Bqv6KmkWmEA2Ita7S/Vow9
	TqFVkasI4FaR52HtKu7dLGiWSyYxZdKI=
X-Gm-Gg: AZuq6aLFS3zanBUJlCpqkPtB0vC1ETRjHryU9RGuz17j/96SV6k5S9bb1F7sE+Mmh1Z
	MjB7+P4317FnHxspZ6bh05N2KSzH5yaNW7FWAGzf7Qb/8O/YJ6+z88ubnRm6G/q7HAVe0GfapqW
	zwAaD+9GCv9gumGlTJaP+vaWNdvIBbFpdYiAHH5j7zmqQNWdK8AE7ImaNEcRCIzER/7r6qZ31UQ
	CPJeWc27oapUyHTmsJV/Z/RQeJ6rYK7/xNdFFFGRxoVTbOGsNKLGeaqQYjWJ+8jaW1gvBp3EM+9
	prpKzBTVfRE06z6P7K+01Ss927hyQA1oy+3t38jhqm10td1Zat+vmmwfV0UXXc84HxyxQvFdfwp
	vuujQwLHaPR/s
X-Received: by 2002:a05:7301:3f16:b0:2ae:5e96:9d1b with SMTP id
 5a478bee46e88-2b6b40ed366mr5837189eec.5.1768921074649; Tue, 20 Jan 2026
 06:57:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <CANiq72n9tSMFW1KHsLBLM-q47+4f7yM70CVFNVeg_3Q8i3RTvw@mail.gmail.com>
 <DFTGHU40Q7GS.2YXW1OUFRM2ML@kernel.org> <CANiq72=PWw6MW8NiHtFPmQ5C8xjzVJf2OOpVP2YQbsFqrB4XMA@mail.gmail.com>
 <DFTHCJYQHUHD.24MJ2SUFZDLTJ@kernel.org>
In-Reply-To: <DFTHCJYQHUHD.24MJ2SUFZDLTJ@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 15:57:41 +0100
X-Gm-Features: AZwV_Qie5Go_coxlwJusTuHjp1Jd-Vq0fjUzZ7juhAowTwGCuvp3tEsIdz_PQ7U
Message-ID: <CANiq72m2tU-Zuv_MjLdjfK0qjE45YnuMmTTtrbzmrQ3=84ei=Q@mail.gmail.com>
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

On Tue, Jan 20, 2026 at 3:18=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Correct, this series came from a misunderstanding, I think Alex plans to =
follow
> up on it tomorrow.

I see, thanks.

> I think there has been consensus on the register!() macro, so it seems po=
ssible.
> But as always, if it works out, great -- if not, that's okay too.

I want to make things easy for everyone, and I know there is pressure
to deliver etc., but yeah... I am supposed to also push back when
things get stretched a bit too much... :)

Having said that, depending on what the "local bitfield!" entails,
i.e. how much of a hack/workaround/extra work it is, it may be best to
avoid it and go directly for `bitfield!`.

But for that to happen, we would need Linus to really do the -rc8, and
very fast agreements and reviews on it.

It seems to me the easiest is that I give you a branch/tag for you
(and others that want it) to merge with the `bitfield!` one next
cycle. That would avoid the workaround too and Alexandre having to
come up with another series etc.

Cheers,
Miguel
