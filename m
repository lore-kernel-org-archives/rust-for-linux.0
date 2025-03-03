Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351A71EB5D7
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740994445; cv=none; b=fhA4LzhY1IBNRzeU+xiMCnuNAs0zFpkeb/ML+M4upuD2w6GM0HP2fr1lviHVba9o07K4VInZbToDK20rJQtOqKudPmSje+hA/6wAtUAVwYlL494puDl2yDg4u5e7KJ5sYNiM0xiLte6h7wXostoi6LyLpFv/4ndqDzpc8DNKbhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740994445; c=relaxed/simple;
	bh=QQfQeOchMFjMIbBZd9BGjFJG6WdiEeD+IaXEtKwcvFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evxiaQxMrFRY5D3da6LQi3rPqEsqKqCoQVY6Zu6xBRCTjitHLK9DbsDEWqj0JkaKhf0Qvsh+S/JjJnwf6Eu8uWG67P2VdX95G5QBJ6kC+GUi2oZcvbmuaIyNfgqK+EyFQqL9T3QaLmVhwo15GE3TmP2qKsetXllMFoC0B6/i7qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u7d7ufUt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u7d7ufUt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43996e95114so28217125e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 01:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740994442; x=1741599242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXnZ3E5/TKOVFTli8c7ZgXogoCXoZZU7O3qVHvhvQxo=;
        b=u7d7ufUtjKfmtL9ThHTDuErw2V/XCxyJcYvhw7Hr/ehv4m0IcBDTI1MAtaQ2CMfyJ3
         Sg+w/2czFI3XCRx+g7V08+beVnA5QOc6xMPicRga51Yfw/TcatDHp06aHb3crbsEJ9lI
         U75QXzx3Xhxf3GnzrSJ42Ohlh8JdE2878iObTiafNFzdd7wQW3N6aAPOmNAVRrIjyP5w
         OQfjMEX+Adkrreql3OFNI6BcfFP4Lxqlagr99anFGZGnIEWdAyWJ2ttwmYt2qNvJ2xE7
         YVIj4QuliFGMiYz/KL8jQOybDLcO6gYCQ8P/4vqZiQlMgWoeKa5ZY3LebnFJp4iHvQiP
         7BPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740994442; x=1741599242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXnZ3E5/TKOVFTli8c7ZgXogoCXoZZU7O3qVHvhvQxo=;
        b=XdexSi8DMOu73UYQgU0KAIntPvb/F5Hu8w/4MF42qokV9y+B6dmczuw0Rr/Msnx3rZ
         kbXHlr9T4jw4mn3wsHSnOS8ygcc00ReqfCTY6oTTK0R39gtrSXiRT6oXaU8QleOSGHON
         h0/kY7j8vnOoUUbsE1C1eHGHbDNN3D8kHTypDO/l9HrW1TZGcCJEQewpeleX4pc2fva7
         yQ8DtKabeFcqrF4citXLTcNhCouOEPsmqhDC9wcepAs6ltWv0RLmgL7ZZuFu3YRSzi8D
         2BpAJgYICKgZb8TWnL5lM0oazgMQxToGzXFxDYdwr4sqDQP9GjjLJ3xLsYhn45qmVawN
         mzvA==
X-Forwarded-Encrypted: i=1; AJvYcCVEi9q42a69kEvRLAnVLnSvN7YliCGidY9RrRQoXIQp56tlUKyL7e/QFNCNfvaLmE6AEcvLvZzt72r356mcbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjuQau57x9TrDPR+bbfyZyKCz21h06OT4o+p4P1xDeA3ctQdBa
	jvdGMNhChgaI/nfgSirGE+d1o/fxqCmuToS1ekavqdGVJSzziXndErWAlK/a2Ci1vl/tTDriFGU
	hac9LDVKU8mIn3rIS9L9Rn8MzDeIy5fax24xk
X-Gm-Gg: ASbGncvdA9KeXoTFzfh46hdG7IYA0IyQ64Lg9dU05Ld35GxsvK4A/+TQG5MOxUfPGDJ
	5HQEvqbKcyl64/Hj4GhMC+qG+XK0C7ubIp0JTs9HX1PgVjww19QtJVx3McmksVoDtNWBYo+pWqt
	XoVBYDBq3rICajSBmxHGVI2i+V6Ns2b3dmn1ARzW7Knj5srDQvzPq1Su+v
X-Google-Smtp-Source: AGHT+IF7tkX24sQKlhC4282EiZxY+hctHT5EHwLzLcZo0eYUQP0MVXGgfz4uJEhk1VzgcXR0gnLyV/lIaiDtAcofzqo=
X-Received: by 2002:a05:600c:5106:b0:439:9496:181c with SMTP id
 5b1f17b1804b1-43ba67745d4mr107426315e9.29.1740994442374; Mon, 03 Mar 2025
 01:34:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303093242.1011790-1-ojeda@kernel.org>
In-Reply-To: <20250303093242.1011790-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 10:33:50 +0100
X-Gm-Features: AQ5f1JpToETt_xPFbUXkjE6L7wUMFuPji7pUB4N-gMgIpy2I89dr701AOdtWuTc
Message-ID: <CAH5fLgg_Ax3x8qLvJCE=0xay7gosaq0w_=xc4zu2dQ7tFV=B5w@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: clean Clippy warning
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alex Gaynor <alex.gaynor@gmail.com>, dri-devel@lists.freedesktop.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 10:33=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Clippy warns:
>
>     error: manual implementation of an assign operation
>        --> drivers/gpu/drm/drm_panic_qr.rs:418:25
>         |
>     418 |                         self.carry =3D self.carry % pow;
>         |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: rep=
lace it with: `self.carry %=3D pow`
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#assign_op_pattern
>
> Thus clean it up.
>
> Fixes: dbed4a797e00 ("drm/panic: Better binary encoding in QR code")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
