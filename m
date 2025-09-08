Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6464A31C56B
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 18:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757356775; cv=none; b=EnVbsBspIQ/wnyXg9GPP60dSlqZ3d2yeKtmf1Lq4Adr+GHnXRrY3EZVqHbW00D3DulOOpfIOFqhBpU5WeIvNIMr8hXWS2agIsLsi+t+qijNX2/4gv8jGu7iwYFfUdPQXlZ9QTRkRWpS7V8vvSCNubJyGAWdUeVjbBq5+CMcdCu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757356775; c=relaxed/simple;
	bh=kmxJQoJMSmOg9mfzaXyB6hIps6CTnIky8axu/rkLStg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7hzHE24emC2AREUvEc+bSMr2t++TBTbTeJLdnu7bxKM5+Czw1HWWLZAUVCQjy4TLPU9l6s1cm9XUqV9R1nnRj+2lt0At4RbYJP4oWq/WvlnzdKMMDTWUI2EXQ7aM2z1iUgDYkQYzZQz52pAp8L+cgLZKLe2yIgWOdgOzLfkkY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHSGFz45; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHSGFz45"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-24b1331cb98so7877955ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 11:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757356773; x=1757961573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlDl0GYAKs0fuixMm4wXNiDo8gjd2eKeGozda9fduYU=;
        b=mHSGFz45KThlPHEHpnMLMAcL1LLmAsCz4T7eiyJa+TgNXzzVJYLiVIh1bSlLkaZSms
         gY5I6U49k/IJqx6rt1REJWnK+axUd3dvSZpbQkVfIhYNdqNi+57kIg2QF2xRoTPU9Xuw
         zRzkuZN6xBiF2aYRbiViyKGkoiyS2gslRE3pJwJZGtjhv5dnCJ8tAQ1ZlrmL6R5Q/CeH
         d58+mDK8Oy3uSPGDJ9zondqKNkVit6N21RKtZUDxS5asaGQcvun6VAGPUt2BK5iPwz7J
         rzmvLTQJ0eB/vMaZN2FObWg5x3ABPZ4Wm49Z9fpfZkQPC/FwtK82rD8kAOXflxT2FaZi
         Adcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757356774; x=1757961574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlDl0GYAKs0fuixMm4wXNiDo8gjd2eKeGozda9fduYU=;
        b=gV5g5hIq6Prnp41dPq3ydsMTww/1GUrm+YBRLDpdUzAX53rrgLJXF5EizdLJJtUVzT
         08D4RNnlIBVA+fAcWYX6BP46c+JH3KDGb2G/RcXjkth9bl9DYIZ9eUENBAgcH7hPwQSt
         nR00DQCP9Oa/qsci65s90IBlZvgBLkf2leSwr246htby2FnGf1+nT9T5GlclciyEUrpI
         YCt1kU4jClcyB15+ZqyhZwGti81uqcikzGyfpwVbJUJ96jCySgW0HzHCmE+eEA7YEGil
         scpfYkUhBCIi9bu1tM9l6b5lBnaD2TW/961I8Q7nD8nSDPKcna0MemMwM4pOPeJOZO88
         b5uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnwPAhrMDtSGiGHdaImFgKJWxGn5samxAYlq1OixMD/bXzyRscYRLveo5xB9TrSYJiLMMvlFNkt/hP528Rlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCjnaLI/BOBc53jFZWLBFQDAlyNXQTdpCRDLzvI/HoaMBZRdw/
	4DgkRb2CKiNIepRtplB608+BMF0DKGljH5pqXiL0uwwSyDVfg7ffW/PhGh4ZRdOkASAE7Xrof/z
	GKI8S9FuM+/gTIR5jHJPnoGQ2kbvnLjM=
X-Gm-Gg: ASbGncvHV9xdQoW38jP88bHaLZZYvuj2lhXcRZFe4enNeNWuBjVF5b0TDa3oKpYh3Df
	cI6uUerUpKmiYyb0uVd/3lNGZhW4UhyfRPEACxXrYPhVhL/FHmfWw5X+HNs0kdm0PR06SmHi6i5
	6CM4ygV+Bhf09L2I1ZkXbEZNKP6EgTEc4/u+wVQCFwJ0JJbh2fi2c7I7ebVUgJRdEbqa1Tpepan
	yNh8Qi8kgvA2uSvXClp7VKNDO88IpZsSs7+vCgjjckcBVntoPzlyksPToFx6IPKQ3AG0wqLEtA6
	lmkRG7ETWX9Glg2PHVa0RZE4MrhHxLUbnGUw
X-Google-Smtp-Source: AGHT+IH29cFvlel6V8ScTGbGDxPZ7K0P7UvZ0rL/JFEyC2Ho11m+AZ7lO/QBBk0RySgAp1Ke1kTHpxcO0Uo0l31ICC0=
X-Received: by 2002:a17:902:cec3:b0:24c:7bc8:a51c with SMTP id
 d9443c01a7336-25172e31d9cmr69938435ad.9.1757356773568; Mon, 08 Sep 2025
 11:39:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-5-joelagnelf@nvidia.com> <CANiq72mx7NA1KD5fw98kba+3oENHW44QXVGO1VmvPPUKin2LPg@mail.gmail.com>
 <a2c990ff-e05c-4d09-aaeb-5a2fc16ecb77@nvidia.com>
In-Reply-To: <a2c990ff-e05c-4d09-aaeb-5a2fc16ecb77@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Sep 2025 20:39:19 +0200
X-Gm-Features: AS18NWA9wdmUAfNEz9N39DTUDKozBSdy8jPLQYkAjRGgYpyBnhyvWqsDm-DJFzA
Message-ID: <CANiq72=S-HnREWAK+8kcJkPabPHSzuKD4k7251+Zw-b9==0-zA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] rust: Move register and bitstruct macros out of Nova
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 7:06=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> The issue I ran into is, without adding it to prelude, the users of regis=
ter!
> macro will have to import both bitfield! and register! macros explictly, =
even
> though they're only using register!. I tried to make it work without addi=
ng to
> prelude, but couldn't:
>
>   use kernel::{bitfield, register};
>
> Also not adding it to prelude, means register! macro has to invoke bitfie=
ld with
> $crate prefixed  ($crate::bitfield).

I am not sure I follow -- macros should use qualified paths in general
so that they assume as little as possible from the calling
environment.

It should work without the prelude -- what didn't work?

Thanks!

Cheers,
Miguel
