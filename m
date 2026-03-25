Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F93C3043BE
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437543; cv=pass; b=jOy8M3Jdg5siYT9Qiu4JTGkB0+Y8DZ5YQCwZAbx99ho3uZ+G31MVXi2tH5C5GZUFfN0dOx2uNjCbKGryYKbxwXP/RGm378QuWua80AQk0H1K7ztQg+XiS9pakEjty04cAI0U94NuoTHTVggjH+xSFWlKosD3UCFd5uLSTUZdTsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437543; c=relaxed/simple;
	bh=MCZJR0JweAatrhjIcgwjv/V5xavy7xfSUgnssbvHYnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oH67vG008x+cNdL9ik44IQcioQpsMTvoGXJtW5//Oyaa3mF9Lo/qbE8UYE5Rq9zNVyOQzPjwpJUN5XeQudG/7RS6WTMUQ9KkZhHJbSudVkPvUJWbamfRFsnTdVWsLvsWZeYkz9dNg1fR2BN3MZ9ztY2dkXyfm0PpfvVog+McSxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhhfSFnT; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhhfSFnT"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c0f4a65bfaso188256eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 04:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774437541; cv=none;
        d=google.com; s=arc-20240605;
        b=V9+1Nr8H0VSw2eXYqLox8eWVT8YrXeBmFaim8NSxe+dag06Kf7Sb0Sa6Bu9CQ8zL3F
         XQEtTjvFBopqAVZnZregJTk1JUFgHBV600KXD2ORf28jPw23YFvnkhITiaQuFcHhCcH4
         3fmx/LnLduvqHcZRVofhXqT8lLKVY/6mtECoTO6PCDO1FieefArXWEuYgDBe2CkepkVg
         PSGqCFKOLcAGxOBrAxse9ZLImMSDsc+03Yvd9FE7tu0gmL0crEbx3l55A+8KlWfZZUzA
         zacpZ7rJ76zy2zTJmCtF71guXmz330u2eVbF7U+UkufisUlZr8JpCiU8gl+kKEetCRDn
         M5ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KOYOoxFExxgHP5bsLs40oV2q/ubG7HXB9er87HhDqG4=;
        fh=pdLKEfujf4RoCDeeywkrCnXZxUPAA+atNGQyP6MHW0k=;
        b=S1qgRSxMLJrHBUj4YOgcWFHbEzAddeDrf5tfRaReNAa9dXmnfDtonfht6OlcH23q/P
         S5bhBqebvTmaZB5Y2Cb0IpnjYvwOvs3n5eQS2OEM782yJtCtDz7s0fWXRCDGPnHuwPnp
         lwfZMMLKrLJchHVgcDyEoWx6S9AJZIApI4z4H+K5RmgANkGBLYGLb0JgEss/LVK9pjA3
         RlheIXNP+JSdduRdk+Qrrt+C592FguwYbv44cz20fO61AZJa84Myrd5C5n/yYpjIULSi
         9ML+gDmsJzwUz5e8vz4a0MUPGcY2OOhli22jViELLRI9vzR3nN3rtSpnC9ouhCdvYZpk
         4eOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774437541; x=1775042341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOYOoxFExxgHP5bsLs40oV2q/ubG7HXB9er87HhDqG4=;
        b=IhhfSFnT6KVFZUCcfs9YyEnzoy+OQ+eZ7eUXS5GEnxtvn8+tvHlyS+uGW0iZ4okcV5
         1pFrMWbbH7Tp7aaJyaCJ20FNQ9cTbmU5wGUOvIq84AmnL4UeJJZeb379SGmvBWnAuqx2
         p4ybjhLq5g6q/TdccQjSaPxlWhEMBEm6XZh2sj6nlDVAMub9rW3tdKLaXAV+EG+A6ENX
         M4sZ1lHOKyaz1z7K4kYVmnwOhdFsqPZkwxaIMBtzoocr63k4EpMkrfDIb4+9hNYlr6xN
         6DQfaqUC7f01JCYLjXi1crm/LIjrU7UsG0QUX7bAsrM27LgWmat8CVl3XTqraIvkbG2m
         CLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437541; x=1775042341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KOYOoxFExxgHP5bsLs40oV2q/ubG7HXB9er87HhDqG4=;
        b=kTJHeZrpoVVPNvrjkc6Nfr4eXqMzLgA+LqRCByc68qasUrQmWuefPCGd6cmlGER8Xp
         j6qdp2J8IH/eqHRP/QyC7B13/UAbQJf4nTHZ40fo80GwTFtNHbqvA8/496gw0fQrb1O7
         hOvgOIxZO3HnitR81OPbADYaHLLQDh0JkBSXA7OXefH3bfgGoDRhxwm4f6m9NHmw3/dR
         n4VFE4orQOKNs/zAaF75snjbE+GCBeMCZtq9YFaCGcDcu0wd9blx5FJw2aZNDdeqlp2G
         I8bn6Yaa147h6ObLoR/CmExy3KFjG+hO9HTfnpwQL5NAT2ncQB2Rh/tzdr2d2bfXmIXv
         SEPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3ncYUG4eJP1XlusbdJPeOrs9pbVDGEXps4WzW1rtBXMsbqg0agx884LgnMxvUF0+dMmdkqE4FW7+uzCFihw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtpi4MljL+93iUY2HARDlBX4vmYP1itipXcAmKoQt5NR050Ge4
	vrZQbRZaxQG7bMiysFp5LkVwfswZaS/oTYxfwlZn8vi0bj48oV4DAco0SyKY39OTBj9aNQ+CD8Y
	CkhMXTWFC7pqKH8dnYrmrw9YdjPLNs3Y=
X-Gm-Gg: ATEYQzylTb82wW/U2ec9wxLW8fOc6J2ogreUla0DKI4b8o410HhoaOw908WyzeNsCYn
	UX41NzefcMkRqwegLsyCMHnua1cEPGyqHZehn3R82I2Y1iTi4bVLmVQZRDEIBzM74UKmgEOOojq
	AG6f8ZEZ6xN9IdpN4lBbrBLrv6QYhUVjOmlE3Z6uc8l47lvVOoEwy1U/CLAtVSPmZpxZPLaTX8L
	MBj6niWfzlvjMec/T1caiF+8/SVT/PwzTxgbfMm2YWVAxb34pZmXddlm88ET/xXoqhJdOPnjImH
	a+zeSEtk1hxwW0oHEP2laiMD7JCFTABxOVbM2rLFGb/5BTx2MMWYGsKiFnF1bzjilYBDaQG+x2Z
	yKNBE4H8Nk+9I6N2+C8NG2xAmWu1a+ljvZQ==
X-Received: by 2002:a05:7300:2153:b0:2c0:bcca:e9ae with SMTP id
 5a478bee46e88-2c15d41a555mr737387eec.7.1774437541042; Wed, 25 Mar 2026
 04:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317225355.549853-1-jhubbard@nvidia.com> <20260317225355.549853-8-jhubbard@nvidia.com>
 <DHA6XCMN83HZ.35I7YETBZUV7B@nvidia.com> <b3780f18-a762-498e-aac5-6a0938d26c5d@nvidia.com>
 <DHBTCMREXRBS.3RLSMFX8U1RXC@nvidia.com>
In-Reply-To: <DHBTCMREXRBS.3RLSMFX8U1RXC@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Mar 2026 12:18:48 +0100
X-Gm-Features: AQROBzDezNMS1WsYBd33qHLRM_LxZ8yTmksrMQSKU01eeagh8jF58cukCs8kamM
Message-ID: <CANiq72k1HcuRzHa2YF824a_BRub3dD91A6RYuzcaTA994BwZ2w@mail.gmail.com>
Subject: Re: [PATCH v7 07/31] gpu: nova-core: move firmware image parsing code
 to firmware.rs
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 12:06=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> No, you are correct; removing them works fine with the latest Rust, so I
> assumed they were unneeded - but 1.78 fails to build without them.

So that wouldn't work in general, but it happens that for `size_of`
and friends were added to the standard library prelude in 1.80.0.

So I added those to our own prelude so that 1.78 would work too if one
imports our prelude to minimize confusion:

  72b04a8af7fb ("rust: prelude: re-export `core::mem::{align,size}_of{,_val=
}`")

I hope that clarifies!

Cheers,
Miguel
