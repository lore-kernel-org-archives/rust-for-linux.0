Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA5F23EAB3
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 22:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767567191; cv=none; b=FuDKQBQz64qqfm3LSSRZM/RVD811ZRj5V2lYMB1ZUql69Fmhb2gilo2uKIjgfeqx6n1sym/StfboZksbRkB6cZ6aiWq9axEZfh/wNsiisBIgeobqdEMl0VtFhuQMk3krUnr8B2HN1UX1vR9jFU8cuiWOGpGb2pDQrZNuA4aeztI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767567191; c=relaxed/simple;
	bh=yTAcmhbohQOCXw5QRmVxlIW/sJcpOq9h1eWT2j5kaII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=liGee3839C8EcKMFwTBnvrYz3byKfj2lFImzlo1fu3PiC858lgzRLoMR+ipY9eJ5tgWidHbZBx/RSHzNAE4W8m1+ye3qTp/5C8l3C+qgJ+J5YaUy6QWWtiPNKo+N1Ytt7bFQs8xp9DpKcXl3/IXktP9z7AYvTw0VjqOg3FnL7ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4RqVMmK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4RqVMmK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29f08b909aeso34502865ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 14:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767567189; x=1768171989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wuZOjormOysbEnjQy/FsNdLFhIRn2qsC+zD2F7VNqo=;
        b=f4RqVMmKiM9VVfKsu5XnAvPVt1nZ1Gn+T01cGSNzq07YKM1r/k4qahIcx/HxQwAYWE
         i9I7MdIMje7g11j6vwn1MzrIdDpA9Gs6YYxNUiLvltuaLfNOrgog8nUAxMbZNX4ZZH5S
         JDP32SUyO7Mm3GqQHLI0fYzhGaR4cfrQXOHsADIDxu1nV2JgfhwFlqH7pOZtRLLXV4CH
         6er2ms5c99zI4h+vFCaXMYSK7Y+c5WJQ1XTlWzPSNHh6VkdpzO1CKHmhWiCpw2LaTBq+
         Rd3IIHuIfPpx+Sb/6etgvJJLaCGVo1LCwEhzhrsleO2NiHA8dgsaoP5AWWU2CXT30oxm
         SbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767567189; x=1768171989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wuZOjormOysbEnjQy/FsNdLFhIRn2qsC+zD2F7VNqo=;
        b=W7dTioS5V74COZ9pX1g9rs23/9L13igPwexpqvC9OsG9YEF6hG9H/78WrWlZJcuuK2
         P7WkvBMJapnri1NoNrBeicn0xJH8sLhnP3iUqBulJty/NYjEAdVeHk6bMMBfLyesfzdg
         l3ozKuuajiKPDNmo32QYyjgzDmmFG69njC0+aYeGHAf4F1iBCHjkUEUKz+m6E7ci9PJ2
         ujhJgGtM1Am+wpLgO+4CQesJwJBPzw1cUEW8KfrfrqMDHMeD5LWKbIwZI6vzCT2XzaZj
         M7GDVvR0Z7jxMjRYuKDQ52c8a7f3OfhpGgZjuH2s8TbJjTr8XavZhBIUI8NrqPcdfWzr
         zDnA==
X-Forwarded-Encrypted: i=1; AJvYcCVjWHiHYHUY196fqDrQW5fcgreg1PoAg1fn9DvNONkzKvVgnQ3gEeManda5CHK0qoGx5eNgBDfq4ed8ptMiog==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmOFcD0uK9L4X0mVYwsGmG//sDMh6WSkLGKXsTnZFwOi+mDVTq
	rK8K0P9hpI0CKu+5xUPaZxQHSN24ddRnd673a5wUtnkmZqIwKAPTirehpJTtXpo3+Wn6pR4Qg9m
	tQGy+ohI8siONMcMbjjkMHC4EstCjIvc=
X-Gm-Gg: AY/fxX7cwFo6/OF6mMrYOOA2sSYFOjn6Nx0Z6YWNcPUv+oSzTAHnImK9qzszrNUPAeT
	FluwRqJZ4iUp5MwoH8Ex1At0tO5XBcCtSG/0wfq0FusacGKerGItrPSyqqVfxtdZQ9o2QqB7oQu
	ODaMjO/Uq+pnP6ZyPwTf7dK2NhBOI2QQhl09xIdWofG85wh++NKsVrf5vtqv0cgItP2w6WuswBB
	caqFSEUQ+kQerSnPZecAUy9/HDAntjyBmaLyiT3dwG1AG0FC47zAe3Wf+hazMOEb6Mrx2eQ2uZD
	QB9DjFwpBsRVDyHIosFtaeaQE/22YamteiLnjhjctaBJuRALTrrCd9ecSqq/Yq2nk6jvw5+2scd
	imgH1PcJY3Szj
X-Google-Smtp-Source: AGHT+IHaYwWGVoEtitSkW2VOkLQdL4XhL7LUQwTIfDoAQwp6BG+mmb5iJ/nU4b1YW9zibGjmzrd9LNjb2wGXXiK40Tw=
X-Received: by 2002:a05:7022:6194:b0:11b:65e:f33 with SMTP id
 a92af1059eb24-121722afa7cmr22579366c88.1.1767567188819; Sun, 04 Jan 2026
 14:53:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107093921.3379954-1-m18080292938@163.com>
In-Reply-To: <20251107093921.3379954-1-m18080292938@163.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 23:52:56 +0100
X-Gm-Features: AQt7F2qlLpG54kLm2wkrgw5L2jaYafF2B8GBV2uJbTaqNXl4nd0NAH2V9ODtDhY
Message-ID: <CANiq72kUt2TSF9pnCDB7HqkSDPuTGw8XhHc=GW6HcaHFfOdk=w@mail.gmail.com>
Subject: Re: [PATCH v2] rust: correct documentation comment for rbtree cursor
 peek_next method
To: Hang Shu <m18080292938@163.com>
Cc: ojeda@kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Borys Tyran <borys.tyran@protonmail.com>, Tamir Duberstein <tamird@gmail.com>, 
	Daniel Sedlak <daniel@sedlak.dev>, Charalampos Mitrodimas <charmitro@posteo.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Matt Gilbride <mattgilbride@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 10:40=E2=80=AFAM Hang Shu <m18080292938@163.com> wro=
te:
>
> The peek_next method's doc comment incorrectly stated it accesses the
> "previous" node when it actually accesses the next node. This commit
> fixes the documentation to accurately reflect the method's behavior.
>
> Fixes: 98c14e40e07a ("rust: rbtree: add cursor")
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Hang Shu <m18080292938@163.com>

Applied to `rust-fixes` -- thanks everyone!

    [ Reworded slightly. - Miguel ]

I merged the tags from:

    https://lore.kernel.org/rust-for-linux/JH0PR01MB55140AA42EB3AAF96EF7F3E=
8ECAEA@JH0PR01MB5514.apcprd01.prod.exchangelabs.com/

Cheers,
Miguel
