Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ECC3D349F
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770294263; cv=pass; b=GikyaoaUUREduJUT99mACDw1AdAQEbpiOqS5CzoqrbzDZEPA9iooPhcCZJ3TEbl3papxEYdYRIIWF+c6c0ZtV5XpQHyeL+L2KgMioIEFj7FTQnn0CRWgCN9HSY45N6myfm0NU3I0lFMGS+bAVH4ikOgw9AOL+i6A7ecukIm0r7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770294263; c=relaxed/simple;
	bh=ZYfglyr8WBVX6WQ6sjuoZun+RCx3dM35uvyj1qgWTPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R0ZnAT0WA4TvDDTn7P3mIXFmAXuGJvu6nr2gvelS0YBJKZm5VpG2pzXBRifjZe7U7YftxKOsDoJxEGRonMsvTXYlQsv94FMUgLbMkJuT5HATbZEPSGEpTMHdXcAn8GOCnOHoGwqLwTYlWBQNQRf2vJVsp9KuEx6qR9fXp+m6HNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnU8kDqr; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnU8kDqr"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b807f85e10so93472eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 04:24:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770294262; cv=none;
        d=google.com; s=arc-20240605;
        b=RlfW0eieMmCw2re7qHYhcIf+QbyQYzFSN1y/Gp8zBQ9j/V6EFn+Bwd8bguzL8Sh4t/
         Q8wjhwEoPtF/U+Vh44t+GPw9cr+/LMp1OjTh6logpdYUSWS8DSJA8r63UItWL+Cg6656
         A0vvDJF3S8MLTu2K4euv6FFB0mMKUc+SjReS3K8op6NQHq3ol+DGBqNoDd/0OGMKuqvq
         JiwT/38RsFs48+xLu3wh4PIsgQqInIuBeHn/kPukDG9wOb8y4rsQ/K5STJCht8rc2IeQ
         sJy6S+TvT/2CyjMeM/gMujbLTJ8aETgz+jg9AFEozsqu3s44wTYvH2nFRsKxS4ztn1/5
         amjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZYfglyr8WBVX6WQ6sjuoZun+RCx3dM35uvyj1qgWTPs=;
        fh=kfn5cmCqYZCh/wUoogJwNibhTFFPH6nhphJEo2GQuCg=;
        b=dqjDhdzFlK+3wJihXFcfDoziIEOfsP2dDZvniRZtVaPpsGgxsqgLoIv9nqdpG8emL0
         6DueH1PqglyaS1Bq0ZLWEkAKbnW0zSSDfU68TAAldkv7a6UBO5W+9Q510KcMbu2dxJVN
         irop6O4gJufBS2DIZ/7F8WVdKtfpP9njMaJUlueljXjl++PL+FOzhHg1QS76+73Fd66t
         /FdOM6M3OxEep/KFJVRij5eWVltD+hZAG1Mgx9cYCW0AoSIUDWXbwCLDdx9C1oYnBPbg
         Y7YSeRuWzkWOoA+r5CEhstzXzm4tCWd/eoCTibgVlpEfnC5KXINYsClOHDpn+WHr5zd+
         kWQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770294262; x=1770899062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYfglyr8WBVX6WQ6sjuoZun+RCx3dM35uvyj1qgWTPs=;
        b=XnU8kDqrS2YhYpPsk5DKy0ZhYzpXsTa4XvtAPQJXk2jWUaD6NACbVjw3wt+4PKy59s
         G3RY7K+FnXaDMtPalbxDHtxFeB6IMJ13tBy/OFHe1OZNf+KfI7SgRC6aK6ErLuE+sXSJ
         l6bASrhO91s+p4BE7QlHRt23d5YFeov4A9mDmL2LgV8QkOUvdEmgmZM5gcyJwsV+ncXf
         ll28toMSo9yvX7hDub0AVwMh/V3uPzZ4wcvQnUNiYakKgT9Gzgt5lo2S31Us5gzaUj42
         lRsYqnaY3pC1RNC+I0oU8wnMtBxglbgg9d0BsIjO4v1/MmEaEIrN7w9jOyVg2x058E9S
         hD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770294262; x=1770899062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZYfglyr8WBVX6WQ6sjuoZun+RCx3dM35uvyj1qgWTPs=;
        b=LNyUvF349Vyu13pL6Vxvpu2J5eNKGYQ0EosZplumue+T+P5hLVRjGBJjGCs8LS7W+i
         en+5e2sFXlPjuEkTo50C8suW3+fs4l0VRzQIstcFWoyV40zsdW4n7xChvEkMNAA7VDfy
         4BZWrZ01ndg0XwGqzZNLx8VOL8Lsz1HX8LpeEv4UUv7UEcOMxF4KDe/5JCrWlIKW93Es
         w6psjNDGQBY54P2UJu/eC0tzQvj4zHzshzC5qhHl/Eq5BW4MRjqngRYL1qq6p8duIvs2
         PcM22NF5AaMdcJvD+h5vZXBWi2EWI4c+lvoS6hgOapYSrx5t8oG8GEOTXmZ2zsjK4ulB
         VRhw==
X-Forwarded-Encrypted: i=1; AJvYcCXJqTWUHqCJlSKmQ2t3++PpGatgyYWNUOi3KWUVx+2wkAON2o8OPvR9XhQqwFl73/BLkljZFQ27KNGXtgDBEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygs+t1TEWCZ1AXOFG5nO3adLhAefy0w9jCws/eL0c2K5hnVVrW
	PVeBgXQeughf5aMtwF4zTmVWuXHrU75T0JT7NkrD2cXEekQ6d6WPOLsgeiWBJQNVAcwvmBb/D2x
	AppbZnQfg+h5jFVCERSi8eRWQe5F55lo=
X-Gm-Gg: AZuq6aKUibTHazaIFePDyp1tAckuLMpTz4NE7sSIY5VYhZCGAUWsUjBsQpG+8/ECmFV
	vXbLL+MoYom4YKhnx5v4cMHW44ideW1N68ldhHkI2pTZKTpczWYsrq3TwFY6v+tX+SkvmRlLzxc
	dCisogv4IV1vxktaU/6oVL4U6CkXAeKY3P5x5FUG5IejotR88+n8Y3QT9vRY2OujW3QXCiER7Eg
	EDgUeoqx+KWoF86iPc8rUsy+3IZ5Sqp3CAlBqmSYcHevz4vR5udcqRbMvY2P68AXPBVVl2fdUFB
	oH6TLtraEIJ5OUxCPsq5xOHF7cy8HtlLJJ9actk+69QdnxGrVD/phmNzADVxXB3d3jKnjYutbwl
	vEFOhRniDajXx
X-Received: by 2002:a05:7300:c29:b0:2b7:b88d:b75d with SMTP id
 5a478bee46e88-2b832743f4dmr1457533eec.0.1770294262402; Thu, 05 Feb 2026
 04:24:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205-binder-tristate-v1-0-dfc947c35d35@google.com>
 <20260205-binder-tristate-v1-3-dfc947c35d35@google.com> <02801464-f4cb-4e38-8269-f8b9cf0a5965@lucifer.local>
 <21d90844-1cb1-46ab-a2bb-62f2478b7dfb@kernel.org> <ab63390c-9e75-4a45-9bf4-4ceb112ef07f@lucifer.local>
In-Reply-To: <ab63390c-9e75-4a45-9bf4-4ceb112ef07f@lucifer.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Feb 2026 13:24:09 +0100
X-Gm-Features: AZwV_QjQOk6KBIhhGsJHJbikCfRdoq7wVHVjUzF565W0EbHofNdnPpSD4f5sZ4A
Message-ID: <CANiq72=ybFtqsh18zkC3e1iyR-RoffcL_ZDr-fU7SjzJiFERHw@mail.gmail.com>
Subject: Re: [PATCH 3/5] mm: export zap_page_range_single and list_lru_add/del
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "David Hildenbrand (arm)" <david@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, kernel-team@android.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 12:58=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> What??
>
> Alice - can you confirm rust isn't exporting stuff that isn't explicitly =
marked
> EXPORT_SYMBOL*() for use by other rust modules?
>
> It's important we keep this in sync, otherwise rust is overriding kernel =
policy.

Currently, Rust GPL-exports every mangled symbol from the `kernel`
crate. To call something you would need to be a Rust caller (not C --
that is not supported at all, even if technically you could hack
something up) and the Rust API would then need to give you access to
it (i.e. you need to be able to pass the Rust language rules, e.g.
being public etc.).

In this case if we are talking about the `VmaRef` type, someone that
can get a reference to a value of that type could then call the
`zap_page_range_single` method. That in turns would try to call the C
one, but that one is not exported, right? So it should be fine.

In the future, for Rust, we may specify whether a particular crate
exports or not (and perhaps even allow to export non-GPL, but
originally it was decided to only export GPL stuff to be on the safe
side; and perhaps in certain namespaces etc.).

Cheers,
Miguel
