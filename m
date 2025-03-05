Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F412B1E531
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 13:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741181989; cv=none; b=s5LvYHhF8iz/nfpUjFBJFakEj1wTiPaMxs9mY3Noi+WzphNfLFwtP6xD5n8mQeFBCsbGm4n6VaRnld2+1uTQhbVBx2XQ0AYUVc8RMZcjh95fvkkRrzeUOB5iAaJv3MHacALCIrWPL+IiPxrF8Liwm7j+oF8rlyRWlG6l3VBxsuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741181989; c=relaxed/simple;
	bh=hH0wuGntW1GVHd67yNV6yPzv4v69JEa9hCYh3rQGUBg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oD2xjT4jFaV5S6ZMlHXKRm8XTnlRPtXdvAyR0MXqPBVE2Z++JW2PHyhzQDR/yTUWOOxJ11q6kCMk21Z9nkkiyNI1tRvVWc1b5dD32AjwFYBoaPS7YuaHnnXPJOrADiFlLcDxMF9GqQieYUFsHKFQg/BvNWHpAipkV5Cf4APQ0Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=08R79sGl; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="08R79sGl"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43bd0257945so6288875e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Mar 2025 05:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741181986; x=1741786786; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iPUZZEmLhiylnhNxZtBaXD4G61CYI3JWNg/PDIcOm98=;
        b=08R79sGlu1eFsu8Sa9yvFrQTniNR/VFkJkaIPR1aM8YxnMD9RLISCrtByUM78gIFJq
         VFo/FB0IUi4Rev0vbVWtiooAM5zgmZWP6HvIDmKnFbg39L87X3ygt+zTCIwri5MkEJL/
         ggdFSaGkIeIkwtgVMPXSOQHfuhk9SiMIK4ThzGy9HH+NguJCc2N3FL4OUNX0Z0X095ah
         eQN7wYPrskditGgx1QmEeVeLjMCq+BORpxitIEUvcMqYhlWUViQuoPe4pzjmHHuPoqnG
         fmi1kwM8k2RRC4iAWWQ92iVjGrPUrM7j57PAMAIQVi9qslCowwwijTquRQE86k5nRVmJ
         mlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181986; x=1741786786;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iPUZZEmLhiylnhNxZtBaXD4G61CYI3JWNg/PDIcOm98=;
        b=khhCow6qYU5U1GKv3dn15T1tCLXy8NKYb0zjrwIEghzaTufPgkPSPhtRbUvTDpkafb
         9dInsD4JtKtJ0KrnbpRjhgiogqbu+aE+0gCVUaRWEjE5lQarTtlpfMp2wefumsoCzPo4
         vWaxUIVFylxHuaQ7yT9+xwzSlOl3yUWsre2LGfYPYr6wgYzL5Jc23OJWfB/vg1bDxvqG
         x31MvoHHhdJA73PlApIr84Jxd2kN6W+Z7nQSYglcgfKzVsv2OZBT+M1qhsHAD3jfFhJw
         mFq3PQpMMm9pyGpgGpGh0sygGmyzFNaCRc3+1+fgKAwSj9OG3Sh4wHteqo1sc4lJTKFn
         hYfw==
X-Forwarded-Encrypted: i=1; AJvYcCWACOGcT/CSojXez6hf7gDiT6cqWuU85A7Fqg0CJaPpP6WtYTc2nSgC44Oy76yKskB4qqAjheacuS613QTUqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYY7m5pQzp5IuF7lhmSMRQsCUDmzP90J2lz8GerVf6qSOsJyqj
	/5XOSjrtWyMJ9dNFLiR+6x1GNuQWX1pPuihkZG41Ual+ij1vkb17ZVDYv618pL30syOMzghmQ47
	BA9v8PHj8Qnj5pg==
X-Google-Smtp-Source: AGHT+IHD3eCKdwuDX9K5/IGnAhihgC/lO0q8ZWD1UMUDw4qzVo/4D91ZjsdL9RIsmzFcjMdEUCbalYuIFqD3gUg=
X-Received: from wmbhc5.prod.google.com ([2002:a05:600c:8705:b0:439:64f9:d801])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1988:b0:439:a1c7:7b2d with SMTP id 5b1f17b1804b1-43bd29272a3mr23637265e9.4.1741181986287;
 Wed, 05 Mar 2025 05:39:46 -0800 (PST)
Date: Wed, 5 Mar 2025 13:39:44 +0000
In-Reply-To: <20250305-unique-ref-v4-1-a8fdef7b1c2c@pm.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250305-unique-ref-v4-1-a8fdef7b1c2c@pm.me>
Message-ID: <Z8hUIPtE_9P60fAf@google.com>
Subject: Re: [PATCH v4] rust: adding UniqueRefCounted and UniqueRef types
From: Alice Ryhl <aliceryhl@google.com>
To: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Mar 05, 2025 at 11:31:44AM +0000, Oliver Mangold wrote:
> Add `UniqueRef` as a variant of `ARef` that is guaranteed to be unique.
> This is useful when mutable access to the underlying type is required
> and we can guarantee uniqueness, and when APIs that would normally take
> an `ARef` require uniqueness.
> 
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>

[...]

> +impl<T: UniqueRefCounted> Deref for UniqueRef<T> {
> +    type Target = T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: The type invariants guarantee that the object is valid.
> +        unsafe { self.ptr.as_ref() }
> +    }
> +}

What stops people from doing this?

let my_unique: UniqueRef<T> = ...;
let my_ref: &T = &*my_unique;
let my_shared: ARef<T> = ARef::from(my_ref);

Now it is no longer unique.

> +impl<T: UniqueRefCounted> DerefMut for UniqueRef<T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        // SAFETY: The type invariants guarantee that the object is valid.
> +        unsafe { self.ptr.as_mut() }
> +    }
> +}

This DerefMut will make it almost impossible for C types to implement
UniqueRefCounted because it is incompatible with pinning. You probably
want `T: UniqueRefCounted + Unpin` here.

For `T: !Unpin` (i.e. almost all C types), you can at most produce an
`Pin<&mut Self>`.

Alice
