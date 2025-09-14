Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C286021E097
	for <rust-for-linux@vger.kernel.org>; Sun, 14 Sep 2025 23:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757891972; cv=none; b=OIw2xW/wAp9Xc8p3zylgJgZXgGpfuhsCKqAhRPz2/AGFKDryzR2FDJZFkSlKWoRi8xWNGVB1llonc805F6q91G+Gyh6l3eWTGK5rmyqRRdgmQsWGwIC4NB0wwwQS/Gnp9NFQT2Ki18I00PcQa+yLbyQoEj+i0W42vhVAUE3Cf44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757891972; c=relaxed/simple;
	bh=m0I/xnWWzA/0fP8qZdIDb3sUbPySbToI/7+4msNB60s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g8Njx/zJr2tQQs81GCrg8WFUEDAT0XRaLAWS0tuTUmb4hAY6nikZkbBcjXvheppmJ367/OoO949xFe2Sg35XPtrsahpsK1tC0U0r5iyLVWHFnI7fYN01WL+lAwKVdj8POomv5yNne/lB0pZ8YMaoBXZAuHt+8nihVAKpAyn7cYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnMJM/rT; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnMJM/rT"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-25f897894bfso3832435ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 14 Sep 2025 16:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757891970; x=1758496770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0I/xnWWzA/0fP8qZdIDb3sUbPySbToI/7+4msNB60s=;
        b=bnMJM/rTPU9AGT9BmhGFpqpmERJzCpd/yWi9kjtXpkbkZa9gSxmjnR+zuzrHftwlgD
         giRtHQcC9GP82vLKynxcUwRQAFA3GBIefdjaxYgxX3XW+n7xSDfXLXWABJDSoheY7DlP
         qZenBaYIW+7otHfzorDAXxYj5SZqZRHhuPTdtE1Xqzz2a+rFOPFsF4bn0DYSsPfR6HRF
         yNtB322mlDv3YU3li9WuQuLc9Qvi4t02oz7qu1DncEpnvUbcNMQblAJYjpfJMbKyK3e1
         FCGBZ9zmdWaXs+2IqfJazP0CxtZXSWiW+oEXttBD609F9jAgeI7/jyg0bdsUViJUIMx+
         eUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757891970; x=1758496770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0I/xnWWzA/0fP8qZdIDb3sUbPySbToI/7+4msNB60s=;
        b=gL8j62SaUq5CzYDBeTS1GVEI8noHZeoQuoSnz/s8vfCfWhPpUzT7Z6nYw9BrKVIoVV
         hRriO58Pym47w7/EnReVPS97h6F9OXbGH4MTlx+sYQJpIXREO06+bwLCoL3xawfNiUf6
         P/umbm+rS1Ou/PpjN4Cat4WubVu43pTSTGhial1LHf101pjcccOzc19t9wH+cy1+/0/b
         n1Ud1gVvhehrPCJGnZGww4zQsF+bxZGifnaMKj2URiu+szEyopxr/xjpR5YNAXX8mKt1
         lCtX4lRbZOX7GJs3HyWIlCaqFuJWDnZdvJEQVkLcfMxYg1B9EWq0pArYUQ108ZBPxZx9
         8Qlg==
X-Forwarded-Encrypted: i=1; AJvYcCWXVctwwwXWZyrdY3D8BNOX5c0FgOkWJ01Mz1RYLN/TjnC0Ehn6IZAgnVYPJ7lkmvmYewYaXKazbqbKSUfhew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzJv9NuA1nY0obNmc2Ve0y91DVDyIkGv9uinU8YBPA5o0L6l5O
	yIbjZ/4MDPi+8Z8gPEGEKpkKFSgAgQfG40RbIkuP0ODBYKFaJjsUjdKN6UdRbenp7/KFGbfHYxD
	KVJTKyhOWhKLlqhZiX/A7MR5A4/W6ON0=
X-Gm-Gg: ASbGnctRnMpRA4PNc4QGFyvt2w36zEDezxwbMDmLA5MtSIJCmLPmxBBPUynk43tykkA
	Jn+JOhFCN4gucvcMYyejmAMFol39XqgdGFxaXXE1cW6hUfIjoul6tUAhPOcL9WiUiyxyMpWquRq
	217twwSiFti5/nVxycAaFrVACuzXntwVGIdGAC6WblBEbPwf28NL7EnGza/C67yvM6Y1mP3XAoc
	rlMIL3FhMpSPTKFTbPNRVULCoyhE9nieRG4y6LhuEYa4Y0C+anYFOU/muVJNsIJ7y36b08ixPf6
	3hzRKgyWR/tKQHtDvArXd8LYH9KvHxOTMn2i
X-Google-Smtp-Source: AGHT+IEL4fTrsytJhQUaldsh+1WXyGODbkNk8V4WUTM+8P8Hw+jJU6kT/D3QhsNp2JyUY/ta0A6bPAm5mVBqkbwu3H8=
X-Received: by 2002:a17:903:708:b0:267:8b4f:df1f with SMTP id
 d9443c01a7336-2678b4fe1d2mr309415ad.1.1757891970032; Sun, 14 Sep 2025
 16:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722121441.224439-1-lossin@kernel.org>
In-Reply-To: <20250722121441.224439-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 15 Sep 2025 01:19:14 +0200
X-Gm-Features: AS18NWApSI_6yUDnJg9YwpBR_rWNHqaJWiXdYcO5dNgirLlwr2sfICJcrOinX3w
Message-ID: <CANiq72nD6qb425Ujkey7KBoGHT=cmgOcAmWHThd5+BktGeQWPA@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: extend module documentation of aref
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Shankari Anand <shankari.ak0208@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 2:14=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> Commit 07dad44aa9a9 ("rust: kernel: move ARef and AlwaysRefCounted to
> sync::aref") moved `ARef` and `AlwaysRefCounted` into their own module.
> In that process only a short, single line description of the module was
> added. Extend the description by explaining what is meant by "internal
> reference counting", the two items in the trait & the difference to
> `Arc`.
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
