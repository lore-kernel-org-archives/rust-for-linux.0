Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DDE265CCD
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 22:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757456548; cv=none; b=SzU7dnKb9JwoJ/XjZpYlR6d9zgQu+RqTE7wQNEUQJxgqxi5Zm4O0OANL4Rd8bH6ETUn76ypbI/Ew5yryxZC6+KPRpVuyj4ficAKObz0JUsHxBI4Ln8Ycb2LvlGv9K8lt72sD/NpZKH4H1fzpm/v90SuSYtrEkKeo9UmW7Lwk9lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757456548; c=relaxed/simple;
	bh=Y1+lVOHdJgc/PJLxgnBu4EYLxexrbOv/c65GNuXU3SY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TdZRJbH+25XfDfZkjoq/ciDjSP3VIWrAuMJU1qATXM20C4K2xrf9Wa/nTmbhMNjFNaUs6nELHfsvQaIt1DeQNcxj+baMzvwfOaggze0Ifdce/4Bxck04u74vaGFMYjTT+d5eJiUdKakhtB19iwNnSrElaKWR3aZutKXfcdoLPhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9ecApbS; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9ecApbS"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f5f7feeddso1134363e87.2
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 15:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757456545; x=1758061345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14zKoaawmL+tkb0ufqaatkUvQTDgaxwDhKzZv+iGXOM=;
        b=l9ecApbSPZVEftWFfPIN3jzQz8mJkSbjo+On8rboD6dTjNHrROauE/PJA6RVumSbhW
         zqR1GeyJyUJwR+6kc3WimMUcN4+L1IaQxwJGj5c/Rxhcwl1DZJSI9Wrl97CSfmd3cZai
         fo5ShOUjdt7ba8D99afGy51VyG+V6sp1udGNggyP5b2g4E4aqZX3AM/fgYzmRwH597bk
         JpcClhLmB8xSXFTPC4euEbp5rxc8BaROghVaaiCDI/TUhrvKKi21XhrnmTK9RG4kkzDV
         Es6R51dYcwfq0VVDqvesgHB6ZztAe4F2E+VeDD/ys/+aJX4rZBC63Zx6OfemPFJgCCXM
         gfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757456545; x=1758061345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14zKoaawmL+tkb0ufqaatkUvQTDgaxwDhKzZv+iGXOM=;
        b=XCxx/EIokmNCS71VVP0Y6XkEFg4DCtfZPHKqeo62r021RoH/uTicFbZXi7MFRLYgGS
         eJqxgv05GiJET3outmaJ5jjTwmWkjVhvSh8aIg49oqbPyu3bAAOZJM70UpRKQrSDsrlf
         lNn5mTNga0xcydmEh6slF6I1ejcCquWTmciZOSOUQdqVub2nxBMmHythNzadcMN+EOgn
         AXBlWFh2AVn/nyGfJm4VTcC62/9hHve5qgxoupo+y7gGD79twSjBH9HptAdaD6mbJQTZ
         gKjyhtE8mFU876G8TSr7b6fgyeCft030R9Aidw0/Ce/fN8KcxNpKktTtH57V7+GfV07k
         Of3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEjvrq3YGqZO7UWewRNozGzKJG+TRSlCCYMdwSlFMeTgOE1OkufwW7qHB5Ki5xCWxzWr3NukYIloBecDASJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDfVJAhGkv4Ocw0t5Cq6mFgOHNl6/vbkx6h5hnki8QPD4qRmfe
	lubchS/5vSL3P2lA9fw0k/xFm+I/UC9Aj6BQr9mMi6ntmN+MJZQn7bczCgV2fElVZzLdubOESGH
	JWRB9zkWq+cn2SRJGueAhx3VhFRiMMd8=
X-Gm-Gg: ASbGnct9hLup/X4UQYccsRFr2h3XAAQym1H2r7jhWRrTK+6FPgNK2DORkn1nFwI2v9H
	f/+RiUCnv8l4FCL1M//8AU4L1zQT4VmR9Y6chAyxySD4608UHdNbAF8is7zCgQN2GrqZfKzZlc1
	Nk1B7tSeQKg4z36ZDLFLjXp+SXxE//Nt5ejXkeiogZqTTQrm22T2+DBDWNS6FPdOs72Bp9IsHFl
	cUCpltrbXWRlGkxOUBB/2DMQpGEVpwaEfduivJgrU2XFDLlWw/5Gn1W30GzISIWm5SHbx37FRBA
	fhICNF6TBkVkoWC3VcQ8ZTGNJmgYCh1XQoEuDuSc5r9qfcM=
X-Google-Smtp-Source: AGHT+IFDuCYxLQfV628Z7phqsroB85psQfsmvFVoNoEg802fzEjgvQkjguzByvEJEMk6c6/YwQXKAJTtY3UGkeA4SR4=
X-Received: by 2002:a05:6512:3b94:b0:55f:5965:e4e5 with SMTP id
 2adb3069b0e04-5626275d96bmr1967969e87.6.1757456544495; Tue, 09 Sep 2025
 15:22:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829192243.678079-1-ojeda@kernel.org>
In-Reply-To: <20250829192243.678079-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Sep 2025 00:22:08 +0200
X-Gm-Features: AS18NWCf2pIbJBXY_TohxQA27AKHeeu88lGrE2tNqE6BO5-_LqyV8PLVSxBYSKA
Message-ID: <CANiq72kS2OFaW+FEgSXGYup=kC3VxxJb32f+ZDs946NGREXUnQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Error improvements
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 9:23=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
>   rust: error: improve `Error::from_errno` documentation
>   rust: error: improve `to_result` documentation

Applied these two to `rust-next` since they are straightforward --
thanks everyone!

For the last one, we can discuss it a bit more in Kangrejos.

Cheers,
Miguel
