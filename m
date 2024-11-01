Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A9E1CB512
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Nov 2024 17:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730481080; cv=none; b=L6kjq6BOM4szF3Gfovjpe6JC27ZXqkyv27L+lKhlidyrmAsG15f7xLAR9nxZVfz4W3Pmhrz//d9gYABueIedyxeISnzh1q2aJItlDQq+Cvd/3hT/GDhSMWALnMDKqkEya/v3J0kIMHDDTtdBJ6djLPANwmTSGIuodmEUP7nFet8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730481080; c=relaxed/simple;
	bh=lDcrhvdKzxICp2em7eOQ2LPUn90y8jpF57EZ1rpkswU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t2ANKUey5nFttpr9RqrprwafWqzNFk7ZRvhTLu31MDmlhKqr/YkQ7TZY8MlK9kb8h37LUr/Qh8YYeMtMkloMJvZO/QQa5pive0kDGM+pHJpSZo5ekb+YjFqdJlvRDQvhrqFugo0a8o0LZPksjp6+PE+3drQj7j8gfLNZm7cQokg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=d2fziDfr; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="d2fziDfr"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7180e07185bso877231a34.3
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Nov 2024 10:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1730481076; x=1731085876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsDgBg/O7EWgquGbLeqs0lCpMz4K8vMjHSFQlw3dpv0=;
        b=d2fziDfrsVBwLlywZPnqnZzcyfsmSoonkiDzG7DdcQPVjKcR9RX9tatdpCVhR8iSD3
         75dEaX0OwPuTytIbsCcnxTJ2DpUB1LJJUgUHe44K8kHO3EID+ZC3zSmb2JB0ndFxTm41
         MuVYExRB63B5w2P5AKaqixApAIxV47e1sFDp7x8KxaRQiaVIsIzXmoHvuNP4UyN1SMWs
         MM5bpSgewBfej8qjAO8fFqk8D9ZHq6gC97W7gFvScTsd32y8qrf1KHOiY5rE4VeGx/wB
         A7USPWw3I2P61ntqiyxZUawmGWZJl8GFwCx+rtdMhgfW+K3S8vorWkOXBGWjBhEwr2Pt
         dE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730481076; x=1731085876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsDgBg/O7EWgquGbLeqs0lCpMz4K8vMjHSFQlw3dpv0=;
        b=ivCsLM6V2PcB3ddjLfyckNOcup8y0pej5LMOCamjQfPINd2ZXRGDsZER9DQmMl34aa
         aNPDgpzn62Cv9gvXb7q2/qlaPiQHIKWbvHVlt/YFM1x14BbwonFgY935C59bQbtDAu0Y
         nn6b6GwC1z0fZ7V0O3fPajV7v/2n1lDZGTwjghmX3ChjI/EAcyx6rw9XJrUcZ/WB9kyW
         eG3Wps4VVoDZs7NZIKAu0zf8N/wRmK3/MufEmL+iiXQFKBFVHot7kZt1420KPnXqwmiN
         ds/V9/H4NHWpG7SWWBsshdXtrqSIqK6ZjwAUU7U65KlonpXHTdwbEgDkfTXQmZ2ytqBo
         uyow==
X-Forwarded-Encrypted: i=1; AJvYcCWzaqjyp3rpZ01RKWeCKfCx+3QTYI2+l5v7XFJdIh/V2P/b/3WqWxxQHMjr6dgOOh0HON/W8rWEZeRR6buAnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaxX1MKX2DrfGg0qKkfZKnT0KaW+/n/k6FuzKaPThreyNQGtHB
	zoGEJX06sD3AqDPPT1bHY1L+nLy9meIk2iKBmUoMIIWjrKk/khDh09a4tuBqCJcIVzdreYqSJWH
	41VBX/YWXXOM3UR7kqx6nh5zNhHT6uasaUPKc
X-Google-Smtp-Source: AGHT+IGE5XTIwiJsnCaOmbPdMrAHJsBW92DiCSlqSt4CdLLL2gNPk/w7OtlscWd0iZ98iATDQMkey/2O1dmRyfwwGwA=
X-Received: by 2002:a05:6358:80a7:b0:1b5:a139:4d92 with SMTP id
 e5c5f4694b2df-1c3f9da1a69mr1362649555d.3.1730481076126; Fri, 01 Nov 2024
 10:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYv_Y2tzs+uYhMGtfUK9dSYV2mFr6WyKEzJazDsdk9o5zw@mail.gmail.com>
 <20241101095620.2526421-1-aliceryhl@google.com> <CAHC9VhS5wLQeF4LX67UgUYVG3oViA7CmSZS_kugH+M5J0XS2Vg@mail.gmail.com>
 <CANiq72kcvpEqpwFTNFmxfJsfBMeBNiDrrvFBf_iS7+ozaECJzw@mail.gmail.com>
In-Reply-To: <CANiq72kcvpEqpwFTNFmxfJsfBMeBNiDrrvFBf_iS7+ozaECJzw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 1 Nov 2024 13:11:05 -0400
Message-ID: <CAHC9VhTQMo11s7mWg=zzDusJompOp01uJat-q9HjQCoEWzHRRQ@mail.gmail.com>
Subject: Re: [PATCH] rust: lsm: replace context+len with lsm_context
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, naresh.kamboju@linaro.org, casey@schaufler-ca.com, 
	anders.roxell@linaro.org, arnd@arndb.de, brauner@kernel.org, 
	dan.carpenter@linaro.org, kees@kernel.org, linux-kernel@vger.kernel.org, 
	lkft-triage@lists.linaro.org, ojeda@kernel.org, regressions@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-security-module@vger.kernel.org, 
	lkft@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 1:04=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Fri, Nov 1, 2024 at 5:56=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> >
> > Thanks Alice.  Would you like me to pull this in via the LSM tree with
> > the associated LSM changes, or would you prefer to do this some other
> > way?
> >
> > I'm going to merge this into lsm/dev for now so that we fix the issue
> > in linux-next, but I'm happy to drop it or do something else, let me
> > know.
>
> Christian has the VFS side, and both are needed for this -- do you
> mean you will cross-merge vfs' branch too?

I think our last emails crossed paths.  I'm not going to merge this
via the LSM tree as we don't have the Rust security.c helpers.
Ideally it would have been better to have the Rust LSM/security
helpers in the LSM tree for reasons like this, but it looks like it's
too late for that now.

> By the way, merging both vfs.rust.file and lsm/dev I confirm this builds =
fine:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks for the build test!

--=20
paul-moore.com
