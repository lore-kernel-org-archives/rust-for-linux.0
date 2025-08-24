Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57E8267AF6
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Aug 2025 14:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756044454; cv=none; b=ITgl2QFadIHJl31QhaLsBD2P1016y8q3Yst3njbD4N/FSCKYQYQ4rZ5Ec4JdU9dKn1QpuaqhrZFUkz+KfISvpGuODrsl5U2/gPH4VCjlUzecTWKLCdqp5wHWhALAb78FiGltPS7j6K5PeNR8IUYUKmwhxL5tY6auj786lgVq1Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756044454; c=relaxed/simple;
	bh=lUELoFUFEP5UzgVaaNNxnVfsUEOMPizKcUEsIpXZ08U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MlJ5TcHZ5DPfxMMVERKW8uly92H3uQyABPZbeb0j2p1lRwZjMJG8I3/XiHWXeCkwSiIO9CVumfClaaJjwPjaeDGJ5iDbcoFhEoiGT2KqIOyrZphFvKR+eiH38kW1nr26pjJGbfv7QI4INrZ95pf0gtD9cz+L5B4NsyHre1E+LqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clTDOXoG; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clTDOXoG"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b47173edabaso614248a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Aug 2025 07:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756044452; x=1756649252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUELoFUFEP5UzgVaaNNxnVfsUEOMPizKcUEsIpXZ08U=;
        b=clTDOXoGUxEvcOQhpmhA7pzlPwX/y7bVpQ7qrUSLWVKqtc2RXMhUeNYzioo9bAQ775
         vvevGvGVq80ETAVVoGxJPWQQ6o8UUgPW16Wnrud2Q4H1f5ZbF6Ww5QZZzAP8SzGILNkD
         5EoaAkwpKOMVyxPzkUlRKKxRPpYydwHds9yXfHubqehvdj0i0Zb4G+I1sM06lEOFVVtP
         JWprKXIqs5Oiwft62AUNg6Smdu1h0VM4h6PyNsyLY+VnnScHnK9GXX/AQovS6OR+X+p2
         U1t8ZH0H7ijvBUHz1kGB3w2LRJzkXzHjbF4SY8Hm0LzDMxNz8SAhQg5BY43/kWuebbYB
         uMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756044452; x=1756649252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUELoFUFEP5UzgVaaNNxnVfsUEOMPizKcUEsIpXZ08U=;
        b=S0euFFH2OPTgsYO6yZXHhQLCR89N7Jb6dqQBZ0Q0Tzyv5JfwrCElLaemIAiJ+APlKE
         pd8mhQL2+Ww0H0FZHbPMP6U4AcXrmhDLzHTiNje3LYOPcWUfpUNDX82eKokO5sF0Byyl
         xdy0Qn/cHCYNgEw8lvmF9C30t++3HS8pSTO477Xvqp7VPypLZkadvdUvgx0TLjxd7kKv
         9/p1Wy9WLZWbsNfVsWNJdGw1ybjrlHkKmls/kOBxUz9EV9IDVj8d3BktaPAwH4mki+qM
         bSdWPK0geRIAaREbE/S0m1C7Vo7H2/ay926SecYajYKulOmEY//Qa2Q5gilBEbL4Fj9e
         R/wA==
X-Forwarded-Encrypted: i=1; AJvYcCXQEnFOvwzAL/s2nUpFGIAYYf4aWwD8bfbejC/YdWUJWfVDmuMmmXKBuXRl0hvH9dCtZphzomWmRK9sW3/uJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHjXWSmOIx/o04/6AhMhfe+kbeFUDJ4YvE3qDR8ycr/bJhdJ1p
	6zDj1H6aCAAwYzkmynp8xpTJdZCafnBIiC7/yYvF+0c+qTR0VPqb526DgWDchVRRAvLkEW7szoA
	hKux//fsCa8Xrwompp6fzyWAsRHIn2+s=
X-Gm-Gg: ASbGncuxiNJQgNdK9eqkrPMyUwIJrGXv9BwOrgj+NnXAaJkNxTvz+Nvr7X6bIXq+6/g
	MTOFZYMDfT1NCRcFf1RoOq1wDXjKA7EMR7HaQ+RlQ8xd4VN9LqtMgZq+nNnnyCogjy4Q80SZFAg
	tGkG8Wo2nfgjJC/WqEUNE8gdWN8+L0D8vm7jDsdWAZ+HnCUA7MK4rvFoVIK8Hl6L8P6XVCIm/zK
	yUYbJn4onzFfzepI2zkhhnIPJWOy1N+7RK7frZ+KLVqU9IeHfAOb6nELXuTgj5bfk+pUeG/qSRs
	1O0R/RDDsP6KIoSwzFN6+dnNbA==
X-Google-Smtp-Source: AGHT+IHBiSK3IgbOAUrwW1xdDFa5wrf0+mgCTyPnctivvoo4NRrmmQP7Wq9YYqtyz/Io34yuczVrJX8M2JoGFz6RscY=
X-Received: by 2002:a17:902:cec7:b0:246:c843:6e07 with SMTP id
 d9443c01a7336-246c843713bmr6435385ad.8.1756044451766; Sun, 24 Aug 2025
 07:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250824120656.208978-1-dakr@kernel.org> <CAH5fLgjkqcyzoZD7PP2i4g4r2uqpdbDKVW5hLfm6c9ysbxkPuw@mail.gmail.com>
 <DCAOH44U57K3.2CVDYWF8MJBWL@kernel.org> <DCAOREAIJOR9.2N5JW0SC9YT93@kernel.org>
 <DCAOZLKAFK8Y.43MJ1XPUJ1OG@kernel.org>
In-Reply-To: <DCAOZLKAFK8Y.43MJ1XPUJ1OG@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 24 Aug 2025 16:07:19 +0200
X-Gm-Features: Ac12FXwnQf3QORiB3XEfUP2FXjiaYv3vFlXfdEVSEekf6wgvktBn3kYEmZrNO9k
Message-ID: <CANiq72=Xp-u16fboZJvdRZCveRtAJLSTsiJMMDXsd2saKCU26w@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: add missing trait item MIN_ALIGN to Cmalloc
To: Danilo Krummrich <dakr@kernel.org>, David Gow <davidgow@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, lorenzo.stoakes@oracle.com, vbabka@suse.cz, 
	Liam.Howlett@oracle.com, urezki@gmail.com, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 24, 2025 at 3:29=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Actually, I think it's better to just do it:
>
> Miguel, mind if I just apply [1] and [2]? (Just recognizing, probably thi=
s was
> your intention anyways?)

Yeah, since 1b1a946dc2b5 is in the same branch, and David already
reviewed the main patch too, I think it is easier for you than trying
to deal with all this otherwise.

(Whether applying or rebasing both are fine I would say, since
`rusttest` is not a big deal and the chances of people bisecting on
that are low.)

For the other fix I sent that you already applied through DRM, I think
we did the right thing, because it was not `alloc-next` and it was
fairly trivial, so it made sense.

Thanks!

Cheers,
Miguel
