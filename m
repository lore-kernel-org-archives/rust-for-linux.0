Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81C82BD586
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 07:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755503924; cv=none; b=iFDj2xLIlNjIgR9lNpy8xVecEd1SoCq7M98d/+QoD+XcGK8z9AvazejUqMavsN+3bccbCOSqyPBWgPmd69HoUQnp6VxcTa4syFWsYSO750raApNzsm+CtKutKcJGwTZv9+48B8Ln+Y3Redxf7OKPJk5dp1xFqHzwbzuIfQFuAVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755503924; c=relaxed/simple;
	bh=oKBzBkYjQ1AhCU9AulAtxppsQb1mgr8Yf0r+sRBOG1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ie6wZ6WZAp7fnZDM91ByX3huHCKRmAWm2NCUyJ/eeEXDv/2F9FKOa0yk28Dx+bAzOxOtnvIPA8ndW/FcybJSyAaOnmyPuQMz5CfgtFhfBkJMVu4IXCHiY9Hh3m40zR5EUxx5XC+jL/vF/O4HPmI5WyLfUqUrYRJErpZvdVAfOBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSZYC2DX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSZYC2DX"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-244581eab34so5995175ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 00:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755503922; x=1756108722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKBzBkYjQ1AhCU9AulAtxppsQb1mgr8Yf0r+sRBOG1U=;
        b=cSZYC2DXSo0N7OH4SU+GqwX3NOFW3cEVkuVDiab9QjDkwcQios1sMopYGJo3VK/F4E
         bnYzClOUohvNIrwt3UOYrD9tSoMaQM3N4nHBYQdtP83CQItw2qS18fza8pEn4KsrOTLb
         II/PTNeyLSSpewN2QSvzxzuMVM1QfCfxS/ECp9OjfbMTO+nAy1s8fanYJEWqfJKfYaxP
         tWcoCGiszokEn3JNs7lVHhqvz7O988dPp/yXg25nqwo7Y1yu9zS3sjPR/2GxkGh7/4An
         /V92q3UnVNkWSSd9+/KFftyTDwL7VhR5SU+YEq2BOgMcOg9D+utqkGjcoUwFcag1cwJu
         gRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755503922; x=1756108722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKBzBkYjQ1AhCU9AulAtxppsQb1mgr8Yf0r+sRBOG1U=;
        b=grfHltcqLgyFmkRD8Jiw3q8WumkmZDwpQyHmsdrPkzTyHqC/SDOIt3zBb5ULphEoYa
         28Kl1Q9jSrJu+kUzBDPrChnaOibfr1eKpBjU059uMczlTflrN3oZjBId2fEEF2ouFuSv
         Fmv3vx3n/CwciniRmvgwU5FRjVmFo9wcCNk6KESJN1ijiCqXEAb4LgVPD/gfWCuHIiqi
         KHXlJPKxQEaiG/3S0h1Qt39BdfV/qaKCvlqK3nWQAMTW8e56VPGnQdQnpj+50CxLoYKI
         Pqf+FEQ06PFetKh+XxPw77WufCWBRycdeotfv1+OX6ufHTyBCviIdv/75GK9q21ufaOA
         pPOQ==
X-Gm-Message-State: AOJu0YzCw+8TWOOuZU2TwADyJezlc+TIB8lJyx3ertsurcO6i8/ZmkCy
	oEMjwEtvhLAXrz8Z/sSR2bN5nsBb51wNGxdQZCYRg2k4OsIaTpKBaOQpql9x8KyN4tckRzidYJo
	hlC4FsyYuZ46pS+lcwoiF1oXtazDJgQs=
X-Gm-Gg: ASbGnct8AzInpKwm/TJorTfE+37mukF8QT2GoJ11TViZRnLdkHjm0y2LSN8s9QIFUIH
	PxH/FW4qYI42425pIphia2QxM1N+w/y902er0qkg5iQDux/vMa1WvBpn5UAeW0MDjAJMWSq+r3+
	wE3KMxBh1lDwsu93ujNRV/gWsn1MHtfE7xwEoQqpYq+Ruk78ROnQSz9HmKoSz3CWgYPOsCZMreO
	LrUC/vY
X-Google-Smtp-Source: AGHT+IFxsuN8OTpCzaDIPZwNzASJSuMc5/zGYCAhP2DbEUgRVZJGqD55MUjWsyLjDAxtE6b6iZEErjTVe92wUYFy2QM=
X-Received: by 2002:a17:902:db01:b0:240:8717:e393 with SMTP id
 d9443c01a7336-2446d78f982mr63555435ad.5.1755503921944; Mon, 18 Aug 2025
 00:58:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818050251.102399-2-sergeantsagara@protonmail.com> <20250818050251.102399-3-sergeantsagara@protonmail.com>
In-Reply-To: <20250818050251.102399-3-sergeantsagara@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 Aug 2025 09:58:29 +0200
X-Gm-Features: Ac12FXxanJRySwES_5HkplIVAqFnzFgozCFj2ZARW4a7Hsql86-4Faz9Qh32TB0
Message-ID: <CANiq72ns_17Z8=T7eTyquPG-x4WEZ8W4wa8nXBpMv04hKqD5oA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] rust: drm: fix C header references in doc comments
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 7:04=E2=80=AFAM Rahul Rameshbabu
<sergeantsagara@protonmail.com> wrote:
>
> The Rust DRM abstractions would incorrectly reference headers using the
> non-existent path include/linux/drm. Correct the path to include/drm.
>
> Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
> Fixes: 9a69570682b1 ("rust: drm: ioctl: Add DRM ioctl abstraction")
> Fixes: 07c9016085f9 ("rust: drm: add driver abstractions")
> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
> Fixes: a98a73be9ee9 ("rust: drm: file: Add File abstraction")
> Fixes: c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")

This is https://lore.kernel.org/rust-for-linux/20250730130716.3278285-3-oje=
da@kernel.org/

Cheers,
Miguel
