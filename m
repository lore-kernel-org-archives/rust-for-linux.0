Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1212A26A0E7
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Sep 2025 11:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759233499; cv=none; b=Acn5eb4hLBspWKRD5BY8VTMpCADxZRkhsD8IOVhBUTLC75uGW+GT+ztKH2ujKCunsRSilMfCbhiWpb2j5dHv22BseGRF1pH4z3ACGl2FshbinW+RlyqApisfY/hSozJoi8O1yUHf0fblrFXuht4G1f9f1qTJKCU6qDiaCjALPQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759233499; c=relaxed/simple;
	bh=VcwjoiI7Z+OQfUBE/J+XJHgAGKhZ1AOP0RhfLRLtwcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KBMuqfww/y2Ii6v2hAanJWcr0rAymiYCo+Nn2CJYPZoWj8ZWwxDCYK0Vy0NNRjvXB5fz2ILvC5eACUjpLyIouKhq7r3tKuNXJnmvqm6p69OgEqGydTmm1fzmOyT9emlqXCdKLDRzlqNbV1Tye5y57YIcuaw2hdF5OO65fGQM0CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVMjpB5P; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVMjpB5P"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-269ba651d06so11515105ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Sep 2025 04:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759233497; x=1759838297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcwjoiI7Z+OQfUBE/J+XJHgAGKhZ1AOP0RhfLRLtwcY=;
        b=BVMjpB5PA38Gi3aw1Niul8RltG3nbShJ5VXVI8XjCjgLY6XPMBwVokuLnM9QC7EOlt
         cy+Zfd0UKoyI/8fvfRMnPiJtM1IxsBKl8h14vW52JJ072TDHovDFo3HXAUMfXVkrZG5a
         GAFlNyXkExHxFSoPLBaDwzXQIgZAeBmDFV1iDJ0MwBQo8opV+iXwsrLqIjQJJ9sIHKc2
         GgCFUx7B049Tuilg5bsQwzZBiXt79y1KR2k2iWtcHDFCxilQksJkZ+oGyVU6h2YCymKd
         4c3PCjb55P4xQpiLvvPkNopjbGeN2kGz442ifpCtUYTOqZ8vLjwrybR3FCrWGWl1V2BU
         5viA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759233497; x=1759838297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcwjoiI7Z+OQfUBE/J+XJHgAGKhZ1AOP0RhfLRLtwcY=;
        b=tBKGKTyvSZpKcTWmTwpxni9jBEaoviohtzOwLLhBd6ER+8IrMQM3b0LzeKMEWUO/hx
         YYSu6LphbsPfgj99RIVR+qJMEA9ALO/jetr8qFlD3FWUo4zVPj4gZ7gNLQmN4+g0DySj
         LrjCwSGMiDEAGdqFrKjN1H/D5Eyc4fQQ6+svmGnAhH67WQGmMYdfr6OPGqo1BsCS6vfu
         mZc/GUahPt6jxd91QSgHL2InuqsGLj1hV70yfZ46Xi6FGUvBD6YmpbNcuvc9EAx4SPWY
         2lKrFLPbCTDae5ufGrqA78ciylF9MAX3+VPZ3uLFXpwymADg0peeY3Ivo+UrH1h2fsAD
         /hiw==
X-Forwarded-Encrypted: i=1; AJvYcCUnI1pl7q+hSKgQykv4Xwv4WDOt/CvY5/D44ixxTMmS5mse/ZTaj2hh0NwDliUaOgt8K0LBHT1m+GthhzeHFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0EYa5Hl0mvglwiHOKiHpddOZWbnzlEf5Zq8jn7Q5o51zwd5VD
	e3neXsdswILpKNz0aeE/j1QvN+H0kijnsp6tP+fJ9qkadBSDM2MqiVx4sZBmkGMnYeME7mgmE0L
	P5o6eyEQxT7MvrZAfDD/m2V4DEAtDxI0=
X-Gm-Gg: ASbGncsgKNLh/7LzU2pQB3Y3e0npTXcCemsGO80G56M1TM31tZiNagM1rE5731N73Q3
	7uS6g9lm7IPs9ZnvC1qYqFCMuo9so9/jCQCK0BEAQs76/q4u8RgbCatriu5sfzMQiZmHJR4ZYtL
	poEorpjBdUc7S8Na3lQmAWzuPnMM6dYpwsLYkRmqp1MdvsevjtYvRnvGRBkWLAXyf12gXTI7hmT
	070mBQlsEr5P/7a466etwPk/jV0Xn8hbZdHmzK9Mx5Vr/Cm8uOX/dEWu+sp4VInpooxz2JzTYZM
	pZaSnAwURKwCVACaFyBxqCcGUddH1Ed78P5nh2AxC9NsIrHfBw==
X-Google-Smtp-Source: AGHT+IHJ4gNihkr+mad+gS8QEVDP5CM9acJAgm5Gq0rNyMMXGiM3fVx5RNRww0KuhYTEhtNZfq1z3GOBVp8XDPlUzw0=
X-Received: by 2002:a17:903:1105:b0:269:85aa:3776 with SMTP id
 d9443c01a7336-27ed4b5dcf1mr121341885ad.11.1759233497228; Tue, 30 Sep 2025
 04:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922113026.3083103-1-apopple@nvidia.com> <20250922113026.3083103-6-apopple@nvidia.com>
 <DD2GCDGQ7Q4W.1CSFYSETFSN5H@nvidia.com> <7brvf66smc3ltqrw7tm7smth6wnefeqykdm2n4qahi5xnr6d5o@4l5xfdbznlp3>
 <DD5CXDR294YD.2RL474PWBDWTV@nvidia.com> <CANiq72k3qkj1HxjnCoknAdWhdM7O1ZBkZDqBsVS7vxYH-tRCWg@mail.gmail.com>
 <DD5D5SRBMW4P.3JJPQVDF5BZLU@nvidia.com> <had7hms7ex4w4bvy2mfwtltyyt2xhsn572brrxvibvufxt6fuf@lppudpzwct4a>
In-Reply-To: <had7hms7ex4w4bvy2mfwtltyyt2xhsn572brrxvibvufxt6fuf@lppudpzwct4a>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Sep 2025 13:58:04 +0200
X-Gm-Features: AS18NWCdBljfozdePu6TUcKqSpCpdgxpMnivW-rYDv0CmHf3eUP5HKxAK6E3ccI
Message-ID: <CANiq72=hmkF=FNiWknrKXeLz4EK_eqLQa2647ejJSfukb9B+-Q@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue handling
To: Alistair Popple <apopple@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 1:42=E2=80=AFPM Alistair Popple <apopple@nvidia.com=
> wrote:
>
> Thanks. Is it still expected that `#[allow(clippy::incompatible_msrv)]` i=
s
> required? Just adding it to `rust_allowed_features` doesn't make the warn=
ing go
> away without the allow, but maybe I'm just doing something wrong...

The warning is independent of the allowed features, and yeah, it is
expected that the Clippy may trigger (at this moment when we dance
with these features), so you can just allow it locally.

If it is too cumbersome, I may disable it globally.

I hope that helps!

Cheers,
Miguel
