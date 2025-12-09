Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E5D21E082
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Dec 2025 01:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765242129; cv=none; b=kSv200NAz4zV1I+EyXa7QTm+NojG8+l+mODIxUXRnkJxx+dfpiaCgMDKBw6jiKGKah3YCPgAL1WGSn5HKvlot/FPwySB1U8NZcAqCiGhjAM0VY+Nybbdhw/38AnmuJfQY0+tf6dsteH/dK3WLsVFwbVdGqcNPMcXiXPxJoeRyWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765242129; c=relaxed/simple;
	bh=uGDKEPLMykAWOcUlNHu4PNNG58YAB3acR8KWNtoonC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epv3RVh907BA1K5uRnIQDDboQKR8/V4Do04jqYMorRXDg1+XZ/mQuzFb0JRMJEjVG/iUGIcWBAjGVbvST3mg3w6Pt7q8yrT8rVCcQn1pfs/us6xu2yAs1i7OpOAWPzrGTKUrJFAtiq2lRwVTTl8rBNoWD5HYrq+9ix4AYlV8GLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byAVSqdt; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byAVSqdt"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297ec8a6418so5578455ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Dec 2025 17:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765242127; x=1765846927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGDKEPLMykAWOcUlNHu4PNNG58YAB3acR8KWNtoonC0=;
        b=byAVSqdtMQ9nrVS6QpEwAX6eH3lpYalHkUTfEoAnSlr9bXFTEftqFp7E16N2zzQDnO
         GdwytJmuzM1lac2lRtc2n2oXlfcH1sfDhAenNzfGESrMmiJFnHmQqW5DapD59Yir+jPV
         Ov/gPhXap6KFW2sEyjRTM+Z8rABH3ppzwfx0ZRNh7/6361BuF3risKfUM9hmBniPcB+0
         9NIlt4BZ07aOQx3Mb+s9S3wZbXQJJXvbYDKCSxAItynaPEvcpl8B02cG2iAkqAKvhlLZ
         GoBBGORaEmxmtoAuoU/CcQiCuJQ93F2CJ8D1dp/9S/rx+YyzpqIZsiQHtD6DWnvrcxdg
         jWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765242127; x=1765846927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uGDKEPLMykAWOcUlNHu4PNNG58YAB3acR8KWNtoonC0=;
        b=e4q9IdutdhL5Nak8pjzG4rwqxF67SKHiGHZNmaOsVp3I6WK14991kDIyMOBzObkSnc
         5ozRwaEwnhon7xRZujs9bPw771ckMJLh/9rvFv/J5YTltVbO+6q08EeAJ7DU3Wp9VqlR
         7OEzF5YTeK7D2FEqCtkdV05I34aPvkS3wz/gBBsuEE40BLDlfLUjacveGsS5eI4OuXGq
         2xXTHxhVkXhpzZHTZtHoJilEooUKxAQ1PKh66x8GFFOKGa6ot08Y0cg7YHPdpJh7ynaL
         DpC9qT+qTqDUVLBoIaBfSaKnUfw3hg6UXy4Vug+Xz+qlnbeAMG/Z5cySC2Anx2VMqnDl
         NoQA==
X-Forwarded-Encrypted: i=1; AJvYcCWTXBNOO2PXR5PepBOmYqeetMC6Pha4lxTVIMulIw8h+Yep69ZK51jB+0gyD0I3b18SXr4etNKKrOQQ6zfZSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+pqMR8dS8v7oeOPqtaK5BSg7wQcBuc0qFaWRXVJU6AxSUV6Wn
	Vt8N7QOyfztxbrDEc178Aur0ft88AZpOGeW0DzyDK1Ue4utSlQUIfi2ikvXhgEBVohUPyVzMVSh
	U8IQpbh/yGjdl7KrhSW59mox4J+kOf5o=
X-Gm-Gg: ASbGncvEw1jqmCvLICm58Sw4Q5oQ15wjdBk/iNxFzyhUOz3VyIBQnqV1b2wpuUXiPyB
	A3vNRxRd399/Zvu7I9rYXakh5lnl6d0F/iz27Py+7Zn2SZXcf/JHQh8JuhK+OIEMOeNBvXkHai9
	BoIyJZ/RuRoxXzeBM/ZCjqXqYnzoqWkdZokF4reTgqlyesR4ra0D3RUPbn344wCmiW7wXS4+KaQ
	Wc1iQ42pxnHs2LW4SPYVPjfVEtD6DIyrcSZTOzTsZlBmJs+YnpBWicOSbEr5a7ytswefaqAAVk5
	+KsmIV2wv4f9iUWEtXvtkmxQMMByj7X4Fk7rf2QRzlqDUHQMxWe2s+om71bDm9Zt0xnL/ZtKS2w
	daesmSiNL0/od
X-Google-Smtp-Source: AGHT+IFrO5rf8fm5a9jJFe7v3vjVPwVESbCkXsoFTsGXBEpHYY8KdvibjzeUj8jNBuYb3/OZTmby9/KV/YRy3eFlwR8=
X-Received: by 2002:a05:7300:b0aa:b0:2ab:ca55:89cb with SMTP id
 5a478bee46e88-2abca55980emr2194053eec.6.1765242127202; Mon, 08 Dec 2025
 17:02:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251208-io-build-assert-v3-0-98aded02c1ea@nvidia.com>
 <20251208-io-build-assert-v3-3-98aded02c1ea@nvidia.com> <20251208135521.5d1dd7f6.gary@garyguo.net>
In-Reply-To: <20251208135521.5d1dd7f6.gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Dec 2025 02:01:53 +0100
X-Gm-Features: AQt7F2pcCQwCzQQDDMpHjtqZugmca2-gRsmgHNhTBVCuGzfGkmQoYCkGIWj-Dlc
Message-ID: <CANiq72ksg4Ad8vk1tjH-fVAhUQUcRpuzR2cogKnGHPTax-fc9Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] rust: cpufreq: always inline functions using
 build_assert with arguments
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 8, 2025 at 2:55=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> ? If so, I can send a patch that adds this feature.

Sounds like `consteval` in C++20, which is useful from time to time.

If we add it, then the attribute form may make a bit more "sense"
conceptually (and we already also added the `export` one).

Cheers,
Miguel
