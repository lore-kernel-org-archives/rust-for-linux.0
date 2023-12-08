Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mwCRo1kV"
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2AAD1722
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Dec 2023 23:29:34 -0800 (PST)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-4affeacaff9so452530e0c.3
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Dec 2023 23:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702020574; x=1702625374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrV5ggink9t0wvGsS5EUrsFBN636nAxmFkZLs8Lkbqw=;
        b=mwCRo1kVGpUiTou2WkjYI25NTjJaOu259JK+Wvxyr2LzgcwLjtOxMN969TefWOi5Tq
         O0sIVVc5oo5aLjcq6OBjvNiyeEAxislsII93DaZGO73OUn0lkQhlhlJijjfR3x1mw7ts
         3Hf8y34o13NJxAxDO0I9WdfhAyDiqDTeiD5DeAwwW7hfBtIuMTaogW3kBfkPRaV4Sngx
         k/DqGbv+iEYwoAah4dpZzQvt07tqU2k2Uv+n2RCaySZqKLU5b/KE8bETuPGetC0/7Arl
         E4HH0xyhyb4Vlx4EPtzG80LmJ4+aXGa0U4/uZz90JsTXjVz2wt6Bs0VyZQVfqOEml0qk
         H+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702020574; x=1702625374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrV5ggink9t0wvGsS5EUrsFBN636nAxmFkZLs8Lkbqw=;
        b=AS4o9O/wj4yO+B87CtiNqJy87GPCALgZDNFAID/BE647AWVmfWbUAU0A9C+ZPQjS2r
         X4lH+8QhYfcBtY3bogqfRfTeVDsAJcjKeo+vJ0A1RGN4i1piTvOiUxXbWi0gsesjn3rx
         Y9tT/YrmPhPEAojEgj0MsJNb4PRoCFgyTjwwzg/Ha1CwbP9cM7JXD2r7DiVoTtpqN0bL
         iSFrm8SXhllj9eUrSUvqxK6T/DkWpQ842y64dtjdStGDyeqOMYZmPJWoB0HXGCUbQw97
         Few7NZifr4YNomoTyebzjkd5zQcnbKTUAyRcmOMSXnU9x3nx72thp9/5zJB29ywcwezz
         LAuQ==
X-Gm-Message-State: AOJu0Yw7SikiA5jb4q080WnRwcmMmRCcfrqYF3E3G3lD/daDcip/G/33
	BCkALIrY4wblUZlU2ksU/IrPjvtE4eUNrMay/4Bokg==
X-Google-Smtp-Source: AGHT+IG37SFgofRSQyexRIQ9EppdOKl7gzb6/3/15FQw037tJZg2e7u6wS6pfk+BzNcLQedowcAOSwkxOAqRZfxHyVI=
X-Received: by 2002:a1f:c8c1:0:b0:4b2:c554:e9b0 with SMTP id
 y184-20020a1fc8c1000000b004b2c554e9b0mr3891594vkf.18.1702020573823; Thu, 07
 Dec 2023 23:29:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206-rb-new-condvar-methods-v1-0-33a4cab7fdaa@google.com>
 <20231206-rb-new-condvar-methods-v1-1-33a4cab7fdaa@google.com> <n18Cdl9DQXfuGtD6d664Mn0rrPfxebZs31-3vQfu5N0vP0ZgfHNwBZYC4qYgU1GD-4Ue4bUhgNqs40-u8t0baAzlQ0cMMiSzTgjQnhcG50o=@proton.me>
In-Reply-To: <n18Cdl9DQXfuGtD6d664Mn0rrPfxebZs31-3vQfu5N0vP0ZgfHNwBZYC4qYgU1GD-4Ue4bUhgNqs40-u8t0baAzlQ0cMMiSzTgjQnhcG50o=@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 8 Dec 2023 08:29:22 +0100
Message-ID: <CAH5fLgi37LER-G-ozc13TWGGxraFmP3QVYqX7oBoahyKwgfznQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: sync: add `CondVar::notify_sync`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 9:22=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> On 12/6/23 11:09, Alice Ryhl wrote:
> > Wake up another thread synchronously.
> >
> > This method behaves like `notify_one`, except that it hints to the
> > scheduler that the current thread is about to go to sleep, so it should
> > schedule the target thread on the same CPU.
> >
> > This is used by Rust Binder as a performance optimization. When sending
> > a transaction to a different process, we usually know which thread will
> > handle it, so we can schedule that thread for execution next on this
> > CPU for better cache locality.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/sync/condvar.rs | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
> > index b679b6f6dbeb..9861c6749ad0 100644
> > --- a/rust/kernel/sync/condvar.rs
> > +++ b/rust/kernel/sync/condvar.rs
> > @@ -155,6 +155,12 @@ fn notify(&self, count: i32, flags: u32) {
> >          };
> >      }
> >
> > +    /// Calls the kernel function to notify one thread synchronously.
> > +    pub fn notify_sync(&self) {
> > +        // SAFETY: `wait_list` points to valid memory.
> > +        unsafe { bindings::__wake_up_sync(self.wait_list.get(), bindin=
gs::TASK_NORMAL) };
>
> I took a look at the C function (i.e. __wake_up_common) and there I
> found this:
>
>     lockdep_assert_held(&wq_head->lock);
>
> So I think this function requires that the lock is held, how are you
> ensuring this?

No, we don't need to hold a lock. The call stack is:

1. __wake_up_sync
2. __wake_up_sync_key
3. __wake_up_common_lock
4. __wake_up_common

And __wake_up_common_lock will lock wq_head->lock before calling
__wake_up_common.

Alice
