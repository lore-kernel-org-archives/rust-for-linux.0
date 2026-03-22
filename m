Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AEE2C11FD
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Mar 2026 23:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774222627; cv=pass; b=dutATGgShKqqijbFamHhORbDs565+BLcCvXRmhdxyeBU0C2OdOgTc5Zc5sXTKGpTcwpgCcqpZcqSZKohrvsXVIlSuXdnxtBMqTQwvGMK2zvDUi89Sf4EzUC6sQ9ghYH8aB9ofSa7Ej+VrkXp6jfRqwKIA4RDsFhgH01GhTfEEx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774222627; c=relaxed/simple;
	bh=d7PBNXoAWJ9oKyq5BMHE3IFpACdy7SKGVvq01Y8kijA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDWYc7uLlutmlVZ6jTa7ZmnVzmYWxyw8gj6U34mouQwvVYcBk82KbqiWP+o/NmS/NoOia6CVsFtCQhApckL3GmLBCqe1vRCKne653uA9D0+h42iRkfw7bLEsOrnhukhtWHFHS06FZkLznMrpGUl44FeUXZPcw9oWiXmskfTpsU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9W9ZA8q; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9W9ZA8q"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c0c4194b2bso127262eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Mar 2026 16:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774222625; cv=none;
        d=google.com; s=arc-20240605;
        b=f6o6WjlFuWpuypW+1r8IP6eMGM7/oAQ3Uq8dySV8GUJFU5vfzfijuOccNyjp66Vore
         qdKkfaBADObciEgIz4cYeukGIpeqkWpANET8zbbvAD6LJMaK+iMyXdNujB6weMa/7j1X
         M+CO46cIZKXWmgFndqCcoQVTs3wIqVXNrHFJ5fNwGvb7EtsHZFRb98YQajyMu7qyddbi
         gHB6vB0jD8q4cgUg+zlpav2QjyU5kbG8NxiF1U7b9xkUC4o8GrsFvw69qp2jL7bdCnjd
         tATIIQjxjpMhl2v+rNvdTSc+euXIB3sF4CAzQqAXkqLtSihk+NCycpEFUX3d3BdOebIr
         SiTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3TFkIH6VCknZ8F6Tfn8RBWKBNHE4UMbauIDLil82xYA=;
        fh=mNIGbH/bOJt6FVlu1gpWoQ5w41zrtxTyucOeK9snsy0=;
        b=I60/kWxsXbmFUhYV8gSOT+Dud6qX6zTnTq04NzI84dLXK3eCW9kaULZzh3Z5odnwKY
         y6aa7hEdtzc7TWx9V3ZSutubNpwGT9H3H+zehjC81PcFOCqRgZ0W3CivxBdEnXenVMcY
         XhLSKh2uHhrEsobSVldeUeVerly/Mq42FAxPNq0rzhJLF+LQFUNdU6QWoHSqp4pE34FR
         gUEcj6I45NRI2L7ZZlqWWhPpfvVsxbN+NzIEWvNUFooXfgwYFzygLpchtzZE2h4dKTHF
         c817MmzKMU7NYPfq5hvf5hoCmaHUh4IIt26Ch3eN8ytZV1/Xt3mejcdlR38iwSobQKoM
         QBtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774222625; x=1774827425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TFkIH6VCknZ8F6Tfn8RBWKBNHE4UMbauIDLil82xYA=;
        b=L9W9ZA8qmmEzGtyrSM3MEliDmwlIObTnci3aB5OAQoRbdgSAy7xhuBYHXrJV5oiM9v
         Wp0rCmEwlcB/H8QGyyk4ZLsRHC//PjUpLhTFLdvk1knlcB8Nkgx86D1uvXmUH9qgVocn
         0OAXP6ZZC8vWjQ70trZXOlZ8R6ipE22cUQ1aG10MGlYgSNjNh7UcwoRqY64gjINs/vJU
         EkrWceHElYxLxDsFTiup+8dOtD+Asmnlmd/ZfIE7FrtcgTGxRSuls8h3FtPtqJdL6VAV
         bS6LBL5d+HehVK6la2mv3ugNnmmZPPNWvn6wUhqMGZfypGjZgoaVyJ74XAZ1253hQRe1
         KPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774222625; x=1774827425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3TFkIH6VCknZ8F6Tfn8RBWKBNHE4UMbauIDLil82xYA=;
        b=YtNJiPg2vbM0BH7j8qQm23Ng4MkZsqAJNq9HXD3qjd4DP4y5XpyGSedBsl6XY/8wCg
         bY8u/oazpOjmzPt1+ttmQmavAvu8Wm8bi2hStRmJZr20QVRlbyNu1DRHe61KBNLaglSt
         +yC97JcmiOXzRQmIusZZ/ig208Wr3ujtKQZOXz8on7LhZMQ3kDAcYRRfMlIMFZpUdo+W
         7qUQowTgVhY1I2Mzrzu0GUadA8LZSwiO+orUQURO/DyLoB3vYDef0SNihAF7n9ijFvf+
         fJRFel4jerKUffUFBBCRRiREaRZ2rxaf23sCx7bhQgXwDvNWT9N6x3KnIwDv/hFsmtGC
         Ek0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTLLRIgQsXqJ7+yHeNH+OHbvYEt0nSTZMFtG5og0ZYuU9wnZVAPM7dueaTIRn9VvJseZ8MiN7KDH3z22SRVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE4ZGZuxH4HkEzvLhqYE+tezLX6zbmKd09MUZTHK/RYXjrQxV9
	vOV+QNj4GZ5V5edkWOBKboYsnGK5vzwUzc1PlqbwPlLZ6NoKV7t5wTObIay5J2fNyu8qIQJwOOm
	AwvnbPaLBcfAO0ZrrYOK0hvQTyAgkaEU=
X-Gm-Gg: ATEYQzyPJxIexHf1jguCryKuDlKkcswpESfhE2ysFksxgz0QMSXQtkYjF8HEIG/4MFe
	UglH8p5Wqhctt7vqnktS4MNdk1VR5GR+HMoYeNUj8Syv9+75h6fvNk+f5W/ODoZ7aDGI+YNd0dS
	YoEn3SLN7AG3liUUMAzNU3bDoBL9UwCb2Cbjxp4H2d/xG09hbUlw2mjz4A7f7TEYK9B3aD8xgbp
	2fhzevsH9mBBw0/PcMUz+Bh4HZmRu05VzUmvscBzcYse+j1lAqbd56zCp87DFRgxm5tqman20AW
	AB37YjtMtKhqsK6t/sj7RU4s+q2nnUQhQj568Nx13ln1qONvYxGJRFprfRSs6UoFGid5524ZBoK
	YexRUPD+lIvxYDhuOeHxdQig=
X-Received: by 2002:a05:7300:d705:b0:2be:681:91b2 with SMTP id
 5a478bee46e88-2c109784e48mr2354158eec.6.1774222624794; Sun, 22 Mar 2026
 16:37:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org> <20260319121653.2975748-5-gary@kernel.org>
In-Reply-To: <20260319121653.2975748-5-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 00:36:52 +0100
X-Gm-Features: AQROBzARASkmL1z31d-SPolLvyqalzs_slFQDBddlVkhvWh2YgJFEiUU-Y1iEYQ
Message-ID: <CANiq72kZH-AX=QQz2V+qCfVzMsUEAPan=o1E=OZOAnivj3L3HQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: make `build_assert` module the home of
 related macros
To: Gary Guo <gary@garyguo.net>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Yury Norov <yury.norov@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Yury Norov <ynorov@nvidia.com>, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 1:17=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
>  rust/kernel/net/phy/reg.rs           |  8 +++++---

Tomonori: are you OK with these changes?

>  rust/kernel/num/bounded.rs           |  2 +-

Alexandre: are you OK with these changes?

>  rust/kernel/sync/atomic/internal.rs  |  9 ++++++---
>  rust/kernel/sync/atomic/predefine.rs |  2 +-
>  rust/kernel/sync/locked_by.rs        |  2 +-
>  rust/kernel/sync/refcount.rs         |  8 +++++---

Boqun: are you OK with these changes?

>  rust/kernel/xarray.rs                | 10 ++++++++--

Tamir, Andreas: are you OK with these changes?

> -    transmute::{AsBytes, FromBytes},
> +    transmute::{AsBytes, FromBytes}, //

Nit: We should take the chance to expand this.

Thanks all!

Cheers,
Miguel
