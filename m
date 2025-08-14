Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA99221CC4B
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 15:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755184785; cv=none; b=aWrfNaL0ejdXo2QagUsJB1o3iXlV8IKoZx4MfcZcOzZ7T5LDJlo0jk4SvyQSIxQPnXpQcOCvGtodW67zdwYLela1MPzmp/EHNWK4aX7FbdSYZI0PJATX4iXbPTwsqkWhJ+NbcLGga1dqfGHbaGiTXW0cAhj7jvnHlOOBT2I7TfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755184785; c=relaxed/simple;
	bh=1aU9Fc2hnGJ7q3vxrXZn0TdZMRj1SgPzOxTn6GYad6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9jb0WY1Af8xdRbMufKTBIB/XDJJJLRXcgXfIIKmoGEOXJ/vQ5l4oauc2V3Un+ErZYVHtqDSYQTgTlMzCLNH+Yab1TUx4J9A4DsoOQ3/Gw7OabpEYyjphBKroCSPLBd+Vp3K0dNqd0jnXuRJq/g9iNIsb33vz1PqRXE7mWWkUnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=cO3aaJg+; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="cO3aaJg+"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76e2eb09041so1035015b3a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1755184783; x=1755789583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20H1bX4SpHlHB/4n1zlWbsrFeE3+kzUJdvfUi51WrVs=;
        b=cO3aaJg+D5WvHXZxcUw6WR4/PCqN6/ZkwlI6RaRt/Rd6juinuCrDOpDDiYetM67QDF
         lvUWVo9pLFE6F+CcxejYY34BNU+VEmngy70/n7dI+uVGLPnxxyNtGhfCakPAh1MdMNRk
         VcNe+An/DlupHnOdN64B8pHd9mKgl9+AWqd/c3BR8a3wZi4d9YWNOpCSCqqz7//Q/3ME
         w/KrjoTBQ9IricBPCQpfXNFIEY2YGtjawjVjlRqoV4CltJTBgwJZ3a05norIbGIBCCb7
         LVus6Pu8ovTCEx7KYIYn2CNQmkNXsHejmZSHRq3qzSF27nv6ZPp3PR7KTqyQ6L3ZHgkL
         Xd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755184783; x=1755789583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20H1bX4SpHlHB/4n1zlWbsrFeE3+kzUJdvfUi51WrVs=;
        b=T+MVJS0zrz3m8N3HAm3Z3Ya9SnVNTKsucSKNd15yFaHwl6v4bWVRK4CuXAkicjLJiY
         9cJtBQkDhTJk/uST9albs9xn0ocFV+Ijzmj1qEdPHvlAMdnUPmfqDXZlWoFc+I67Z2tz
         KvK57SHxgvOexo1wldP/2YEUw7eVOERmsNV5DTKbmTyNIGPLn8BSxTBt3iTC1QQihD4w
         uuc0sNkqDjrTp/86tUoi4co3FNRAORx8i7onqq1QHon9qaLd1iK82pLJCM2Ar8qzGV4Y
         2ceV6Li6FHLNj1trMuGPETaE2MD/7gMOdQzCi6lcN4DvFuHcEByVAkkVqxVLUHH5cVqN
         tMGw==
X-Forwarded-Encrypted: i=1; AJvYcCXiUEq2iPtn/JsG1/1+9qGcDFysbljq8rs/x99JZu9vBcDgxgG2OgTH/8ylf++xUC45eEM5ZZL4j0QU5NdCSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh+VNrjJn1JZHqOeMIarFNyKE6rmL3y7kzOdTcDXKOZV4zcyB9
	vef5ugm5Gtg/61tDusgT4ztbQzzXldvLJQEOXX6C+idhrcew+QzRai2bi496YdGofaRc8KEZ2ES
	hsxOwXzBbbya2fG2nWMrbaS4pWSPZnTnHku3drWpi
X-Gm-Gg: ASbGnctnWs9YwWnoMgLLRkdz8NR8r9kinxrJJ3Lq7GQZd3NtkC8JUj6ovDTlEwRltgk
	5lyRu54aTmBWWDl9izHi+rlOis8Iu0X9tk6JfOKdn8gZqeCPaH3pOk8qSVNKkon5uNy4UUzr3H/
	/H9tG4JPEkmiPE47edTJ/12FKD+eo5SrWGcBwKVZNeAAmj84tzq1/twda8ECFQXEBFi9RM8mzN1
	CiQpEQ=
X-Google-Smtp-Source: AGHT+IFj2nuw4OO0aHub04IY1bUUEIXMLpj8BpAPXS/WeiKdAX2g9e2Cm74izpij3E8Z0pJYOO+KflfoZ3I3eW+o1dw=
X-Received: by 2002:a17:902:f550:b0:234:c8f6:1afb with SMTP id
 d9443c01a7336-24458868a2cmr48666085ad.0.1755184782770; Thu, 14 Aug 2025
 08:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814093046.2071971-1-lossin@kernel.org> <20250814093046.2071971-8-lossin@kernel.org>
In-Reply-To: <20250814093046.2071971-8-lossin@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 14 Aug 2025 11:19:31 -0400
X-Gm-Features: Ac12FXxDyG0PFgKScv9MjLNEC8CCg0DXSw1W94x7lFL8PxoeSTQQVlHWfNxxHrs
Message-ID: <CAHC9VhQXOezJ2=B1BQOqLgfuzDJEVS5G_r9+_bQ+OUNTpjZCKw@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] rust: security: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Jocelyn Falempe <jfalempe@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 5:31=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> All types in `bindings` implement `Zeroable` if they can, so use
> `pin_init::zeroed` instead of relying on `unsafe` code.
>
> If this ends up not compiling in the future, something in bindgen or on
> the C side changed and is most likely incorrect.
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>  rust/kernel/security.rs | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

I'm happy to take this via the LSM tree, but it would be nice to see a
Reviewed-by/Acked-by from someone with a better understanding of Rust
:)

Alice, you've reviewed/submitted LSM rust bits in the past, can you
look at this?

> diff --git a/rust/kernel/security.rs b/rust/kernel/security.rs
> index 0c63e9e7e564..11a6493525f3 100644
> --- a/rust/kernel/security.rs
> +++ b/rust/kernel/security.rs
> @@ -25,8 +25,7 @@ impl SecurityCtx {
>      /// Get the security context given its id.
>      #[inline]
>      pub fn from_secid(secid: u32) -> Result<Self> {
> -        // SAFETY: `struct lsm_context` can be initialized to all zeros.
> -        let mut ctx: bindings::lsm_context =3D unsafe { core::mem::zeroe=
d() };
> +        let mut ctx: bindings::lsm_context =3D pin_init::zeroed();
>
>          // SAFETY: Just a C FFI call. The pointer is valid for writes.
>          to_result(unsafe { bindings::security_secid_to_secctx(secid, &mu=
t ctx) })?;
> --
> 2.50.1

--=20
paul-moore.com
