Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E8F2F5A05
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Nov 2025 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762507654; cv=none; b=N/9/ZUc/I2uwQETjzabrxDmyI6rVGQxRxI6U7bYkVf7SGPMnskvoks/V6aUwns9b7R9PbzPdlsaPOLc5wrrO4fUX46FNxKlNJGtpA3HGqpGgMwo/v60hJcZIX+uiPyiLBe/KbDiAwwWQrJuyuJiU8S6DIr7Ck/zSHjgUIhf7X50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762507654; c=relaxed/simple;
	bh=zql2idMxKn9IZQQNYisWu3dktGhNGu+7zZEYNX+6VNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WeHx18V3pJY4hlhsdzAu+A5MNgospc/lLJ9v+i/G4JSdKg9yTqCLUydMDiIZs9PyyVPcQgn9qNTAvyYXaqggMit/0qnXYQg8B1xtVi0PZhQdAid45vu7nuDWOzG2W0fcE9YnnIApDVKdA6v/nUyAesaz/z/yd8tUJ31bJT10IiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2RM+Ujcj; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2RM+Ujcj"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee130237a8so312752f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 01:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762507651; x=1763112451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJkdEVxT25O3GXjohNk3p6mQ6FsJrtPAoSVYfYSIvHw=;
        b=2RM+UjcjaqTLAVafLXzNXwiKtbPjfqz9ynfem20WPAOHycMxyVnEijfrZDrfEYR1AL
         uJ66LX6xQDX5R1UJd/lCY0YeaqPoZJM8JUBtxjlr43xPsbBR71Qy5w3E25aepGT5SI+6
         AMQVWmr2ygA4MNQGlfWOeUVxVjFqP9t65Uo/DXCQxtlxB7AVBQerL+9XO4PBVKeg250Q
         VMR+tD5Td0ou829j16Ma9EOmou3MG7xUA/pbW6Jo7XucieQOMqqVkqz58m6Q2lnE5Hfh
         bKrKbLk6+S1EdgOeB9L9xbR/zbfk/ekM+UYyeHMBiLw0DpcwM5HZfAkPHHimkBd/92bR
         6wDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762507651; x=1763112451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oJkdEVxT25O3GXjohNk3p6mQ6FsJrtPAoSVYfYSIvHw=;
        b=RS4VvLlAAUbPlXolITWdC6c2iU3j7giE9PDbplP3EDN24DQanJmqVzpQheD6LLJD5g
         Cq3u4xZR2gzjlNFs3rU2d6GYPHIo37GAqvhAGa/E0tNzGqbA37qaTHNwh+qQh4oNM/KJ
         C1p9yNpazBa0QTdxvno4wSeC2Wy80LynViW7Y1pFlhqMMh6R4rFESngolYjshS07hH1O
         Qsmmn5Y2F5ZxjNI3JXTGAIgR9JLyIpP+P3PfFQeYBRPHLj7AlAjfdJ9BDym7+CGtrzHs
         h4aKOV7SwQKxib6LnYhGDPIY+dKJ3WpFfnImd9lO1qpnJVjxOXBLSlDcL7VXHTmgzTNk
         mh0w==
X-Forwarded-Encrypted: i=1; AJvYcCUlB2DjaXjZimKdY9n2u7esslcYWA9VtbuWk1SjsjE2CLg3NDYK29WW27euYcJNK2TaREiHD6PExV9Ccc/CmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRPXs5wl2aQ3IDP+o9iEXN6T/6d6Vdb9qaoaHZV6jre02t6/ja
	n+ciFWd5rM3K/I6bHquvINBN2nJs40YVHYDwwuE2AzkV6map/hmmkRqZfbsIJpBXvWexb0CNAsA
	oSsYniwB7TqePDzafKd1RgYxSMUwZeOwUq96LRA90
X-Gm-Gg: ASbGnctJ8wrBoYTsPcv9lJ/xiUZZq4AJ1n1+WpxYZ3RwvDpfJm/hvZOVz0dtA0YNprG
	g1fl55ldlRArt71w+04ZoXQ0XuY02zeKchSS90xZ7ZxboUBK+in8eIDVljNGMiolj3fxHNwSOK+
	CIfdRAE03hho6ROuTlWmoKK7Q4L0WyE4Uky65F/V4jItC5qsh8vPJ1d4OvLIuhIbzWcIkWmbKU0
	cqpdesTq7p8lRXtKUd5J3nanhFb9MBLMmw5dpxoVSZWCrSolfHPUrK6IpCx/DPChKExh8ZAwbO+
	rWCd5hmOLjD2vg==
X-Google-Smtp-Source: AGHT+IFle/w4e+aky9dDN00u9w5qMqMYp4+iwTBMRCAFPTApgJKqffnTXa0XQ44LPOLkMtHMiEidtNEEmO7onsmHZ4k=
X-Received: by 2002:a05:600c:474a:b0:477:55c9:c3ea with SMTP id
 5b1f17b1804b1-4776bcdb495mr21615615e9.35.1762507651253; Fri, 07 Nov 2025
 01:27:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107050700.1086059-1-m18080292938@163.com>
In-Reply-To: <20251107050700.1086059-1-m18080292938@163.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 7 Nov 2025 10:27:16 +0100
X-Gm-Features: AWmQ_bn0_YpyoyCmwHnyMVeVnDhIAwFUr0Y5LT4OlVSRZWa7nbsVmxfJKIuTnIQ
Message-ID: <CAH5fLgirP4=RrDcuF0n74KvN05K4FkAm9uZUfwX0WYfM+pKP8g@mail.gmail.com>
Subject: Re: [PATCH] rust: rbtree: fix cursor method lifetimes to match tree lifetime
To: Hang Shu <m18080292938@163.com>
Cc: ojeda@kernel.org, Hang Shu <hangshu847@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Charalampos Mitrodimas <charmitro@posteo.net>, Borys Tyran <borys.tyran@protonmail.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Daniel Sedlak <daniel@sedlak.dev>, Tamir Duberstein <tamird@gmail.com>, 
	Matt Gilbride <mattgilbride@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 6:07=E2=80=AFAM Hang Shu <m18080292938@163.com> wrot=
e:
>
> From: Hang Shu <hangshu847@gmail.com>
>
> The returned keys and values of cursor methods should be bound by
> the lifetime of the rbtree itself ('a), not the lifetime of the cursor.
>
> Without this adjustment, examples like the following fail to compile:
>
> fn test_rbtree_cursor(rbtree: &mut RBTree<i32, i32>) -> &i32 {
>     rbtree.try_create_and_insert(1, 1, GFP_KERNEL).unwrap();
>     let mut cursor =3D rbtree.cursor_front().unwrap();
>     // compile error
>     // cannot return value referencing local variable `cursor`
>     cursor.peek_next().unwrap().1
> }
>
> This modification ensures that references to tree elements remain valid
> independently of the cursor's scope,
> aligning with the actual lifetime dependencies in the data structure.
>
> The changes will be applied to multiple similar methods
> throughout the Cursor implementation to maintain consistency.
>
> Fixes: 98c14e40e07a ("rust: rbtree: add cursor")
> Signed-off-by: Hang Shu <hangshu847@gmail.com>
> ---
>  rust/kernel/rbtree.rs | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
> index 9e178dacddf1..702a1b6ef7a9 100644
> --- a/rust/kernel/rbtree.rs
> +++ b/rust/kernel/rbtree.rs
> @@ -742,7 +742,7 @@ unsafe impl<'a, K: Sync, V: Sync> Sync for Cursor<'a,=
 K, V> {}
>
>  impl<'a, K, V> Cursor<'a, K, V> {
>      /// The current node
> -    pub fn current(&self) -> (&K, &V) {
> +    pub fn current(&self) -> (&'a K, &'a V) {
>          // SAFETY:
>          // - `self.current` is a valid node by the type invariants.
>          // - We have an immutable reference by the function signature.
> @@ -750,7 +750,7 @@ pub fn current(&self) -> (&K, &V) {
>      }
>
>      /// The current node, with a mutable value
> -    pub fn current_mut(&mut self) -> (&K, &mut V) {
> +    pub fn current_mut(&mut self) -> (&'a K, &'a mut V) {

This would allow me to call current_mut() twice on the same cursor to
get two mutable references to the same value. That is not okay.

If you want to have methods that return a reference with the tree's
lifetime instead of the cursor's, then you need to add new methods
(probably called into_*) rather than modify the existing ones.

Alice
