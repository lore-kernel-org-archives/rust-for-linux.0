Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC389363C43
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791710137; cv=pass; b=kZpiIMicwFD3vErUb2WUlwSi9sSbHaIS9C2T8EzKmUv9jtCUj0ZIPIwzFu0Cxu7xxTwNYFq3yzGXT3h3YVHwk7l1or8sE1/wQCe7xUDZcYFiTFC2y5umPrOcNkoun9q0q3SCfv8O8GnZ3n/BmgwJWftXBaw8Jaowfg6WwLVgol0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791710137; c=relaxed/simple;
	bh=hGkdQt3CffghjwhVKgS734IYuXkQ0DDpVgAEI+JBZM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Az5fJa4fXW1tz6Lip7VguZhgmzNrsS5GZFnkc90a31m+CmrsEYRJ0u70MO7VA2L4jy4uRs2CthmBxEATsem2AR/ebUK4PxOkqzjfj369fOuV60UWPyREZqfSQyF50cOWZJyV0PHwUhpEidHrSY3kMCAs0jGDQPKld7AfipzNQIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfiQ+1YW; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfiQ+1YW"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33e623bd651so116805eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 02:15:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791710136; cv=none;
        d=google.com; s=arc-20260327;
        b=b8knrFcV9nOmwZ+XQwdiHPclph8kB/wfDtuO0/+5ptwN2bO3fTYvx5zGqcGwnTxwZh
         3xsgSxNa8yj03Po8C4xlbNHkBqq0IZn4jTJ4txWeeSXiaHpwWFQjPKrapgOdHTXZ4d16
         xiB0Ye3VQ6PmpCpCtxWg67ho2E/e5vaSCQjhXqOw4NcsKjOLhQIpy1vXwCm3Kg/N0KS6
         QDIbv/N2sGe1eaBUMcE7wAdHvQiM+D0hAbL/0E1okRBH+w0hKShxo26+3L/SPMS6wpof
         olqD0/0xyU1RImPgbtxgrc1CDw9KdF9h/Is5Ip77NjUeH1noFEq/HZZassv2DzkwhFzZ
         XJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hGkdQt3CffghjwhVKgS734IYuXkQ0DDpVgAEI+JBZM4=;
        fh=GR/G7F5I2XmgW3sgP9QsnzEFVVg9nxqUyax8Ya99IIU=;
        b=hwtCzDIWSTT9FxmDmb9H1dht9NTW/SxF294Gm411CrjaG6NS7JXYR6ly8hvw261d1P
         0fCWUYbQneNRCZNFFrTYOFuo+MZF0oTWDh73qo974uTzG6d3KnbQwFkuZLPAXTapaADF
         MjoivUCxc85B0MVX7AYviZYOVJbu24M5uOhn0dEyXtqqNzbsOJ5yMOIxBf3DMiTrzqkn
         t52obIdb86G/Y3gbizoDazU0C48HmgiwtdHRfM11ZySHQuKLv2zdM+yvtXshMLav/OBE
         rlnlZ08uyFPMIKOogsM9XdAWUBdOdAo8v3uobvxJLHZcNNwP7N36ZdG4QF32mI6ZqIp8
         Lbkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791710136; x=1792314936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hGkdQt3CffghjwhVKgS734IYuXkQ0DDpVgAEI+JBZM4=;
        b=HfiQ+1YWFpZUiRoyRuKMbjxWNWn+4Ja0dIkSZ57xjyAWMHlWWv7qWvioozHObJX6cj
         4lDn/HXHf+IVf2uB+T4rMp+rUEWWUTPUuL2wfF7DSRYpLAe3w3WLWFe+as7Za9tK8aiP
         AWwT+zyj5G5X5nsdm3vgZH7aZ7u1HO+UDh59KpHr7NuPGLwxQ5WBRQjOUb+o0AWCiV4P
         UFaorTvX+bCxTH0AFBzPGAuTIzEZ1KISDmoyWMAt/KVuLEURG9NAWHAjxvUTb8T7Socj
         W+7MtRxNyWgAGRylFIm75tnovahpcLsQehEKOFplkMOSdlosbJ3TjIZLijVcO2BUkcXp
         SXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791710136; x=1792314936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGkdQt3CffghjwhVKgS734IYuXkQ0DDpVgAEI+JBZM4=;
        b=BT4idkelU/BE1NgGB2sYvIfzA/zhfbhYtta9LvAlKVH3IQZ/KIZNmUYokjuPz7KqLe
         UpydwvrN86x1dKAtKkOzpkj9wuPFZTGngCOcArdzOrWWw9fM+MyfNZaTauLfL17MWehO
         rKSsxiqaGE++YoiqDhOLmfa35KJUVHFwpC2CzoulnRGguZ6JDUQPWuOG3eGCIOMb63Fn
         FRTVbGZWsJ+HFraLFZ4PTiQ5Z4cELBfAM4+K2tXSvqka6o1iWT3/6WykFzBmTWAx1wPN
         PvPYHJLs43+25OzCqIzy4O5cKv4JKWiEEeMMPrxMhQTWoY5Cxldt5nBO3jr6jUKoXGgJ
         1PJg==
X-Forwarded-Encrypted: i=1; AKwUvBym3l+c9K/Pf7j8vPLvy/dnz/B73Lr+eoP3NsT5CPJV6RLdMpNOVgvoXGMjQHzz96OvJhWNiOxx8QVydE/I9A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIhzNuqY/CPZhDjNgfjMXalpSM0246y9RThaRcfkpnjFVDinHey
	Bs1JhW9Q6Zt9zZth/CXWGDaiYI9tpArzx0aCGyBup+Cvk1Z9mfY0BLuLl3y814RLSO+w4iOazuH
	avNDZuHK2Y2NX3CfL7Yl8zJDrG1NoF8E=
X-Gm-Gg: AYBFou0Un1bnRJ7XtYKrTqLq5K1KklQTo6BcLAk0vTQ/b5jie5lHe9IuAVuQhFwNMl+
	jqlLEZMKVmdLQUgqzDaNyu8BdhhnaBhxTEUBFXxdoEAa1KWGfCEdY5Msi/9/8Z4G9dp6jwsM9z4
	RwYAqEvXcj3g8UNvwAlNyEtyIIDGqYhxG2QT+xU2BtJERq4z0VDSIEWkarRGV6lrbnocCoa2XdL
	SkgtWxROMiXEpRU3CqUUn/Dvme2pwWECcEEs5JITeGzwwytbTHPwhIXO/WDimS2l2Heh2JzuCU3
	NtWKroFJK3XniJa8CLo1tEE0JdQRxQa9CD609TUgAm8VNc1hWchgpCB+37mpdCKF3NIxpajSnrV
	pzG7K0HJZ8ZcquWIG8972Cc0dRtQkzhzlAa2OSs4btttBf9XdB38xBjAsBQCUzmWVfR0utT0oCt
	BN5N0DpIrBhNOILg60R3AaSeo8wtAfkkeaJQjng1Y3UjrxoQ1M3MY=
X-Received: by 2002:a05:7300:ea0e:b0:351:6d7f:e2bc with SMTP id
 5a478bee46e88-3537e04ce24mr13816603eec.2.1791710134848; Sun, 11 Oct 2026
 02:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com> <DLZJSCA10YBI.2NIG6CA24G8L@nvidia.com>
In-Reply-To: <DLZJSCA10YBI.2NIG6CA24G8L@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 11:15:22 +0200
X-Gm-Features: AclHuK8oq3naNnD7eambaIbJJqVk3yW7pH0z0MJvkulMtcEMY7rW0rV1YUtor2E
Message-ID: <CANiq72=91-kisxDHJyth3xsy8BdEdqLd3qpHLWqpRxY_bmFSTw@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] rust: Add support for reserving of ranges of IDs
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Yury Norov <ynorov@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 5:05=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Since that's quite a bit of code outside of nova-core, maybe it is
> better to merge the non-nova bits mentioned above through the Rust tree
> in time for the 7.4 merge window. All the patches I have listed should
> have the required tags, but the `cv!` patch needs one last respin to
> address the remaining comments and add a "Pitfalls" section at the very
> least. Miguel, does that sound doable?

These things have been around for quite a while, so yeah, if we can
land part of this now, then we should definitely try. :)

The "Pitfalls" section can wait, if that simplifies the
discussion/review, since the rest are nits.

Cheers,
Miguel
