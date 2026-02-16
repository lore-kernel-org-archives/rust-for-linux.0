Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE0B227EA8
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 08:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230570; cv=none; b=BItoC14/nxPwv6uWEbEyY+RL9yknxE+OpWxNYk83EZoROMR2MnxyG1vD2yP0sXbB+hKo9JcHs7ZGJBol7oMiAOAA05ioSbFJWmEHFbcD6QTk3W42QA+e3CrvMp4pJvB5H1oh/xH6M7HlSq6g6zJh0iUh3S11gljUVc/7pizW6pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230570; c=relaxed/simple;
	bh=ra1V5naSBIa3oKdC22ngSjF+njr2h+bn056HhsDqPMY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hqfRyqemg033Hbvrm2Yn7dvTqwQp4g5VU+6oveI29yLv9xmHP0/G9XMfmyvQYOU8g0WdbDFk89pXW0Whc9cFdBEPVvrMN0q//HR2fzz4dg6d5ocjUVOE0Ql9sWVlZbtrSQ0fliu/6mAl3p0rgNOSKPlGnqP2moFERZ56GJKE0FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lU5j7QUG; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lU5j7QUG"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4836bf1a920so34629605e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 00:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771230566; x=1771835366; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dw73ohv4pJTcmw9KbhINi0iCnAI6CO1W3op7q8abiDI=;
        b=lU5j7QUGcIBvjTe/4qajbOUlIk7kAwyGHmkUpLYBRi4GnP+XwqQkQtCipAYcT4sDje
         3DQW1bmb3r4mtwQiyvAIA4JS2OyLxzD72dGTWLWICD2kglv66IRQ0aD/v392yWnJnAvs
         XQIro5Klj4++WtCW6ipVIB9WYX4KU0nrPxJksIt3WWCtlbBD7yp7bC2fMwNPO6Li+Maz
         Pjkd+N1qwsNWWKy+FoTnPMehzCdfD4ihVfNSu2BEDrHJydaZncO5Viw+g6vdSb//bhpl
         JdyRrO3GaBZBqo3yXDziXB0cnBhWvECMWS8ixynvxeWSn2NJTududjz3jjr6vboQDGft
         cxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771230566; x=1771835366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dw73ohv4pJTcmw9KbhINi0iCnAI6CO1W3op7q8abiDI=;
        b=LxbBa0FDt/WHEQZb/QS1WFWg+kVIh5t8hi8JJPDbPunF3YM4lNcRxLp2cF2pmYszN5
         ZD5Ga7nz478pSmfDq7oYKPvdxu503iG59WE7zFbEzUwk9EateiE7vrS1Z2EFcht0sCxq
         AKt7tSX9XFIaWfgWgINT6bgmgCUzBeIfcQYPz46UBOnXFRvdGLYy/zEcTptkUDY+nXmZ
         PsAmOkAWUM0oTFB7+Jv1937STePsNoFXD1JIdE0kx6wJHgEEvGHmCb6DDj2ZxxRXzcAf
         KRjm4tCgQhX2EF77kSb3RGaJzcIF3QGPHoZt+bx4iD/EzXQ5K1VeZHjp2l4R4puI4DuK
         OpuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWw3vPSMPE+cIxIyl7rs4DpAkQFTBd9Y0IDKWOnR4g3fktPg93YD6xAu+F3NmKeesf2pnaopS9nKsMG+yARg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd0jCGdmiumxiHNRsOFJWvyOH96l41ofwP450bo1b/Y6iM/RRz
	yXPpJU9gLCIZq3A5wA64t33yPetUVShbcclZuW+p4rYRLwwEF41cxthyfG9QW+G7kD5MMPIwaRA
	q6XBxljRUGpvpeucYYA==
X-Received: from wmbiv15.prod.google.com ([2002:a05:600c:548f:b0:483:5ee6:9c8b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:37cc:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-48379b93370mr118294095e9.5.1771230565675;
 Mon, 16 Feb 2026 00:29:25 -0800 (PST)
Date: Mon, 16 Feb 2026 08:29:24 +0000
In-Reply-To: <20260213220718.82835-6-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260213220718.82835-1-dakr@kernel.org> <20260213220718.82835-6-dakr@kernel.org>
Message-ID: <aZLVZMHzAPnY03Oe@google.com>
Subject: Re: [PATCH v2 5/5] rust: devres: embed struct devres_node directly
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 13, 2026 at 11:07:15PM +0100, Danilo Krummrich wrote:
> Currently, the Devres<T> container uses devm_add_action() to register a
> devres callback.
> 
> devm_add_action() allocates a struct action_devres, which on top of
> struct devres_node, just keeps a data pointer and release function
> pointer.
> 
> This is an unnecessary indirection, given that analogous to struct
> devres, the Devres<T> container can just embed a struct devres_node
> directly without an additional allocation.
> 
> In contrast to struct devres, we don't need to force an alignment of
> ARCH_DMA_MINALIGN (as struct devres does to account for the worst case)
> since we have generics in Rust. I.e. the compiler already ensures
> correct alignment of the embedded T in Devres<T>.
> 
> Thus, get rid of devm_add_action() and instead embed a struct
> devres_node directly.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  /// This abstraction is meant to be used by subsystems to containerize [`Device`] bound resources to
>  /// manage their lifetime.
>  ///
> @@ -111,12 +124,63 @@
>  /// ```
>  pub struct Devres<T: Send> {
>      dev: ARef<Device>,

Wouldn't it be nicer to move this into the Arc? Most of the time, it
would probably fit in the kmalloc bucket without enlarging it, so it
seems like that would be better for most scenarios.

> +// Calling the FFI functions from the `base` module directly from the `Devres<T>` impl may result in
> +// them being called directly from driver modules. This happens since the Rust compiler will use
> +// monomorphisation, so it might happen that functions are instantiated within the calling driver
> +// module. For now, work around this with `#[inline(never)]` helpers.
> +//
> +// TODO: Remove once a more generic solution has been implemented. For instance, we may be able to
> +// leverage `bindgen` to take care of this depending on whether a symbol is (already) exported.

I'm not sure what a generic solution would look like. There is an
assumption that if A can call B and B can call C, then A can call C.
Other than just exporting the C methods, possibly for Rust only?

What happens in C when you turn on LTO and core kernel methods get
inlined into modules?

> +    #[inline(never)]
> +    #[allow(clippy::missing_safety_doc)]
> +    pub(super) unsafe fn devres_node_remove(
> +        dev: *mut bindings::device,
> +        node: *mut bindings::devres_node,
> +    ) -> bool {

Since you're taking the opportunity to wrap these, I'd consider adding
#[must_use] here.

> +                    // SAFETY: `node` is a valid pointer to an uninitialized `struct devres_node`.
> +                    unsafe {
> +                        base::devres_set_node_dbginfo(
> +                            node,
> +                            // TODO: Use `core::any::type_name::<T>()` once we are able to convert
> +                            // the `&str` to a NULL terminated `&CStr` without additional
> +                            // allocation.
> +                            c"Devres<T>".as_char_ptr(),

The problem is that type_name() is not const. We can convert a const
&str to &CStr with no problems already.

Alice
