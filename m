Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0746E332EDD
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 13:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706047; cv=none; b=DuETCNJWLYBnje00pQPoep0CKy/hkQ07B1Sf9baYcOJL9bP29DFJA9eYCSGuQFFb+xdQdY20S2nAjZ+CWxRh8FE859cucN0KmeYT5ifCMyOeU3PilIegr5L/umOXRlFoICYiGt0NZjZYtWsP2JM3xFtSDaHKfAmVbVq1TGuzOT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706047; c=relaxed/simple;
	bh=yuIGDTY6jcTI4lY1dh0UG8jPw0Yz7dG+/3Lgikhw+xc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YgW2qeehw7YtvZS7eTgTm5t3HfIfLFrUKu6RDva3824hfWvR5+SYMl5K7tHSETITAtOb93XGWo1BRjj6ztWzBY8HgkTDKs3EnOQGL+gO3H+BUrt5rgbBq4FkRQwTLoQd+AK4cV7xTFoE0Jb6WpX7Ca+5+xSftc0XWo1tWhpOEX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D/BQL1Ym; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D/BQL1Ym"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-470fd92ad57so34381435e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 06:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760706044; x=1761310844; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=baDIVkL6qPcD3aaf21CtYmUHWqgvKSn4TldyTmiJAq4=;
        b=D/BQL1YmUflwXUD2p/Eepi0h9KPhZzmNPml6AVdxxqVYl6aUaMP2yb7wdMZUb1B6Ps
         oAo6sy4jVFTaX+GfIqRm2yUKEARtbfZp9zgxS9GIWwRhxN5Z2kUkUltsr/6Tl8K200U+
         TbaCqD0hdIlzHVbxo1vT5PQM5E7aNBOOiFycmTCIhRWSaXuvmETnCQsbQDcILWwXZ8fD
         V6aFiEahWjroLcicBOxubB+lGlkXwYC7TxjJ9lKQZBJBUkfk5soGkd6p67ZkG9/jg4TQ
         WQRfO7xfACf4Kn1+qzNMB+vH0sXpU8wC2YoZcXUDKiFQ509uTS2XW+UMJcX8jcTBhIPh
         0EyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706044; x=1761310844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=baDIVkL6qPcD3aaf21CtYmUHWqgvKSn4TldyTmiJAq4=;
        b=rGkxGGfrKkreTEovjrlYGLoLJLFLQxnSd7rlUdgxZUyR0zCbWkrIwKI7rIjxVGxtrw
         HvnjP7fXzCB3xE8fqqtxCcIeD5H+QV8PfyaLkskZVhONWKEsVniqSWstZETlzHAOhBQC
         rIQjNMV0K5rLMzgckWkDn5We8gZ3E7qxHBIHBhe+WGjZz3mYVjVggDOBAc/bma3g1GKq
         du1S2TYC6LY5aWdUVC7Kdt0ytd4afM6nv6y15Z+cwwD7kkbiwWT4dQqxiKSOyN5UJDSY
         AjT8N9F1I7gvkoYy0ctMpKrPJxmBFp8g+L88lHGQxdXZRncpDwo1r9eFyxn7L7rhvfmo
         0QRg==
X-Forwarded-Encrypted: i=1; AJvYcCVyBMdUjkNWohdOJOoM6W14LEUuBt88fvmgo3xedICd18dgdRxahW7mrDz6JoOn8CP/0P/Qlup7lJWkd6ilaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg99/A1sSAstMJp/SeuMl9iAEv44jSz+6J7eIHAFLlXk8VQfmT
	yDqzig4rrYZPHRcobIsR6BGmXhE9VEPsfvZC6T1qhyIM90wSS58LTxbMoHaauDrq9HVWq2pM7xm
	Q7YvXjjzz7WIGIgm7Mg==
X-Google-Smtp-Source: AGHT+IG1bpI+LaOgjBQH9DFhBzKsJsdJgEyfHVAfJovk5BppUcFq8EGVxjZ3CA5D51LlfBkl3vOBFoQyKjneobc=
X-Received: from wmbid20.prod.google.com ([2002:a05:600c:a194:b0:45f:2b4d:3c2b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:64cf:b0:471:12ed:f698 with SMTP id 5b1f17b1804b1-4711786c793mr28292685e9.8.1760706044065;
 Fri, 17 Oct 2025 06:00:44 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:00:43 +0000
In-Reply-To: <20251003222729.322059-7-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251003222729.322059-1-dakr@kernel.org> <20251003222729.322059-7-dakr@kernel.org>
Message-ID: <aPI9-_6k4ZUKtA1C@google.com>
Subject: Re: [PATCH 6/7] rust: debugfs: support binary large objects for ScopedDir
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Oct 04, 2025 at 12:26:43AM +0200, Danilo Krummrich wrote:
> Add support for creating binary debugfs files via ScopedDir. This
> mirrors the existing functionality for Dir, but without producing an
> owning handle -- files are automatically removed when the associated
> Scope is dropped.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/debugfs.rs | 45 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index 3c3bbcc126ef..0eb1719e4953 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -531,6 +531,20 @@ pub fn read_only_file<T: Writer + Send + Sync + 'static>(&self, name: &CStr, dat
>          self.create_file(name, data, &T::FILE_OPS)
>      }
>  
> +    /// Creates a read-only binary file in this directory.
> +    ///
> +    /// The file's contents are produced by invoking [`BinaryWriter::write_to_slice`].
> +    ///
> +    /// This function does not produce an owning handle to the file. The created file is removed
> +    /// when the [`Scope`] that this directory belongs to is dropped.
> +    pub fn read_binary_file<T: BinaryWriter + Send + Sync + 'static>(
> +        &self,
> +        name: &CStr,
> +        data: &'data T,
> +    ) {
> +        self.create_file(name, data, &T::FILE_OPS)

Why isn't <T as MyTrait> need here when it's needed for the other
methods?

Alice
