Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DEB2417F0
	for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 22:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764542576; cv=none; b=DlMh5z1G65e3Y1++33S9GJ6xzDTGDRmtkECyZaAOnDW3HEmL3jud6GZONbiBYf+HQZ9SE2yHL7He22UI0ZJBu7DUWW+k7oenc3wQqFkQn3ZPcnKpVLNGoULhOgA+sNyF3Ffi8BjaD9B9h2EtbvLI7X6N/Hhh3mLMz3KR4fGSl5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764542576; c=relaxed/simple;
	bh=HcZEsjG65+yGMetX0Zj+M1YtSmKxm1zYnDNrk90J+K4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KR3CmcRs8OEOu1SVVrNvHmTRhc1hl9GE8bAf06tDgrPdDiFVFNobvbfYQSMBkDQqIvHfy9TgTZ3uGJBBO88pwtvtQf5TktsUOJMWfxeVi0vpLbBUBVCCnU6iWUXHnSWHZu704rdzRM+sLLl//keBk1qNVQ1mVuICTogoEX/2EQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2Qdm3Uv; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2Qdm3Uv"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-297f2c718a8so6826395ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 14:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764542574; x=1765147374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcZEsjG65+yGMetX0Zj+M1YtSmKxm1zYnDNrk90J+K4=;
        b=J2Qdm3UvvWcNiXqpHemOcFqvipW62EEIAy2V5gFzHvAzJ4JWuyCmL9qnzz+lcsHWWI
         DMkvLm5n70PAoZm5HFk4xsT8JhUlrS0uz8SF9QUnNoP/8jomdEMZSVUnpIM8U/1lCZyy
         ZtOLvbCWgJz8KnfuDhVF8h7SGN+CcVegxj5fgcXDHZZAWu6Xu6c2+8COyJc3Ty+punbt
         srjzgc2QUGryFx39oD/aRrOH93mTIkvfdNHatFCe0L0Usm559Cw3qu2N/larcfhz5fWK
         Dj3Lea1icZpn4oLQ4aXlf+/bpEoylGbQE0PA1KnLRPaT+9xXgKVJDp2PP7oz5YzOHfTy
         GKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764542574; x=1765147374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HcZEsjG65+yGMetX0Zj+M1YtSmKxm1zYnDNrk90J+K4=;
        b=ceAWSARVlswnOSEg93Vf4+OCpuaxFnmif4aPSxIdZVPTHV68yntPusXAxbvpOhC+bV
         Qf1lAmfHsRYVxZXp+misbssYo2R3NCVJOHh0iXNkpA4yIJHUqKVZhra35ewUeKw5aqd1
         HAWqFztbISzZCPgTCj+hhv+vGPOv4EZ8wt5zVWKjCc8CxIG5gAdlJSCOlbdsD4zztc4g
         nXfd/j5D5ECqcQCYtXh9Z/VFlw4RUbjhkudahksf1HRJO198ZoNGO/7NKmri9wvAzrN9
         MZdWAMEQbrpu+GVo/UVaNZmutbDb+8dCQblFr66WAQUZAkq1VNZ8vSWYlR2mGKyoBgxA
         Btlg==
X-Forwarded-Encrypted: i=1; AJvYcCXdAmQs9JjsE87YmCeYamZTUCaoP/uYPY+nGcp7RMkFgkCrHig/7fo9SpDdC7wLxAr+hVF4Nm7fJztBLycrGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3cKHcsSBAf8+26mbi7l4KArwJgJrwwZ5xyKx0TXDtkM9BRPkB
	yRhiU7VREXFhni1Jro3rTmy2vxyDDEV7eSVjF3hgf+7YxOSLLDaHIQXwP5TGtaroaMIvl1Eawkx
	Lm0oYoVYzz1v3JuXkOjuL8n9PaMWkImo=
X-Gm-Gg: ASbGnctAZUIq2tXjIqQ3v09MTgUtZ0h1eBDJRZePZ/sdvysqt1oVqHP6c7AElEf81qw
	8hxrBvjUC9VoQMfiMT6PQh1deL4A11CVuPHLeq95lBSX6NV6Rs4ADk4dCFRVIRES+YAf7dEWrEj
	/1h7sbh2LmereXXkqiFkR9uk2Lo/4ANvtMKvvVwUoM9wY9278Ki4JHACSQBVBN6oaOZzkBIA9E3
	FDoFGYXatPS2QDDBwUNhTun32iy5gnAHjYHP2e6enDPvT0t4ohuuR5dNYux5nhUVzVYz6WbmLZz
	7aP5wQbUGffoRcfMAt1R50FXWJPNsN4IXiudXg+oAOpoU7RABd7uh/I3e2Njq38qVC6cyXHWxxB
	6/ERsJOoFXA+U5Q==
X-Google-Smtp-Source: AGHT+IHBGd+2vzlTZsau2QokhF/IkqB6hHbgHqn950T+l/SVi3sOaZJ6kcggPwucnCYRE2cxkq5mSzjCakwfION2s5Q=
X-Received: by 2002:a05:7301:e24:b0:2a4:3593:2c07 with SMTP id
 5a478bee46e88-2a7243ec7b9mr20206056eec.0.1764542574091; Sun, 30 Nov 2025
 14:42:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128-io-build-assert-v2-0-a9ea9ce7d45d@nvidia.com>
 <20251128-io-build-assert-v2-1-a9ea9ce7d45d@nvidia.com> <db6a6b28-c0be-4bd8-a0b4-70431df7737a@nvidia.com>
 <CANiq72nGUuK9VTYJGob7pnXU5zuuCzqfw6fezAFpbqvte1sDFg@mail.gmail.com> <46b5eef7-2e8d-4801-93d0-6cea10f62dc9@nvidia.com>
In-Reply-To: <46b5eef7-2e8d-4801-93d0-6cea10f62dc9@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 30 Nov 2025 23:42:41 +0100
X-Gm-Features: AWmQ_bmQFx95A3T-2iwjutvbpyVPYU1hJ59utd8H9Qu-WWRt5GFpLBBIhJuMARY
Message-ID: <CANiq72mhXajwj7HjiW_HQq9nO4o-HwBFUya3wjT8pRkWx3xjZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] rust: build_assert: add instructions for use with
 function arguments
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 30, 2025 at 11:01=E2=80=AFPM John Hubbard <jhubbard@nvidia.com>=
 wrote:
>
> It seems pretty clear that if one writes a *build* assertion about
> a function argument, then that is just conceptually wrong unless it
> is inlined. Because it can only really be a run-time assertion.
>
> This is what Alex pointed out, and looking at the code I agree.

No, the function here was already inline.

What Alexandre wrote, which is correct, is that the fix is about
asking for *more* inlining.

The build assertion itself is fine. What is "wrong" is that the
inlining wasn't enough.

Nevertheless, it is (or at least some of these are) definitely a "fix"
in the sense that it did fix cases we hit where the inlining wasn't
enough, like Clippy ones which may change codegen (which in turn is
why we say it cannot be used in "production" kernel builds:
https://github.com/rust-lang/rust-clippy/pull/8037 -- back then it
disabled MIR optimizations).

Cheers,
Miguel
