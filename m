Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6E44C2271
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767385; cv=pass; b=PABRC73q0WAQwitpgLa1IQFJkqxlfG6UiHkpXZkroehQZD0VrzYmPy904m/RmDulY1fkUaFVX8Qh2D1lORLW1AfCdK9kMTNXK54JJWjGU2Zd7tMMilyArOaVsuykYeDBiogYhiEi4/GcDP/qrj5FoVu1N4Qvkuq4eyxIZIpg0Yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767385; c=relaxed/simple;
	bh=Q967mc0EqT+NcQxMSEBQMD45Gc4hGwPZY4Sm4dYQidk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7HFB4mQCDJA0RTCwoksk0UhceSJVfWlTMtolExlULBaOu3LqgjZHnFLEOtbT1dG38Y/Aa/DQHqWkgkwIYPN3GstVzCd3rTz3dFoWPYISkeodmx6lfhiGWfLbJ7vAc5anzWNoK7CAgdUsbtyVYY9F3SrTtRri3MAW8eoi9dTLXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ss8idYNb; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ss8idYNb"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e4e75342aso395726eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 04:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790767382; cv=none;
        d=google.com; s=arc-20260327;
        b=TNAs6EhZm+2bUIUQqV2vxC25yXp/4ToOAQIySEF10mBerm8Vbdb2Gy0zh5iIipN2Tz
         XH2yRhbhF8PSZXtwGaFHn4c8EAdZ+fjLbmEreVq24Uawl+2kVo/2xlbF85zTEU+VTcLt
         W9IwTKa4Sc5sLTH4xoDwFi/PzvMjfLtY8i0XD36eyGUXUMREgSyxCOjb308v+Cb69P1y
         2mN6DNuOdloWKz2va9he/n72tJEpM4zMLJDZ/PwLnMFeEm5ONJBvzE60tEVsSZeU6Ifd
         Bj1auFhokD0kZe6fUISw+hZR1EnYS1dZb20VNsX3Sb2EgamAF/je/MstvdwobT9pXkWX
         mCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q967mc0EqT+NcQxMSEBQMD45Gc4hGwPZY4Sm4dYQidk=;
        fh=kn18S8FO5bXBdbLvk+yE3xlyiNyE7362jt1pUJyGiAg=;
        b=pQkUO2j1YGZaAA1or+EbVXh7H8ruJ/IoWorurB03pb0/PZQmY81eD97kM/ISIApBi8
         f5Tcdc6rhc01eG/d+KWnWQ6AeqmOWYyQGMQm9ILCeIsLaQxVa3mpJMY9AoO0iAErZhpr
         bN8HfOJqpLPHoCEZIw5dSc40sNGmb7ZT0Bi9Zu3RyNbGDsfscUdPHfMKUFD8mF5kZKDu
         iDCxxmTPv7yNMewczhyToXTBTS+e4ls60ZwzgU7ReuNsQIa+CeABP4h5DQeFqaYxvs/v
         gsaocIKVKIWvm9CRa8bzM9DYYepLWqrZiK7PLKor0o8kwJ8nSNioAuHRT8f+T77OXXSo
         O1XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767382; x=1791372182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q967mc0EqT+NcQxMSEBQMD45Gc4hGwPZY4Sm4dYQidk=;
        b=Ss8idYNbGCa8wxB9qACmHEOdVlhI19gBVQ8YzhBaoyv/KoviyukEnu4H5sdcDYH2Xo
         /rE0lQSfPYAzEfjzvsDMmgZnjrSXqUieJDCx0XT5UqV9FK9H2Cg7qlYAbc/X9PT3/ZWL
         r3DaEy5uW+SkhXBECMLwafRJXIpdMYLCth1Qd5uyZ2GTCxFQAjfODEza/x1a9JsPDD/J
         NN14OYQ5oMyglvZZSqt9BhSZqw+caU5Q0kbNl3ky9Ng+qsfmkRdNjxHvA78mYlbVcpg2
         EMQ7x3uUukctZ8iZormt9Zw2UGuP/cK99IuKOoqRX9sdt5lQvkRvBtKF3g1RvTzYeaWI
         PdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767382; x=1791372182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q967mc0EqT+NcQxMSEBQMD45Gc4hGwPZY4Sm4dYQidk=;
        b=efScH2bywfykvwNxDae/RBxWXXmpPvGY+96WZ3LKtkE1LTMqYn2sP0imBT7svueUge
         YGISBiwPbyIIJ3IEXsYvn4S/Y5A3MlC0FADvBmhb8v/ud2ms/nuuWd0/kvBKl2L7Misn
         nSO5k3lT4tVtnbMV+KOD3ycdVrwgmCCn+RPhoYBhEcrxPoTk6noEc2TmlhCZR6JJvcSa
         Rl2Omh7y9qMxWJOqzv5pN6VOvoHxpa1vbcI8IsqS7qqVwKyJQ4J9JkjEDHJsX9MA9dQf
         VrDsaQtlmyGm9rJ2oiud+v0ECXMyIJ1RcNeqh8RroPbDQnh5S6rvRgEF2SlsJiUZAKr0
         NMiw==
X-Forwarded-Encrypted: i=1; AKwUvBwBvFrHFTniPa4bms+RR6d2kgCqZIs6aJsJ752dMMUREJ02rML5FSL+H5GKxPWi5SyYmkRFXt3uUwLVfbeXhA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKfg47ehzYRMQ8/OJ/Op+U92z2VW/sBHIGyNC7SDKA0XWKkZxBC
	G7s0u0SI5aN91kd1uQ+eSpchkKknp31CVPzVXah/495WXaAiYRhUIcqa3lCwYh7oY3b43u4SQth
	lXYPPxj21fbbHIksR36IPm694btIgCzw=
X-Gm-Gg: AYBFou0SXS4O+XMeOlpuORlu1ENF/hrzbM/VNV6HvMAfq2EYLEFBxgalgpgvHVK58ZA
	NAqVo0tongHgM73gSKFoAQIgvhAQ6RTHO0GafDiqsH3GhcbJrrUrjFNPb0pzqpla18DW6/bMUop
	QTyAx219oTPy5GDDmRF/KkB9qOIc9XeMkXX/4J1H0nAj/k7oGIKgyMGcBqaJdfDnz02HhEk7t/p
	IfnL4PX6yFvzYqiidslDIAQpl2HEldpwRutlTtmxD/Z2Qa+NhOlrmJMxfHwi92IquehyK/B3fcg
	i/3du1fzKHqO0UY+xWKjxU3Hx56uICPejkUXijVqhO9JCjnIh4WXKVjUu1C/r39SUkeuNSq7ps9
	ZFXw0Z7Udqv/hCweAP/CRBRqqfB/H9Yxm9/oKST6fZy5eQn9FVSq7d2sAkFFevAEhGGFLitXokp
	xOdUXReRqW7jGI17ScouhIVw/X7j4PjCC7Ic+vatTgms2IR6aFCMo=
X-Received: by 2002:a05:693c:8085:b0:34c:f181:85e4 with SMTP id
 5a478bee46e88-34cf1818b1fmr2066899eec.1.1790767382465; Wed, 30 Sep 2026
 04:23:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com> <20260930-chid-v9-3-0d6cca376cff@nvidia.com>
 <CANiq72kcqVfvVj_b7KTHKrCDj63LMKpsfP30zafoYB8c924i2Q@mail.gmail.com> <DLSLNL9HDUKM.HN7Z0MACZZSB@nvidia.com>
In-Reply-To: <DLSLNL9HDUKM.HN7Z0MACZZSB@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 13:22:49 +0200
X-Gm-Features: AclHuK_tZvjMuy0Rny6WfvK_GwQlWAvr20_A4Fja8oGIX-etyz8meHHBtoM6IgM
Message-ID: <CANiq72n5jjW8U9VkYJZYFpL9Z5rPe=nRfs3DqmUdfxCW39oMgQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/9] rust: sizes: add sub-1K size constants
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 1:04=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I am considering picking the series through DRM, but it also has a
> dependency on the `cv!` macro [1].
>
> Is this ok if we take the patch introducing `cv!` through DRM as well?
>
> [1] https://lore.kernel.org/all/20260917-cv-v4-1-547ef5727451@nvidia.com/

I asked Gary yesterday if there was any more recent discussion on the
tag thing from v3. Does anyone want to do some cleanups this cycle
through rust-next with `cv!`?

Cheers,
Miguel
