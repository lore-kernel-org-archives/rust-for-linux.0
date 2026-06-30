Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B87416CFC
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824542; cv=pass; b=WI1egAmKdVH8Tk9PXcymGzh12PjA1omYM3YVBlK0cLciNQSUqOOYTrCMD7r8L/FxbHw8txe8vxtY+XYp06TrcA88Xn0shc/JTRWHNfAXKeV4XWYiILyFLDST42OldMt0tgCEJ/76jxJIA7rEs14/WsEA/HyEXtWlDUqGJihLKHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824542; c=relaxed/simple;
	bh=zVGN+irJoRn6fLQWlrqbDrVdpoX5ulyKwx3V8NzpaKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CusFqiJLEsgeN4Y3YM0io/FTDvqip+q0zdO1oCJOWh/psDmtY3zdH4XgXuheV1TgUuzhILS/7RZfDC86n0RfKh1kwHm2qngpt5By/zL1pyzc58WB6SmMpwLqoQbQ3aGsD0a1wxFa+uDYuDqYqO05B/Ej5e6HCMI1LdZy9OjFo/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/shVtnE; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/shVtnE"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30ecc2e02e7so154769eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 06:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782824540; cv=none;
        d=google.com; s=arc-20260327;
        b=IvL+YQZ83MSrun1gZ9agx13sD2ve0tIc/YkkZkNvLlmLCAjLa+iql2WUJa8JFboSYq
         qwfaqR/9moEDkijSc+kPonChF9zP/SfGmyrDeAhzZc3z78MvYzSnDkYDRai8CyLEEirS
         1LOxMdZomJQyc7fL6Mg2/p2/+Xk1cQfpn8/z/uFn4KQlmF6iMoQAX8kEGxP25+S3DcXE
         7H45l/uBBNcpOXFNjb17oGLB31UDQN6hqYxlyncioh1iVP6COiGzgqwNsIrhtp2H7iWH
         G/a0fpeRUIR+hlM6wRETg8gBhp+ARspHeMVcxWn05dTM6rKSaKEMZM5LV73k0CXpSI4/
         B5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=32JdvvqJTtjWcr4BtrKwmZqPpf2cS3llz4s7uLQdovU=;
        fh=FT6LxWH+bkTBy2FBKa0sBEZvnWRE3oLBfUAr0L5B4gw=;
        b=NMNK9EAtBb9+Po/pq7S+5KTDEbHPlSMMvO9JvqaGzilV81Bsfo/Vzhpm7Y91g3uYS2
         wxUQtL1nkVeZuU5a61iAosknkYWNPRSqKI2D4eA7ablxT+W54OQJHRNjBpJlUJlgmNSq
         r4Y+NsTHP6VEHIj5jQXQlU4ErbyQk5RANZ6+J8ufgdbQqXjonJzO/iG08ME2oJdsKZ9D
         81Rh7ngMV7NvlfvNV6GZr8jYcXQEYET9gyoJQYyeIlfWDOx7Uwje7qpv22jHuSxFobG1
         PpJUtT+uqEevhmHxenyHVZdPCVH7dHcyx7eNe8RBOpsUL4SbOMWzw/aijjW2Mm+cGa7y
         C4Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782824540; x=1783429340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=32JdvvqJTtjWcr4BtrKwmZqPpf2cS3llz4s7uLQdovU=;
        b=W/shVtnEjxIbeiLPvQZbnxVOAB1dEYpDvCixFFIZJDBWOb4YeKK2YBLQSJvJzVitJL
         djy3i2wYpeQm8rHpOyhRnPY4N3PLr1/oEDzYV5LRc5SPi2EfG4v+SrOSA6ZBxiwBTtFl
         nOpmMb0+BOa1hpM3X+NFuTmBCxyureOfewIJp0/oyLy43E7glJkSgFLLFC2ds4c0kvAN
         ZodmwbAvora6LNjydB1rmz+skrYoTbeRNUyhx6R8TbO599/OsmAwFwEupvfsmkXw7XX0
         vSM8uNCTaJtk4CUwsnb84ayRMxMWujVsNSExdKrALitmXBXxX2k4RZqcajm1KRloqRHm
         3dBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824540; x=1783429340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32JdvvqJTtjWcr4BtrKwmZqPpf2cS3llz4s7uLQdovU=;
        b=kNa2njs9Ogv7BuN31VzC1JPtbMApE+TarIOJlnjuOS6RhuUzd7iMMrilzzpS0s5IQQ
         4jesMx++tXZ7EfYQfh+PqQ/ZuM9pNGv45SzgEA3kCDNzZZqivok+c0kBd48DUaRntCqv
         MxaFFvKrKuaWWZFqP3G4FSuhQonJBRHL4TdFi/7ARVY2kSAVMHdhrbwBaIA0Uc1d4vyY
         WRu4OO+HSx1f0ozdnFWCml6r/xlS0ZRnA5OKh3dsPXobwo3yrOmPH5GCA0Uhr1+Qujfh
         ONvvm1xKjrQ7lOcYe/w2qO57H92ygsxy8EzvGp1bUDRhFaxXQ3up2ZsQnNavZQcbi9YT
         vbfw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8L9V9zrZ0TDwQThRtJusclLOkhjynJSLFqgUef0j5sVtUfpwyOiZ0PDeO6xTa6ECWr2YwWM2sdNvVBDUM7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhAXq86ZmTODCQtRxkemWOPW5I7wPe7gFnsCKZ2TYGJkmmohRf
	3szmKgGnQrw1obGGVlMVpzNAWo/HEccfDI2g3Dnj3/E84OdD1LcamDM4OmkJIvGGvKk+hzD/wOd
	/b99/prUdYrXw5Jva4+lLkRsezKFBxP8=
X-Gm-Gg: AfdE7cl7tRtOqyCD0W8o143gguKWjMj4mGSpVFJZcWnqMF+MySbrgLFK6wrcB/AdWIv
	2iFb/22hgvPhfwtcElfFj75EEvkHF4yIjeOSz0hL7ft5QHUZNdw8KJ8gbSllX8h5Wvl0tj90YF2
	dKG84/E4YyfapIERhPJW/nPV/aLJ4Zr4sNo7cJclH1G6pGZP7O/07OiXsuHET/yGGgxlk2OuHTU
	j98MBiEjjHpf+ZEqUs2kF9JdSjyiG9wvyJVYvZczdynApjV62y1QmV4xwqijQMjWhekl1GmbdsI
	33lAh+u8FT+urY1bg+XZpH9WUgzaedVRzAFhHcPkBaSVfMw92nJUNqL971OdYASrTCiMYtL3eo8
	k9NRbIdtJsAXi
X-Received: by 2002:a05:7300:fd13:b0:30e:b3e5:cc43 with SMTP id
 5a478bee46e88-30ee13cd8b8mr1307107eec.4.1782824538764; Tue, 30 Jun 2026
 06:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-io_projection-v5-0-d0961471ae50@garyguo.net>
 <DJL2T5XDC53F.3C2QC5L1V2H6@kernel.org> <DJLLHI7FIYM0.2YB1QJ6TB8R6T@garyguo.net>
In-Reply-To: <DJLLHI7FIYM0.2YB1QJ6TB8R6T@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Jun 2026 15:02:06 +0200
X-Gm-Features: AVVi8CdlaW0HC3qcToqh7v3q0JT2Ai7s9vfzaVZXIxvGTDn0q6fiJzf_f2XS20c
Message-ID: <CANiq72==81FEfMxTnUCdrFBtj9fnCnhF6jXgx_eqE-VsLgW9Rw@mail.gmail.com>
Subject: Re: [PATCH v5 00/20] rust: I/O type generalization and projection
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Laura Nao <laura.nao@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 4:15=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Hmm, this looks like a false positive introduced in new version of rustdo=
c.
> I didn't get this with rustdoc 1.85, but do get it in latest rustc, howev=
er the
> generated link is correct despite the warning.
>
> This pattern is used by other code, I'm unsure why it doesn't trigger the=
re.
> Anyhow, the following diff seems to be able to work around the issue.

It seems to me that the issue is this line at the end:

  /// [`include/linux/iosys-map.h`](srctree/include/linux/iosys-map.h)

should have been:

  /// [`include/linux/iosys-map.h`]: srctree/include/linux/iosys-map.h

i.e. not a false positive.

Or do you mean something else?

Cheers,
Miguel
