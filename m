Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA60923C8DE
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744803845; cv=none; b=Cs/FcBiuDax+Zii2GWP16aqIZQZdl21f3zFN0ZMR+YkLhLKqHHH8f0zuWe1msYE7YWMK7SBF4eXrqp9zoFa9gVbfGE8E8ibs5lorFknKsynB68pRBAeSIWXdpQ6PD/Ry/R/VlqHujoc1TkFjAIMA72dQaKCKPSk1tDkmDXoC/tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744803845; c=relaxed/simple;
	bh=nzizKzo8Lxv6uOeq/gTFpe0rr/Kc7xMWsK4wkv91jbQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Uk+SXtzHDcAEsZOwqrM66jxCItTtwqXNXC3HJUyDB2+58sKRsRojvGBz7tm+gsLCoTUE+YY/39f4CQ5q4pLerYW+mWgSuL+J9KfDrzRO0Jmp0DRapv9IJkn9BLc8CrgtYzNzSPvT6WRu47RH+mUnEJkJa3WYM/uB6yI9l7pHniY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2GbwSC+O; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2GbwSC+O"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39135d31ca4so365546f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744803842; x=1745408642; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IF1VZRpImns2dmxjUkl45LwCr5OCxkT/CnkwYELAXFU=;
        b=2GbwSC+O16ESoxOaJH6kp1bhKEsfD6AcpCa1MyAI7vc1b5/lsV1ZDd7/mg985q6oW4
         fJfMIu9wX3jCasVUicY769uo8whKZdJBvRrcWN1h8oCYL19/e1OWwfyFJp9ce7GsdXvg
         dRoeBOPa57uvhLTLpxAKWO4M/00vxFW+vvUtOWlE754ZuJHHm1vJH+FhWafHlVhszhcj
         iyTuBohWJ4bEiIONbAxMQt9YXTc9kCxXJMAe9tOLzCDIQ7ez2APOqdAfJETJcABEg9gH
         p8VrdXrXN3HAvy65cT7XB5J6G5QfUZQNdb+hTVjM7/cH3BaQ7hNG6gItO77plTQGsvye
         BcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744803842; x=1745408642;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IF1VZRpImns2dmxjUkl45LwCr5OCxkT/CnkwYELAXFU=;
        b=ezkmNdwQSHS+IZZg/zD42g8XBb436PPmPYPL4VTQMnbnZrvk0CVWxO/dFwN/pqwjVO
         N5GMY7044weZhahYtfQypnLYpRKKMNUl0Qfo/hN/7d5xKHPkQ1bcBTUZVzDELKvZAbYK
         3KqLisGCXhSy/1rQd05lqGF11aoleODA23Chp2Id/l7ZsADIebfITh4WQgRa3R/M5omU
         DTgFGBgKVnktO+xOlOH4NZ7N50dl1xeSbEUrDx6y92XDGbxJhkh5n5neCvslmwoTCEIA
         3O03gu34K13c7rh9J/U94oGgyYoGA9U2BjapnJ8zATbp2sci7DL9TYwp1fVOpSsDaeME
         gZCA==
X-Forwarded-Encrypted: i=1; AJvYcCVJWm2qKcpGjOJotr1uV6YL296ELvgqXWpLZcHzApSNWqvu5T3rzqUJH0vCs7vOB40LupHrd5a6jtV4F7kvRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu00ugsKjROiKdxOWgkyD+rBxJjoSGfybhAckywv7IG2tETHKX
	VIFsGOlA8Pl7Qzf10upL6+rsELZ3Ka8Ykxf/9qcMFhuaqspVk++SPHpu6umSsxNo33i2ap+KK2v
	P9r7YcEoXFtIy0Q==
X-Google-Smtp-Source: AGHT+IGALYmOGR2cfumjQH5um+KLKgozzVHSRwGqMvv0DTT4qMGdsYU4qv0QGpbxElwdAz9dDJW4vlVIoSCEgsg=
X-Received: from wmcn28.prod.google.com ([2002:a05:600c:c0dc:b0:43c:fcfd:1ce5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5986:0:b0:39b:fa24:9523 with SMTP id ffacd0b85a97d-39ee5e9afedmr1224016f8f.7.1744803842192;
 Wed, 16 Apr 2025 04:44:02 -0700 (PDT)
Date: Wed, 16 Apr 2025 11:44:00 +0000
In-Reply-To: <20250416112454.2503872-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416112454.2503872-1-ojeda@kernel.org>
Message-ID: <Z_-YAAzQVT8g4IY0@google.com>
Subject: Re: [PATCH] docs: rust: explain that `///` vs. `//` applies to
 private items too
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 16, 2025 at 01:24:54PM +0200, Miguel Ojeda wrote:
> Sometimes kernel developers use `//` for documenting private items,
> since those do not get rendered at the moment.
> 
> That is reasonable, but the intention behind `///` (and `//!`) vs. `//`
> is to convey the distinction between documentation and other kinds of
> comments, such as implementation details or TODOs.
> 
> It also increases consistency with the public items and thus e.g. allows
> to change visibility of an item with less changed involved.
> 
> It is not just useful for human readers, but also tooling. For instance,
> we may want to eventually generate documentation for private items
> (perhaps as a toggle in the HTML UI). On top of that, `rustdoc` lints
> as usual for those, too, so we may want to do it even if we do not use
> the result.
> 
> Thus document this explicitly.
> 
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72n_C7exSOMe5yf-7jKKnhSCv+a9QcD=OE2B_Q2UFBL3Xg@mail.gmail.com/
> Link: https://github.com/Rust-for-Linux/linux/issues/1157
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
