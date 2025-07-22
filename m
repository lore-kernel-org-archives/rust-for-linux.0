Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC7C2E92B8
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 12:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753186377; cv=none; b=l1f+V6T+oaWBZJhGWUboUQ1YsMbvEoCSFQTyxD6rzHyZ44DGgFoLZExD3LtuIRHukV/5s1EBEtQONIxG04IrpZYoTAn/tCakxBtYWgLjbkFKiZ80gVJ7QO2VWUjgCFYFmbYwH4yZhZl3zYSReJIQ224/h27W9QHnaxdS1vSwd7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753186377; c=relaxed/simple;
	bh=6Ey6oC/8Ly+VAsm6Gvez7GvAnCzp/oTs2lHcA4rFBiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPxZK2zm4b808yQrwR6mR/c94PXYBVPgsg9+f+8vHOm1+SykaKTgiMG9kj5rlz2vIFOZsoQNB3D2a8CZIfIS9fApa7NhwUpt2xpY11DapUJR3YDFJHOD8ImVXxpxf86SojS6nrR+9gtLv2K8F2/cIP3Nm1W71TSaV1wnQKW2Wa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bE7SS3eN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bE7SS3eN"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234b440afa7so50355125ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753186375; x=1753791175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R5LbFOFKy8jmL+D4YdMhEQT2dM0QposoqUlcZkfGFIA=;
        b=bE7SS3eNpl6rqenXSwT+PgbV5ZZvo0RX7OW6KtS9MXsaxXJ8lSeIzUxiPhbADQ42AH
         BI5ROFft8y6PSD7tXwiaBJplDbGIF97aHdNs+z5y67cy6x14F/UB58GoE3UvXZHgwQRC
         scliWNSgszlkPexAcW7LJDNxQjQ4uI1tIJzpSLgMasWS/vkKiB6UP2K8jIAycZyZTaee
         HzAGsZHhlwE/8AOOrsGP0MCvmtJnM5BVyUeHDQtDPfW7lmGtzJeeUJ5kLeFQMHVLl2D0
         bp2M+AgHWE0fEtzw9ATB3mkW23sMD4bUM03jT0bHs3MaqOzd8EDELyOS8LSfMDnJcP62
         1E+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186375; x=1753791175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5LbFOFKy8jmL+D4YdMhEQT2dM0QposoqUlcZkfGFIA=;
        b=f20iLNZMvkM2RUxZ15oClYApY6je0FUYiIbP8+Q/hZG0JzkHer+pls8U0cKK7RyFlv
         ANmNved5ZiZgT9OIoiPeDYNccwywoFvz/U6Qk8tYEd8vbbqnwY6XB3GtSeU3DIutBJIV
         OCx+EToOhV9TMTSuJzploGg1Ml1y95SnWwou4dWksWVPbtiBktExn1wYkzzQuEyUUqdM
         yusFUh7H+Wv/3ZLzUHV/DjW7xX7OsX5/NBKYOePoxShix7sgz9RqxNb9bqBln67ZizqY
         UiQjFhxhz4R1vJ1ov9sx2dduKhwjtHndXo+AvyPFGmjWdbxdWykUIdoLYSLTo6dZs2ot
         Rf0w==
X-Forwarded-Encrypted: i=1; AJvYcCXC6hyZNg24rdd7LNIdjDlMLQ6kT2eLaGgs46WtNgwzyF2x7qlrAhnokRg/a+LPbUNjSm3d7HoeULloMgXbtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPYx4lgYp+NthF04WwX8nsJK4n2Mg0EPceQEGkJeIDJcritq7R
	l/JID4AYaM+8srrQInhpNYz9H1Elq37t0lvgJGaazdc2AxmtW7wkz5Kj
X-Gm-Gg: ASbGnct23+IWrqza3wT2VlPNsHT2otsqkQjc1s6zkbW4nhVWb2A+AcNB4GD5DXiBYLY
	kWUpMvWSopVz8s02GKR8YsPT5L5IuBIKkPiorx9QE9UNY8kqYaIdce2whCNuCHun+rel2kFWDlb
	TUNoLFf14heNSRVrY7L/ws8QCtg4ViEJ3WtPflDcLzbXnyXO+GNIvBB+vpJ2ZFGHPhqS4cgFlnU
	lXJnHpc6s8eGugLsJcynJyttbgI3E7pIhmwUpT0+udCjZgGgZ004dsNcp+taeBsTMA5gCXw1Tlx
	sQZexOmVbAIE4gEdav7+LyeMh6dAzgsLF88+LmYFBVyCkt/3m7zPzT2KZVIo1Ri881lSkaK7yJy
	MVV7McPgXv6rIkpwWu8I=
X-Google-Smtp-Source: AGHT+IEJge1qD0SkW/ZXSH6Ejab7xajibrjASlPI2OoDoJ8spaNoSn9OGn8EX732viRbNzrjii6byg==
X-Received: by 2002:a17:902:cecc:b0:234:d292:be7a with SMTP id d9443c01a7336-23e3028127bmr313860135ad.1.1753186375117;
        Tue, 22 Jul 2025 05:12:55 -0700 (PDT)
Received: from fedora ([2405:201:5501:4085:eece:e0ff:6b68:de2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6f0da6sm74843235ad.214.2025.07.22.05.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:12:54 -0700 (PDT)
Date: Tue, 22 Jul 2025 17:43:16 +0530
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] rust: kernel: introduce `unsafe_precondition_assert!`
 macro
Message-ID: <aH-AXKaEqcN2Wuzg@fedora>
References: <20250716045957.39732-1-ritvikfoss@gmail.com>
 <CANiq72=C=VHGXFvGuSY7rnNOvW-2yAA_g5yQamVN-mG9btwMkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=C=VHGXFvGuSY7rnNOvW-2yAA_g5yQamVN-mG9btwMkg@mail.gmail.com>

Just to be clear for v2,
the caller should be able to call this way?

```
	// Allowed
    unsafe_precondition_assert!(condition, "message");
    unsafe_precondition_assert!(condition, "formatted message: {} {} {}", arg1, arg2, argn);

	// Not allowed?
    unsafe_precondition_assert!(condition)
```

When the assertion fails, this will be the output:

```
	precondition(s) violated: message passed by caller
```
