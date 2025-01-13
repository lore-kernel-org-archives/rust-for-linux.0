Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF431E885;
	Mon, 13 Jan 2025 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736770207; cv=none; b=bk3OZPheXxFp8kX+PF9mG6qthkuAiKOu5XGI0i47YT++TGx63HWAthMmBF9exq01vE3z1SszaQHMWklnd7dnlWW4ISP+DC8O+UB60bcCIHcMA1esJns1hyqsiXFROMNzx5uujRUX8nAOJUP14SeqkQqtiuuAFHnl+sCDb48FG6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736770207; c=relaxed/simple;
	bh=9PyoasAhtbD0fgNztoU4/z3MBxQ3OEwY55cuWC5zDLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZKii3cc3Mj9HJt4dMoXxCfkW+srr4azdT93br+LyJRdr8BWNJGG8XR/aEx0w07BOzrDMhvpFhzNPOALVnf/q6QvpR5bn32AZV8XXbmuHb4QKMxw/EYrTywjieVlO+B8PXT/cSyO1pNovn1jX3h3IUyme+ij5c+PiQxVwnewKCwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/vx6lfm; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/vx6lfm"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f615e14d0fso407618a91.3;
        Mon, 13 Jan 2025 04:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736770205; x=1737375005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQ99dgQyg/IQJpZzC9D9s54ROB27Q5lZgA/2N+DmRYI=;
        b=a/vx6lfmuxnLBxqZOAipwd2KILtHh9ULj0Ha5fuXEREy5IifvLIBjfL+gWpKKMR5LM
         harm4eF8r26yUQwoeM6DS4Bd0HlEFUILlS5HH3HOfkcxY5/F29WUR5bBym3gpshOJGsp
         ZA4Ir85FHVad/0thWWjLkRGS2weiyvTc7IX6F1871cSTM3FWT/mo9LRn5uQkhPSqj12j
         eY9P9IhUA+aLz8scaRqrCBqcFWsDFACR2mSheEikTyYaS9AKPsW3PM1BbI/8vVj0wy6A
         mY4Bo37VmyMU1Pwfl+sDu+jDYL2OurGpNMe8dbkhee9PlfOJvexQTd96wa48WabGDoYR
         H1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736770205; x=1737375005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQ99dgQyg/IQJpZzC9D9s54ROB27Q5lZgA/2N+DmRYI=;
        b=uszUpv+UEruiwT3c0+zxWCnhSoBy5qfB1V7ua+wH9x872krvNHN+OO/YGWAdypbWeh
         g/yDk8AMfMjc3tlj4Qieus9IgqZqSg4SccvMEITMWxsqKsXCxkmScreN9JyUUEs7nPyb
         PFAWl3WTBe3kTBx7OCAIl9uq8FD0yJZU6tYMzHl/Y1Y/+NXAoJ1UrkSEuD7Qo+z/iabs
         pT++9VosBqIZX5k3HwfQG7BCSKVhgAYVzzLerbBwh1WSpjNqhAKoXZt3LnSa5AjRpJWQ
         F/uJ6PWN8M10qtfZLoj6Ut0AaUF+Tn6t1PDr44vMDBRUlPzENLh3srZUNra+VmpFhYac
         gJGw==
X-Forwarded-Encrypted: i=1; AJvYcCUvtXU1FpIYzs/3cJkLdPn7IMYEDuK9HdkIkyqKcVpNC/KayBZufyqynEjmcarQvA72WC0yd9VPguN1aI1p4M4=@vger.kernel.org, AJvYcCW83Ve64FxenGKMyrv4yYeRfrrl+4upeF7qUUybv+oL3rs4MunUQwlqCwhOxIm9Sh9PVIta5DFsFSkCMSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhACm0l8kFLHFt6UXvr+sueFQc5cai6rwDuL02codHH36YNN01
	E3QS2rsMNaIqJuVSRJBqlfZQK3BPdbIOJ25mZmaDMKPNGiO7UgREAc5BLTX5vRLv+Z6kLuov0sI
	IMg1vJJnGkYtvkohUxHd5KdzMzsA=
X-Gm-Gg: ASbGncu96VQPc90qW2CZVMcEh9H/IU4vwHeDsXfMnBfjgKVVRSKrwjow9dzHZNh1iQj
	F+s7He75qjyVxaHJb88Fh72S9/I9aewn+bPf0uw==
X-Google-Smtp-Source: AGHT+IHpUhCOsKigvDB0EdZMr//8e4eJMoBNJ6SwlsFHmxZtdAzX7wws7Qz5uonqaFArszhYtnPlLiKx3ZTnwmgImRE=
X-Received: by 2002:a17:90b:5344:b0:2ee:6563:20b5 with SMTP id
 98e67ed59e1d1-2f548e3e81bmr11436389a91.0.1736770205048; Mon, 13 Jan 2025
 04:10:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120-borrow-mut-v6-0-80dbadd00951@gmail.com>
In-Reply-To: <20241120-borrow-mut-v6-0-80dbadd00951@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 13 Jan 2025 13:09:53 +0100
X-Gm-Features: AbW1kvbz2FbatZsHbildPSGSadbIvaTcCNVbvcYPKejleSDgETAqzSehGUuQV_w
Message-ID: <CANiq72nLY_Qri0Hb1un2BB3+oLkCLkiEi+h0r_NbnyA5B4Lx-Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] rust: add improved version of `ForeignOwnable::borrow_mut`
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 12:46=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
>  rust/kernel/alloc/kbox.rs | 41 ++++++++++++++++-----

Danilo: unless you don't want them, I plan to pick these (an Acked-by
would be great!). Thanks!

Cheers,
Miguel
