Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C24F20AF87
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 17:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747674640; cv=none; b=k/2XE13eH4jy0Tn24mlJ5a8YURgWVDHBQP9SLNrzSboqFkYWT+KOidmYmyHQhbSCitLPQwJzrSE+zWU4FwFnOVzGU195RAD6PHNHopi55mAOP1FeGVJ3Q2gKZSzJFhdgLRZnfJSa2mS4sXuT6sK77cN+Pr4/FVR+Z9IPc/q5bV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747674640; c=relaxed/simple;
	bh=P8N2y65o4MO0NBQKOl6J3DHg82v4Gb5hE/6uXupkNSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ug0j/BpK8xWh6Djv61S9yw+57V4sIYOdU42qrxtAWXg8v5XzrtObItlWB7VNdM87EkkApIHHrjyt58syMtRT7Y3coeaQFC69iLj2Z5GSGuFboaSJ5pgfy8kZamTUfkEWHCdxPVle1yfBTaAOy+7HYrMEe1Rn5miTA85mVidanf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKckkw2V; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKckkw2V"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b26e6c551f8so347291a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 10:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747674638; x=1748279438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmUcaKS1V6l+6g7NxIOIxnfg2hTZMWJY0U/K5nkakgY=;
        b=bKckkw2VHp5WYjYvEX3C+pYBHBBNG9200xvBbDbcgWgK8oLXPRrPT5Gvt/qxZcAZQs
         mEm3ixS0toRbPS62Qc1+k4Oo1YtWho0auf53qkA9HJNYkcD59LpKFN9w0r0daO+3dK7a
         HqWGKz+nh/E1uLuzMoF+ue9Ow8HO3k+vxhX9RWVIbWC4mtS0bCdgz4EPNgMTFTNow+Fj
         GUGlEl3zURadfscj/08RYt0+d1JqY0RPnddzpa9VpOYzk+oAo53B6fbJPLoERQN+O/NH
         nKYi9wohf/kUzB5rBiAbst019NeDrQrWMaLoEOg2nukd9K0PC0Z4Yhg1OMGav+G+1+uI
         hvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747674638; x=1748279438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmUcaKS1V6l+6g7NxIOIxnfg2hTZMWJY0U/K5nkakgY=;
        b=gtNCIp25SSsM4OKecW5AaFQYq9Q2ra2bwwlxuPDxUPqjTfb8HodEHuGhZp++Grc9fR
         yMOfyOHq1RzLYNa/G94s2tMq2Y8rIyUVJzX5yp/nDl3QwmBB4c1I3QLGG6NqXN/Bspwq
         +rBUAWi3B4E1JSlC7+3KFYXvXqGgS0BZBYFLsByZ9HpBmF+v1++tEg4+3mA43tKSl19V
         BlrTMgbg67p6NoEBthvmGk/aFXzikXgS5SyoO4fnnhS6MeKC/VXFY6t3Dqlw/QxTCsCB
         tf7g5To9T7j0x/dXGMYOhnD/9I0hDW0zxzZNVlE9R6TfSzAlAgdvPfhu5C3jFD3YZ11J
         gj5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqGeaSCeGrSBXtIBCm7s77Omn+zLVtIjFuhdvyl2iBgiSCjhgrCCSjEFc3s+grzWg6kvTNKAWwSSnTfk0naw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm1fI+P3Fe1ONlRgbH0inymSwvkn/jyK04e52gUcvQTfpDtF9G
	CnxyiyBbTiJrjGNyzzvCt/5mjKKWeVNRtp7dLjCLYPKYUgvQBg7kbWZqZe0zv3U56Ic5jFVPlZ1
	MhyryjxLeHO4dUIICh66L+83g0e8WbHo=
X-Gm-Gg: ASbGncuxtK7lcKmDyXn2vBHXuIx8yOY+bjpzZ5qYd1KK7Gzf/Rpl4CiXg7ou2sDZqws
	Fn0bAEVR/GaAPlBtO+XMnDEzGxwjEzy62iiueBOF4RTswIhP6c7JerEx9O2JZzcNc4Ih1FPbk1P
	r/fc17IdX19qgYp/zZXhg2w4x5mtCWNNX/
X-Google-Smtp-Source: AGHT+IEOI34QtkibIgvsVcb9KcEBhX3YOR2s96qRnM1r4GryJWtbx6ZUaSoi1HO8eYNwc37nm8vtS97HlyjrCxsomoQ=
X-Received: by 2002:a17:902:cf07:b0:220:e1e6:446e with SMTP id
 d9443c01a7336-231d437f0damr69159875ad.1.1747674638592; Mon, 19 May 2025
 10:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516122349.1944895-1-igor.korotin@yahoo.com> <20250519164615.3310844-1-igor.korotin.linux@gmail.com>
In-Reply-To: <20250519164615.3310844-1-igor.korotin.linux@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 May 2025 19:10:26 +0200
X-Gm-Features: AX0GCFuEp7vsTSfNNmeD-pRiPPUqa0fjnoK2amX-_T8XnejdgzOFamvwu5SYbRE
Message-ID: <CANiq72kis5ykiO8kNAB-uu84+cQ1Doip=An4B+Q2W+Zg+Y0tww@mail.gmail.com>
Subject: Re: [PATCH v5] rust: macros: Fix macro referencing core and kernel crates
To: igor.korotin.linux@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 6:49=E2=80=AFPM <igor.korotin.linux@gmail.com> wrot=
e:
>
> From: Igor Korotin <igor.korotin.linux@gmail.com>
>
> Fix macros and auto-generated code to use absolute paths, `::core::...`
> and `::kernel::...`, for core and kernel references. This prevents issues
> where user-defined modules named `core` or `kernel` could be picked up
> instead of the `core` or `kernel` crates.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1150
> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>

Oh, we crossed emails... :)

Couple notes (no need for v6 -- I can fix locally when applying if you pref=
er):

  - Normally you would keep the Reviewed-by from the previous version
if there are no big changes -- in this one Benno agreed to drop the
`static_assert!` change I mentioned, so the Reviewed-by should still
apply without risk.

  - The email header (From) lacks the name, so Git had to add the
From: ... at the top. I would suggest checking the email setup so that
the email goes with the full name too.

  - I normally suggest sending new versions as a new thread -- it is
easier to read in certain clients and in Lore.

Thanks!

Cheers,
Miguel
