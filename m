Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5903336ECE
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435725; cv=pass; b=HU0MMEHK4uQ8HnuE4jVvRSoBIKA/nDF9lfTSh5xwxtJhfBNw0ao89BZBSg/loFhmyqC5iZL89bnfC5+De2xJHmUJrAU4jaVVKYVynlqoqvzp2Q/l8fyPVyaVkkDUb3JOUVwJqsYtSbQdLThPgcSBqOcwYmbvQVQCTAgVTqTB95E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435725; c=relaxed/simple;
	bh=XeV/7lzNuLy+dkaaDAwnMUXnGAlO7NMOF3iEa0s8E0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=owzprKkYTl6SlybDta7WfBjx5oyQ/Ibli36EQ50fxAKkeBN4sXwAZ74ItwqUEHn4uNB8x68Xtl5BooecvgmSYyCf2Ew4zZ7gtqJTSX96tmA6up5CKcvtLdfCgp3PwUB1DWkZiQSbFRTGB5IknkXmBSXdtsZXsdxnyqFcKj+uy8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPaJf+46; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPaJf+46"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b71310e8ddso161550eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 05:55:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769435723; cv=none;
        d=google.com; s=arc-20240605;
        b=KXoqnoSYoETgrF2iH753rvr8v2uMjrhrmJTbfJ8Yp+Lc6bFrb/sOaJ9dnP9lASmrTQ
         l9+C/WC3kHJaMRDhv0Es29YwgpIV4wLdt1UJJvnKHZ1tufFueLiTHCSbITZvfY3Wb97h
         WbovUbtaygzbfbl6MkrzpFD8f2ro7T1ElLOHr/iQmBoXb38TOGXQt4hXRcarHicS5iNF
         eno0Odx5W0JkI1cU3xwN5gm6/qfNZbRoEt1b3XTAiVKrXXng2hSNFFvOwJKGhnx5MXTC
         Uy3ab/7Zu2gpu8g8fHTsrjCdWk70FYf5NVOWX6rWAu2BE2lPWUXHCNNvXkdfw9mcHVDv
         DMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XeV/7lzNuLy+dkaaDAwnMUXnGAlO7NMOF3iEa0s8E0U=;
        fh=zSsjWHlHquUQUOwfDGoaZVy+NaVc0ROvlKC4nrqOWWA=;
        b=TXn8lgbr70aXwQpGIXEZLZRdo8ROFgQvZ1IQCTjjumeBi+p0ZNminVnA3UjEgv86+v
         vLwXY9dHLYIPVU/6HxBPAFA9yZrbA0W2WvVxIaaNIDP5HwcZSYs/peNsn4Nw8WEZcWl4
         JYHLxv8K+waCRGSq16bQJgVWo67iu9FuPHUM3reJfzR/PFGUmFZanQRYRvClyJCRjLO5
         tjv+LodmAdlYxE8t+96GrTBe+d0jqmM68D1C4XkZMmuUetw17H1QdVlZWmHRMQpyDAVo
         qVs1Ay+bZdplvEB21Ziam42bpexqYLS+Fa0QfkgZiEkGU0ZVAtTffwZ07x8qZ8ICkxkQ
         79vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769435723; x=1770040523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeV/7lzNuLy+dkaaDAwnMUXnGAlO7NMOF3iEa0s8E0U=;
        b=jPaJf+460vrkRdumGv4jdI5DmmUOAAvBHVMiKEEdiRF96d3hMgu/jrBgd8mCrvUvE8
         rmBo6eaaHWTaYMsSrLPPRRcHUx/ENO0wa8QMI/MvDa41M1msOjknJCj21rge3MjsDgea
         OwGptTCwbbA4VeGofVQUEYbkdg27Bf6GGDhbFrlOwOtIXCxQ2YkFuxCVnC3jNNwzwkkx
         Jqq4/RnkI38sDYbkm5jPciww7rcQcLfJqlhvAwkrHKKL9DkD+kszdtsd6Z1AXkvt5Pm7
         L2JYN6qBfuEgAtqo5BBSQfVUssIRXki3qGH+gdmG+K7X6f/zyHVIiA0KaXeTyVz+98KU
         32fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769435723; x=1770040523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XeV/7lzNuLy+dkaaDAwnMUXnGAlO7NMOF3iEa0s8E0U=;
        b=kXNerbtOm+ndU8zQAYHZk6wHxHIdU9U6d4o6PSdyrfFcb2e6MZNnzX97qQjXbOP+G+
         UFaf6txCgPCXKgQRmg2bNB4I63I3nl+Do1Fb/lzWTopHtNSm0qBJoiOUHLYvsWtKh0q/
         rpwrWmK2/PQhvcB04kiENS4EkpSWeD1qTJ48bLgn/m4EWUmjBo7URapEps3RoSa1jy+m
         LAWbz71udLnsy4nYgAUMexFYSXKKOfTe4ESFwY+3oSiK/oZWe8SUo8wDsPckn95YKrd3
         z6ER2bMFc0c2Mi/fIkyBfw5vLE7ODdszU7RSX9uRWXjnykqDfVnPRhfXFt0uhmEiHtsR
         Boug==
X-Forwarded-Encrypted: i=1; AJvYcCXpKrrmkHSeUEYUZxJAprKdRZvAtzGgY+NUK+XIT7DYwCIZNuEi1tliGOWHN50V9JLSqzSim8oLKuC1tuj/vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGsjP4WAJ1wEhUSRvaNDZjP5NOe03IieK6clILBQuHAthcdnB4
	80wTRlHDLJTvgzFRIaIk5CXoyXmJPA+htolfcL+a/xOx0gkboqTd47ztaZqqRvsD9rn9xC/QGvg
	Vv3aBLbKVwc+a1jrk/DM2GLUZ0aaUU1M=
X-Gm-Gg: AZuq6aKenwHQ7/VK01WGGVv5iqYmUpMM7B2KGdhdi25l7INFXGN3HdxinKpUO3Yufy7
	HiDRoN0miyriPCuLbkkna8kHas2y1uxJiwzdksHDabPeh1d1qUVo5oheiN4ykcPjvobsziDWLv2
	511KKvMU7Krn3WV1NC52kSkHOwtaSaHAlKZGHzsuEi+ryFkXAvCGW0REl5YIUHJeH+v9Yr2qKaq
	HKAtghV/6Dp5KZ/rWeCvcDMVZPH/oV2ze1F09To/LTA6RtqeGLaXwixhkONgf9RX7axM2Pt1/gw
	FZqHgZr+eWhazA0nfvHwS4oJZo4Fra2siweKEAd2bit3SNfbi/srRCr5l6bFCM/1H93kAqufina
	/KGyfscnmDw/N
X-Received: by 2002:a05:7301:3d1a:b0:2b6:f142:44ce with SMTP id
 5a478bee46e88-2b76433995amr1315641eec.2.1769435722962; Mon, 26 Jan 2026
 05:55:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-register-v3-0-2328a59d7312@nvidia.com> <20260126-register-v3-1-2328a59d7312@nvidia.com>
In-Reply-To: <20260126-register-v3-1-2328a59d7312@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 14:55:10 +0100
X-Gm-Features: AZwV_QgXiF4PgUdwcV9QJp_XN5foqce34aKTJx0eY6Oq3f8Xlym8CDrlRKffcPU
Message-ID: <CANiq72nqyZBVktuExKdpyXL8N36zoBXyK5tYvMwk+Ky6RcxQpg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] rust: enable the `generic_arg_infer` feature
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 2:29=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> This feature is stable since 1.89, and used in subsequent patches.
>
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
