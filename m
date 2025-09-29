Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4367D309F1E
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759155895; cv=none; b=ehJl8mig/VKHahm13rJMT++tPlhG2/F8EMYROG/ODQ+S1Gnsd8ESKjjW1au5GcWB/9vJy2gZ0nxlx+AVmAcsyd+npwqZC2xbX9ZeScbc1MbxU1xA1SMDYlG5NsYsT0dvgUrOx7OL2a1Kf6il/mmOAhNFhYIO/pt5XBMOjGm3KvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759155895; c=relaxed/simple;
	bh=ot8hcRKjG+GhZEktY+15kwYYzRMRN2qEVMOH15R9us0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EfcZjzgdSlpDTroVxP9760a9Z7i+xaxkd8Uepyl9Wy+FLkdf5XOQ6GXPgJlLaG0Od6yh4hd/5U0sGPAenBRaLiK0+Wk8fVFQJLG1pnxVb3xPy96vWsqN/MZK4kCACoYwRKL//bu5m29I81W7Mgu9MB/Y3ha0KF8Il+6xTMhgRbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1ZqkmIc; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1ZqkmIc"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2697051902fso10930205ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759155893; x=1759760693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ot8hcRKjG+GhZEktY+15kwYYzRMRN2qEVMOH15R9us0=;
        b=d1ZqkmIckNX2lrSGeU65Xhu7nXJ+Z+ZnTEmzt6NMRbmj3/E9L5tISrwe5o55miaXQ6
         r++e70H5FvP/3JdDWtBasjP3AR/Ey+el2NBIdjr5LydY78DIyQ3Vj8nmYXiFPDh1EKJx
         mBbVyBHRY7glXEnIgxwR2mcFB+VyrdjKUe2hehIRq/LZYiMT+AghUrR0uAlDCYdPlwNI
         TexgbRig4GjOtU6JJJleHkynApCOjRLUw/9vwNSFDGna5TDsYvY/Kqb50lawiTQVeRxj
         Y6kfkKzSdG3tH03EwI/DZeCIdCMEmmHCy0QpV5bmD3TwYx/tMqMOKaFNX3/8CDEOOIm5
         65Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759155894; x=1759760694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ot8hcRKjG+GhZEktY+15kwYYzRMRN2qEVMOH15R9us0=;
        b=lvnALP04WBQ2jGLM8Mr5zsLGVjFFAvvOmS59zZZfJ4uFKWx7irlkdngokm53NGjW1h
         whP5Jv6EEAmeFA25A/6b9xhs+2g3zxA4A7ljtSyID84xGqbQ6n0Oy55uEwHAhj5O2+XR
         W/JIxfyjTjjG4T/QAWWGCkjgbhZBCaG8IleSF1Uq3GIb7ehwua2L+gpmvzl81Jq+5Qh5
         zL+5cX7yDJlHydR+54vKpcf1qcvXIyg5Ql7WKfUcYQCtWPbvqNNAB3LyEDkkoec4oRtd
         mEpySAgGkzG4nwY5czbaIGyF/Fyer1hr9d4vfs3jS8+mTrFVjWJ9ssERxniD+NeOV2b2
         yn+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/eCG5pmu2l01sdzG+DLMK6WdAc1c+cl1NQzqLlQIK7prRynhxPAai3NyOhNmVW5Z1A4lb3C87zOfb3i9URA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEaEgiX180HJB0E2RphKyn4d2edbSFnXutV8AyzM0CyzsR0QL1
	IssXxMO//MnhgLYgolQETj6Is4vzhMobME1grNFePuyUqLQGq7l8Jo0iDREyNLFWDXt/vVIda5b
	cGhP3NMOQNGGeFyBsnQAzMtFH41l6oTw=
X-Gm-Gg: ASbGncsntRHyUvXKykBQEHVo93B9EkyLnW8/rV71jog3yiKUHCSD2TEof33yyVoMuV6
	pvNN4FWUzINDnlUd/+LZK/HM6xH1c7z6YTiOBkLDCbpAPk7stcIXhabnov8MGlnLm08Ds0xxNh4
	Wrg1JT1ywE4DQDqnqjatZrLoat5Yi0y/JM0i9dCincplQMIZzUgz0Ox6taurTGU6xkMK8pakutH
	Rvaoifth1FqAUSPCgF0OUOxD2Qy4eq4iBAtSiBQMx8TdmVXw1cDxzFwzFIpnodMmjr3GYZ5rHBc
	qc4d5bm1oYgXWOO0mnchiuHFUoHS+ihob53H
X-Google-Smtp-Source: AGHT+IFO+CKcOfhjq3yagbAUNFRqtJ2JQPPv6IOGwZ4Z+4FHLSqV7RrX0bFPoMZ075YnvnY3rrn95mijVFVOb6eOUBY=
X-Received: by 2002:a17:902:a507:b0:25a:4437:dbb7 with SMTP id
 d9443c01a7336-27ed49d5fedmr70259715ad.4.1759155893602; Mon, 29 Sep 2025
 07:24:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1754228164.git.y.j3ms.n@gmail.com> <DBWXJA6XF1VS.3PNHRWH030H0J@nvidia.com>
In-Reply-To: <DBWXJA6XF1VS.3PNHRWH030H0J@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Sep 2025 16:24:39 +0200
X-Gm-Features: AS18NWAQUPZbXtjWExl55E-tjUwblkbPBQ5uQeLCMefcIVbUSmtt91RPmlpmau8
Message-ID: <CANiq72na_d6JQdyZ1S22mus3oom_jz93rpY+ubr4yOuvMY_fSA@mail.gmail.com>
Subject: Re: [PATCH 0/4] rust: add `TryFrom` and `Into` derive macros
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 8, 2025 at 11:13=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I have tried this series on nova-core and it allowed me to remove 150
> lines of boiletplate just like that. As far as nova-core is concerned,
> this is a perfect fit.

It would be nice to see the (possibly RFC) patch if you have it around!

Cheers,
Miguel
