Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B20385D99
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Aug 2026 11:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787485247; cv=pass; b=B1K4FgokcEARhCng9GjBPZZfMMdPkNVux9wjAGymYPQilBIe61eaFWqcKOfsLM/nlFFS2RTb2QU/sheRezrgY20YYXmcHUwIH4NKezoZufrmcUxWEizuBUcIhmyUKWduu/3DDP4GwBvyh4MDE/8jdhVf5mh08ZQ5hTTEPd8PlN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787485247; c=relaxed/simple;
	bh=t1yOB6lXAkXZSgznHtcAAF62SrqAAlNeqdd99qDvIqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdDhDK09n91xGzQAsKko85xq1ZSxT2gFwYlT7SpoPbiTte44X4LVat2P3q4ZSQ8WGldrBfWKvWi7rLE6/sZQZ2swhdcjl+tT1JipjAJaZAvpFN1B9ix789dtRAO3zVfl9/GPmJ4mmkGbNj2Zl9ojz/8k3hLDn02geB7hBat+5mI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4OSHurU; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4OSHurU"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-392af6bda98so364367a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Aug 2026 04:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787485246; cv=none;
        d=google.com; s=arc-20260327;
        b=Qv3DHhtrd2sGm1RjVUcb93tm2+M3CIUBEGLypcPRX4kJsc0PYdYOBY17t7/fI13DmN
         w9UsKzpsLHnMSeUEMmSd+bGCdYuSuNdPGMUO/el3A50JqLqFtIwD6WVwVFcNRC0UQit7
         bTO2tiaAB//1mUPlsc/fgu28RuwYTq76peO8V+v0n1UcCQ+z5OOBRys3luw7U1cEk0NB
         bltrJFWBY4AeKkFT6FNFMC2WKkZi3D7oRJudxS8dPzh5rc5Ziim1BbcoKN2cGod2SEuY
         +Z8yWm4S+TAIFm14+KLmODB8qWdX5n+GhGr/znAd9MTaiFPBBD3jY/Krq0LyxF8e6e8y
         ADpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t1yOB6lXAkXZSgznHtcAAF62SrqAAlNeqdd99qDvIqs=;
        fh=p949WhuEnvONhiGTvUo0icM4a7NKLko9E0N/ccYRhP0=;
        b=OGHhq/igBopYsr83nh55kkQPsPeLE/2f2SlOdBcgJSD7QgAUi9mlBGGA3fT3gM0bKK
         XOl6Eb1cziL7Vf4o6LK2nPz5NDeqLbPIA8UZm4okD23mF5476/54l1dJcWrgjQLJwj0K
         ESQaC4qiBRmjhT/hs0N7MEHsr+lz7OoO4f7ya/6l3Ud5wydfHvMULNgm//5fSWsETrqc
         MEZIQtjryFF0ipE/5aELfLj1FLq01CT9KnHjmz2koM+DqaH+3mkvksCN8mWZawxWKCD4
         1FQ7uj/GdS1kSwSDWu5pu10yNJW3vxnCv5uGZDMO31zlFTA/ahY5vkNxfSv9ePpYhsdS
         q01w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485246; x=1788090046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t1yOB6lXAkXZSgznHtcAAF62SrqAAlNeqdd99qDvIqs=;
        b=e4OSHurUi3FPik7E2pe+GIl7rr52gHTBQdlGv4kvB6+3pFk0HCsB/cQ5OX0KLD0U9s
         0yx2zbTLUVfsHloogFiUPoVHNs8W6gcB+ST2ugSikvyE78qiVuHTHeuSiMyKSXIlEzfQ
         0JK98nEbQhNa0zN3KsSX23aLxtXoVp2o2gywwM7gkz4ffG7VgQvAB7Hm3jzEgSmJJksU
         uqdCVGEgWde25J+r9GyLYTzyXRH5Fru0mXNrB08RHzKZ3fF5PMamLhin10NCPgYrurDx
         RTNl5hRTEzpnC7Uqa817ba5GKWaEogiVSJebem4p8moFCoUyk7OznK7urbg52BO9VWaG
         kh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485246; x=1788090046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1yOB6lXAkXZSgznHtcAAF62SrqAAlNeqdd99qDvIqs=;
        b=AVLZJwkvKDOMxRdmW+lfqXKy8z/232Ju5mlvyYSREu3N79dD7LiSSOv6367umncLtH
         qyY34mXmeTx0+lJb+RycKmK8AX/71jhbC3cFqT7M0zrj2vr2DxSLbRB84ZduHgNWMrS/
         E+Q/07EMKaIqh8UTgSyaTWkg7XM1dfXGn92kOJlx6Awst6Z2DWWcgXYpBs60Elu/dsGM
         giS1erwfOLkOZRMzfD7LUocQ9AtpDhpJzT2cGyNRmyWKrbeG2PI3/W6xKClSYpbnUIea
         S+GjAG/jvQCXHDwdt9V01+GrTo02Gtm7Acc8XTjJ0plCwO2+uIAPU4UjLj4+mKLg+5Yj
         4/3w==
X-Gm-Message-State: AFuF++kLzChZCY81ECNaLwzxlieKI/491B8pZyAu36o2jNB/JyYNK/iA
	wyQOybpZm54HDYLQQzePzAIxe1XeNx2HwJyrqlRajgyeaQ2UQEScYp7W5pYulnsi2R7RYECGPuk
	FVnCKbChOq93LKpdAmGw3TfbnCWKIWRY=
X-Gm-Gg: AR+sD10xwysBwCci1JEQmbX83n6odVbftvTPse5iwiMJtjI9tVr9DVGSsj4YjfKEXnw
	kCPCEk4v5JJ8hRNvYfCHPxZU+/0F1Cvd2OwIloZwlY5hkZ8JrgN2Toez1IAQ11G5nkRgODCqpEf
	/OdLbCE0HfSbxnXkenZ5deFaV0XTq+B39cOqJuQ/vfQLnGc8UKVWHDvhm0K6tCX0cpHP9uhQRqV
	gMydQuu9pvpLkpqOIhf1w93tg3I063r6AL7ZJTNXmNprTzTVcjgO/xJiAMaFKHUyxusItJp3yFT
	ZCtxriRUzuNP0TDJzgUSAulgLnwDX3DTbfkKPPY0gZ4i7JFDGDLr3dU21v+g26WUpcp6rvD3763
	LCmDzSKYELhYjruk/pz64kcNE7qZULBzvBXxMPErE1HbqH3pT4qWNfV6aLf/z
X-Received: by 2002:a17:902:fc4d:b0:2c9:e846:a582 with SMTP id
 d9443c01a7336-2d64a9a668bmr165095525ad.0.1787485245660; Sun, 23 Aug 2026
 04:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823103644.342849-1-springbreeze@stu.pku.edu.cn>
 <CANiq72mUbkEcvffQV-mNLfCxGkgTqwq1qQLuWpENsUCCBAHOqw@mail.gmail.com> <AOUA5wCUK5sso-ea1NbU-4rk.2.1787484007018.Hmail.2401213299@stu.pku.edu.cn>
In-Reply-To: <AOUA5wCUK5sso-ea1NbU-4rk.2.1787484007018.Hmail.2401213299@stu.pku.edu.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 23 Aug 2026 13:40:32 +0200
X-Gm-Features: AcwNN1Uws01evHg50TElosuDV-b_vS4j4csMx5AQPXdF_CkFs-0dBW7hZfXwcMw
Message-ID: <CANiq72mQ8bfEw-NM4phjgp-QxEP5RpqNTkXrjjGqkX+VukqkaQ@mail.gmail.com>
Subject: Re: [PATCH] rust: net: phy: fix off-by-one bit positions in device
 status accessors
To: springbreeze <springbreeze@stu.pku.edu.cn>
Cc: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 1:20=E2=80=AFPM springbreeze
<springbreeze@stu.pku.edu.cn> wrote:
>
> Thanks for the review!
> The literals were a stopgap; the code carried a TODO to replace them
> with bindgen-generated accessors "when it becomes possible". I checked
> the current bindgen output: it now generates layout-derived accessors
> for these bitfields (phydev.link(), phydev.autoneg(),
> phydev.autoneg_complete()), so v2 drops the hand-written offsets
> entirely and uses the generated accessors instead, which removes this
> class of bug.

netdev may prefer the minimal fix for backporting, though, i.e. the
improvement could in principle be a separate patch.

But, of course, up to them, thanks!

[ Please reply in plain text; otherwise, your message may be dropped
by the mailing lists. ]

Cheers,
Miguel
