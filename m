Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4701FC0FC
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Jul 2025 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614580; cv=none; b=pqay1iPC+fsQ+3dMHsQPdde8e8CBU153P//aJ0VYqRQ3s5zZQJut9wIa8b2bbG8M3FkY3BfsZgpp9o8yB9aOHfwn2hSqguMfFq8AX1iWmm50ioQ4zLGHXXKt7qa4UACLWdYa8xpAzgCpIce9f5PtHCzXpjMi8XkGyXIClK5qOOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614580; c=relaxed/simple;
	bh=/Y1HDnCY8jkC03G1cnevxf9lCIBn5/QFyR+QC+TXdRs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GAhKRC55Bci7+yfhXyS8dkGHpG1t8B28C7lyLwgP/Bq2yeRNlcAAFHzYhCIVMLSy+XJK1s0lbQBr1XOYFpw8QuPZ6pinqOV/bdea3VwmKcbjhvp51Olx1vu7kxJiDMxxlrblSYcutmFWRFaHS83g3t+NufMQ988W0AOzb38iXBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nMxlfSaX; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nMxlfSaX"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-adb33457610so59990066b.3
        for <rust-for-linux@vger.kernel.org>; Fri, 04 Jul 2025 00:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751614577; x=1752219377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VbPLQ6L34/3I/7pb+gVRMbQKVuoSJ7/Wr97i0FfOaA=;
        b=nMxlfSaXiEzLHtmOTqjeSJUxJqXbT6nMFSlTN2xK2DeM9Wxs/J1WINFbL8Qrd1hQAU
         Oa8VOm/3u0MCYdS5NAOX1Z+/D9bkukrh2Dz6e2NLYW39qUM7H2Tzpvn7PzCvw3pFqZRU
         Q8DvsJmib03pd0c3VIeG2PMFkiVfl7ogPM6ijIlsCGjlxrxl04ey1w531YXZi1MklJhh
         TYHFvufnKnffirkf0igcFS3HQIbg8PnEQUJKED/naowkLtg1qqNywAQJNPWvGyMhqGok
         ASJmI7gBdiISPj2DH76G2kNCjyR+ZGXrw82brLqKKCKiehsa0exBFxUrbP5cNXWSrinP
         gZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751614577; x=1752219377;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8VbPLQ6L34/3I/7pb+gVRMbQKVuoSJ7/Wr97i0FfOaA=;
        b=N1cvF8UK5UOgClUMSR00yaJGuobAKPf6k6ofO6PLiVGGKomH9EOXJFPtHDPSnlqclU
         eeTMEVneXL8Nh1jDmgSbRdKT9kGF+VQSQJIMObFJ761hRmieJ6lp22zugbkDIYq/sdxR
         2P+ar4a1f+I0H5PKsxbzj8C4ARyMCDh3m/awzQpvmo9zCh4l7aXreqmPw8utrpj8PVoW
         XAPvYwngQs+IFTnSm1n4EHsLG9IrHWmkUfuGqQ1pcrp0eWlbO0Qn7l/s3qIXzeiy1goX
         VVqBiXuXZqmeVKKeFWegHzIysEGjgGbeIZQcbav1x+quGH58it1rORDaDIL0ndV5pGwW
         rqnA==
X-Gm-Message-State: AOJu0YyOgn+Je/m+g7Efu1FJ/iiYWSqX8oXF68+PFgmdD+ptkIB6gxBG
	hmrhK0sLzXgO9IaBNpx82nASC84jpc5cyzonQ2azZ5sRwoiWmspwp7QgcgcEt1siAMG5Dmsytmk
	kd7ZKzyyqG9fG/5OEaQ==
X-Google-Smtp-Source: AGHT+IGLKDhWN5Gp176PgenJ+657UGPDzQsvmRizcQxTpVnTp8COVLNgzrPq486eLmrZODnX5hmljKS/IgnUiqE=
X-Received: from ejrg6.prod.google.com ([2002:a17:906:5946:b0:ade:3a07:859e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7292:b0:ade:32fa:739e with SMTP id a640c23a62f3a-ae3fe5964e8mr99965366b.2.1751614577728;
 Fri, 04 Jul 2025 00:36:17 -0700 (PDT)
Date: Fri, 4 Jul 2025 07:36:16 +0000
In-Reply-To: <20250704054539.7715-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250704054539.7715-1-work@onurozkan.dev>
Message-ID: <aGeEcOEYXiLju-Lj@google.com>
Subject: Re: [PATCH] rust: rbtree: simplify finding `current` in `remove_current`
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	mattgilbride@google.com, wedsonaf@gmail.com, daniel@sedlak.dev, 
	tamird@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 04, 2025 at 08:45:39AM +0300, Onur =C3=96zkan wrote:
> The previous version used a verbose `match` to get
> `current`, which may be slightly confusing at first
> glance.
>=20
> This change makes it shorter and more clearly expresses
> the intent: prefer `next` if available, otherwise fall
> back to `prev`.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/rbtree.rs | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>=20
> diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
> index 8d978c896747..8f1052552132 100644
> --- a/rust/kernel/rbtree.rs
> +++ b/rust/kernel/rbtree.rs
> @@ -769,18 +769,10 @@ pub fn remove_current(self) -> (Option<Self>, RBTre=
eNode<K, V>) {
>          // the tree cannot change. By the tree invariant, all nodes are =
valid.
>          unsafe { bindings::rb_erase(&mut (*this).links, addr_of_mut!(sel=
f.tree.root)) };
>=20
> -        let current =3D match (prev, next) {
> -            (_, Some(next)) =3D> next,
> -            (Some(prev), None) =3D> prev,
> -            (None, None) =3D> {
> -                return (None, node);
> -            }
> -        };
> -
>          (
> -            // INVARIANT:
> -            // - `current` is a valid node in the [`RBTree`] pointed to =
by `self.tree`.
> -            Some(Self {
> +            next.or(prev).map(|current| Self {
> +                // INVARIANT:
> +                // - `current` is a valid node in the [`RBTree`] pointed=
 to by `self.tree`.
>                  current,
>                  tree: self.tree,
>              }),

I'm okay with this change, but the INVARIANT: comment usually goes
before the `StructName {` declaration rather than on the field. For
example, what about this?

	// INVARIANT:
	// - `current` is a valid node in the [`RBTree`] pointed to by `self.tree`=
.
	let cursor =3D next.or(prev).map(|current| Self {
	    current,
	    tree: self.tree,
	});
=09
	(cursor, node)

Alice
