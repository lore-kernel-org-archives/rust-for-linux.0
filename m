Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562261EF094;
	Mon, 20 Jan 2025 22:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737413119; cv=none; b=iPhYpukjZyfurfylarrGMv2RuUeEM6z1iRfRa5y7HpdJBlbxMPM70nNyVHrfQoxm5BtWvmT84Mr5f4MCu3Qd5NqovI+QWT4I8Qivu1iHLi0dEVM+F15mjMHZzAOC4zMhMT2optKo/uq67HFoSKcrl8aJtftemCnQ6tOBTXnIgak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737413119; c=relaxed/simple;
	bh=qoRVz4xot9U45X7WBIu2KHjDW+ibf4oWqCI2kYAy8Qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u5Gd5E9bAtoxGpB8nehYD+E6nv6ztghWCbQQKy4srmUvljkgmU0ERM80uGvVpct3Qr5QNXNAk1iJRcyJAco6KARgmnPGDWjc0f7QuXiCoMNHd8A6Ayec8lBcHWiGKE0vG+N/mtO32HEnuDa2tg+jVTAW/epb0kOCmfppI8ZGwMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfS3C23k; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfS3C23k"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2161a4f86a3so9469825ad.1;
        Mon, 20 Jan 2025 14:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737413116; x=1738017916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoRVz4xot9U45X7WBIu2KHjDW+ibf4oWqCI2kYAy8Qc=;
        b=kfS3C23kFA7xIaNAkqc5NK2HjNjil45Xjx8S5TEwjpqNXE6fZaroUa0OYpEGdszaJ7
         erMHXC/4Ret9MXxvaOuHUwQKpFVWyB5WqDjlqCnd90aPCQ7Ig79YHvj1WOsFq3w9x/+h
         vktgoXzTvSdCqgVNr/R05SeibfOFwzikpnqRCh5PEaCtlwLxQKHpOqdz6HrjRF36ojAz
         6O+/eBXhZCKs8U4E/glUTHLVksC/YNrbjjSUljDimqDUvC2RNpN0eYxLlPrCML4E1f1d
         w6QNQC8n6OTzdqBk1XWujLatv2DSVjLvrS3tx7rCvFeuqjdhe8G8197kYjH3mYBqQ0N2
         ZSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737413116; x=1738017916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoRVz4xot9U45X7WBIu2KHjDW+ibf4oWqCI2kYAy8Qc=;
        b=LmDqBcXlUG+ckZs0saaObdV9WRr2s787T+X0hrgbCZKQt9arjYz9bHdyykfPUWw9nu
         r90EZYFl01F44RptaXDe2eE7EO34y2UbeDJf/mM9mvxNURHdpZ8U4J4tt/snecjN4Pn7
         7r7acjm6kM1rVNHHBM4Zkm+d53boM0HLkmG8tPpGExMODanIYJu26BXcVyPL70lrt8yd
         bqNvvW03DO9h0NUg8bzRouKxcHRUc3+M+vq0llHFS5tGUjfZEsbZQtxj7yu6fL+59uUw
         DRMe9ji/oW7WhYbcj3KAASgRRmjbPB8kOobSBulTSBGRL8LlSI3exApp/5Nk47jKZNk/
         L8Dw==
X-Forwarded-Encrypted: i=1; AJvYcCV4R9CULRq8RObWjVMR3HAG+gsJDrN0JM6vB3I8Ncl01QoUoEvSBwoFV9L9lGJwSfEdyAApKSaxhlFSVLHMVVI=@vger.kernel.org, AJvYcCW3eaWZ+KkZuK0/34p3ddM68J1vNpkknH43nd+x3dsvvXP+rAy/SFiqPRtponwVhrP569dB68EyAz5Xs6I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1aN0bByc7ECNQeYoYAMLgfqAYI+6gHKb9dwCJqk5SaubKox8F
	7DBdlGMjT0CncQrceQcNVDuVRNjdwkUSANsfygWSujj+wmPRNpNP/4CgmNi6K6uiLbPk4khClCg
	tAQ59WQC+rp1Z1/tyjdZJpg3naA8=
X-Gm-Gg: ASbGnctJPtA+xDeNbtE5SM2rKL3NUvl4zxl+UIBaXhRZZGRBLS8FIDN0UHRHbreus7+
	OiVU+Z9TMe44mUshkmhctFjU3UpQpeI69b+kT/qvtyDNHwwe8MEU=
X-Google-Smtp-Source: AGHT+IFODT/xgYF7MkVM3GEyRLVEiM3Xsefx3OrlqeMRmOQtqHLNxXTFaliFbhmPohpf/AsMZz7d8/5zFFwj2Mri1ak=
X-Received: by 2002:a17:903:1c2:b0:215:7a16:8389 with SMTP id
 d9443c01a7336-21c35536f27mr82671565ad.3.1737413116501; Mon, 20 Jan 2025
 14:45:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120124531.2581448-1-linkmauve@linkmauve.fr>
 <CANiq72n1YpUowTh3Hdjo5auOmTTUU1-8d2FTL3e=Oyu3Q=-BkQ@mail.gmail.com> <Z47IJ-2tPDIVzMA4@desktop>
In-Reply-To: <Z47IJ-2tPDIVzMA4@desktop>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Jan 2025 23:45:04 +0100
X-Gm-Features: AbW1kvb2v2Ti_RvHiVDTO7BSLtPZG1cOcI0Zmq7o1Yi40QX64ft-88D8sAnjWV8
Message-ID: <CANiq72kRwmnM63Fb-5U5aHTjW4vh11-sii5eVf6BWvCqJViEmw@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: fix compilation issue on ARM
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Jocelyn Falempe <jfalempe@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 11:03=E2=80=AFPM Link Mauve <linkmauve@linkmauve.fr=
> wrote:
>
> when building with today=E2=80=99s nightly compiler (maybe that=E2=80=99s=
 relevant?).

Ah, that explains it! The type changes with beta (1.85.0), and I can
also reproduce it in CE.

We should probably try to backport the cleanups we did before the
remapping, i.e. the commit I mentioned in the previous reply, so I
will see if those apply cleanly. If that does not work, then a
targeted change can be made.

Cheers,
Miguel
