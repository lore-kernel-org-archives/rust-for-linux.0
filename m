Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DFC35963
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Jun 2025 08:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234761; cv=none; b=n3RRURMvnQA0xblVy4cRvf2Whw276FFLTb3b6WouP1JnVuD/h4wDzhZbqrWUQyX3DyV+a9pJj4/kFkrdoeiVHLrHVB+hhXQcQjxmujbfdLFk6D3Men1WieJ5xzs6s2nxNbMJdGdUuxRtGJfPW6YYQx0n5+l4+GyNCyw+uX0f9VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234761; c=relaxed/simple;
	bh=LSNhtgb4bGx+huxENi51BzSjcnT5El3b84UX/Aphoe4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=em4Wh2KqDSHEQrpSEXisexR8bh4VT9acCidIamkJ0a4m+H7U2y3ZIeckHeJ1s1hU8xJfNhk2CfZ+Gkohbdc8Uthu0jTJVtqbXJggaLTtLboxnalX8m6o2Ckk9J8YrsCvOjopteqrAoMVil+DjhiXdpkSwB8Ua6dlFd/Gs9cqqeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dZstb4JH; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dZstb4JH"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4f6ba526eso3958793f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Jun 2025 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750234758; x=1750839558; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EjaDW4eapCYtRtB2VTdwiBDlT26AJNq0bD2fmpFHne0=;
        b=dZstb4JHOeRJiA62MZpIaLP+esRgOp8tto+7nwRcCFq/4GAifWw9rmv8vp7WqA13bo
         Mx1ypRJoss7Nmn/dusFukoR4SPzacvJEBKnUboz8thZiY2jn2B4oupnq8IJZvrgfx8PO
         +4YFnGYhJg5D0vyij0Ps/ubPyV1YexOfO3Y7q+L23bzwMMIAjjBON/CrjyKi1LmNtP6d
         a2Mm24FnjrbjY4du34tPWDkiEEMa+lvHQC+x/5tU82j0A7tUcD7Q1K9RIkxeyTjh50IV
         uFW0ghE/ntlmT3n1ccQjebOohF/ZpjM8AxUUfir5FaJfwzhI0JKsAHn9NywJBtB9QHh/
         AO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750234758; x=1750839558;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EjaDW4eapCYtRtB2VTdwiBDlT26AJNq0bD2fmpFHne0=;
        b=YDRwKcVIGW7yt+LMU8PL2ciOppT4aE4N/2z50PZ/Uis7EIVZAU3lGBWs+MGUbSJLhx
         xDvbnTAMFOIURGvsFXlqIJZZVzaOEsA4ECMxHsUzHz6VMsGeX/x65pUEe4ZF88+SPhh3
         YDQcvLMpQXBBqSoPO1N+ZoeW+69/T4QP3iHuNvCo+4ywmfi94zFqd/mktRYtBWUjU+rn
         DyUT6RomYbT6/T2+43qyOknUr/4VcDslJFPWbbkgBQp002UNGQYLsAZKvrlBCWyNjjco
         mekAsCBv0sJNKE36xSdlqaO3U1Y2allfVop64FnsNr2IPRjQCVVK9K+Sxu6P9Su760uT
         Ok1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhnqHnfS6XHHg0dCosDyhV5mvkc+u/wugdZDr4jo2JkR52I/Kn6hQKcjXfWePtTxHhM2gxrT5WPLIfjLA8Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz11H7+aGp5Vbl1npozbpCedZwXgFqe7Bzc4HQNzHtpBp6f42ug
	RD51jz0f/a1Ty+fNBk1aedSYeC7GRcLKbTUfJylJrqWjiL/EWcVNGwWnW40oRCLysEhmYgqiDz7
	4b/WTqgeQwHPsHH6Djw==
X-Google-Smtp-Source: AGHT+IEbUxwSHnhD0Ea4dL9XedV3QIyfupV5dWJUxquI4u3Z0Ik2mWqnx9KiiP/8Eb5Sr7sOGbkv8UDICYkg2Ko=
X-Received: from wmtg6.prod.google.com ([2002:a05:600c:8b56:b0:451:d70f:eb87])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2088:b0:3a5:3e47:8af5 with SMTP id ffacd0b85a97d-3a5723a26d6mr13759868f8f.27.1750234750702;
 Wed, 18 Jun 2025 01:19:10 -0700 (PDT)
Date: Wed, 18 Jun 2025 08:19:08 +0000
In-Reply-To: <20250618-debugfs-rust-v6-3-72cae211b133@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618-debugfs-rust-v6-0-72cae211b133@google.com> <20250618-debugfs-rust-v6-3-72cae211b133@google.com>
Message-ID: <aFJ2fJ_pX8mWCQo6@google.com>
Subject: Re: [PATCH v6 3/5] rust: debugfs: Support arbitrary owned backing for File
From: Alice Ryhl <aliceryhl@google.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jun 18, 2025 at 02:28:15AM +0000, Matthew Maurer wrote:
> This allows `File`s to be backed by `Deref<Target=T>` rather than just
> `&'static T`. This means that dynamically allocated objects can be
> attached to `File`s without needing to take extra steps to create a
> pinned reference that's guaranteed to live long enough.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  rust/kernel/debugfs.rs | 51 ++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 39 insertions(+), 12 deletions(-)
> 
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index 6a89557d8cf49327d2984d15741ffb6640defd70..cd83f21cf2818f406575941ebbc6c426575643e4 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -5,12 +5,13 @@
>  //!
>  //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
>  
> -#[cfg(CONFIG_DEBUG_FS)]
> +use crate::alloc::KBox;
>  use crate::prelude::GFP_KERNEL;
>  use crate::str::CStr;
>  #[cfg(CONFIG_DEBUG_FS)]
>  use crate::sync::Arc;
>  use core::fmt::Display;
> +use core::ops::Deref;
>  
>  #[cfg(CONFIG_DEBUG_FS)]
>  mod display_file;
> @@ -61,40 +62,59 @@ fn create(_name: &CStr, _parent: Option<&Dir>) -> Self {
>      }
>  
>      #[cfg(CONFIG_DEBUG_FS)]
> -    fn create_file<T: Display + Sized>(&self, name: &CStr, data: &'static T) -> File {
> +    fn create_file<D: Deref<Target = T> + 'static + Send + Sync, T: Display>(
> +        &self,
> +        name: &CStr,
> +        data: D,
> +    ) -> File {
> +        let mut file = File {
> +            _entry: entry::Entry::empty(),
> +            _data: None,
> +        };
> +        let Some(data) = KBox::new(data, GFP_KERNEL).ok() else {
> +            return file;
> +        };

We may want to consider using the ForeignOwnable trait here instead. The
trait is implemented by anything that can be converted to/from a void
pointer, so you can:

* When creating the file, convert it to a void pointer that you store in
  File and pass to debugfs_create_file_full.
* When displaying the file, create a borrowed version of the void
  pointer and display that.
* When freeing the File, convert the void pointer back into an owned
  value and drop it.

For cases where a box really is necessary, the user can create a box and
pass it themselves. But if the user already has a pointer type (e.g. and
Arc<T> or &'static T) then they can pass that pointer directly and the
pointer is stored as a void pointer without the Box indirection.

Alice
