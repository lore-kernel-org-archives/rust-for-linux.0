Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486F6367B9E
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163769; cv=none; b=rMpgFMnN1Qry/o3+zw3bKB56ONmQRL2ju+4oufsroIWvKCC16FrTOJXWdQMwX6HPL+sMZ3VnqqCUG2FDhKwB4Ue9yi50WPU1fwU0WwBUsCYmn2iDPc28x6uOuLArB/pcwxNY71EGzv5157Z7qAcDx5YyBd69/10wmpcB0cTpkZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163769; c=relaxed/simple;
	bh=9Hi5G83dO7QXkCQSBytppdeMnz3hjd8brQd7w5LIyDY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j2IGLmUFPjF03O48qoJ0pLHJSZJgrUwhbE7WjKWW+b32H2VTqTwFewMUbGF+b0hH2ZX2mqEiExq/KihKkj6utAc9pvkPlrmPuuCF3WxD+8Hi02mGFul12x122aAijr3gkCwPRCCg5KfYAoldQA0sb/9xoWN1RH7V4mGzaHPdVwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PeunyJ9t; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PeunyJ9t"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490b0682d2fso71706355e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 00:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781163767; x=1781768567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QS/QG8pusntP+r54WiP07pgkraUAuj5JsutpBJR8Ac=;
        b=PeunyJ9tgzfGrcGSmVv/ByrczxZf3y45aXjyBatQB2wYSx1h/NEBabznV8hKWm9BP2
         Iirb2jyEHUSq0yAJfgAXzSqpOWGpd055OJNyM+z5qqCt7hX570l24/VTFDlJ4aa6g/EX
         kjd86xYfdIF9f0zI45XV1nKIDsPs1zcs4uhsZ7wecd5wt/2C53R5JnB51DxfVBwsHrIX
         upVZtCd3wlTtrVjWWwCeTU6xAYEpiUznu+ZMylIQB8glWVznr4+1FeI/hLH15WmKpxuX
         WSoOf6f+0S1J1aHrapaX2Ae4DMfhvidUVbZ4/qQ6zGPN4gIxqUu+6eA8DS86BcJkW+Fp
         UvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781163767; x=1781768567;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2QS/QG8pusntP+r54WiP07pgkraUAuj5JsutpBJR8Ac=;
        b=RBtIDPvcKS2wGpr8fvPRTYII+pkV4hqUk0goVH7pJ3v/x36q+U7ZtiE61lRKGdR/8P
         wyCH/LUkaUcuQ62uUOKYDYTR5ITPA6kAbcxFfTzggRkZbR/VX4Yp3UbtC24W5B1RTdoZ
         +Rr+xv/+wAagu6f8ZiPOUaMFHZGjaHqNea+S2hgSlsLv0Zd6wGph9NiHvgs+YwoeGyEJ
         RiDnwmGEf0fgJQla/H3JPgdm/GB8siHb4EdZYpbeFr9GWxakRBoSFr5F0Dd2RlgfEwRt
         grs2fuSJT0xH+22VBAp36K8342cOoOL+jXdZAr+fZxdYlQS7y2tr+WAk8p/DMm/8OM6W
         yRUg==
X-Forwarded-Encrypted: i=1; AFNElJ9yWI+kefQL5CbuZ0h3az0p8RTPamfetcN+OrXCw3R9iJCNwOiLihaw0ZzDtQi1J4n/Nr2uk2OOCkEsae9eGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWklw9mTnkZCjf/EOweeu9GurUSUDMczyHtHEgHDA7ZpYzb1+P
	Fq/M4nt1IOuz59Vf4Yvw6N0i7rc6R44Z6DKYWB6s7rO9YKVsxGWPFrAg63gjnqbIzIFC8SB46LN
	djYrqMtRa3uBlvUF7+g==
X-Received: from wmv21.prod.google.com ([2002:a05:600c:26d5:b0:48a:79a9:335c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3105:b0:490:d38c:7836 with SMTP id 5b1f17b1804b1-490e55d0fa5mr19190645e9.3.1781163766573;
 Thu, 11 Jun 2026 00:42:46 -0700 (PDT)
Date: Thu, 11 Jun 2026 07:42:45 +0000
In-Reply-To: <20260610133241.374115-1-georgeandrout13@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260610035544.3333022-1-georgeandrout13@gmail.com> <20260610133241.374115-1-georgeandrout13@gmail.com>
Message-ID: <aipm9QeAyhah1Vkh@google.com>
Subject: Re: [PATCH v2] rust_binder: add ownership assertion to Node::add_death
From: Alice Ryhl <aliceryhl@google.com>
To: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 09:32:39AM -0400, Georgios Androutsopoulos wrote:
> The `// SAFETY:` comment in NodeDeath::set_cleared assumes that a
> NodeDeath is never inserted into the death list of any Node other than
> its owner. However, this invariant is not enforced by the safe function
> Node::add_death, which inserts NodeDeath into the death list without
> checking that death.node =3D=3D self, leaving a risk for future code that
> may miss this implicit invariant and cause undefined behavior.
>=20
> Add an assertion to make this precondition explicit and catch potential
> violations early.
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1237
>=20
> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> ---
> Changes in v2:
> - Replace assert!() with pr_warn() + debug_assert() following
>   feedback from Onur =C3=96zkan and Miguel Ojeda.
>=20
> Link to v1: https://lore.kernel.org/rust-for-linux/20260610035544.3333022=
-1-georgeandrout13@gmail.com/
> ---
>  drivers/android/binder/node.rs | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node=
.rs
> index 69f757ff7461..425076405e1e 100644
> --- a/drivers/android/binder/node.rs
> +++ b/drivers/android/binder/node.rs
> @@ -333,6 +333,11 @@ pub(crate) fn add_death(
>          death: ListArc<DTRWrap<NodeDeath>, 1>,
>          guard: &mut Guard<'_, ProcessInner, SpinLockBackend>,
>      ) {
> +        let is_valid =3D core::ptr::eq(self, &**death.node);
> +        if !is_valid {
> +            pr_warn!("attempt to add NodeDeath to the wrong death list\n=
");
> +        }
> +        debug_assert!(is_valid);

If this assertion fails we should not continue. Either use a full panic,
or do a warn_on! and return without adding it.

Alice
