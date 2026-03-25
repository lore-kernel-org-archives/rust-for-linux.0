Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0684275AFB
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 01:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403903; cv=pass; b=VtW8CDdqmIpdqPC8JM2TMv/3OaKMvTH3JnQ85U5jLB3pDCRryT3ORd291So5Na7nLuZk2Ug/upWEII5kBeAsixhFzRxhkMYutD09kWgtw7mtI+1m6+jMblH/3PkiVwOWSKO44VtJkhxAwFOh4IQRG3+LldO6Hmb+M5oRL200PsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403903; c=relaxed/simple;
	bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rp219wbbfM75yZGJ5SUKH+HycZqwb+2eeWhf8hg8g0ldomxITMEgcLS8VBvSBeiBjAUrFX4eWnp0vQzY1+v2oi/7Z0VQtbc3lrjVQUZiAkfwi6OotLApuNRaBMDnBWp88Q4CCmfh++knNZRZ2+8a6RsSIvMKRLsjRkIvPEWqkEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ywixa/ez; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ywixa/ez"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c0c4194b2bso226051eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 18:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774403901; cv=none;
        d=google.com; s=arc-20240605;
        b=dIMAweN3HnHP1EAVjK0iVtbla5y+oChyYBXY/uUMCgmWSksImKcvW+eui2r5ZM+K5E
         JGRRtsBSU1drpfuSt+Re+bTtW4/y/FuTpt3wHyczu9DpzZR7nV37YhSrwwyAMVtzpIae
         81SUQiRYXCS0eEz5LKBMBksYQgUIVCFQWubUbTzGNh+S6tN7YVtXVg8azSOaIfVxjN1s
         QNBtwAn7D83IO/mA+j5r1uUvbTDHPVM3JWutJQSTTZDt+xQnpR2Ge5GkNp6zrCzkGp4t
         hpGSsyuW/kOnS/X3oEZmrZRC2G1jEOq3NJjEezjEEpfyyEXxx/VLygjHnTrorn8VabDE
         v72A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
        fh=Ch/r78QNZy8pUM5tUK8gxVh3mDDc5m7KXtZ8nTuzYGU=;
        b=j096cvHBS32zBHl5Dr0S1l6G+ItU6JH24oMo0AL4NWnJeM/xdESahNOdbBTSCPY1PS
         X4VlALz+pPGEmUU1QmwzhFn3zXz7VuEQ99p3JSssRDNv6Ip1KjsznDN7HwZvymhb2ArD
         Is7nAv/7y2tVuDE2y7SeDs7beCno65tnlWAiWKkd+CmUw4TTwpaXkfFZKBnyOtjpG9sO
         C7R7/4BOnE0ITGyjA+ewuRKVt6gVoHjsmK5IixWe4tG0Oi4NS32gETcrJ+y+L0oB6Bjp
         RQXq5kSVt0a/z72KmioNcavoYRaoGHileo/yIAB4U88OKen729f9k5e75YBWNuUvt1aD
         +cGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774403901; x=1775008701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
        b=Ywixa/ez1uiDZdc08Qus0DA53ujwgs7OIdFh4HueA3lpFSDX7gaODCqomtBcJmBXDR
         a+zldmEgicVBYFXqUmQadDqW82u36tDQDQeIOIDUVBHpx8YCqANM6F8xVcxrAYTFk63R
         GFBaj04os96MEQ9VmDA5NMnlazbyn/F96rUMa9cqllJZ5UvRXeTx+OybhHBRqstuYnUn
         9LjGaYUOvxo1lktmGecxGZZqOfhOEqY0Q8BnldZp4qJBo3uywfxai48L/SDjk3BFK1IO
         Z6JD24U3liroe3nP+EwE4DRtc26KOPmTEOUKa4CMlQBEIqw7aVqcy+9mX4j5phJkZAfF
         MRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774403901; x=1775008701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
        b=hd8wPvOfb62iFFOZc31tFFmfmFp9uC8lTF2LigPvNdiHRQZ0xZpvA1Uz6TtamasbVD
         JfJipkxSZSqUqCSlu0IVL+AQe9WShyLDwRl9fzhaOqLb7T84SoYWIhkAgzJguGoEL+1o
         heCTb5bHgZCFoM7iAtOKDJFSnGH8beAhxK/dGXEqRgFNjRvelfP9+o2s4wPB0M8ll4H5
         ekabyWpYl6icgi8EKxyBDTHswGdGzGBsisRaTXeEeDe1hFmHqsfMUSwbxNb5yYFhtmC6
         SBcjvGepYxIMPFGRZQzf381GRdntMdkZYeWtnejAdqZM+NqiSyC0MJWdIk1GrF+XG/FR
         Muuw==
X-Forwarded-Encrypted: i=1; AJvYcCVOJannWHGdb+CuD6jGRSs+DPuhjEHI4ZJqIowKjajQQqi7lt2vZNbEjkztWU82xyaPvk0K/37QjJE+lx4Qvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVyzP+/BIFu4kLlmDHWxu0ItBamJKQjs7I+wwySUEYRo7SKvfd
	JP40lBWvYkuplTmKtQi4PQ9lScI86WT+Fr2mzS67TM0xPSRBFXAq8JbqrvKas+0SGHaQtQO+yLc
	1do4fsvg3ROBmKuyS8if6K9lghUOKMLo=
X-Gm-Gg: ATEYQzzT5ShWCh0868jmx5xWqo4D2PNY4qWZNI5i4PXgdBVjUObNvNIndE7W591lP6p
	cKKsdhegrKdeuzUJHIfksqDcrbNOLQramEmIdF+ydML2l19AqsNhu/aNzntKEJWvgQle+frUoc4
	xhVU8EJ+tMIeNcKvYTwg/8rNwl28e056mEG9Ow+uGTzCLhddfwu44On5d/0unfFtuS48wV4nw1e
	AsF9eGQbSYw+KMuif8os3KNFeSmUdXT79ZkCpb8K047TWQFrLHMJOWaoE6qKHsSVz8sd5ntF4K/
	04G0zFB6tfu8FYwTxxIFn6Bq97f0l8pw7/bVLwGVSKziXonF5O2r/4bycaweYVCEPxTcCRcbi3d
	X4erIziYqo1r+yYk2Nma0B4w=
X-Received: by 2002:a05:7300:dc10:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2c15d3a8a70mr394983eec.3.1774403900918; Tue, 24 Mar 2026
 18:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <CGME20260322194701eucas1p1f72625f53e50806fa4f430550f291e76@eucas1p1.samsung.com>
 <20260322194616.89847-1-ojeda@kernel.org> <1c4e429b-f30c-42a9-8de1-71cb2cbbc114@samsung.com>
In-Reply-To: <1c4e429b-f30c-42a9-8de1-71cb2cbbc114@samsung.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Mar 2026 02:58:08 +0100
X-Gm-Features: AQROBzAYV4sPQIbCVLLNfW-UqAw-p0H5kvr5leqfcWwqgBKVIhpQi6sU039YVRU
Message-ID: <CANiq72=UPiXc7JLracLeC6k45ToByJWZedp3B3j5=5mAnyKZmA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, driver-core@lists.linux.dev, 
	acourbot@nvidia.com, akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 9:49=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Yes please, this looks like an oversight.

https://lore.kernel.org/rust-for-linux/20260325015548.70912-1-ojeda@kernel.=
org/

I hope that helps!

Cheers,
Miguel
