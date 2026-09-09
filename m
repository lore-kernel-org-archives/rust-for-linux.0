Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C77054DAD5
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 12:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957651; cv=pass; b=BU02PEH6ID1uBH5RzRd7xaNwewaVDpSyR7eRP76B2xqgCNNeCcg2ywovCHy63t+shNVOz1TjYB9hJgSeGN4YOowUGTc2PYwLG7irbE66Z4zOszN4mAL4uyE85QMGUAOuuDuFwQvJmKL0EwaFLFSgfe4TgDdRy15n8cLEcMinWOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957651; c=relaxed/simple;
	bh=CvYtV/SZ3/N68blqG6IXcgd9EYI6RO/7AwXt0HZiXpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvzfAe4Kh82xius5jW9r/qcAdbNZ9h+4oll5CEQw0yJM0wTHGyGPT/heM/cCEnVXhWslnbjlEjfdB5+h6qE6arjJhzI5dh2vVRqfEQb4Mxqz5wC44UBeRHunQevIfp8s64QvB+UBFTb1mXoYH12YYB/dHmuY2azQ75W1SDk8D0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mX13pZHt; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mX13pZHt"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc42c773d05so142043a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Sep 2026 05:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788957648; cv=none;
        d=google.com; s=arc-20260327;
        b=jKqyoqw6BsENFcuBXNunLFWjejAIdmrrhtz6GXvL+ScgZARu2Nfm0mWmj1ABsCQjY7
         RireObRtRYfQJ6Mu+5igxR4Dzd9F/+mEYm+zo/ZrbXnRzPt/N361gV3VeQO4jR5xqKq3
         i4Ro9o0YZ0Gr0MhMZjIYyyO//0olFRigOYhrE26NUNwTbu+D1fpQxucGr7PIxrGOs+ce
         RwoAh6WLPqgG6scqpZqU6SunCre7KunjuqZ9xmhU8BfGsDaeJxNoqjG5HvWAAZhBI8St
         KPi5VT4DJjaruWCkTCGWSjnyg4yXr3uSgEQN8l2h4/kSVt/ZfWl/NFvcOsaFesnV9EdU
         kCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CvYtV/SZ3/N68blqG6IXcgd9EYI6RO/7AwXt0HZiXpI=;
        fh=50Oiq9R0sCjPDKO7EZ+fDeCGGA2bdg0YB9aT3ec5Bn0=;
        b=OVeInxSAT3lDhfYcIG5oV5RiUSLqx+88T0MKDj7R5Mh+Z7ZvFzryCMwkS3psb2I/fZ
         K4ejnp3keat6N5WK50I6C0ovb9NWtw+lZbHO0uOMgeKeYTPvkTBqFTNcbBBJv1CWybyI
         TOVvvK3OXUpsNxSzd6Yf7qqeX9Q+JcZ9SKJQJt1pv+Xh6UAgd/t+rZ/x4HtktfDZIpjy
         yUvt/buVUtcKZfre/Hd75Vp96ldus/OzstS9Ra+FnUNrXWnvyREsk4GAYrU1jkMXV4nM
         d49t8Eo88ONw/QAiJK3CW88nkURytUlpfGy4JgJ5uCQFnji0qqFJx6onOsDu4tMOTtJd
         WAhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788957648; x=1789562448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CvYtV/SZ3/N68blqG6IXcgd9EYI6RO/7AwXt0HZiXpI=;
        b=mX13pZHt0XOH5UXYsdmBK/FiAX6R2VSrGayXfKqNrNgUi4zNBLJYe9NN+L+zHR92KA
         kZ6WbbvrFPZ/7FbDr3lFOBc6lqHJAk/gC4JvY+dyY4pdlNYV1WzzyMcGCzbco9hijbcv
         Le2uVWct8KMOT53E0r+a5MYT0GEBv+kyR2XtdQQAGETl5bm5hOITk6FcqK4dD2zaM+6d
         TBwagmjI+Arr17dviVbgjALu0aVP/bAawnRlnlCTMYNwP95uzVhsAwkjSjf/G3vFsOYl
         NNlz3WJObT7cjQDTDCvGcvLN1A8QnYh/lsy0hm24hlLqkhPCm1hnhLGLxOSGxvm8b5st
         kKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957648; x=1789562448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CvYtV/SZ3/N68blqG6IXcgd9EYI6RO/7AwXt0HZiXpI=;
        b=RH4y5PWF//fjhDyps2Csd8xSNtHG8imz9DCLhoYTMOluMZOwvkPHRc0mIKKp7i6Fkh
         /1udA8IvrUHTouqvMhvo8q0HRAWOtR3i9zhPx54qX5NZnNAugm6nsE5zL15bclJECcEk
         oUl7viL8oM2jvDNtl6ZNr+1gZd8k/8nYWxdRPO+JqSRaoqo6sU3ellYi99BpsVI3Bwyy
         1tR69xq45igbYPXRU6z4b4EMSsWZwXTg1Fj4Wq9PMHQCElMHU1EMP1tjEA9nVt3iEe58
         iAwqhGcfnQX32IcHna3IGydJUfw+M/0VuachFOVxNf3tRNnB/Nb4gpDFCbQFtlS0P7tk
         qljw==
X-Forwarded-Encrypted: i=1; AKwUvByrS+Fh4ULRAI59AyY1Ik1Dfkh/64vu+Ltd5FMTcAWE2gdL9PdkRcSlFQh6D1g3zW2v6NLF3s3T+kNJVnKNbQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lujg5+kxI4hbeza4sw0l+0LJOEwnbTIzVy3xZXo7NsjRWEA+4n
	zTNtnM1ObQUiWmUjYjVGQRfg/yf98a/oCM4dgtLKLq0LBPyDeGf35LwMtyx/nUgBFg0413uqDaO
	z1+PkiLonXv5ImQj/lBexehCjy2soSLA=
X-Gm-Gg: AYBFou02onT4y/gtCtvD/OwNxsK4iNZEfJN/JVcWXv53rJ6+7+9vxWsm+FAnz3BGwHa
	NRwgTcSGy0NLU9VdUbWhOBipGyKpwrB8xu2cddwlELQ5l196ZSXBwURbXfsPrZzbhiYt8j+zbe2
	eHJds4yAnL7rTABlcp7dk40aqo0IlAlvbjMo3kKpn+euHDKXtbE7thrsaw3SIqz+NGSvmVwUf3y
	eKTD5qYE2sxivm1529gmOkBTFhRQkVWL+n6qqK33uipnDqxndyIbBSRCDDvNMngkW85yz/yuWtI
	rpJ3Gcm/1sp1THzno9jnUKN0o6WjXRssTj3UeI/WBd8vc/C6sthCGLRQ1t+7hzsz4k5sl3e5hzQ
	YGQ5+7BxkzIrj/mm2gWzlR1TQTAz2l9Mv04UfqZcG5YGOZHyrqcBaqWMmNhxdMFMWtfdaP70/Ka
	mA8Yac30byTWP68+YClt3NxEMLvM1YsMugGFsoPundyfscqdxe9EybyGSy18crwg==
X-Received: by 2002:a17:90b:3843:b0:390:3936:8760 with SMTP id
 98e67ed59e1d1-39b3d3db82emr25928663a91.0.1788957647620; Wed, 09 Sep 2026
 05:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909033246.2779303-1-georgeandrout13@gmail.com>
 <2026090955-lustfully-fanning-33f9@gregkh> <DLAR1ECFC1WO.8NOBWPL6WM8E@nvidia.com>
In-Reply-To: <DLAR1ECFC1WO.8NOBWPL6WM8E@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Sep 2026 14:40:34 +0200
X-Gm-Features: AcwNN1XhXoN5_IFb34ArOzJVpKsqjlwNs9WCrPY6BaOeCuMJu7VIDDuOhdGDBiY
Message-ID: <CANiq72mCdDWsWD_O7LJ0i6rM-0C8p-pi-Wqvn4hTWv2Py5DMRg@mail.gmail.com>
Subject: Re: [PATCH] rust: auxiliary: validate DeviceId name length
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Georgios Androutsopoulos <georgeandrout13@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <iweiny@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 1:29=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Note that this is not a runtime panic, this method is only ever called
> in const context by the `auxiliary_device_table!` macro, so a panic here
> translates to a build error.

Yeah, this is one instance where `#[const_eval_only]` (or
`#[consteval]` or ...) will make it clearer.

Cheers,
Miguel
