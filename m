Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07860190664
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 12:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736339063; cv=none; b=Oai2yqdyufJC8HqXkeSSh6XGYySl352O8csXuvRCc1mJ7JhFyiRCQPtu5jgCoXzxorco8KYPRZFLBFwJ80By/1ADWOuZqXGEiB35wSvRGHc0Ji6T5so47WJdmVtl+AIfQ2spGVznACJIvkYaSPH+vxtQA1OJhZsSJueiVbB7Ous=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736339063; c=relaxed/simple;
	bh=PdF/IyfQ2vH7wDfmxYjwtaaUUOfqGZsXMMiB9ACtjn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXHm0HS20YypYfkg6R14eY1zxzX21MqgA6euQmbm/ZAGcTfkZoM8c3Yb7uW118tcFFJ0/VujJD1ulI0NvcqNYmREMK/ostQrYKK8tX0rsP0HSoLt6jUWHJqjHHmLXk1CCNlsqaCWUSK+VjA3KKNyY9r9SKfSgsrIaRYMCUNEpYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=exSrspJ/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="exSrspJ/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4363ae65100so171242265e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 04:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736339060; x=1736943860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UT/U0933vcmbadDNyF5pn5YyVzSwGFoojlmR9CmQa/c=;
        b=exSrspJ/cHxygwz6PwkN/lGpfkqMqjK0s7soNzA9BTi+TOCSN3YrpaBFVASXF6B61C
         PhtYPAD9uOtn8iHXa2k3IMsIkN3aE3P12Ax53+qA3/qMkuE8zh2CDwwxVnExaUH8XVOb
         ZKLTn6RAwJRBdolgMDGy2PU1a6JPHQoZPtJ5nROZlbqXaJWJB4t5lmNxT4o6C7d47jcV
         VBm+p8ScHB344wE6hHPAy/4TGjykIy8XGSt4g5x/wXZFWP2KK30wbLVy82WU3ZmSfRnH
         2gL77+gkZ4+E7yTbBHpHq9Ve6g7O8Q7CZLx3DBKgqpsNjECM0010xyzG/Aolxc5+PqIB
         gTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736339060; x=1736943860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UT/U0933vcmbadDNyF5pn5YyVzSwGFoojlmR9CmQa/c=;
        b=mThUqqfhuDEvC3mxi6A3I7sxQ/88N+u87IOJ/fPZdYdmnHLLvH3lnaPAD8EJsbZKyc
         u955s/ZGZpwMGkPinl7HIYi8rSNB835ltI314wV9RgegwhE20sNiav43KK1HMaMWVB0t
         25BziBBIxRM8t8dQik0tNIiyTaT/CSmMDg+FWHn8zOytvFBbNmJfhMYboCnEQy8N7Lc0
         UTp2yjZXC9knuibo0LfnOmll50lNEQ0R8JhE0eXItYR61svn1Q9apfiUZe+x8dH1GkQQ
         MDHmySsQukAkVfLmW03lcEW2OhbypaPUHIyJQgQ78iunZiIFGH//RS5jJJ9dWLHs1jpO
         UdLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMB3CNR3mVZQiN7P68CVXJndO9NbMAO8CDv5pBh8HB+AMqccWogKqO1haMR7VqId99Pgwz/+lPJBktZidVpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP2ET+w2F1naknx/ruo1jjmX4vZoC8AtatqEqxX461DuFhAWVj
	aNukXh0FGtIPvWy8TcJrqu17OzSnej7uFzsyUlWkgXQ+v9GjvVE8ydYvAeTQXp6WljpLR6WEHrC
	RSQwxxyEZW894PSJc6gLgwza1zgpOk5zAFalK
X-Gm-Gg: ASbGnct4U7CvOkfshcbUy/y2RFKG47jxrI0+8aIyI9wzrh5bBGj+F+1onaTQnrG38OC
	T8wVSZHPu6T1SBSLSPY4ImlNexnWqe6rEhrqXxMBF0lvkQev1FCo9zwQwAWJHRfbiq87c
X-Google-Smtp-Source: AGHT+IGKR28tzizsYpjHyQGlOMD/empU53ArcVi9noDpkZERD6AKGOGae78aovTQolruhnC4UVoDkhns6ufP2j1VxdE=
X-Received: by 2002:a5d:584c:0:b0:385:f6f4:f8e with SMTP id
 ffacd0b85a97d-38a873573ccmr2019898f8f.50.1736339060388; Wed, 08 Jan 2025
 04:24:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-vma-v11-0-466640428fc3@google.com> <f8bp5f3T5_3_0LpabBpwjSarzhZTp1CbAvcTBI6lHlaKpPAAFiofsNI2iJxK9kuXwnqvTkky9uvpS0rqRpa_RA==@protonmail.internalid>
 <20241211-vma-v11-6-466640428fc3@google.com> <87zfku8xm3.fsf@kernel.org>
In-Reply-To: <87zfku8xm3.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 8 Jan 2025 13:24:08 +0100
X-Gm-Features: AbW1kvYVFFCagGoeLxLjiR8WPkakRaYACgA2t9Yv-VrYqFS8-3mtxX2oKuD11DM
Message-ID: <CAH5fLggSiiQ1xTcEKbAiux=r+3C_HqY7AMtZOC6fwQCR51crCA@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] mm: rust: add VmAreaNew for f_ops->mmap()
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 10:31=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > This type will be used when setting up a new vma in an f_ops->mmap()
> > hook. Using a separate type from VmAreaRef allows us to have a separate
> > set of operations that you are only able to use during the mmap() hook.
> > For example, the VM_MIXEDMAP flag must not be changed after the initial
> > setup that happens during the f_ops->mmap() hook.
> >
> > To avoid setting invalid flag values, the methods for clearing
> > VM_MAYWRITE and similar involve a check of VM_WRITE, and return an erro=
r
> > if VM_WRITE is set. Trying to use `try_clear_maywrite` without checking
> > the return value results in a compilation error because the `Result`
> > type is marked #[must_use].
> >
> > For now, there's only a method for VM_MIXEDMAP and not VM_PFNMAP. When
> > we add a VM_PFNMAP method, we will need some way to prevent you from
> > setting both VM_MIXEDMAP and VM_PFNMAP on the same vma.
> >
> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> > Reviewed-by: Jann Horn <jannh@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/mm/virt.rs | 181 +++++++++++++++++++++++++++++++++++++++++=
+++++++-
> >  1 file changed, 180 insertions(+), 1 deletion(-)
> >
> > diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
> > index 3a23854e14f4..6d9ba56d4f95 100644
> > --- a/rust/kernel/mm/virt.rs
> > +++ b/rust/kernel/mm/virt.rs
>
> [cut]
>
> > +    /// Returns whether `VM_READ` is set.
> > +    ///
> > +    /// This flag indicates whether userspace is mapping this vma as r=
eadable.
> > +    #[inline]
> > +    pub fn get_read(&self) -> bool {
> > +        (self.flags() & flags::READ) !=3D 0
> > +    }
>
> As an afterthought, should we name these getters according to RFC344 [1]
> (remove get_ prefix)?

Well, perhaps is_readable?

Alice
