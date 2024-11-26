Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369AF1D5ADB
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 17:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732641333; cv=none; b=Vt/av9eOjngUj8KAfYEgNlK8RDX849bCsHMPISuPXV4VLCJpSq2hIKP0jQgFnSiUhlLUB1sYveegPvB5L0/52PXomgP1KWJAsuREGELJse8JMmDZCF71Q4nuIA6n5idtJ6WGR365oYRvkWsTTHDpXMjKIrxoMXQEwTwU3jGNHw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732641333; c=relaxed/simple;
	bh=VqAQFe7mntOdBAlVZcfHJCCujSRH2afcpIxBiKlUtXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHitv18KGZqsqleyhajzX7uErOMdSl4xxheLDoDriNM88J8nDh06LlF6Y6I4VuQvlI39l4hxY+7OKGZfu++il64C3Aug0qg7HaTMQhWWOg21SwUQ1/T9iB+7nYRMAqx/YUK6oOc7FYmGl+tZpocz/5/PHdW06vF5+XmmaZ6Mm0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d2+fmP8e; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d2+fmP8e"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d027dc53ccso11528a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 09:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732641329; x=1733246129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqK5DtYfTpwNTtQIv9zMAjmqjKBcmKak3zeZPF/XA5E=;
        b=d2+fmP8emIw/mqhYSogXkAeeJUgeVW1eY33MigLxLQNLNIdywRExgAZvipcArV3Utj
         e4za2on+sBaxouPRUls4+3BPAOlPIyCyg8utqwhAfCxUm6n9NPkjYeLceNP1CEPinLFH
         lX20F0ZtRX9GSJ8oBOuqOtSCjkQzSl+QWtQiIfz40Ur6e09rl0QzLTBvIAW0bI4lPIl5
         8Rig9qTNrt74TTkrtDUBqPcHsbADo8+DqKXrsHN+pvUfPmFno8IwNYYa+E581t2sweDl
         5vXWo2rbSralz+S3ka7+cVjA59uHZgKXa8vL/UnouMuezx1vb9CPV6HthJ7UanIgIGus
         lRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732641329; x=1733246129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqK5DtYfTpwNTtQIv9zMAjmqjKBcmKak3zeZPF/XA5E=;
        b=CN8YGMqWveixTh2swt9mBzQqzD2pA8RjId9PQ6Zsvvzz5H0HeX7PIGPqXGHPAycCEK
         gyuL3+CYmWieLkFIXhERrMhXCCPbyYQz+1ST4kbv1jiJR/P1iXqdbV4Aq3hgk0i9ex46
         J8XOaqauiUoRqu3WQ/3a/H2qD9W1MHtE9DljdADIdKgl8p5c4HPOazrN8NYMuJipJTWo
         3hqikewQ8pC7SkcsU44MmAaW4KNv6p7IwrFqBGMB/NiRntM+sJqZjzRQDYCjlwg1iiPy
         J0QZL7jGP+9gqj+HFgup+0FBdbabAic06g++bBudzyJRuUtGKplDScl1caYJh+q39vrS
         r+lg==
X-Forwarded-Encrypted: i=1; AJvYcCXtW21KbjTM4XEztqJ9eiM2JPfYDbHM2n4SIdZChWa4JVvlvQOz833W+LRlNjKqwrDRpKOSfFatxK7dr0iYIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM67YNgYsn9zpqXfexhyBMTyO1ejWJRJpsqLKqV/2jQ+cwVNzc
	NW5irBW7C3FUtbiis2gWYZG/IrMdgXgJ8mz4TsHfM+uCMoZ+JKN0Hi+oskNceAqzbBjsXyG4Qjr
	qhtkcIC8BKfnS4ssej0XBxyxrEFQ9m8m3SOGR
X-Gm-Gg: ASbGnctln98XyuigYzms312xEwLl8csSosNKFHqh9gWeVE9rYS9AAbO6N0uAjrk8QVz
	dF3eIS0EEHLf8Ko2LDaUBw+pfjaSqqAbc7Hj2ivtfUyliOJlvtT07dsKtDXA=
X-Google-Smtp-Source: AGHT+IGZRocPcPSEtcuNErKj4DIDiJvXUShdMqtpfNV3ra7ee2dGktWA2YG43z+yQQWKUgLsr0A6/dsgXytzrSe8JgI=
X-Received: by 2002:a05:6402:282:b0:5d0:6bc0:7706 with SMTP id
 4fb4d7f45d1cf-5d06c91da98mr93597a12.6.1732641329016; Tue, 26 Nov 2024
 09:15:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122-vma-v9-0-7127bfcdd54e@google.com> <20241122-vma-v9-8-7127bfcdd54e@google.com>
In-Reply-To: <20241122-vma-v9-8-7127bfcdd54e@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 26 Nov 2024 18:14:52 +0100
Message-ID: <CAG48ez09fS1v2gWbOFx+uQd7Lj+z2x3LhL3hfpQzpVHdNJ5UJg@mail.gmail.com>
Subject: Re: [PATCH v9 8/8] task: rust: rework how current is accessed
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
> +impl CurrentTask {
> +    /// Access the address space of this task.
> +    ///
> +    /// To increment the refcount of the referenced `mm`, you can use `A=
Ref::from`.
> +    #[inline]
> +    pub fn mm(&self) -> Option<&MmWithUser> {
> +        let mm =3D unsafe { (*self.as_ptr()).mm };
> +
> +        if mm.is_null() {
> +            None
> +        } else {
> +            // SAFETY: If `current->mm` is non-null, then it references =
a valid mm with a non-zero
> +            // value of `mm_users`. The returned `&MmWithUser` borrows f=
rom `CurrentTask`, so the
> +            // `&MmWithUser` cannot escape the current task, meaning `mm=
_users` can't reach zero
> +            // while the reference is still live.
> +            Some(unsafe { MmWithUser::from_raw(mm) })

Maybe also add safety comments for these nitpicky details:

kthreads can use kthread_use_mm()/kthread_unuse_mm() to change
current->mm (which allows kthreads to access arbitrary userspace
address spaces with copy_from_user/copy_to_user), but as long as you
can't call into kthread_use_mm()/kthread_unuse_mm() from Rust code,
this should be correct. If you do want to allow calls into
kthread_use_mm()/kthread_unuse_mm() later on, you might have to gate
this on a check for PF_KTHREAD, or something like that.

Binary formats' .load_binary implementations can change current->mm by
calling begin_new_exec(), but that's not an issue as long as no binary
format loaders are implemented in Rust.

> +        }
> +    }
> +}
> +
>  // SAFETY: The type invariants guarantee that `Task` is always refcounte=
d.
>  unsafe impl crate::types::AlwaysRefCounted for Task {
>      fn inc_ref(&self) {
>
> --
> 2.47.0.371.ga323438b13-goog
>
