Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EE93446A6
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 09:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588731; cv=pass; b=q3rO4tNC9jBc0azOQbSFGSYf64/ZK/o5RtDaa946NKfyFkNN/rAamjIP7qmoZoD406Sx49zv7s9W/JhsKIPP8lY1LKH+LINGluN01XMkZIjOiiT3qYpJTdLrfM+sbuxLyPBTDsc42SmEIjDjP4MFuPZjHjTCqZufMojzdONNX0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588731; c=relaxed/simple;
	bh=6ehAr6MfgEneg++2m1fOffNPypZtYpu4TUYf4Bz8Be4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uw4KgNoVMfn9nV0LBEH2HWlKVqzg4vNF+pFLdPGcjMgRdc3ecSurh35rDJ5jXHsSXTXKyvXybmrTVMMmtQ0W5/4QhFHMgHA4ntTrSoah4bFoGcFj8/k2w+Ts6CX+1ElaliLXstg9DGmhbsI1WY2zkbqTukOQkxDBv1eaehAfXls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oL6IyTXf; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oL6IyTXf"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342c08bf64dso149345eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 02:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790588729; cv=none;
        d=google.com; s=arc-20260327;
        b=jaGpuoXLJjfEFEPVKk2SVANwOpoeshugCdpfgz6ldsiuLIwsleGEh7ksseJOuRZYBe
         j3B0uQF0tma7gnYOHQsSbFfoDPGcYhXPSxq6lS9sYs28XRzQgZYyDg00FS9J7LMONph7
         4b5yNscDSPBqNgtuLxM6HuXZgfbMVjRPUJiZmd44q3q60xzYXSgGpTlMHjN8FhP2XvqN
         RH2WsPTbMlYj3FgeZ3LrKTpOImvWFgOH7YE4dcxQT2eGKd1L2fkXhG2le30pEHb7uFFR
         6mnSEQ49EEDh6XqPeJHPMIYlv772VF/e3wMu4tv+oYb2zzUzkOARBprJb5FTdx4K74GP
         Cdcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ehAr6MfgEneg++2m1fOffNPypZtYpu4TUYf4Bz8Be4=;
        fh=IcYUbaEkLMR0ZoVbRCtS63m6tXV71clysVjIo+ihFD8=;
        b=bVt62cIy/G4G0gBvoL4pwSr2hOODprDKPPrG1+ZhFfFUUuVyPW2xI0XX80Z+6ZJn/v
         qSLyi8yKNoTBS9ixZmAKGGkjsAqgEOZ6w4EwD2Ryg52Iw9oQiLpZtLxYVIA2xLzXFq/8
         RXRpxA3upgQxdGJ9SfV/tJCNxdwwFSmfgNHUa6RLWu/QW/sW52UpB/0ECTzQ7bkbh7uA
         U0eprCWsKZPoiyv5eliiugIqJAoHl7qG+O4CR233f7BicYrckn74RDVblhsNCyO+MW63
         Eez9mRspBwfnuVhbTaBF8I89MyXeix7ml0aCP+0LSnwehtZb/PTlQbkQ3MF60kaI2Hbs
         cu0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790588729; x=1791193529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ehAr6MfgEneg++2m1fOffNPypZtYpu4TUYf4Bz8Be4=;
        b=oL6IyTXf4E0Z2FmMfR+sLZo7xgXL5NAQAQFbuutkQYIsf7Jz0LKc+VgGniT0a0mdvP
         8epMCLRgiCbMw5hcrHovDt5gt01qveRQbvV8gP3tGY/jwqNBy1WamYO9Ves+l0kV8lVq
         yKsNhQnNNXQXbiHEg40CP75qVRMGNUxF84M5MkdKp47PpdOdWEd/lHNZaQeYSo5Ftoax
         9aawRBgHBWZ/EK/7YLVD7dc2CuXxx6S84Eyi/wak7uVmzLRHZHWz/vxIrR+8mVGeSsyq
         gQgaDi1oTdZi9oJ8ljd/b3IK0ixdHYL+HOjOFtmb7OJqGo8XVHajAVgM1dUoP9gY+mo0
         mN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588729; x=1791193529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ehAr6MfgEneg++2m1fOffNPypZtYpu4TUYf4Bz8Be4=;
        b=lx6Mk5A3ytmtj4DEI+c+7la02/B3FpcgdB1q0HpLS/es3Wpz1zqfeQpVOKJ1Axhpcr
         p7AHYqQQfQ2d6709JSFxECEWAWJ4u1HgdytXleWMtQ3pPYA0qfX4bkpfhhpHRBLqzx33
         8ZO8Qes62YYcIp3ulNzSiG3w+ylnrN3stOaNsNZviIi9x4Mv5OWjYU08ZDUpJvyIp0XU
         ekMOJEvrDN6MlxgTIlWsXAnA2Ce2yujtBNmRw2aQLYGPKZkvzMV7MjJ5H/yVRxVrjk2Q
         G4Ly6u5g5/s+7kxURmHnCO5Ecmw0rZOx0buvKJC/jIrGOl0rqUyyhYKmAvGf/oVLHw2+
         QNTA==
X-Forwarded-Encrypted: i=1; AKwUvBwEtxAd5kWjiaclnL2ivf9okII0GGWNmoxMNnZ/IQ54cweZJGSnZkTY8UcDPB/revBdPip+NlU52caEkK9rOw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKPTkxfceTLxFpN3ZOHRysE76tGpVmlzEeqQyfrE25NIs36wK7s
	ZR1lPp5uBSgxFIzyIKJTnZH8HE2PihUt01DfLPwu5Pc72ISlDNsULSKecLf5A+zeR3FlSCOezPv
	BMliqYMnsyXWwjtZnlqhN/0KPOpC/N2k=
X-Gm-Gg: AYBFou0wPh4WHja596m1RqEkOzN8dL+pn0j7l6L/T94V8lm/0kjjiR91EyFz/YSHhEx
	7yjv7REeCMIiR72kakhukJTCeaG6XY1v+cbS+sdoEk+ZH+6StuZct60IpJqyS0LFmIAc5utPqOe
	zC/rVTmWE3s1ADO9j4/zjgcneRNwQizde0HLucgGcCX5h5R43V/+LIIi+PHjHW8bMlv3Nw6FZ+4
	/thM3GB3dLt84KlPysEhQpu/almvLUDVgSXIQc4AjiQzZInzfq3GtfbSW3rbx/cb8i2Slbmyouv
	G0P0QNUR30ELYDTK5dcghAVnwWGm0b+qGMaBlgPzxRNEChiVmisshh5xSbl8hl91KjTxqPm2g0L
	wl5ptR5ugeCxKMyKhgIpEciGE2aAvwhFCJ0O3gzJghhUL9XJSl1GgJxm8Vi6d8/OFf/M246He4k
	L+qWwkp1clxBjwwCidYx79C52peTyD3UWOp4QNFN2UZvWjDpy/kI4=
X-Received: by 2002:a05:7300:de0b:b0:341:f4d6:d9a5 with SMTP id
 5a478bee46e88-3427169be76mr14511760eec.1.1790588728829; Mon, 28 Sep 2026
 02:45:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <N-9g7-JCEv-O-X7-hryv99BRSZvftBvpmaAmWdwRp9b9Gi64FWr6GAtnUToRHlX86lCBJgEKPQine1a1NsJcUg==@protonmail.internalid>
 <20260924232530.446588-3-tomo@flapping.org> <87zex52224.fsf@t14s.mail-host-address-is-not-set>
 <20260925.183924.808421603238938986.tomo@flapping.org> <CANiq72=iYeD0AZCRb6X_1BMR1OBxGrzy6j45ZAq5C41+giG5dA@mail.gmail.com>
 <87qzidu37b.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87qzidu37b.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 28 Sep 2026 11:45:15 +0200
X-Gm-Features: AclHuK9z8qeve_I7YTy3QoFH-d3kteqkmfXCrvnAyMGehI0GUbyI0M_O91fjGa4
Message-ID: <CANiq72mUWhzwZhDpDTj7awy=WN4vcSKF+PKbbAA1YTMX-sW2Ew@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
To: Andreas Hindborg <a.hindborg@kernel.org>, David Gow <david@davidgow.net>
Cc: FUJITA Tomonori <tomo@flapping.org>, gary@garyguo.net, ojeda@kernel.org, 
	acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com, 
	lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, 
	tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com, 
	Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 11:37=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> I would prefer to just enable the tests as soon as kunit is enabled if
> that is OK.

Let me Cc David (and Yury) to see what he thinks -- the kernel
probably wants to have at least a Kconfig for each test rather than
having a default set that gets always enabled as soon as KUnit test, I
think the question is mostly about how "wide" to make those Kconfigs.

Cheers,
Miguel
