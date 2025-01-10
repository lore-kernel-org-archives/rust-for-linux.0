Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B6E78C91
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jan 2025 13:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516104; cv=none; b=ezKlfOGp11XeFk512nr8K7ilpxHteD8MRrwF5PCgbjmheqmci2rH/q2PzrGDtUQ3kV1aKlTAxZeycmTZCBmydVP7+r8dXEbzcg0UUw/5G+FgJsgeuifft0CnrjivZqLr9bChsBgeOtoBf4OkH+AJFyGcm/S+9K7vYIm4z2CH9lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516104; c=relaxed/simple;
	bh=GDR9TqULwA7tbLJ0npLWLef5DOmH1KGPhzI6maT5mes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZCZvbdW9wdMPXPVN84rpVvSFzOO4RqFrUTGvpUQvaqSz7VW/uNQb8S9LDpY/pN8dK6/nuNrXxYAIvTsiBn0ph/HYmoBlUVRQtjPUHjJSEeITSmCk2gq23CqG1TD5AyMzk8ovgnC44byOWm8NAvB9tNrTB/YstOIVe2zT/74o/WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fd9GX4WL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fd9GX4WL"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361f664af5so24103055e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jan 2025 05:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736516101; x=1737120901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=groF09OQmy2qoF9yby9+EWDsjHj5SaTCekdQxNqyZiA=;
        b=fd9GX4WLKaCx8GQ/Gr8fJcWeSYUotAbKSypBjj3aQ5GKArjzr5gJTzpkOVhqehj36n
         FMW9DJk8nGUcIWBu9GC7Cn05fxMJ6OtfJrmw63pGxYQEM9XriJymuqSr987cvnARTo++
         xG3wCvEfJkWkmZHFhEogoNOuBJILmewowWcaZReFlx0Vdt+7Bc+sIR7CSH6iVSM2yIsU
         E9WQtuHdThYUcDRKmS9eINeFizVjoecuT7ToQZpMws8IpcNVThg3ZL3gXnCrBpZZfh5o
         NcjxzqBkK0XQHiz8sNFyzJ/XqwL38OLpnZIPBbR/rCzGSbUxMysKx6dx8/VK86ALVRAA
         43Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736516101; x=1737120901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=groF09OQmy2qoF9yby9+EWDsjHj5SaTCekdQxNqyZiA=;
        b=b0nFD8GQDJyxojloPr+VdAiM/gEPegh+Rr8wGxvat5q3bOnJoyrab+sBfJ9sDZ6UAs
         ol85FYIelrlC1hxXccdrNtu6r6kL0eBemdTRQfAs9qlC6DoiV7zfw3Tl8MUQU9QXFpit
         44fpC1GKmQI1iXBCX66Png2BKSqNG1e+s/b7x1EhC5JOSG340RL0sbT0SQcvQY5xZhVL
         T7h45/kDDDXZOEdS/9PQvXERq8nVFzZRqjsyXiTsXp7Yu7jh1oZcBPn3TJplvIhjlm5p
         WpATNnD2ia9g+I+7R22Z7xf+4/1RtsDtWx4M077fplGMZCPDVNNwyPUOBUV/AwiQVRnk
         qXWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnlExzS2uWToG8X99mTpqcli/Uh8B4dk/Tpl2KodsWN7jS99CZB7ib87EMyPOzpVrUoR1nzFdgYZf+X7Abxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YznQFTaXf6b11YbsMTy0IDGEOQcxLG4Ey+iNrsHGlxSxwqeWtHA
	wosIwWxR0sMki9WJUvkqZTvAuXVrNs2/8b0D+tU/iQBjpz31CgovyRAQ7LWWsvO33QjwV8Kg4It
	32HAXQ6gop+bu9MAWPn07rMUPY6C5P1j93ZGo
X-Gm-Gg: ASbGncuAIoooUmjUB6rYVSXOEnqzE/foynzH2DrvdvmxI0zjXNA110jTzKrTEnOs6FF
	3AYJNQ6R4LFnr1Y38O4goeJ9knDpNkQgUwKZM0PQxC1fp8GbivciIeIgRNsYmxn5Z
X-Google-Smtp-Source: AGHT+IFB52D/ZL+wt7G2Cs59yUudbla2PXy69byShnaypRyRMEHd9Q1CwiZLkUWwL1fDM2YzhaSOMDplgsVQDqTJ+Zg=
X-Received: by 2002:a05:600c:4446:b0:434:f335:849 with SMTP id
 5b1f17b1804b1-436e271cce0mr99607745e9.29.1736516100577; Fri, 10 Jan 2025
 05:35:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-vma-v11-0-466640428fc3@google.com> <20241211-vma-v11-6-466640428fc3@google.com>
In-Reply-To: <20241211-vma-v11-6-466640428fc3@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 10 Jan 2025 14:34:48 +0100
X-Gm-Features: AbW1kvaSiSAuotZrGPmJJS0_zS2yev1GBb2ZPCFYhZexLVD7AONRUOsarSEJWmw
Message-ID: <CAH5fLgjBmErL48-+Qfbz+4SPn49tUdS-5CYLzyPBAN6oWNvt-w@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] mm: rust: add VmAreaNew for f_ops->mmap()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Frederick Mayle <fmayle@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>, 
	"Liam R. Howlett" <liam.howlett@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 11:37=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
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
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> Reviewed-by: Jann Horn <jannh@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

[...]

> +impl VmAreaNew {
> +    /// Access a virtual memory area given a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that `vma` is undergoing initial vma setup f=
or the duration of 'a.
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(vma: *const bindings::vm_area_struct) -> =
&'a Self {
> +        // SAFETY: The caller ensures that the invariants are satisfied =
for the duration of 'a.
> +        unsafe { &*vma.cast() }
> +    }

It was suggested at https://r.android.com/3389887 that this should
take a mutable raw pointer for better intent. That's fine with me
(Rust doesn't care). Lorenzo, what do you think?

Alice
