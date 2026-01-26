Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73961ADC97
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 05:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769403953; cv=pass; b=hzqP2s/Rx6IVnNPu4lmWtpK+GmnBEsxb3qkopGmqcgFf4i8+5Njw52M/OhbEaNfWnZ653dpDPn1c3DLkh4ip8NU2jriFPM8sUcfQIAP2fn71k6Mw73WAk7wdex06xjc85Xoc6X5JdlPKtahqwhhNUXDdTAvQNt14UUr/hOq3Ztc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769403953; c=relaxed/simple;
	bh=6a6ZBvxqcF7MbgJCvALLwjzcZUqlKkLw+64IeluPvPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FduaBa/eCYnw5G/yCPXbi7/x4Se1XYmnVeorEQtOxkeCiMEPqFQuwsnzwxiS9Svc0EVPxeoMtlNX9HWSQa1B49Cjqb8Jh2TL1cgMply74Euuw6wjS2l3pV3wiZDUVzkoVuCm8TVxoKaOhUbxIRRLYze+Gr+wy7YVuYahcjTPlwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0Xf5iMY; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0Xf5iMY"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b6aa67a792so186302eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 21:05:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769403951; cv=none;
        d=google.com; s=arc-20240605;
        b=kK4xf/1+hS6fLB3pnKMlheVRwtOts8H9KMi7X+TH4a8qbn/iejofDr9xk220F/BmUf
         7wH1D/2i2waWPwIQ75DKv+2HsE7gBJFvsqYQ2SAEr4K6vGarFJ/zQj4TbyEpoWjmIy/o
         BZ43jzTlgBBIJGaMrE7zmZYWCSOMuuAsPkfzgr4CAf2hTelXbnQtAK2gUMbF5yb43xlM
         OR7B1WGmEfMxLBus23LtXi6rjFu6gSOHghsC4J1d3f4deNoVsstiiZvYqZtFXzqwA+9H
         X0hG5Gdq1TSxasFKS4qtR59ANJ1ojDzAeEFPjD0g167TgYuheyLHumYz1PXSLcrVULpp
         FdDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6a6ZBvxqcF7MbgJCvALLwjzcZUqlKkLw+64IeluPvPQ=;
        fh=/nHTXIniDPWoSTyBvzGgrveGimLsEmtIBupeZuCyOpA=;
        b=Sj5QmYVkpRJcyfK38VydUlqwMVbwYyGyP4VMjJU2NamY015eyiVuBGAVBjdZijKMpF
         BpbwwGhFw+s8/1qOkoZdcwxcGKE4CLjtObfYPFAX1DbCA1j53ZY6aKki70J4+4U4deiO
         g/hNbevJ/p3EN96p/UqZv5NCHwghueGtjdGWPygrm3wT/PeCKirLBU4vEfgNN8/16tta
         YQvKgXKWEp6mYHizGTvcjHefcrfzALz6tnzE6A2c/yGiNynGbXxYf3hRDZ1yR72J14zb
         38T2U4b0oSZM/5xRsVDJy1ZhL5ppBjbEGbNAwXWTiZ46LCC40Zn9TlvB6Ny6+qiH9gZU
         /Djw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769403951; x=1770008751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6a6ZBvxqcF7MbgJCvALLwjzcZUqlKkLw+64IeluPvPQ=;
        b=m0Xf5iMYiW1p9rCjyC88+GYGo5polJEFgOWl128mgW6/qOfjCG8qGAOnhFMkp0NiyB
         y+zWUGhgtAv90OmghGEamQyqjxHyPSmLpBo5arZ6qvCWwqNyOwwtH92gEUaSFIyByr0e
         DurthMtB5PYItrhI9N9GKRFEBb8Bbz3S2Sjj6fJ1YEBkhdipN+k8aW+2bstA9369slGv
         VdAIM/p/7eXtsPsdTgCEbm+Z406cqca491QAch7N/NY6DqOLXjq1+H/djC16qfbu+BIA
         hBxVBl4THkhkQ19979J8E0M2LOabW2Xgp8AAuVrtanKqvqv+OT13gIoQhgY50fy3G5nl
         lQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769403951; x=1770008751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6a6ZBvxqcF7MbgJCvALLwjzcZUqlKkLw+64IeluPvPQ=;
        b=T1Cu/sGQE7/631KrJE3c0ux+aMtzNH/q2NbGxqy5diwYR6KbLA30fcbK/tK4aEWsnw
         uTsV2+IH27nX5+qWOZSY3w5dLJj1FAozMF+7+NOfI/FlEumVlvruRQtdLQESUI2IOre1
         2anH0OWK/2aDDr264dMF5j/R9MP8Oi2g7wEkvlvrEnSubDU+qpma2VGMcXtggoFak1hc
         XU9O3Ll/iQ2uaBkrazEEMUiKJD3nd8spEQCYn5q0C1mjwBMWDfKMf7P30LpPD8UQnCep
         5lh/UpRmMjZDbpdGacZ0KvgcOnS0+XOfqo32aWhiZ8ZYgfQS1/iVom/3vP7T5k+rHn+/
         kVsg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Fzw5PRnRjg3f4sB/n9aobKobUZUet6ZX+ed9KjzDFT0jM70VKi9Ds8RzHkUudTF7X86+MMzjr+7Or+8yaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjhp9qKnJ5HmRRMjOYuBTJQIxfhgRB0LZwgakMpAQFVzcTZZir
	C+7ebKtchWC97sbQDAHbKzm9cWMFHCBLeWo9JQ4omAAKWi+MQ/ECkhN+RZfLCEwWYACu1vZloZJ
	xmufo3eElgjHplYbaDNY0AJk5RvVhe04=
X-Gm-Gg: AZuq6aJnJX7DoS1t3YNt1V/ic9P+PLZQnF+oLTI7f7TW+ga/QgWgO6Vnb0OUxn2rR0i
	70pwQC8GT4WuatYo6sp+MCZ39a6+nkqH7T0tXVBrxuA6Fp+8JHHprVYs3vm4oLG7AUYFnGQ0a36
	1ZvyEY67YXBOYa+wavQtlsTpuoOQp01UIIGIw68wsZT7xEpB+SUOIxN0+jBk4i9Pf85GUL5fvph
	j3d24tb31xnt9Qq7kOH5ZhF3AQxEu665AmwJwLJmD++UYZ0ahN4F/+vx3Hz8wGagi3Osm9QTySv
	kZVupWv8K8r7EprtRRdyNWIQctt2RBKxSXM89FykuITtQUBb62PdEOZNszyKzShmtOF3w+VMo24
	SpINI0YOXnjquS7DUPd7iRCY=
X-Received: by 2002:a05:7300:4309:b0:2b7:121a:99f with SMTP id
 5a478bee46e88-2b764154191mr802959eec.0.1769403950859; Sun, 25 Jan 2026
 21:05:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com>
In-Reply-To: <20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 06:05:38 +0100
X-Gm-Features: AZwV_Qj8bWsZq8j7NKCBWbkVOKnq9gygupvQi30E-XVbV6Z6boKQvh-y7mrjDlk
Message-ID: <CANiq72=TDj=EBC+C7LSgjqbULFzWhZnNr1Yd5cqhj62188ZNqQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] rust: transmute: implement FromBytes and AsBytes
 for inhabited ZSTs
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 6:49=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> This is useful in Nova's GSP message handling, as some messages are
> empty and we currently need to explicitly use an empty structure for
> them.
>
> If accepted, I would like to merge it through `drm-rust-next` so Nova
> code can start using this feature quickly.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
