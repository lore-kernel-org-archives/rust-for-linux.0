Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135821A23A0
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 01:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762909844; cv=none; b=URIOTsi0yVxpOFMfsd2e84ia/uj63cbFfZ7xP7cSDF+jKJe9mpGmXTavoy9WCVCTTqTXDJtL1HWWYrl+pam3zw+1j594TW4lM99H0M1d8OPLqkTYff5a3DBZGgmEdLLTicUa/gYtNnkgHLbDbpc70648Vy8F4ovinNZRjRRO7QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762909844; c=relaxed/simple;
	bh=M+Wlr7dck3mCcnmw/K+6olCTwOKBfh9yPz2t0HUN9nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkOjlQEZTu1L944EbKVwAwZMvwoqorRZEigK+1ZA/4xFmr8VSRu5orSyZrvN0v2owhY38qwx0/JrkDeRVGCaoXk7b1SP77Z5syzg3eQipFLb96cFkihlC0+DCBP39y3I9pMxUgcJghCM5HXyE5galywyztGfmhEpdCtHUV+lgsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQIKJIod; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQIKJIod"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ba3b6f1df66so49058a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 17:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762909842; x=1763514642; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+Wlr7dck3mCcnmw/K+6olCTwOKBfh9yPz2t0HUN9nc=;
        b=KQIKJIodcDAPfEzX5Ng5YMAcxpG8ZAZXdI/NBo0aUs5h1dgxb6JnnV/mw6XnoEvA1M
         5gIW71Lzjnkq0MxvUiT2QnXejlGt8PgEyUgR8d92xrp9xRTuaLEXRKfHCNMqGQPfFm8v
         H//IQ8adppnz1+Rcj3WAbvv4lyIGCDTgGHeoqlsPiiz2AC3tOg5gySmhduzvZEgVYSgp
         atuMnXBBa/SzzOTbtRwyEFriHpIQmQO8659JPMVR3GQ4ykqOQ5sE7cMYbJMa3QsbgVxa
         sCq/7Mf2B/t2+STuHobPSNyhN/nxUwaEETJ1bo1O1MkGWj23yp9VN/PbMTorMc/Ni3xc
         l3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762909842; x=1763514642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M+Wlr7dck3mCcnmw/K+6olCTwOKBfh9yPz2t0HUN9nc=;
        b=D1klIV+BJIiCk3uYnG7xmSBL3EmxIx6BqwHZbosLIz7gHVv4qOtt6bEvbYzsBvvrRu
         fntlN0zM+g54be34o2LNGpm1dMhjtEtNxKh5o9k3bLyrePkJ2moA4kNbkMBXgxs3zJn1
         BzqMiUToYu0xtOR0ZeGSWbAfoRefx4caPo39t0FRn0ucjYNTaNiGKbxQbwCduBzEjQSD
         jIrYRgaYCzpgqYaiSScvRJWOOX0UQmDMt0zSO3/vKmvN6C9w/dXb70/09EdbKWFyetvy
         +SfSlua/eB4VRmqAOGGp7q+c9xMEE0iax+vKDawv1yprFyhgfLjkzMnSdA3ZeGlxTuME
         yNdw==
X-Forwarded-Encrypted: i=1; AJvYcCWqrOsSDw3Ab4MRRgMgOIEUJoM/M/r2J2B4oqXvIM9ln2lJwWcbDw6guNs+yfCgDpgxpMu/4SnOIhRD1LdUoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJmIfvVu2bbYmGS66BtpWwvQjaTjlDmVs9uX29DLSPzqv1GaH8
	Yv4KINMStp+Oe3qeglKz3FUBE8olGgrIcwUh2A/A/c75Ql+m5xb2loHIoxhGCDtqL9XwKL1EJO6
	rNkvugS0YJcSYFh9b7AJKtsIYpKR/fdU=
X-Gm-Gg: ASbGncsmycd7qUrOjNNJPrvg75h/coCBlZkk3p3qb9v+wY9JSCW6JYJxXsIX4dlaQP+
	/ubNcPYiXbvO7e3sXUMbNMz5UKng/E1rPIuc8bIkNWsqbPCTMG3YgqiR2EAGM6ZvNP2LVUsEjxE
	ZIgfzfCH64uG0UvS3NxmT4X7srGZrWfwvOKBC/Ch7a15+99IHbCKZu0CVC9sAGhQw4DrH0DOr7q
	AQCqEegMYC527DDJO9Gj0h+2cYFQkMTDDcw8HZLV2SGJ0aX12eMGtvsAauH3dZiaLvK04UILuyo
	sHiE/wsJvS6aEvwPXpE5d6BP/2xNuyJPFXRvlefLxqEI2ev7qUgp70/Fy6ZGeDwY/ObvAxRMAwm
	3SWY=
X-Google-Smtp-Source: AGHT+IHB0ZG07UiacYVnMQc5E8b9SGddaCc8KnuTcyd/zUb48n+AqmKQETj5Hxf46NdhwddaUrthZzx8aXIQGO+IW+s=
X-Received: by 2002:a17:902:ec82:b0:295:2fa8:cceb with SMTP id
 d9443c01a7336-2984edf389bmr9400935ad.10.1762909842321; Tue, 11 Nov 2025
 17:10:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251108-bounded_ints-v4-0-c9342ac7ebd1@nvidia.com>
 <DE5PQ3927GMS.31N4JGGZK3M1N@nvidia.com> <CANiq72nYgvsTLvaXkGDN6ZReHipZVSgg1BzCgjC05h+dmsFe3g@mail.gmail.com>
 <DE6B1Y80A2EF.80GLFFRD9VR8@nvidia.com>
In-Reply-To: <DE6B1Y80A2EF.80GLFFRD9VR8@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Nov 2025 02:10:30 +0100
X-Gm-Features: AWmQ_blq2-Ss3usAshuy7Mp0GK3Xayw-H4mq4mt53WujsxFzzz_bAaPFhKnocIs
Message-ID: <CANiq72nhZnUXDowLB_j2yYp7-B_PyG+a-WxExdiZh8ROYni5vw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] rust: add Bounded integer type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 1:55=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Thanks! What is the path from this to linux-next? IIUC we wanted to
> merge this series (minus patch 4) through the Rust (not drm-rust) tree.

Sounds fine, I can take them. Thanks!

Cheers,
Miguel
