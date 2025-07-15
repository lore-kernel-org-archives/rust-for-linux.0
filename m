Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A6018CC13
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 08:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752566621; cv=none; b=VbzWeyQIE5DnCe7HRZwXET/Rk/6J8nX3mS2yGTVDtPkX/3xCkj9fDRECn/IL70IxKwE12WBgv1yo4KsToOJc+Aok+5lGWScllx0LG7iX6b1WWN1p4mj+vuM+v3Vh6f2t6J3ENl9bywWbTNXW0mi53r2z9HOwRqUdf4l5F+NMLuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752566621; c=relaxed/simple;
	bh=UZBwZ59CPBLYFwNPeLfjUvXYkBJQ3D4WxtoV2nfUiVk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HbX5IlGEzWB3yUvjJ63p7Hb/N8aJRB9vBreTLv381/l8jS3Nyh8GO8TUWGCjZMVIc26lO+TS21G2Dufe2QCrghkZCoyVqGioA/0HxN1cRY/jQcBEI30rVk5wwuShuDQndh3qzzKt3mMYhhXdVmDJh7PilbykKDsTZoCHdZjuK/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jDNxy/st; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jDNxy/st"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-ae6d551ef64so416423466b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 01:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752566618; x=1753171418; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ALgOJfM7Oe3hti1pkSfdPY9FKknayko8OLCQL/Qg9dU=;
        b=jDNxy/stG7kCCyAmSAPCxxk85DfC1aN6UV5oR7hvFswiVpC11kzyFxzu6Vnwq3b4SK
         7ji3SMtzIKLFnRSWJyqCIl736MS70tmQ8KCnM2TsOIDb4RdTC7fANdbGHkIRLQY+cJeL
         b4/kSfRCULRal/1A6XMnx3PyBkAPUWNpGGG0JnDa9EAOSbT6NRT7sq5yuQ8lP1/R5gOx
         +0I1HhsdG5Yll1MQJCt2FO9lMDYFXce96uHkzkoUznWVd41/JnX3yPqBRzG4CINbWKbp
         Wt+k9qUvY1uzAyPGRYET4Nwwwj1Qhte/GPBc13K2qQ4AWgwP6w2mAsHd1GL9FFyB148z
         xn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566618; x=1753171418;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALgOJfM7Oe3hti1pkSfdPY9FKknayko8OLCQL/Qg9dU=;
        b=uhpdaqvehchEiSn8fXrOvBgTg9j6B56FP5WAVxRXEsj62vzGt7+oBnX9gfITr+fggL
         DI+86JY5PJlaP3TB57/MU659vdi1G6A54TPQdBHvo64UusdHLGkxNHlnfZwi05RA/qOv
         lB6WwSyFrm+6VlGYN53GZS3b+jOMbBDMpUmxYj3c9bfH6iB2+nISVi3OfSJU/y0bS0nj
         XojXCyyFzGVItQrRCtdwNZwDG6rP7K61t9+L20LRgVUdGhu8/+UpUzbaw8ED7WSpwH2s
         qKTtxweE/bb7dMZabYEXdEXzUkhPeYdBxn8Qn/69GgDvkdK1AinAq5MpqEdLrRvFEEsg
         BdBg==
X-Forwarded-Encrypted: i=1; AJvYcCVmVBImKWk7rLqYlvMotlaX/APIxJZgU5Do3kwD4+jC+Qhmug4Zuqh0pFVta+KX9Y47tQKlXEN1mspvPBAC4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXzc6YAQwZiRG8X5wxoO+7BuK6VwJFaAxbnKUioicONOaygoHR
	V28JWcI0Tog+ZJ159fxuDt6a2y0q+FZDQZOqRsJ+PQG9NkFD2UwNu5IVfZaezzPx6GFbNwF6L+r
	oXpid8XDua+dOWjcf9g==
X-Google-Smtp-Source: AGHT+IGXzCEeRLbwNqRQm5Ckx3fjlOe92BzWH43/qO1crcM1pk5L1WvDjbrrOCtG1P4K3A1uiO+4F3W14czD0ws=
X-Received: from ejbce10.prod.google.com ([2002:a17:906:b24a:b0:ae0:cf75:d79c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:c144:b0:ae0:d8f2:9065 with SMTP id a640c23a62f3a-ae701268ec3mr1498857866b.39.1752566618681;
 Tue, 15 Jul 2025 01:03:38 -0700 (PDT)
Date: Tue, 15 Jul 2025 08:03:37 +0000
In-Reply-To: <20250711-topics-tyr-platform_iomem-v13-1-06328b514db3@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250711-topics-tyr-platform_iomem-v13-0-06328b514db3@collabora.com>
 <20250711-topics-tyr-platform_iomem-v13-1-06328b514db3@collabora.com>
Message-ID: <aHYLWc_KkMHj_jF-@google.com>
Subject: Re: [PATCH v13 1/3] rust: io: add resource abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 11, 2025 at 07:32:27PM -0300, Daniel Almeida wrote:
> In preparation for ioremap support, add a Rust abstraction for struct
> resource.
> 
> A future commit will introduce the Rust API to ioremap a resource from a
> platform device. The current abstraction, therefore, adds only the
> minimum API needed to get that done.
> 
> Co-developed-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Some nits below, but overall LGTM. With those fixed:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +    /// Requests a resource region.
> +    ///
> +    /// Exclusive access will be given and the region will be marked as busy.
> +    /// Further calls to [`Self::request_region`] will return [`None`] if
> +    /// the region, or a part of it, is already in use.
> +    pub fn request_region(
> +        &self,
> +        start: ResourceSize,
> +        size: ResourceSize,
> +        name: &'static CStr,
> +        flags: Flags,
> +    ) -> Option<Region> {
> +        // SAFETY:
> +        // - Safe as per the invariant of `Resource`.
> +        // - `__request_region` will store a reference to the name, but that is
> +        // safe as the name is 'static.
> +        let region = unsafe {
> +            bindings::__request_region(
> +                self.0.get(),
> +                start,
> +                size,
> +                name.as_char_ptr(),
> +                flags.0 as c_int,
> +            )
> +        };
> +
> +        Some(Region(NonNull::new(region)?))
> +    }
> +
> +    /// Returns the size of the resource.
> +    pub fn size(&self) -> ResourceSize {
> +        let inner = self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`.
> +        unsafe { bindings::resource_size(inner) }
> +    }
> +
> +    /// Returns the start address of the resource.
> +    pub fn start(&self) -> u64 {

This should be a ResourceSize, right? You use the ResourceSize type for
the `start` when calling `request_region`.

Or ... should we have another PhysAddr typedef that we can use here?

> +        let inner = self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`.
> +        unsafe { (*inner).start }
> +    }
> +
> +    /// Returns the name of the resource.
> +    pub fn name(&self) -> &'static CStr {
> +        let inner = self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`
> +        unsafe { CStr::from_char_ptr((*inner).name) }

This is 'static? I would like this safety comment to explicitly say that
the string always lives forever no matter what resource you call this
on.

Alice
