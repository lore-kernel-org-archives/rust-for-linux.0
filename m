Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BA71EFF96
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 08:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755505446; cv=none; b=WUn/I7zPUTV1Uj155l+mBZDMMdv0Q+TcbDBsytd4bGAf29o7VnGPxlkgY9VexsKGIN/kLMczIod54K/V8slEYOKF7Vhz8ivtU5lIAXxDs0kKjbhe3gq7zo5DN8g7HmEZR2da6wKE12t+Lvv1P6iqRkYjuDam8XCSljxiXuixhng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755505446; c=relaxed/simple;
	bh=IzNME8PqBwqoY2i9L+WEb+gYN2gdCsJYrCvsvccSGx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=flwJxDA9q6Pje3S35/TX/6QckpcK9VhzYmJmQaY9CkmbfJn4LZ7Gpi6akBxCLCK+1Yo00SUN8TmMD0EPALOfjEgMTcXIHXLrbfzJdR8ENupNb8irJQbaCR8PFZUK4Kr9qEs7wp3cg1UdQUAkHfvar7usiFDGY9EyEuhhGWJZjls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XH1KXdfv; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XH1KXdfv"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-244581cd072so3346315ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 01:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755505445; x=1756110245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzNME8PqBwqoY2i9L+WEb+gYN2gdCsJYrCvsvccSGx0=;
        b=XH1KXdfvulwn4zgp87mdMzuCZe/YIjJTvuPN74tGrQW5oKUObKrnDKQHfp2SB2nuq8
         20FR4gtCKyhWTF7DQvgtJM0sFivNLZUqQWUDjEffsEWP2tLPuAuPKTJKE1NpAv3CeLWX
         DMpshXvXZm77SH0oZiYpUqzcGbTvVW04KHEAsOEhuK8Eii2n0jsZPBZmCZPvVPpiN6Pm
         mLqr3dJS6LHZ0t97QfCEQKqDqKhPaavJm5Y+f2cILcvF40lGonFc1Mt3QFWVa1vsmL7L
         gpQfir8/S/wluiR6aLbkob48LjjlonxJICBXSkirKYw9u/wqp+h6O+786UJzCLu7jp5B
         MXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755505445; x=1756110245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzNME8PqBwqoY2i9L+WEb+gYN2gdCsJYrCvsvccSGx0=;
        b=mlSKAYcnC/3Ix6SVsYpKYvR8ZbwF8Y+c7/CgZlTAseJFxUsU6MH8wrTTfWkPC8mvqk
         9A8t01qlxtrBLxuSczZxZvmnA8EdhjrGZf76u6MQkK1cGZFilTx7RizqWgBAIfNXJjkj
         OG5tK57vUfZBtJ5FrWiGbxVsHx07V/HNJ2Bg9ofPkD5KcM0CbDnLo8zmloncVeHWdP8q
         e9axuKyoP0713iHAMuyL2z+QjvxANsTH1sRtPfzzkyONoTlc0zlrh1tDths8pivMX8vX
         yMj6nMkUACsjlUZ+NQ9n3hNlxqbIFJErGoWRgTy/L532uW+2keMGYWkef7Ly0CGGuH0n
         ZYfQ==
X-Gm-Message-State: AOJu0Yw38vX7ZBiNuHspUrbcUossyiWV/7bhlSYZAJXvT7WtqOAATmCE
	RrN4oV11wj4cS/z9hY2aPQWUJNwFrsUaWOUSGvKUacC+dML9NojDZSLeCHzfvBdFg28Uel0VFOx
	9jA52/VXNlNbJtegtCLP+QaquO+WOYHQ=
X-Gm-Gg: ASbGncvpvO68AB7IJvPv2IwexHp2EcSzwX9wTGsxtWIStdP9cXHymSQkU9Ms1yVvQXU
	sSkbszjUSS1pquIQ6Bkc1uuNzv1lk78eh9eIGRoNYhOXoGi+QGTo97PHSLYukAlvl55CzUnLCLD
	sERyzYuhrR+D2vDZLQcWYBxybh4cuamxlWQaMQH0LfD+ub4MgAyZmNCk46sLAcG36M8ZoST5XOu
	mpDyDQZHeyvSVbnuSk=
X-Google-Smtp-Source: AGHT+IEnXMfxWj/uyVvOP6fWrBLWE/k6Z/ZqigtSlIWyEufICXqSgSvpR2T5EwW8xptt8zsRW731TiHa1gKAisHB5r8=
X-Received: by 2002:a17:903:183:b0:242:fcfd:3f94 with SMTP id
 d9443c01a7336-2446da0fe10mr80939555ad.11.1755505444632; Mon, 18 Aug 2025
 01:24:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818050251.102399-2-sergeantsagara@protonmail.com>
In-Reply-To: <20250818050251.102399-2-sergeantsagara@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 Aug 2025 10:23:53 +0200
X-Gm-Features: Ac12FXxCduv7CFpvFZ_x9oxzYB1qAFIsKUW45Eg_PkQDxQNj9_OdTi6CAun7OTo
Message-ID: <CANiq72=KExEZUbeTZiC=OPUG2gLc5eg6WFzJRy=OCFBGZUXeug@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Initial plumbing for implementing DRM connector
 APIs in Rust
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 7:04=E2=80=AFAM Rahul Rameshbabu
<sergeantsagara@protonmail.com> wrote:
>
> I did toss in two doc comment cleanup patches in the mix. If these need t=
o
> be re-sent individually or split due to the multiple Fixes: tags, do not
> hesitate to let me know.

Thanks!

Normally, if they are independent, like in this case, they would
normally go separately. It is typically important for fixes (and
especially so urgent ones, of course), since those may get applied
into the current cycle rather than during the merge window. It depends
on the timing, the subsystem, the fix...

For the second one here, for instance, since it is not critical, we
can simply land the entire cleanup in the other series soon, but it is
definitely possible to get the fixes in earlier too.

Cheers,
Miguel
