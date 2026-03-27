Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462EE30DEA3
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604018; cv=pass; b=osrYbMY/VrZMeKB9P7z/4RF9QKzEQOfQJnP6bqo3poNOZgrJmqg+D5Np9RGwjnJMiM3uH3xXbdbP1sl/WSvjEjs51/mwX7zY8lIOHF2MNCXu1Nh4hbje6HhbBfFlBTGqZWacLMlRHQqfq3TxvXFqZGxjoS23a9ppKMNwBWyhr4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604018; c=relaxed/simple;
	bh=7X9Njz+cwCrKS9bsljWqEvlf78oK7r3Nfm8yjkfspb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HkSlTZcxV0r6s1dtbdtepj+1vR068kqVP1CK4G6ugY/1T8eYUi2Bx/Aj2Mc/tf2iPiNAN/02pBcP2OEgEXA2FdC/UEC92P7iLBX6wPSgr2T/gp/C5dX331N+nbkBv2u9T0gGSjhGbNN/bSmufeFTcGyGj6TGd6Gi7A7bUxfypdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3UwyUum; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3UwyUum"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c17b0a26a8so24311eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 02:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774604016; cv=none;
        d=google.com; s=arc-20240605;
        b=VbXaTIVeKAmSg8qnZ40vrX9JnnGA2lnsflYS7Px1KdjSxYd3QAC8vjitYsAol3D3PM
         lqPaVeSHtB7sSDBqGYidhlvH6ZKi0qYYX5rFkyKyti/MZseltuGkiDyL4kP8HAvMcjaL
         3kC66su+P954rwD3KcWIUs/V9PL+pXiVBlMrWzUwf3jptzLYiAmAoYX55i6Mt2i7eWgc
         udtYoevNOspP9DVabS4xagZSvaDpkkW64tIE9LFk13qv8CPtKf77XeuNVuCUDqZh5bKd
         US+p2M0sczvwbplzHJwnQBc0FyGCS4ao1q4L/TZFKINf079dj+KEPcYgOs/r0hmXLegE
         RmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7X9Njz+cwCrKS9bsljWqEvlf78oK7r3Nfm8yjkfspb0=;
        fh=/zQX8ZtIRgHoki6JjxQNn0OHIa4XA3X9ETF7xfkQNHI=;
        b=GcjsBX6BueW4yHPhEhl7Hl/3OLLB4oJdNXnjKKr0LaQsN0/s8zy26KNjU1zG7d3zUO
         vmRwIuNIRHZFpH82Kkt2K+ilzXHZvUabwjE83YFvE3pnBK6P1qJXvDQ9mwX1JKrIQN5L
         cbywH1nySNYrMyLsWy3bcEuMDs0jww9Dc3oACtpzMOw6YzWNlgmbxv18tNExkSuY3CjO
         15FoV6fIsSd0bV0dGo/34wq65YBGLai6ul8swBKqGC3eJJglHd0hMgPos950PQDz5pI+
         ux49w5g7Rar8OXzXbX6yrGJiZdq0k+WafFUd6TQ8CNtgG3iObunw0MdgtVf3o04SUX+3
         lmcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774604016; x=1775208816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7X9Njz+cwCrKS9bsljWqEvlf78oK7r3Nfm8yjkfspb0=;
        b=X3UwyUumo2LLfkQCXqOBoQOK0cuwEF0T9hacB5/L6uY2c5lke86HqlX7xWFavbWW9o
         JkmQOJ2rLgHmd6ejUADNyeCit27Uy35HfF0UMLs8Ghs5+5knvNnDos0EodWERarU+5o8
         BnZ92CHPXlYjtaPmDV6+ESVv8AAXFWzZSvB0TLEpyC17PHwkuy7moM+vkTi6ckZOsaKe
         Vkpizwr3feJ3Nn3kr/uTI2biE7LpG5e4v3a2BVHeglIxyJdeq6AWep6Kcqdx8Grlx6Gv
         h7lClsyp+zxR7aZ9MR7hV2eKssxoX6rGETMGiDtBu62CVwxyCltPxRIjrkRzoGgTdQO8
         K/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774604016; x=1775208816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7X9Njz+cwCrKS9bsljWqEvlf78oK7r3Nfm8yjkfspb0=;
        b=W+1wLsDIWNt2FLg8BWgAVGjB1aSYdaxuEkrR3CqlFcqjPniFmMTeqANnJ6mfdoiyFO
         9w3iyymdlJO723AbFmr5DHSvnmueh8lvj4SImg451cLJq9CtGUXe491Td9fRTuRGRovX
         DyqMf5Nz+FOgtv7KEViVtbVpM1W5AXelcBry2ZXTR0YUDvrIijV/7LbMI6g8NZLl+poq
         AIKWJ1Rf6jYMjBB2k0IyJ5eh91vX/cnL8n5RKTfNNeiPXOOR10nWhJgptFz2/M1Xrklt
         MSpzkaoMHsF/5vE1h2bvFoCGps4tSN2/98ckz1rcKvWGECZYQQ1DfHpWnHsgaPI4Qqbh
         zbdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0LFlWlJVG7wWMgsIbci/eD1S3wK3GrzhxvHm4BsUII8vJED6Zv/n7gStAH7dRQnzom9zIy092DCj8QNQqOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8VxC+xEjMqZc35IscNgjihgYHt8gQEYvSOOMPCDsHNSKCYvnR
	9/HR4/5NNLTM6HHCOBMIz0CeEIhgh5TPxEC+zFriJ4k1Bt0CK68bdAzHDZodAgA29qnGkmHPK9l
	f6b1q1C/dVhw1PvYqOy9UWxhi9yd/BWo=
X-Gm-Gg: ATEYQzyhETgb5bp2TzrFrwu1Ibn+/9PwxLYNBHFuMQfTtRT3pyCLjj6NCRAvcmU82IY
	TwHo0ut6mEge22gmPjGoq68dhlAuFTrziIfeIHiHKytA0E/hQ6RzG4dw+hMlKb/9RfO4GQv7lPZ
	DsPZ/3Jfr/pYbXs2G/NXtRZKY9cUGP3QG63JEul/WXJ4QrkwkJ9CM5Og0C2a+vPrB5ZpxLz3czG
	M/zlbk9mdaoVTuxezQzaAOnOFRBJoS+c9FTfIQfc0vGNxPgPlUWULuMHb17TyuAPVnIZfiRgtwk
	lW7ncnbXyCjaC9j5jCYhL7akmUi4ieyij+FYXp2LaQFK+OvM5WCNFL/hGrTYTjTFlLOKqeORIHO
	ZYicdJpFOa3qAQDDddO5ayyQ=
X-Received: by 2002:a05:7300:6c1f:b0:2c1:7afc:deff with SMTP id
 5a478bee46e88-2c185a73670mr440652eec.0.1774604016218; Fri, 27 Mar 2026
 02:33:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326013902.588242-1-jhubbard@nvidia.com> <20260326013902.588242-17-jhubbard@nvidia.com>
In-Reply-To: <20260326013902.588242-17-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 10:33:24 +0100
X-Gm-Features: AQROBzCgX0xMMG-ORcQGVC6daoY44DgijZ14ApE1pzVytreJzwIAMCwFdcszHK0
Message-ID: <CANiq72mwC9K3mOaTUsfrreJqiE7WumqcwqhXQK=nvhsb=024=A@mail.gmail.com>
Subject: Re: [PATCH v9 16/31] rust: ptr: add const_align_up()
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

On Thu, Mar 26, 2026 at 2:39=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Add const_align_up() to kernel::ptr as the const-compatible equivalent
> of Alignable::align_up().
>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
