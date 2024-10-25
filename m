Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEB118BC1C
	for <rust-for-linux@vger.kernel.org>; Fri, 25 Oct 2024 04:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729830556; cv=none; b=PLPCnUR+kCy2BuiN+w8i8tOdJkxFwera1aI/tfmZ5cKy4JQdX9yG5Gczwp8mS0/rAs2jYZZu0e6ySwRIbdxGqcAKYhMJxiaQZCMC82HhPtp6MXh1UH5hZ5A9MosQH1elBIQzw9kbLve8qqeVFn8aVP6sCbs7DmEM4+XDFag9NTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729830556; c=relaxed/simple;
	bh=EWCK8syvlG430LCfer51vMNGSWA+i5Z13fpF3yXP7Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVwYl9p/xNyQ/T7DoQpl4Q0luJavddY/EUvhTo6XBxwX5c0U3e6sJl1XnPwCN8WtT0Q28NuLQO67SYoZHgOpf/IWFgvzNBd+hNxInei9U/CWYbk1fAsVB2/g8WtUR/FMk+m8FPD4/9/qWN2EHQwuYNe8qC8+MCk8useytZyMzAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=CMmcVlZP; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="CMmcVlZP"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e38fc62b9fso15779637b3.2
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Oct 2024 21:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1729830553; x=1730435353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWCK8syvlG430LCfer51vMNGSWA+i5Z13fpF3yXP7Hg=;
        b=CMmcVlZPoAWmezduIuZGWyt/a7o9ZFPeE3mLACnXT9yfNlBUqSU143ypr3OXRO8Nco
         o5egG9DX8uVvqpdie+Sa53oN/VRC5ezxAx66u4LI5kHlz6BN2rfwYRXDV6ZCv5LvqtaI
         GxRw7OYVSu+BaiKqaXu3026KcGHmxqg/uZBaD36YFaqzUM5pyyOLEVuoJTFqzChMEwTy
         C6g9AOTkeZ+xzo8SMTJ1oxmXbUOIiZWC1rQw+A6FfUwAyyLl8Gk7lFQ5L6NvS4uN9fLJ
         m96y/CN/Br6ezL7/T+5KmcpgXAABNWVpbdUqczgoQX2nmgd3zXgmJklqq5il/bS6PVd0
         SkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729830553; x=1730435353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWCK8syvlG430LCfer51vMNGSWA+i5Z13fpF3yXP7Hg=;
        b=Z4Y/3b6Q25m0KZdi3gTCSROTeQk6wfPI6xCOElTeXTeXf9GomHcK9QdaHYVu1vcXp2
         H1GHYeUZzbDQZRLY93PgiRqv6EWxrQAyiDxy1SLXj43BPymZyZVpwZR9AnAS2PDymTUb
         UAXtFCuU31f9RscKEMIDUMzm+4iSimQM7HUSPHdQhj0w93AkMkrp3m2aE7r6CGbbOmbU
         WF0ZakoIEeBrSgKNVNr+j+mqNvpU3/IdFmPaWFwB8H4XPIyNB5pL1dWNu8iod06tFj8y
         0q7L/2ttJOPbQOb4KdQWiLc5JabvUEGIf4IDqPXVTkw8CBzpZkLeh+ocNMxR/QSEcIBq
         1M3w==
X-Forwarded-Encrypted: i=1; AJvYcCXPmUImmpYLR85ob74DG9OF+ekGKdbxrr/rmuO/lkJOHBHeHCJFKrl6gdjDG9iZ1uhuVa26B9PF05t0mMIxRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlMQT579+dT2kX2cPHG1vPa5/3rSvPg86kSZhtRsRVJwEhuQse
	hYpau9R2n6l1L6+bl8y9j1oaAyPxvNovx6OsdNw0He7pAXUF8KZmYbMu/2TSqQCT6tQeJ0Mqwvx
	adw52VUfiYjBmjWcVnv4FT0hwBnkotZCMYmu2Sw==
X-Google-Smtp-Source: AGHT+IFxXvvTdE3yugP3KWorwEDSHTOOfHgNN/Z+duUWd0Akjtp00/GgCjbXkozJntXhXwb5dgIWMV2hMm2N1FcFclI=
X-Received: by 2002:a05:690c:6687:b0:6b1:1476:d3c5 with SMTP id
 00721157ae682-6e7f0e04bbcmr104496997b3.12.1729830552972; Thu, 24 Oct 2024
 21:29:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025033118.44452-1-fujita.tomonori@gmail.com> <20241025033118.44452-2-fujita.tomonori@gmail.com>
In-Reply-To: <20241025033118.44452-2-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 24 Oct 2024 23:29:02 -0500
Message-ID: <CALNs47typNN-Zp=Lf44DUkS8vUQme08zt_qPtxO3mngmfrnnFA@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] rust: time: Add PartialEq/Eq/PartialOrd/Ord trait
 to Ktime
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: anna-maria@linutronix.de, frederic@kernel.org, tglx@linutronix.de, 
	jstultz@google.com, sboyd@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	hkallweit1@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 10:34=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add PartialEq/Eq/PartialOrd/Ord trait to Ktime so two Ktime instances
> can be compared to determine whether a timeout is met or not.
>
> Use the derive implements; we directly touch C's ktime_t rather than
> using the C's accessors because more efficient and we already do in

"because more efficient" -> "because it is more efficient"

> the existing code (Ktime::sub).
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
