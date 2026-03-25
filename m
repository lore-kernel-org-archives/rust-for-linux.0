Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD943BE145
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 11:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437579; cv=pass; b=jyTQrOFteTjDwlxoFpE3/dKd7PqwCDrNypRQdzLPN6GRD4OgE0Hu/HDusYct6nWtn1v0jrtlIiWSuzYjPud7cXRN0B3SijpenVmZ5YLG+Mne7A7OXqf6IMKuPy4HebzJXWxOK5AvnvX4MiDrBpHf9s+LVqwg2ymyud07RXifMKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437579; c=relaxed/simple;
	bh=Ra//rBcZDaNbeRJfP6SsNy1isVdIi0KnDDT/IgEDcUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5aVBw2DE3QqpKG2AwxTc2shvzWSzqKh7FhxVD34y0x6M8pV7KGRTzFvkKElMI/UKextEld1b9ce+bFLmz+cjQRgMoYNok8kEB2cn4+AXf74sdk/n+c6/sMPTiwUj3nan8OfIWNTrP+m3nju5mfL/1zGO0BK5rLOUDsDvNIwOK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qTDb5ixK; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qTDb5ixK"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c151551a6eso91468eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 04:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774437577; cv=none;
        d=google.com; s=arc-20240605;
        b=cjn2RmjfV29Npv9C2ilGsDwUIeNOQecsnMVluT4Bhs14jNQ22KL0GFAFcfUW176Yn2
         gzYg8ByY82wVUMmWo3U+QVE0modyCeDvmWJcpKsFdHhTWCFMm57umRYpX5NBoZWSlrd8
         G/ktlQaq3ksjFBb4LvSKTsfE4boAtiSyXNZ/Y2ewaCworN4cBcJ1YsjlXOhG/MhZF8kP
         rw151SVOgHFpiZ9big3rApkXVeFBH5ThseGngylJkixbGo51YZycNFETySt/Rj1XovJT
         +s2UeCOp1i5cLlZZBFIvnAVWF3i9EUlZJbq+haL7yQH3y2AVhxF6vic/vo7g89zlto8i
         L1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ra//rBcZDaNbeRJfP6SsNy1isVdIi0KnDDT/IgEDcUk=;
        fh=jtCvY4tEnrtYg3rZJzW0waH4nUxtmDctQDPtun0NBJ8=;
        b=gCGPUJsdwSJq9/J7XkpXFvHvF8Hx7aVYmqIGlH1/AzTlOlGuP1hX3hSz7z6PaiWz6i
         KLOO1NMQyEsUQaZ8bedx6xNJAEXQCT21ngCDbfYBDsa6iVqm/BOUIDRZ+CdncPvOUqRC
         IQf1UTfzgntXxVVbjtdYbY+I5imeFtiCl5+ReM+7kgohqpzEvvmsdpTd7y+FvqD/eSWT
         RTDpIXKd7ZRttI6rpJcukOChKWGXkeUi4bY219HBnujp4xUnh90S2eofcInR3gC3SUR/
         xQ3SAsqdiTMOsURLROkiJouxU3CSxaCYQgcaHH88fptTJnOcS25uoVJob9aTj5wTTCc2
         fVGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774437577; x=1775042377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra//rBcZDaNbeRJfP6SsNy1isVdIi0KnDDT/IgEDcUk=;
        b=qTDb5ixKN75eB0S3EE64OfZ+VwRHK4c/vJroHXxISEHsX8Qa05c1IBjbgSSrU1Tof2
         ielP4kExBWhG3AJVTg2Wuv3QOxcA8HRjg48MUEc6hJJy0ePLdWelz3OKdoHts4EQPG6b
         nyZjW6shhB4AhgLCDfQ90VxnxwxSiNmImzdFZUgnDwrzv71oAtuwkctiytT1P45c2fz+
         Qje5hHYTB8JDNMQqszuE0Z40KNo/d58pb0+wvpSr/3CA6RS3x6Txftl5GSw6Es+yiRl2
         D/hlYI2qh2CaegJuErrkERqG3oO5kqIHKuRzv9+X2GS8A9ZzGT5PNLSXPvm8Ks+C7Hca
         60SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437577; x=1775042377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ra//rBcZDaNbeRJfP6SsNy1isVdIi0KnDDT/IgEDcUk=;
        b=NONywEwXQjaADdAaunFSHVo9ZvRPRtP1u0xHW07+3fBzWxUkrUgDQsiCxf1CWeVw6M
         3iiCF7e5/G4twhjYYlsaX3WJeLS12GiLHKKuCI3qtO5gzmpt3mO9uLqiuhyCIDkfbOlr
         aGqXka0Oq/HIDMvCs1B2uf1uIdcRZXIv/sFBoKKvYpHKitjPwAQXPjp2Y04gYdW9bJDv
         Bo72Jv/zR5XGBq6NZnkO89A+uQAEinKG7lG42XQZFHOnYcjeGX6RtsoRYtuAJoEIzaEY
         RR2FdmaVbEOLVpnXgpX0AMRdetUrFyUWPSuBY7TS1bLj6e1arQTWVPWl1WB7Ove7KLy8
         yDuw==
X-Forwarded-Encrypted: i=1; AJvYcCXc45LAn8/GjeUGkSJMm2oF8kj8r00X2RwAfENPAfVtwdWMXTimd7DyerDvHmfSaNHp6ui0CVtXUTG+2uQ0SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWaDXodChN6PSfnvt1e9XW7QNWgQbIxyCr83dQ4pOSSclGk93+
	5HJnzOYSML8QFllaLvxHX6Tc/PXVOXxhSuvk43R1kYfhwrZRXye9Dr6JoVyeLGgdC6NoMQOQhfu
	9BX1tB2sy6hwnHc51BJ5VXKFRLqdHQ/w=
X-Gm-Gg: ATEYQzzCp8W26I8J3MwfG+lRD7VRjQZlSDvKNd1/CGR+YjGmXKESNxaOmSYO5Nn3s/0
	mRsYpNPipkEwd7zbjpU7jHvWc38+lUt0MXFu7ZYhTepWV6SA1bhMNm5Y/yQOdFIudtxKbUI39BF
	cCcfJJGpE2VlcSinA6fOQhKRdxucp5zSpZYh2xD238KOj1NV6urEvZ1XHIHyPTiUGmO+dEC3PHe
	dzaXP9OWcsTazie9dFYvROYubBHVsNioMaaX1XehWKyyh4Q0tP9kfWgeQV+cl0gSnhd7pg7pHyg
	gG+TdXQW8ay6gxcPD171n0jsgUHkuwj+6aZpN32fKE5j5QIZNds/kVq4h6Ycj4iCtWjuH2Ibalh
	lx2W9ePLdOy6nBBCJquUvQDI=
X-Received: by 2002:a05:7300:640c:b0:2be:2912:ff65 with SMTP id
 5a478bee46e88-2c15d3a3290mr804181eec.3.1774437576868; Wed, 25 Mar 2026
 04:19:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <OxgMwl1EcYLh4AqdBa-FaFap0ODNxpID-Hnns6odQVjvPTXqh6VoXM01bZmoVkAOF_5udNfKuCP8YJoW4UE5Fg==@protonmail.internalid>
 <20260323153807.1360705-1-gary@kernel.org> <87v7ekxixs.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87v7ekxixs.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Mar 2026 12:19:24 +0100
X-Gm-Features: AQROBzCW4ZpQFwMmq7pjAG3exaRqWudmr8HUDplJtzv8yd4rMvDeVglgs68Lt1Q
Message-ID: <CANiq72mQ31ssPZs1M7wQ14c9_6SyUEQLXwSVoLSn9_LXLPNR_A@mail.gmail.com>
Subject: Re: [PATCH 0/8] I/O type generalization and projection
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 12:11=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> What did you base this on? I can't find this commit.

It is next-20260320.

Cheers,
Miguel
