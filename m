Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7591D9A47
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Dec 2024 10:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733395219; cv=none; b=VoRCK/xo1aHJvYhp0HnqKtj+HTwcrnoxemt3Rg1vZWoleIs4SZJPJhC5blpzIdqLlmabqcgOpWJ0OOM4p9i58jKKtSItFpTXZQOlKLIwL/iAqMkNdvuIqS3pl1H2jRFKE3EBwdnSiyZDxyGzd+Q/X4+tanf2TvGeO5/0+FheNSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733395219; c=relaxed/simple;
	bh=WPtqld1LaQcMOfLWgEkhuJXsVEQnJwRf+2DulZqLtME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p6JjyNizmoCiDWQppxowQkLQO0gGscX5H7SXtUoaYeTgTdoh+DvMFzB2oFc2GeMJHErkj5DB46eGgbj9RFzAJIulD2xDfuURmvOA1ibiiA3i7TGiUAauDv6A7ezP76Rh9S/4tNwbo/6s4kgwLwpHOXY/N8JwlKDhUYVK6sfd3bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OAHH9ArF; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OAHH9ArF"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385df8815fcso358519f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Dec 2024 02:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733395215; x=1734000015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPtqld1LaQcMOfLWgEkhuJXsVEQnJwRf+2DulZqLtME=;
        b=OAHH9ArFM0U1BdTCVs996B9LTqdwq+Z2LOP1PONKPt50p3oE/9EAgLE740lNJHVckX
         rs0qeKK2GwZ2+EF7Ue/cVzorSINvIZvmiv1ZTOXaAzKG0yI+lAd5IiIg29vBr0CeF0TQ
         8rAepjo+7ZPVT3VaOyqWVIZ/cM9IvuDUgL+y7GIsADkZBEje+ztF4Pwo9S/riinzAORn
         06ztAySDDluxiMFZo0+2zCq6knYb+eBk3WERpiJXVDfdghXiBvTsRcf0k0LxG36CR1Zm
         vAWiJya+sV/fiRg2fjx5CIHxSzFvDctF3kBwU9Jl5j6p/mdoumf7iiwiAJMRquBGb58U
         u16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395215; x=1734000015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPtqld1LaQcMOfLWgEkhuJXsVEQnJwRf+2DulZqLtME=;
        b=GBtMEvGwtQsPYe0ELr/oJ7kZmr8BkligSG75tj21eSeh6XFVJX3ExmKGrWrImde+z5
         z+2lg4NB0dFm+/dwm1ureeLG3lCyaZf4nL7QRW1H5GlsPjLKkJ+EDGHFLjXODJ+UQjDe
         2HMPKu/rCauuQik+dovwEpak8X7wC6+LlSyfHP9V10yK/+aDYOq+DQ1p47i/bp4mIhEL
         H6VzHUbrNAscmZDfVvVjWDdIqLcWQIs4sZZ6ND8wQtQSY/cC/J1RgZqbLDyHgm4vOi19
         Du34GFBkDvDM/oczMBchWsmiL5kcS7Ho5DEe1JnzZAAebAwZ6faEVScSNKiXy/KyZjb+
         ZmKA==
X-Forwarded-Encrypted: i=1; AJvYcCUTEsWp5hxA6vYBI+Vf6pgA2IKodNANX+Dt/NKhuD3Fpp73/XjYw842raRQn4tHeyguqw2tSmPZOcf4TYuVqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrwMUpMs3D+QV5NVMkOKLgqUrKK9PqfnoIlWTRFNq4qVPk0Oop
	vbo5lglhtSr5J2EQ5GzhHJOXvpwttFwQQqVIDD4rDBoMl7A+Mo8zK2OGm+BNhWC4BTgKDAWGRDG
	Zyohcf3dGOrR9xyA4AtmlOBzDmQL66hh0y+YY
X-Gm-Gg: ASbGncva0dnWpYTaa+s8dUFmQsu0vm0bsl00vwZgR2GJuw/D2vZM1dZfjJIs7WexnCU
	SWudTFsaAa8k3izEsdEz9NJScyS/rthOBRjeNnP42DMf9MNIsL1mRJagR3cHfJA==
X-Google-Smtp-Source: AGHT+IFg434w4z8s8tFqBhE5av51BwZ42Q5HKcJ0oYopIV4HP+3g/md6jNDkoJ8cd/1hXD6iFlXDlWN68Eo2+u/s9YQ=
X-Received: by 2002:a05:6000:1866:b0:385:e5d8:3ef1 with SMTP id
 ffacd0b85a97d-385fd4374d8mr9050329f8f.44.1733395215402; Thu, 05 Dec 2024
 02:40:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241129-vma-v10-0-4dfff05ba927@google.com> <20241129-vma-v10-2-4dfff05ba927@google.com>
In-Reply-To: <20241129-vma-v10-2-4dfff05ba927@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 5 Dec 2024 11:40:03 +0100
Message-ID: <CAH5fLgjxmpcLJwj5k85O39R00+vRRixA6i3xeK1STe_LQLHkTA@mail.gmail.com>
Subject: Re: [PATCH v10 2/8] mm: rust: add vm_area_struct methods that require
 read access
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2024 at 5:32=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This adds a type called VmAreaRef which is used when referencing a vma
> that you have read access to. Here, read access means that you hold
> either the mmap read lock or the vma read lock (or stronger).
>
> Additionally, a vma_lookup method is added to the mmap read guard, which
> enables you to obtain a &VmAreaRef in safe Rust code.
>
> This patch only provides a way to lock the mmap read lock, but a
> follow-up patch also provides a way to just lock the vma read lock.
>
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> Reviewed-by: Jann Horn <jannh@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

It looks like binder needs a way to check whether a given vma is
associated with a given mm. I guess we can do that by adding a method
to VmAreaRef that returns a &MmWithUser.

This indicates that vma->vm_mm references an mm with non-zero mm_users
whenever it's legal to have a reference to the vma.

Alice
