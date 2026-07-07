Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D207A41D4F0
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431139; cv=pass; b=L0DHwhpdkOtT4DxezKB5TSyzxnoDZSqS3gAIMZTRTJxFu/vLyUS2/ZAAznqT/G/nOWyiXo6d3YLnFb1uc9kTKjw5J50DRhPyq7u0sQtk2LGDchGoqw+cAotb89PWRb+3D01qnh3c0DxAkPHyJJfQ9Pf3ss+nZS2Y8ejec8eHCZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431139; c=relaxed/simple;
	bh=GUFsCk/2NzYF0/une/bLFGZZu5KrtRApK/yrChMm6zs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8USXgS+do+Y+nkmAhYpFSMxgTa+xIg4Q1zIg4RBZ5ug9p7w9wDOIEwRcwwb6SkPNBKrR7HRyUM63XWSH1w4cHhj5shFXRXqa5MGfJ34fsNjGSDzy0J8635E/9kebP9x6bwt/VevHINdL5WUc7Qc0Lo50yxVsTLAgLwqBvlyF60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JkF0aSaR; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JkF0aSaR"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47dc6e04367so681845f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 06:32:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783431136; cv=none;
        d=google.com; s=arc-20260327;
        b=KncJi5eqBOH+w8IXEJAmB/OtWxh2Rnial6WGK0MUT3ErIkdRWOK5lAjSOA2K591IqA
         UnMefA2syisztxcTW2SrZMOu8H6lWf5fQDMDaID14pYQyNwbkL44fKku1ZpKgQ7XMM41
         Dh78dJOEZJnwmVfX3vNP6NG0Fs4mctCUULcVuTZtZkv+a8STnMxeZBKZOLWQGGAdI2Zi
         5Ai2h8CFpNOhdzWbkfy+vtH/J47p7MFJrIaxeyfQCmws8MzrQJQT5LzqkL4jKNIhlFbz
         6uyjY2dCHWHpASxNQl+pj5xpAjScL9Nd+O5Q2on+zXmmqifZKrk17lfs55Z3VDjcIJbW
         TDTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YbvH0rz9v2LuEGavTdE4vxLt1YV7PzWsO2f3mHG+f40=;
        fh=pw2NrsRAcPrld/RbF6+6Vdn/2WKSENdy19HId4dqPHY=;
        b=e+2qoHIxUt7wyvmX+QG6iH9sRYjJPIXGitbo/BWY/1ALAWdVPu/K8RZy638MZaP0DN
         YZQXBKXrZWPL5wxokwya68lLpZwP5dPqLEUUf33RLGj/Ed8M5aF1zv4nuJNhjmZgbHxr
         gZSeMyNqRaAhPjw1OcZa4Dj0qYRaQFeK6nAsTRG420/QJnKMmmErKZfQF1NGfPq9kZmx
         RXKp0UgH8dVYRaW6NtoYupurF4NVnsj6BLVJRjwyftlWWsijoNSmNHc0WzGxrlm3VHa4
         lJ2+w3UkQra45smClShWQ+FFFtQZp+3YhxaNOSO55sYx1LNCF+TMCKfRVXW5pG31h9aR
         A03Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783431136; x=1784035936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbvH0rz9v2LuEGavTdE4vxLt1YV7PzWsO2f3mHG+f40=;
        b=JkF0aSaR9oKmhFpiIE87kMw8wc/p5xR6bSnMrv8gcTLLeLsW23AsgRaVT70CdMJTJL
         Ihh0DozQS79vkpy91fHiOjoSPaZWsGe5YsRxZ6PuyyopSzu3p2NgUOqXqy8dmKdzbdkl
         IXDLEAt8G8v/889hAWQVOOwpIK25OBHg7Uo8NnbdGBUUAqrnd2afXLksvxjD0JVwQ5Br
         NwmRrjrK69ydQSNcAiLDXqBcKjnrgh9C8omQyg9avTh7QcF/f1TlKhyzpbCKOPiZjHKc
         SzsPiUikTYv6kfkDSf8vMFgWVbwsIRstsEmCWWMvDs/SjIJTP0xnUN87BIjtup1rZuy/
         7IIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431136; x=1784035936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YbvH0rz9v2LuEGavTdE4vxLt1YV7PzWsO2f3mHG+f40=;
        b=pOtohPrZcWD1TEmyl0qAZ8QxTmX9ga736BzccS6w4Rl0zKthE8Z0D6DENnoYEXH5w6
         TVqWOJHpswo+4t1sC5xMi0EbvS/fOFfK2UJDx0zWqQMVu4eKcN0aK9D5NDxS1RDJmTDD
         351OIkbQpgSFeZlADpeCIv4FUBrep+sY4Psvcv2CQJid2wlilWjQ1DQ1H3dxfmkKFea/
         OVvMfW7HS/cdtiNH9Dy4qkPpSZmL8L7POokb3ktNqOj2NE0ihr4HUzQKiXsDNpejGdnO
         QB9lKfgSATA4r+TevQsJV2M7AleEZ/KQEz5laEMcvMmoCOs/2pw4UObhM4OtGNW58ne8
         t2tw==
X-Forwarded-Encrypted: i=1; AHgh+RrCrU4orARuWDI53VHcSECm2sJP5tu97bK55wQJhibimdKDV06IHy5cq9Pthy0KBZVfuRB4WhBCUg9+YUSP1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvsa61ge70xN3/kB4l3yDPSekFz3d7lz6YXydfryP7RacKra1q
	ivP1pHgpRESTW5ALgxC7Bi3JqlGQJQaNU7dLvQq/5SeGmaBR59RPOxrqtrLPBj9GWhHitxqx4mb
	L1cPi/zu9Rt40vB059Bltjpnzkra2Ba07WCytjT+T
X-Gm-Gg: AfdE7clKrMEaGy5mu7Fy6jYU2OxVY6Y9uUPaTpzpA58lfnIh7WPNlkWH8MDJP2a9tRY
	/wGB8uOZVocXr1Z+82py/C3FEDW599tHumTGlLZLTTFYGdr580rG1+DW2j8sRqHIHoTF2dTc0r3
	HdwBzTKC9zZLuz6T0LfvC8CjibN36D4kCv3N+kzkU+KmGTdy5nRRJA7eFRuKn0RDkAihsLZjK1l
	ls9Mk6Y1pi9jn2dGdfEoCJZx4AttHp14YJRKNX8GD7lICDLPE8eUHWAve1yxot25JG6kHXzx3GT
	wYK3Oij2uTV1pBPMwKDsV8N9Hutx7nFAnJXHwQ==
X-Received: by 2002:a05:600c:3115:b0:492:3e66:6c84 with SMTP id
 5b1f17b1804b1-493df095172mr60789075e9.30.1783431135794; Tue, 07 Jul 2026
 06:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com> <akuV_GRAM4QPqf-o@google.com>
 <DJSDG3RE8MDB.135TG7FX4Z1G1@nvidia.com>
In-Reply-To: <DJSDG3RE8MDB.135TG7FX4Z1G1@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 7 Jul 2026 15:32:03 +0200
X-Gm-Features: AVVi8CeuDxVjaDzyUQSDcYcmcH9Nnk9YtXJ9KbqPE51Mhk7CXpF1V1tW2Dtgja0
Message-ID: <CAH5fLgidT1MFYp8Qc70yeYmKBSi-LFKQWw+M_kjR6b2N1ypMEA@mail.gmail.com>
Subject: Re: [PATCH 0/4] rust: Add support for reserving of ranges of IDs
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 3:26=E2=80=AFPM Eliot Courtney <ecourtney@nvidia.com=
> wrote:
>
> On Mon Jul 6, 2026 at 8:48 PM JST, Alice Ryhl wrote:
> > On Fri, Jul 03, 2026 at 07:16:03PM +0900, Eliot Courtney wrote:
> >> Add support for reserving of ranges of IDs, with a usage in nova-core
> >> for channel IDs. This entails adding the helpers+users of the C bitmap
> >> API for ranges of bits, then users of that in `IdPool`, and finally a
> >> user of `IdPool` in nova-core, `ChannelIdPool`.
> >
> > If you need ranges of IDs, perhaps you want the maple tree instead?
> >
> > Alice
>
> I think maple tree would work, but it looked like not as good a fit to
> me because:
> - the number of channel IDs is small (limited to 2048)
> - allocation of a contiguous sequence of channel IDs is sometimes
>   aligned to its size (which should be a power of two, AFAICT) - I
>   realise patch 4 doesn't reflect this (yet). The bitmap APIs natively
>   support this.
> - maple tree's alloc_range stores a value: T for the range which isn't
>   necessary for ID alloc

The limited number of channel IDs (2048) is a good reason to use a
bitmap. Please include this context in the commit message for the next
version.

Alice
