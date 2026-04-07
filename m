Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F1630EF7C
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Apr 2026 22:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775602041; cv=pass; b=REw09gVqoRlrVIknyoQYvvYNIJEwGXzSt5tMzbHb1czDzztGj1QD2CmBSbekzLK20FVTCLGm7/yXBhWOoYNAsFoqO0JIhkr2z+c5MvD1JDqvSVPPttKOZFprTsfK6nyL7oKCKZ7KlAfU408c+RMtdeLlrU8umLOtVzTrFt56A80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775602041; c=relaxed/simple;
	bh=aFsTfqC63ezOutiiD9PkUdFoCmYTGkCJ9PQqyoVszpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=idoZwOpWGZlLx6snNFISTc3SHdfbgeXoMlo8CnddIvKuf+rEmVMsLtfy+ftfk5B5DOLTgpE3EPNdLhbpfQI4Vhvh0L5g5h8qderNYqGRbMNhmGHPee3fL5R1gHLCz5S9RvtQO4mBdWYAATu/VfihmbS+/y/R6djVxJfSWYuQHM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qt5qSoyv; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qt5qSoyv"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12714f01940so375449c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Apr 2026 15:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775602039; cv=none;
        d=google.com; s=arc-20240605;
        b=coPn0X8wLc0j81YAt50NQqE1oYFqDxBIkcOLAe4/hHIw2gYxi3QCFld8xvMP2Y8EZr
         Eo+k6ENV6q0oMxUXEBhKohYtS+HURDXtaVXAPmcxGuO5cueeC8DKYbE4D0TDhX1//DMe
         TTfpXljzbYv7ivyifKWFg5lvlnbnwJ2FDEmT0V5R1XqjB6xKGRZVKZH2/jRyzKkgJ3iu
         2I6jiim4mc2WgqWjnpjKdzFtTMCgXnnLwCjc5x774XC8s13x8eqp/VBr5hk53X6RkEJc
         91YiIo5PHzA3S2ZUFic5yJR4CzVeRxQWtIjMYWl9x07etNkTPtgT8IIt07sonFgJwkYo
         lm6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U/Ecs7Bm4eldilL/fIpGiIvgkbcE1EVKjcxrXCBPFoY=;
        fh=u2bgq0PfNyIOoKl8e2MhbVMv9pE296eV8Kk5+7byWD8=;
        b=N0DQQXLReGBL5mpJOjsC/3xyw6xhifBbXOkvwiOijfosH0TsYNIvQXZSjk+A1nSvp5
         Bwzxq+yV4NRNbWEJiN+T3Waba1JpmU3SVzM6V3qIsC9VP+e5hPlpLyJ12Q2bvWlU1yD2
         teWN78sWpfwJEXQY7qOp/uxBrxRXlhH07t5IITqWnLjMuqEgCYaHa759Bvupmy0yGiZZ
         tZbMJU1ZKPEq5gDMTudBOnxmXzxVYjNvoEPQZpRAyOiMtAvX4kMKfQm6K6EoTqFht/EQ
         ZGtfWxm8O4LqzdH2ylsIr5E58apFWkAUeRJRwqEWt5n1wd9XrMm4Az9eN8YvQKZPsHu7
         4z6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775602039; x=1776206839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/Ecs7Bm4eldilL/fIpGiIvgkbcE1EVKjcxrXCBPFoY=;
        b=Qt5qSoyv9Fr2a0toEVUpmy0sRvbMGRte1ZUDOYyRPtiHtPwno8N5PcBOyP62RHWEpW
         04kTiz+8deYeKTbY4kUbU0ENh7FtHDi6Rygev7CwKNZwyZqfQi6NDpqit9VpbTeWH6XQ
         /I7C2ebC7Z+k2ekgJc7qq/xpZr1DAYUt6WDucVYni2N5NOrnGGX3PyrepP8RqvT8QV/K
         vsEyCMMh/KioWUgHQcKMYxv6tbJWB5RyC5Cq4rrD9U9uF5lM9UWjWbtI30j5rauVJGN9
         taIIhJFAYr4Kb++vcJLfzuc40qdwATcaPgmY2cuttAD4hk33G0MI9/nEkEH9c0G5RJk+
         EFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775602039; x=1776206839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U/Ecs7Bm4eldilL/fIpGiIvgkbcE1EVKjcxrXCBPFoY=;
        b=L0SqLZ2cogEJAJdm7ubXP8uNCFwPK42SfxuSUHjCjI/rBdWk98CNyzxn9CzX0Cq0Zq
         vsiIrZZ8ezjcVkttRmga3Cm4q+uo94VX75rIBPTb6nFDaUYNQ68jG/1aI6GumlhDUe5O
         4YQ/BvnvYPQtusQURIoeCc7kIsmThmjYmKwkZAltuVA165ITizJkqyBv69PiZwz8YPMm
         eefgzNduowAVUEp7/HAiT30gafa1PMz+GOGYy/buk85Vy1XTGBGdErUcX2UaFilJfzN/
         TO56D30sf6CLi77BaTp6swy2FMOxGqJ1nGbeXrZLxFN3LowOzB6uqUgL+DM3yuOii2MN
         cqPw==
X-Forwarded-Encrypted: i=1; AJvYcCVSht9a0hlPMwzRTMTO+7lQZP27Tia9fRUB9KoGXse5Zh7vVnf/4fq54t5SGyV3fht2lTpsvRMJ57c+2/Ya5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEG7YwnDAXDFaI1+8CkoFRYsVb9Z79/oiHMNqe8bAf5s0WabHp
	oNGyopjiDWnnvAe50lyHEw8zTmCNB9ESr2mpVcLYT9vgp3YGGtf4PM/dnKcq7eVPB7hIM6hNl00
	byD6V8JMXb2wQu9GrgccInbZGL/XNdK0=
X-Gm-Gg: AeBDieux5+MskOP0w+xsAtv9gvHH23DsZANa/y8rUMfZ/l7wDbEL7mPRv6BZhwAqBDK
	lKcrTBkvfrE4ZqGzi+NoUKfLDgsns9n4Pu3myTlyOTON6CUrDv3ZB9D/S0dHQgU/txO9UwaekuI
	MSm2+MdNAQsYmwiXy4oqfbJ/9/jIM2eTaw+iL0Ea4i88nUHnU2GAmK8G7aX0OvLlIkhyFGU6kPj
	rQYZOQ22Q+oWe87KV1IoFZR8qCeXkJVM7XBY77XRufffAuCqFvZ8byXFoRsGnDg9yLHGPOY1/7d
	2Wzw2IX0YjjIwkyytWeeQ+o+WGphzhiZRE8R+C4QEWumx8SHBZfG7hnGOlDzkB6GGLWd5REkM4f
	O+N9r5KJJWB1MTyg8lFcgURs=
X-Received: by 2002:a05:7300:a484:b0:2c4:ec89:bd7 with SMTP id
 5a478bee46e88-2cbfc16e3ecmr3082819eec.5.1775602039353; Tue, 07 Apr 2026
 15:47:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404021204.339779-1-jhubbard@nvidia.com> <20260404021204.339779-2-jhubbard@nvidia.com>
In-Reply-To: <20260404021204.339779-2-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Apr 2026 00:47:06 +0200
X-Gm-Features: AQROBzBmaMDAfC7LrHPhQgz73fzrr5TwYLtsvAa5Om3YhbV_AvYoFA-klQNqu3U
Message-ID: <CANiq72mMxuTarCrtmmh5-W7Ha+NvK2jsDUM33ewL-MBLVe7g2w@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] rust: sizes: add SizeConstants trait for device
 address space constants
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 4:12=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> The SZ_* constants are usize, matching the CPU pointer width. But
> device address spaces have their own widths (32-bit MMIO windows,
> 64-bit GPU framebuffers, etc.), so drivers end up casting these
> constants with SZ_1M as u64 or helper functions. This adds
> boilerplate with no safety benefit.
>
> Add a SizeConstants trait with associated SZ_* constants, implemented
> for u32, u64, and usize. With the trait in scope, callers write
> u64::SZ_1M or u32::SZ_4K to get the constant in their device's
> native width. All SZ_* values fit in a u32, so every implementation
> is lossless. Each impl has a const assert to catch any future
> constant that would overflow.
>
> A define_sizes! macro generates everything from a single internal
> list of names. The macro takes the target types as arguments, so
> adding a new target type requires changing only the call site.
>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Link: https://lore.kernel.org/all/DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org/
> Link: https://lore.kernel.org/all/DGHI8WRKBQS9.38910L6FIIZTE@kernel.org/
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Applied (just this one) to `rust-next` -- thanks everyone!

    [ Applied the "kernel vertical" imports style. - Miguel ]

Cheers,
Miguel
