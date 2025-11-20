Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84BD2C1788
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 19:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763668559; cv=none; b=R3vb2kewQwKr+bGTTZNk+QQ0KOSzMlmIYBaAm/iL/PhqZ2GXnccnywdhrfn8d9x9sY8ihC0SRh3WPaodmZPvVvyjNxm9mIlRGjOwFuZyj35ngiAwMkkKWiEQfJMrpdWUttvIH08YadyJFEnkth5BA4LuyWT0mQGwWB0fp3y0beo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763668559; c=relaxed/simple;
	bh=awC8H28cyhE3GFUUMAVAwKmgdAmub9Y/gX713QaW2ZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVtJc8VAoJ7mDeFuWTBhDRF59x3/QPxxrW2j+qCeC664PHHYh0FHndZ8Mac/YceLnifvSEGjgVbc+RkyFNmgKA9lIFqY8JS4UDcCTjVj85n/55fygTIqNdhbLYRVSrELWAlIZaBKHq5EGbmTpqtWZ7ht1K3rUcT7q51lsLv5Uf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/zJkydW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/zJkydW"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297d6c0fe27so1492625ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 11:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763668557; x=1764273357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awC8H28cyhE3GFUUMAVAwKmgdAmub9Y/gX713QaW2ZA=;
        b=B/zJkydWwv9nFLB72erdj1HJVv4w5801W5KLe8y9f5118tQByqRH/243sywFNV0wHK
         XMar0j0efLaCEr23t+kt99nOxj4peHEHlnuIkPJmo0OP5hKytItvVGLHaXINykoMP1Eq
         wDfBv0RukMjq4u2snGM/jd0UvQg35UOXcbdMSmGX3s3y+/ENGlYARQlCOBpc4ITzzCPB
         X9AqZjfa6367QQoh3kunbP6jAF1s7mkVC76imPFgf+G2J8eE0d0aD++5FFPf4qmH5oi7
         h4yzA+l/ZRY+IoivUTwjBc6vSt9FAkDKR3COfd+a7+EWUHfIDIwCxrSBZZTcIUkY+u/o
         edNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763668557; x=1764273357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=awC8H28cyhE3GFUUMAVAwKmgdAmub9Y/gX713QaW2ZA=;
        b=kO8L6XiwR9OziYASqtAgqQ4zOs0TckJSF0B1kuBcwmZMU4JcKw2B0wj4N5koSkV7k1
         Z/+4NumfWclGOyZwK0Hhcqk+ERbLCJ7HtFNPVhlh2cFkwVfbaRXTxbO1Q5HaunMf9bvr
         IscMqDDZiHdz9xNl9LZvtIWvxN5Qv/uCRYi+JcECk9ZNwUMn8q1xygfIMW7IZkGbfJWA
         SyQCFhXNLXVHTVRh0LAc4YRJLsJYEFL88wVbJx+nBzrOn+GxCc/9GERHfYRhR2id8lqI
         fhihvCKwLcy8tt00wy47tQDaUF+rYkIE2ZnrRM0XvL+wgkkX/TPKPQFMaySABoBJmoCf
         nvIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi7mqR6ymnVZjb0PcSh6u2g0fWO4WhWUqw5DniNkFL2jbqeru/k4Ig+PiGggp0C+cyEiFA3BCsuJnqy3o6Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlr9wzxJu6Nk0UGA8I4/CYFezwUi59eeImAdV5+/FfamnC3Vy7
	NnuyKShEYok1jhaaRAwqlCMDaurk+LZFPpvaD8V0VIH6+Gq0BSBmmgEl0mP1CLEwkdd4vWML6g+
	KDV6vU6M58MKel5CARoJ+fC7mvx/bFzI=
X-Gm-Gg: ASbGncs5soJoLIqHKoM6WlZy++U43MMaIfyr9IzZEc4ZeC9hKCD/x3E6rVjriBAocxx
	GItxn7AnGA9MI9kYkDZFZ2DKni/j/PKvpVLI50iHycpk4mst+BQZQ8jJ9Dm7LRdH90h90PgvitZ
	KOth8jcc4bKZrX7YnV6LWEuIUeLp02Kl6cwEhWG51ntEYLgmQRUBoimhcacnRunLWHWfS3g2rsE
	LPWxUvN1X4okwyYWaz4qK9RWwNBNolvOPB29ZR7k8gFj/0QEaIaDalowJR0UyrITa6OKvu0TQUM
	8Mzwh1ltPc1g0TT2+pmd93U+diDyHfAG64qP4MLIRrSHLgvW27gEyCLgBTV4PzwA21IxC++GfWn
	JV+0w7oVTFO0J2g==
X-Google-Smtp-Source: AGHT+IFYtuBZ9R+CWl+RpOaqyslYJ8uhKXfKYfosrSeJMKCYVP6X6UA8aMsRK3q9+96YJao7/rJfCXoSqhNvkRAzz4I=
X-Received: by 2002:a05:7022:4426:b0:11a:5cb2:24a0 with SMTP id
 a92af1059eb24-11c9572e150mr1088196c88.1.1763668557030; Thu, 20 Nov 2025
 11:55:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120193656.142234-1-binakugent@gmail.com>
In-Reply-To: <20251120193656.142234-1-binakugent@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 20 Nov 2025 20:55:44 +0100
X-Gm-Features: AWmQ_bm1pDGocWPCLsjE2QLqdAi7LazdbyrTmIpn8HquXX3WMjLs9LtiRsSgN2o
Message-ID: <CANiq72=j7EOCLjboXKck841F1wfgY1eDQ5DsTZMV5PsGzgRADg@mail.gmail.com>
Subject: Re: [PATCH] rust: Convert PhysAddr type alias into newtype
To: Gent Binaku <binakugent@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "open list:RUST" <rust-for-linux@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 8:37=E2=80=AFPM Gent Binaku <binakugent@gmail.com> =
wrote:
>
> diff --git c/rust/kernel/lib.rs i/rust/kernel/lib.rs

It seems the patch is mangled somehow: diffs appear twice, and the
deltas for `rust/kernel/phys_addr.rs` seem to be w.r.t. some
intermediate state (?).

Did you perhaps edit it manually?

I would suggest re-generating it with `git format-patch` and applying
it to a clean tree with `git am` to double-check that it works well
etc.

I hope that helps, and thanks for the patch!

Cheers,
Miguel
