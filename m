Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBF9298CBE
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 22:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764629939; cv=none; b=plRMwRwv4m4IN+eKQfKdEfpOMAGv+6WL5+tMrPFwbMjPJ8kt8A15l0IB8PXK3S4PWgUUZiKpLHbQc6OdH9EAMmGAJxEum8/tRpEouWiGlm7jdp4aBWWVt8WnzZnXvma+SfFJJKHb/npp1BYMoIkrVe0/fjXjElq56DzA/0g1FjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764629939; c=relaxed/simple;
	bh=zyWPxm7BxHU2DwXC/shC6IQcOtTNXj2MQcP74sbsrkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUJaf8xijU4bD9mXGiY7zi8GvcQp/5nrFVAStunGdccK21fgOgVNc2TlXAXw93Amy+cUO8vpdlNC86UTQBix188LNjXyKF+OX/5R+ML2g0qziKGVO0/fa2XLFa2z3y3RFCmAJkmrcFzshAXT9nNNmd0Lx6OphbtSAJdsaLZ9Jto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AesH8m5N; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AesH8m5N"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29800ac4ef3so12103335ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 14:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764629938; x=1765234738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyWPxm7BxHU2DwXC/shC6IQcOtTNXj2MQcP74sbsrkE=;
        b=AesH8m5N1u1F6R3WCOjx030KCmmAxsj8BXV+v9oq9o3zNbyLd3aLRgMg48oGq3Bb0Q
         P3ieMNyVRxXUsykP1R3cQTMBT9VUpr7VekhZcx2ky4SmZOHK3lSuszt/mEy18ndTNsIq
         3fXUj5RrzME+MWVUDbsLeNeLsB7hWjp0SkflFi8m/VSROIKQetUdVIHInXjHHQwopXK6
         gavdFmluE6fY3ozviDMI3o9g8O4znDUBjuM5Ic05IOmdYcNdovthmm7IemXaW8obJmi2
         nlQpsPygBa4ysKdUcQljWzlXpcEbSusQB3ZLBC2/Icna4CI6zfbxrM17lOL4Q5BzaPoJ
         O55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764629938; x=1765234738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zyWPxm7BxHU2DwXC/shC6IQcOtTNXj2MQcP74sbsrkE=;
        b=WCI4LoUnCAqGhe7PQc+LpoAjou9elvKpn6ub91D4sAs4tm1jm/kq+BOEXzGPjJOj4h
         rmCHDlf6WRNxwql6pOLtY8Vl+F0xJnoGJUzkmmqxd+4xgR2UlbIuVgqssbEWuvYVzZ36
         guY7YRfsya8ss3/tAhdIsVtBw6MM5IdU5ok+umQOZ7/4ytGbZS26Ph7DORSNhUcseV8l
         Zt4D277UH2w8e/cXrpKi7QrtHmW0legBIH4RVPSK4VWICbbk8DEdrE+cxz4epR+fnm1r
         VBumg8CpfEUAgCh3dE+umPR4Eqy7OzeWXuw5a37x71hxUeWKLUixz4vsorHC0NMy7t56
         z/fw==
X-Forwarded-Encrypted: i=1; AJvYcCUD3tTm869laxjjD9f/WeU2sTOUvJnFl2khxvpqHdltGKPnUT0wq9to4iyh4CJ+5Xkk53Uhut+oorTkrktp3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwprEacwWBDdYhOW9A96mWsak9ze/ub6ekhRXMVbMO4477zFynI
	ySD1DtxIvbBrMoWEhIaNH42yFUSOyWZe4eHVxUFpdrFipmJKyKTz++XNjmb/vCQeYnqkiIall/e
	bgksOVMnC9XsiSkE8qr/qhEeVuh1YBbc=
X-Gm-Gg: ASbGncsuKo1m6Sr/tDDf15cec/+lPFHy/s50RawZV0AeIZyTJ4DJZpaZH6DGn8mlJy6
	2PljGI+uqC+uuKEO/BGBxICuFTy35sqChPzBWmB6I4489qawzmitorKL4IoVKeglJ5FRvPj917I
	VYLsO5DOHpDONbprivaSLh0Qef3Zw8304jSZxZigizhBYYZn3ufs0vJcZxUSK1vHQzJSXP7DXKD
	GoNVy2Bt1bkfAhc8t/yhiB/fm41UFuDTcmgS77NhLsFGvZOakhYxgfoMbQR62BP7ZGZGV//JcGu
	TPq19dXNe3og65QyFsNlLWsZruyimZ31CWTWEGC+Vez1JJm+HrXm+syn9HZ6WDYEJPfU9VySnTR
	0aiYaukGGRc8qAw==
X-Google-Smtp-Source: AGHT+IHY+FeAItpAcrc5Fq3fIXt5nt1KC5tdgt+lz+Ap3b7wKK+vwNPbBlkNS7wWrophFDdlzmuDF0mqMk5k9ykfKLw=
X-Received: by 2002:a05:7301:e24:b0:2a4:3593:2c07 with SMTP id
 5a478bee46e88-2a7243ec7b9mr22701116eec.0.1764629937707; Mon, 01 Dec 2025
 14:58:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <5B89D953-BB52-4E8F-AC40-1FA33C016780@collabora.com> <87d2c2d5-12d2-4655-b070-872c909f7e0a@nvidia.com>
 <48EFFE1F-4D20-4A2D-B3E0-13E9CB796624@collabora.com>
In-Reply-To: <48EFFE1F-4D20-4A2D-B3E0-13E9CB796624@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 23:58:45 +0100
X-Gm-Features: AWmQ_bk8XBPXNwQ-7Pod4UntjM0rZKNAiZHIZMwXF3_mA-n9qMS1f4f_JysZoCo
Message-ID: <CANiq72=V9TvPPvx=nAOciSZKVQJy+YBgLmPTt2EGo9bGrthdog@mail.gmail.com>
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked lists
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Lyude Paul <elle@weathered-steel.dev>, 
	Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 11:55=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Yes, this is what I meant.

Sounds good to me too, but if enough people like otherwise, it is not
a big deal either way.

Cheers,
Miguel
