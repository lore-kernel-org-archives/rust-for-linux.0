Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F333B279327
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 07:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766476138; cv=none; b=olbHhnv+KyKlr6DqPD8TGq7qZQfZWy2/G5vHS4zWs76viWCS7RtmT2OlzMptZDBe6E0TIypE6k2Nfb41F9cFNA4psajGYRUdirYS1MFUbV8QbbCLBX3//iPXj4mdqhmLALBp/mhLqxt5z9SgoNW1ixcwbB0/XO9rQfJtGXEkWus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766476138; c=relaxed/simple;
	bh=nNVjZYuCgUNvRIf5FpO9plp03v3td7UJLhhZt6cEf7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=seXwj+t16eE99NDYnihoKJVca+oDNUGLoi3i/uRcFFZzPOYFEOBNXMnJh7R7jIWhXoBD7+3POwWV6Q4qvzQC/Kk669RWCEw1XhWeeQm7cSTsJnI8XE8OqtV44wQ1YedGroAdQTbaT6B4186C1/kVoM9zyU74h1HHwJQHt9wmsK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahPSnSLg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahPSnSLg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835C4C4AF09
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 07:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766476137;
	bh=nNVjZYuCgUNvRIf5FpO9plp03v3td7UJLhhZt6cEf7A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ahPSnSLgBqQfwWn4XDimrL9juNkiZVAy0x2OKarXgnUF2orjymCPMBXbE1zha5zey
	 zdQNR7IuaQqPIttCzzhfd0XDZW4SD9ZGu2dgY5AnT1i/Zd+uLATrXWaIrc4n6wJ0FT
	 y7eWFAoIpSCy0eJuzL6I+B6aTanZjXSPND9eJQu3MwCWdjBPrz0ueMsfub7Q4vu1tX
	 VeptZviHnl6oj/lGU0rC5pzFtiMFYrGCy+lXdrX33XxQrUhNabj6d/XXHVXL2BOe3t
	 2ywlWjjEif5vh8PLdvbzL+qdxdbzHERD/I9zg88RPNU7YcP3v/rJP8GurqyWatLCOw
	 5iQHMbFbZT4Yg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37ba5af5951so42318691fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 23:48:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXBKrYiAi6buNv88+KP2jGk0Ztv+Agk7dfHsz3lAx5zkdQMlXwc7z+X7FldPqNKwpUeeDPk0Eb20tLEPXYh4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBdrTWDzCCnbdrjREXUnscwAnoO/g70gMU/O+Q5XVCQL4NvTfc
	RuUtAPonnwAz5la/7joYw7A8HCFR5SvbFOzMPDqYigRMxMS+0fIZIQmJKYUM80uf83pDu+woVXA
	Pyy+YkC7dXSD3LgMbseQ05hKrCnLPQCE=
X-Google-Smtp-Source: AGHT+IGmXhm2OTxMWzWOBhVvRmJ9kJ9vHSYPeyQXxrbndu6wjS69wPAEWwKEE3py18ZkaMYQ5RVWrna1+jAxOqMgMYs=
X-Received: by 2002:a05:651c:549:b0:380:989:f602 with SMTP id
 38308e7fff4ca-38121568d0amr36693561fa.5.1766476136227; Mon, 22 Dec 2025
 23:48:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-tyr-v1-1-d88ff1a54ae9@gmail.com> <8ED64170-53CC-4D03-BAC3-682ACF273ADF@collabora.com>
In-Reply-To: <8ED64170-53CC-4D03-BAC3-682ACF273ADF@collabora.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 23 Dec 2025 08:48:20 +0100
X-Gmail-Original-Message-ID: <CAJ-ks9mrZtnPUjp5tD03hW+TyS0M9i-KRF_ramNY-oh-0X+ayA@mail.gmail.com>
X-Gm-Features: AQt7F2peq0jDPThnB7INsXhtdZ_Tc0tpwkzLeYZUrxxW7OXPZR38v2fFhD5Oc18
Message-ID: <CAJ-ks9mrZtnPUjp5tD03hW+TyS0M9i-KRF_ramNY-oh-0X+ayA@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: replace `kernel::c_str!` with C-Strings
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 3:18=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Tamir,
>
> Please cc me for any Tyr changes.

Hey Daniel, thanks for the reviews! Looks like `drivers/gpu/drm/tyr/`
is listed in MAINTAINERS twice since commit 29e7c311b ("MAINTAINERS:
add Tyr to DRM DRIVERS AND COMMON INFRASTRUCTURE [RUST]") with
different sets of owners; it must be the case that last one wins in
b4. @Danilo is the overlap between the entries intended?
