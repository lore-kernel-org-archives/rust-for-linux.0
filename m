Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4018A3822A3
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036767; cv=pass; b=IYLuTofrRp8W1JBqRPNqpIsbIVkiW9sPFU92luM6BMtaQBj+Fmn9wP1hw00225Gq9SaOk6xQ0FHDl3sQyHqxW3G8uWA+IM9SWRk9ZWN2tnldAxGDw9einbkZ7P3WKXa1RynB4ezRa6GeJqVrIn9VSJM33F5YYZPhZpsi1m8cY9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036767; c=relaxed/simple;
	bh=TCQWI5Q6FGCnOrU5VBk3cALOemQLRDh9ulOpMQcKOl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AogZqAGPT3kNRRKforrBcaO83Al11C6iJdQMlZacW084RdqJTq9qtN/8UkzJOS75t0LrpJeDP1aS1QWahBvmqZ1Xvjgir/xlCajzY9y2eEoordyCO1tAOH0oRNDRfFYeYQQSbKZbtock5IUqGQS8xV2ngpJtuc1evEVedrsMLe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlqUS+6k; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlqUS+6k"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bda3b4318dso446554eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Apr 2026 02:46:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775036765; cv=none;
        d=google.com; s=arc-20240605;
        b=ZzWhSENm7USUORwg7u4Z7J71HbXVeEhS30fFxcpTGnyLuRQG1tdeYRvdmSV79XgQsC
         XEtxewblbrb5ms2kyI/Q610FbQUiTf5EesXhB8wBJZn3JfR/XmhTey1YNgodLap4dbJO
         y9kBkRiLvEjQ6EAKTiuceO078lFXZ+RdWtLNxUWyFXkncMftW933RkwiqEM1W+1Z6rLp
         JTnZ/2YI26WwiZeUM4TAMlUq8cs3MFanF3j67Wktz8RXGCzyrhy3QcwPKZn3ka5/493V
         dRpVjvx8TJDXZKqlh9JxwGBYd+RFMMQEUMNXCmlONM0DxXCju1kz3/hchwlr+kLPfjuY
         ywvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TCQWI5Q6FGCnOrU5VBk3cALOemQLRDh9ulOpMQcKOl0=;
        fh=+9dsNXhabtLcGgBXDoV+SfJEQfHlx/hl03zAdui4f9A=;
        b=Hz1/iaZKvCDkEP9x/I8zUFxpRpDT7Celm6e0NSkbIATq2MFo7TY4jegyMnIQSFh4mn
         AjlY9O7KDaFAjCNWApIehp0o8dU5kCn0eUTzUdWnJ2jCa0Kr5rxA6aT7SWGNb8HSuLFh
         /afb/z+mULBdMibgH7iZbAvirauacfzFTuj+7SANek+shfGN44Q9CfCIvHc7zg3kw9Y/
         0tk5V1+YmxwJIeS1R8yxkjDhb+mptUv6TYS5p9fQG97JgiGwQ5AbWTTjbFZ+rq1hYmRT
         uru3ktPkrtug67o2bVKLAoOxWk8ZTsA3jdkjWj8pOIewU+zC5mxsETV/Sqqc2FK21FLw
         yElA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775036765; x=1775641565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCQWI5Q6FGCnOrU5VBk3cALOemQLRDh9ulOpMQcKOl0=;
        b=rlqUS+6k+cjXgGN288sj4NkoEoQ4Z6ECv7v7XNLyRCTvKLSTl9Fz7KaS8YFhGwE+tm
         7zv/nPeoRVjVoBlKQLEEH0UxaNvT2QQXgQQaSPjFJ+JJZloRNXVeJZanZd/BN+EBgCzG
         GNp7zI7KBkc2BB/VE8eNDHfxwi78HqgXOvr/dEUaD19MtH1tFpFzUJ7MVKhcEUZIL9D4
         ymNXQZ6oYO5PG/EF3vbo7J0+cMxv5N9Ga6VxDaGaBd4ItqfBxCs1zRlfD1wUgBzOtclv
         gueKLUe0t0phpefyA31dpIfuCyPyKBdr8sADO8hIqWFgxWgwvzGOXT3vULE7Mmahtt/w
         DA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775036765; x=1775641565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TCQWI5Q6FGCnOrU5VBk3cALOemQLRDh9ulOpMQcKOl0=;
        b=IyGEM6Nx46hoO5cvr7+l+qW4c1td3g5hkFGj3KB3WmGr1tJ2s8RGWj4XgSgQ+VOV5A
         zuXrkjIxaXWATVjQA8eN5rE2ppE+WuZ+m3UC+SOxnLMRLps8NyfG3EkpYyVUm8a6TQcZ
         dsZB/juhzlwT8pqCCiNAIypdsIDs9bZzN87Ko0SCTYlHyKAsfOJH3iLbz/CPV8GETsyE
         bVK7xuWiwbfNyKCE8ZRVLs8C3vqwuid2VPWgfEsuI469yOSm3g7vvH6e6qNmoJklcs73
         6AlWx4G2tQbG9yOaiutsmjvrZoSnA8Q7qYyteY+96yEM9ncwUhz9dQ/5fu9py/VL/J2N
         L6Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXF7SujML2+E4F8oYNNInyPAOIuvNukUYjL8diXFJI9Fm2flYTxRF+Rj6szhNPsaj2Y0TGcqqdLiTWUDe9GVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcC2T3lpmI0t6prmHtksny07KNwYbBdP3ICct8YPNLnnpk5txJ
	v6NWSGRXM3fouymu8ZPQ9qyQzbk0JVae1z4uDZVtoh9XuKy5YcG9JWXPFrEpNaVtURMicverAos
	nI6FYDLiYHT8jKRwd81qy2GytQaoBdRE=
X-Gm-Gg: ATEYQzx91WfyMYPh0hZgce1cb0Scbg4KhL3WegxU4e4Dxjxnw/G7w7DxT3lZLdExoFN
	uNMWbiPjdoHtVM4ArEipHVcOvkkQ7SQamz4aOMPBaF4dh711YN5Rh5u/x2jgpz9zXPVl047Fc1G
	PlNRGulN/h6YeZUx4W6pogmlrpZCyq8vp+FHBq/I8hIpmiBL85nhVsBorptthwTJcJtMLpvFod2
	TJO84dU1n3ovS+WlQ/R0E5hhnxvXiXTVh5Ik8t++CdexIkFw6BnY+8su3+4g5aewVNo/eQqrvDB
	R6bi1AaNmTiJI0etfcpNL+0y/WtwFdSCZgXc5fxPwh99HEyC1YH/iMZWjidQ6v35LK2fAY/SDDU
	VuXF7R4IvSwlRZuw3soCeAvo=
X-Received: by 2002:a05:7301:7c12:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2c9327a40d3mr747575eec.3.1775036765317; Wed, 01 Apr 2026
 02:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-kasan-rust-sw-tags-v2-1-f6765e3e1a2f@google.com> <CAH5fLgjbrFsJxikTe-94x4a9Q3K6V5rCJBK=0pmZ2_qjfreBBg@mail.gmail.com>
In-Reply-To: <CAH5fLgjbrFsJxikTe-94x4a9Q3K6V5rCJBK=0pmZ2_qjfreBBg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 11:45:52 +0200
X-Gm-Features: AQROBzCjUQu7NjNHmPbhIZ1BAZbb9ZAEsapzitn57V_yNBap9S6NbPzVn7RTz6M
Message-ID: <CANiq72mh7xnknFUyZ74=jBYqVP_Qqdg76SCFTzRDHV_J3gbqGg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kasan: add support for Software Tag-Based KASAN
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 11:13=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Sashiko is asking what happens when GCC is enabled. I think we just
> don't want this enabled together with GCC. Miguel how do we usually
> handle such cases? I imagine we have quite a few options that are
> probably not compatible with gcc, but I'm not sure we explicitly list
> all those cases in Kconfig.

For options where it is """OK""" to drop them, one can use the
`bindgen_skip_c_flags` hack in `rust/Makefile` (which is best-effort,
and which we eventually should not have when proper GCC support is
added).

We have `--param=3D% --param asan-%` there, but to be honest, for things
like that, we may just want to gate it with a `depends on CC_IS_*`
instead.

Cheers,
Miguel
