Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6362BDC00
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761308137; cv=none; b=ELV1OJxaGcfSEB9wtQCAb9qZSkZxsOMzMpaid9XFBzuWwW0O9ISBUiwb1imzXrGCMuWVrP2HDa94Ut/WpRk4JR/Bsbb7BoKrG2QCRXwrdS+gR/jP+yp9Mc4d7gPjyY/NWq2xR5rYMSuydh/ZkjFdLO35gun4SRxo3MrkDjjp6nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761308137; c=relaxed/simple;
	bh=1QYFOnhEDNlrBEyVN+IEYzwowhQlYIEJHN3U3pBB4Ck=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hqR8A/zAuCqH220XlubDycW/97p2bLh5bgXgc7fODcs+jSKWYSF2Jx3VjqHSvxH5MuraWt0dN9NSLTB5r3SbGmg7HCUP8fVURkKA/3CQKCb11z+WOwkIuE2V8P/dZI+VtDvKAL6gcsNF9TLTShLTgKYhQMmjg5c1ZqmkxY+UBew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cJ77kMA1; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cJ77kMA1"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-63e0b49cd15so2141415a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 05:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761308134; x=1761912934; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VYIbCMuRi13fdYnbnhpcKoD3rM3DmFSEXS9pBiRUSxc=;
        b=cJ77kMA1wwRM4RrnEvo6LlLMWEer+iJh2jplK4o2wNvSxaji2HKmbcLaVBP4If82Xn
         6VFSFU0Guoq+YCma+FsFNQdou38TKB+TUzYObcPSra/bloERvGs23t+a39Gq4lOlFEJN
         05N8CdGMed6ZTcgfQ/kFQMASsMlFAFUzkGozn9kgwBkc01y7D4bTy44G0VTgv005FCU2
         Hagfzsmfzn1pZR2PdvUGAP0wAR0YJV0f28CD8Qq5v+rWotIc1B9iGUdGHabQj6d/bbBH
         0UVQo8KC31E+avuIfouoEsRJ8m6EJnAOddJ2fHd4TTOPvA1P1TpdyvuON+ovgSAXqIxN
         uAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761308134; x=1761912934;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYIbCMuRi13fdYnbnhpcKoD3rM3DmFSEXS9pBiRUSxc=;
        b=Ld/Qc+ljrSJXxBlZulXcGzVLGNklaqZ4awdMKPPgQHBTQ+iJSnQDexxqq3gJqFvgDS
         jXeF+kMYvt3suw1Jl+mmuV4S+mWbGQAy7qrASSzaXYMCVebsrIqLXYOJDXPW1ersr7Fv
         2EB/hSHSIDOBNOiiRbiR+UXIdgXaCONczS2XU1I8vamp/zmq+zY7O7T8rUELJN2ldpGv
         lWSQuZ05brBV6mx7lXNHV8Y/rRIzRN++0+IUE0wkO6OykahHK4JrvS1iZhT9wD2xSpvN
         NmA4zKGHodA1FRtz5XHgH140sD5X/RoYEA08iLCtXR83V2Fcrm8UNkQRa7RosD0gOTNg
         h2kg==
X-Forwarded-Encrypted: i=1; AJvYcCU2s/ol1eeEbwWbq4/24odfFDbr+xdhkBJGhM4LwdY7ZH1d2V5f9P9wS0IkVOGiJtTCiYrIKQ4a8IX3O6QbCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJdjTdUkpZickkpwTyekhmmiw6TYsvEokgCCmGZMpmW4Tigt8J
	5H7kun+I6oGmjURT6Bpb1s7Cr7getAN0a8XcrtRR5iuMW2S1Pm/QsdB0BhFBM+28Ni1IHFf62xF
	y2/bT4yoyhNqRu9HA6g==
X-Google-Smtp-Source: AGHT+IFKGYbprr7tWKIreIWGEx72f2mseKaij75eArsKsTtRHf0EN2H2ZyWU9vKva3onEuRE1wLgAY5783wz1i4=
X-Received: from edt20.prod.google.com ([2002:a05:6402:4554:b0:637:4e1f:94b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:847:b0:63c:18e:1dee with SMTP id 4fb4d7f45d1cf-63e3e4791a6mr5530880a12.24.1761308134211;
 Fri, 24 Oct 2025 05:15:34 -0700 (PDT)
Date: Fri, 24 Oct 2025 12:15:33 +0000
In-Reply-To: <20251022143158.64475-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251022143158.64475-1-dakr@kernel.org> <20251022143158.64475-2-dakr@kernel.org>
Message-ID: <aPtt5XyE_pBoiarD@google.com>
Subject: Re: [PATCH v3 01/10] rust: fs: add new type file::Offset
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="utf-8"

On Wed, Oct 22, 2025 at 04:30:35PM +0200, Danilo Krummrich wrote:
> Add a new type for file offsets, i.e. bindings::loff_t. Trying to avoid
> using raw bindings types, this seems to be the better alternative
> compared to just using i64.
> 
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Jan Kara <jack@suse.cz>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/fs/file.rs | 142 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 141 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
> index cf06e73a6da0..681b8a9e5d52 100644
> --- a/rust/kernel/fs/file.rs
> +++ b/rust/kernel/fs/file.rs
> @@ -15,7 +15,147 @@
>      sync::aref::{ARef, AlwaysRefCounted},
>      types::{NotThreadSafe, Opaque},
>  };
> -use core::ptr;
> +use core::{num::TryFromIntError, ptr};
> +
> +/// Representation of an offset within a [`File`].
> +///
> +/// Transparent wrapper around `bindings::loff_t`.
> +#[repr(transparent)]
> +#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Default)]
> +pub struct Offset(bindings::loff_t);

There is no invariant on this type, so the field can be public.

	pub struct Offset(pub bindings::loff_t);

Otherwise LGTM:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
