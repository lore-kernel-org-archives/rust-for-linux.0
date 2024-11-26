Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867B01DF99E
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 21:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732656608; cv=none; b=kaXQaRov7zInAfeRY3emRmFDW5udxjb7Dyk4kJxIJFN/cWqnvOuaEPngFS44KLJCP7ZKS04n0mTupz1SGOp3TZEu0fjHP0rx44Zp9VQOWDI3Y3ox2s2HAI9CamzxVGDhMjG/FC+Qj42A2PHj9Jpszj5sPPm2/A802Bpoa+v4WwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732656608; c=relaxed/simple;
	bh=KmNk5xOk2Kue+fgxNIZEq5vIeht0l8CGghCJU2wzAfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sr5KYEHotuyjavV4MrtRAhPcbnT3yNtd1wMhqeE8UTYLih6t8Um+YKwL/O8mubcQH8JO90+V8pZQxEOUe9XNnxKRUCwgdRuNrDE7nD/CGfaNMcVCltF9jwhRtDQGfHQp7C/Ya9tbx+kogKCjiHi1J/jrnVOD41WtXi8kkBYqSp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HwpMYCz6; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HwpMYCz6"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cfc264b8b6so600a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 13:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732656604; x=1733261404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBRiUmH5cK1KW9rqacSmoJx+dyswngEhwrAEnw8m73s=;
        b=HwpMYCz6/J3ckOmnlzh51owF8WcdswYtqL8WDIJSvpriu2RNBEkL9FfbedfU1p2Aa8
         Vyl/ZJ72aJwtrMY/Gh5W3fVlCmeA5Q4bt9+4mc1AH9usLri2O0JNlEMu7WpsMOQesf1m
         DQ6UPVsaCAk4CuUouIrpGbBTC4XVNvDYw1Q18fDWFkilFb9BLjfWLiYqucZCqK84+ZrA
         VMPQ34dpkirz11DGdDElpoDy3pK0sHSDa3KuCFxadj+bC8HZHA2AavYRoFkB+YyB04TJ
         JdNaIKzieYc0XmZULTurPrqGBG/S0Qzb70j8oGqcNrLUeCcKsUbeZpodRVi5EktKTMWA
         I7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732656604; x=1733261404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBRiUmH5cK1KW9rqacSmoJx+dyswngEhwrAEnw8m73s=;
        b=mfx2+tjAl2YCrgdLzCMPL8iO8Ngu3u+QlUcFz5z/L6xyVKEDSY8rnfOOZgpcv42I56
         4Gt7Yb24PZ2COuHQMQqWvCCuhzg8OejWCz42xLvTwTsDaYYq8tJLmQShjTrFwD7GAucA
         JF6doyB9wq7cA3K9wQ/QccqKmai9ziy6J9U1rbiQzzFbBmq1TIoBz0IWdLoBQwH7z+z3
         oE1lLo7HpCHPYw1G949CvUoegGJkG38G0ziayhhr47JLGh8xgwuAvkr/3hE3mKXlddLs
         0gU066xbfA/aMCj7TLvTpiHlmANCXe5mchbLlmJjHOGCejxOrHTPDmizsJsBH0vaY0eE
         r2BA==
X-Forwarded-Encrypted: i=1; AJvYcCXKvi2gnZmCWJtAVjpX+oGpedDIleQB4jrxdUicZU22fbx7zs7D0+PNDwH5e96AIqQYFu+n0h5PGEl9xf8wqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyBBRTIVQjin6LwqH5qBBE9m04jUUQgadvyxZFOuVkxJPfvGT0
	BzwOdW0ySjBScojLJnL36ra59zUKlhHbY35cglDYdSt1L4YCpG3pxWwPQB3wW3GV4nSCvhwH1uZ
	rrX2QEMAkbHrXtxPetOUobL0BKbqG5dGyeFs3
X-Gm-Gg: ASbGncus8Jfduvq4D7nRSr8EgL1t93pAnUTuOGF3t/gcD89WkuVYQUo354fpafMMlY0
	wmCl0UiyoS9kzpm0ofCWH56/Z6dltCgvFv6q0lDH9IQIFzZ4Bsr1eIPynByU=
X-Google-Smtp-Source: AGHT+IGGQKkkUZxUMrUHr4jl8Bz6Q4s3UsJS3XnfpswWphcVs7mNeidA9bI4rEX/3MP/EhElClBSv9DdpnmMbSwW+Fo=
X-Received: by 2002:a05:6402:394:b0:5cf:c23c:2bee with SMTP id
 4fb4d7f45d1cf-5d0810ab5cemr20794a12.0.1732656603448; Tue, 26 Nov 2024
 13:30:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122-vma-v9-0-7127bfcdd54e@google.com> <20241122-vma-v9-6-7127bfcdd54e@google.com>
In-Reply-To: <20241122-vma-v9-6-7127bfcdd54e@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 26 Nov 2024 22:29:27 +0100
Message-ID: <CAG48ez0V5B0ycPuP7eRA-xE88ks8cr+a1MFZC5emv_eAsybNAw@mail.gmail.com>
Subject: Re: [PATCH v9 6/8] mm: rust: add VmAreaNew for f_ops->mmap()
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 4:41=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> This type will be used when setting up a new vma in an f_ops->mmap()
> hook. Using a separate type from VmAreaRef allows us to have a separate
> set of operations that you are only able to use during the mmap() hook.
> For example, the VM_MIXEDMAP flag must not be changed after the initial
> setup that happens during the f_ops->mmap() hook.
>
> To avoid setting invalid flag values, the methods for clearing
> VM_MAYWRITE and similar involve a check of VM_WRITE, and return an error
> if VM_WRITE is set. Trying to use `try_clear_maywrite` without checking
> the return value results in a compilation error because the `Result`
> type is marked #[must_use].
>
> For now, there's only a method for VM_MIXEDMAP and not VM_PFNMAP. When
> we add a VM_PFNMAP method, we will need some way to prevent you from
> setting both VM_MIXEDMAP and VM_PFNMAP on the same vma.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Thanks, this looks really neat!

Reviewed-by: Jann Horn <jannh@google.com>

> +    /// Set the `VM_IO` flag on this vma.
> +    ///
> +    /// This marks the vma as being a memory-mapped I/O region.

nit: VM_IO isn't really exclusively used for MMIO; the header comment
says "Memory mapped I/O or similar", while the comment in
remap_pfn_range_internal() says "VM_IO tells people not to look at
these pages (accesses can have side effects)". But I don't really have
a good definition of what VM_IO actually means; so I don't really have
a concrete suggestion for what do do here. So my comment isn't very
actionable, I guess it's fine to leave this as-is unless someone
actually has a good definition...

> +    #[inline]
> +    pub fn set_io(&self) {
> +        // SAFETY: Setting the VM_IO flag is always okay.
> +        unsafe { self.update_flags(flags::IO, 0) };
> +    }
