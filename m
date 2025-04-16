Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D2D225401
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 19:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744832498; cv=none; b=ebLxxSxm2N1z/fOxWOowJtKg00RSQ5VjlfuvRYePcJN/faCOXYr0P3xjCG8zzwPfmOeXYn4bEug8x+G418q5JNzla4xtsJGZV6PkhkmuCiuEgp2s3QXhLJZxH4ClTVaYjCZlnYPXYyLA2tMFYuut0REy1tg/9x8a3Xu7//8tsl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744832498; c=relaxed/simple;
	bh=WpFEHMxhIom4a/gyRlqsZYvF8/V4lOFd9v3l2dBOHLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WwkwoxbEdp/Zgc6wBogW0hP/C3VguWK3jRyc8NyWtjSTp5u3hlyHJZ0fOW8htJ5CHXPox7uEl2nNwv/a8P8z7ATkkBNqZF9LxsyKwrHnzw8W0NMkJskqan2FJQBo/z8pPS0Dq5B3R4HyH1hNBHtIjk2lIWc1YMZKy+pHdKTT4xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1RZKtzyo; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1RZKtzyo"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso302465e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744832495; x=1745437295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73p9gCBFBqLCb5CzdqDqTSFtvn9eMBZ/PtG9RJYv3ps=;
        b=1RZKtzyocQOJFRaoVoFXU0XL9reIczkTwUBLaFjjByYfpRdGIzehVUWkXZUkA0wmlh
         Zp9BiOV7bWBaERvO9Xct4w1rfJbHsjiQvHk0h1qOjakSlnCWFY+7IAzTf2rQg8Bb2uIz
         TahnYv2fLRrWXY1a2Iwuj5+PxYclJQCG7vxLuEFq2zO7iWloOvuKYa+xkrPHxvq72RJJ
         AB1Wgkmk5wPn06oyhfgF1IDs4jKoUt5IWivJLetW0H4naEpG8uCAJnq6HBbz4Hm2/0X9
         dWB7tWqCkwmbmEPVCuhp6RxV+SLN31nS6urFu/yKJrq/QSdptXGf2thA3ieVdKKuLosM
         sPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744832495; x=1745437295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73p9gCBFBqLCb5CzdqDqTSFtvn9eMBZ/PtG9RJYv3ps=;
        b=FsGSw81nK9VDHm2vd8ApS5v+TROq6jz9/ZfHq9W18dB70o3KjYfFuDvq6W+S3naHcG
         YgEVGQEqs9Ra6YWPzegXG1VRbHKCze55YLyBNBbCLVuWc39GfWSNYv4zflqI9DIkfKqu
         YxfDXxHXRwPgYiqcRQ8D1w6vm/DmFQ16Y3tWRrNhSZClDY7JSTJHFqx2+EcpziuPJf2N
         bY4C2vWUy/ydsO+Ro4r7iwLhqwuw9CLY0eTWTQgLv7JmLWVfBi199lQaZL2yHt5deHXJ
         AeUQACC+qnB4SIl05QStA79LqDx26f9rFAOewwmhzbrM5/Ps8wuGgM7hY4ohh8FczQpo
         yIrw==
X-Forwarded-Encrypted: i=1; AJvYcCWI+ZLhS3sFjYbe1iayFBPKuon4Sgnk9YS8DNofPSq+1a7c43Vi8ioqraOrl6n1yfljC7X/q8rjuy3bJSs+0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqCPiKwIr1f91J57I/0jlaN3jh3YVCTvWmTBYnKY2Nkrb0cz2k
	MpKd0xEAROyexj++exts7PzIemOaf53gpUAh0HB6BbLEUMg3MghLYel5R5x8dX1ySLAdvFalrwm
	GAJtTp+v72xyDlsRkhUOGYo8g3K7VKEqdIGp7
X-Gm-Gg: ASbGncvtS2RLJq406yfg7JV9kTCErzqxFxuTavuPj+Aq46yAbPnzUwPLSBewHczVKr+
	7BCHbQqnNcSqfJjYAeCA/cAiHz2rp3hOMmLAeSgx02BF/MaPhb8v6njIvKJ+RWfK44p1jv2xvNc
	A91bPdvLHsYebrd5gi5zPFnX0=
X-Google-Smtp-Source: AGHT+IGtVEMKWEUzjMR6E9qdJbM0wZpB9E2Ql4OEqXn0MpYDgCa3qkTo0RFbYVx0BGqBtSEuwJiGggOpxfJIrc7SDJY=
X-Received: by 2002:a05:600c:b8c:b0:439:643a:c8d5 with SMTP id
 5b1f17b1804b1-4405d5bfbb4mr37966485e9.0.1744832494480; Wed, 16 Apr 2025
 12:41:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1QzTdV8mHJYdQ6@cassiopeiae> <Z_4gb8ZAlbfhobgW@google.com>
 <Z_45kDv_wAHIBNpI@cassiopeiae> <Z_-f7Bgjw35iXkui@google.com>
In-Reply-To: <Z_-f7Bgjw35iXkui@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 16 Apr 2025 21:41:21 +0200
X-Gm-Features: ATxdqUGdbID-1p8JPdVsvpY0WjMZ8EKfyShFzfYD0_8h-UB6mUQj8wDa31lVY80
Message-ID: <CAH5fLgiKxDpWg=dDsTJsrB6Kmkw32GZ9WPO-SrpWm4TZDxGVtg@mail.gmail.com>
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
To: Tejun Heo <tj@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 2:17=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Tue, Apr 15, 2025 at 12:48:48PM +0200, Danilo Krummrich wrote:
> > On Tue, Apr 15, 2025 at 09:01:35AM +0000, Alice Ryhl wrote:
> > > On Mon, Apr 14, 2025 at 08:15:41PM +0200, Danilo Krummrich wrote:
> > > > On Fri, Apr 11, 2025 at 03:34:24PM +0000, Alice Ryhl wrote:
> > > > >
> > > > > +/// An owned kernel work queue.
> > > >
> > > > I'd suggest to document that dropping an OwnedQueue will wait for p=
ending work.
> > > >
> > > > Additionally, given that you're about to implement delayed work as =
well, we
> > > > should also mention that destroy_workqueue() currently does not cov=
er waiting
> > > > for delayed work *before* it is scheduled and hence may cause WARN(=
) splats or
> > > > even UAF bugs.
> > >
> > > Ah, that's a problem :(
> > >
> > > Can we make destroy_workqueue() wait for delayed items too? And/or ha=
ve
> > > a variant of it that does so? I'm not sure what is best to do here...
> >
> > I think the problem is that the workq is not aware of all the timers in=
 flight
> > and simply queues the work in the timer callback. See also [1].
> >
> > I'm not sure there's an easy solution to that, without adding extra ove=
rhead,
> > such as keeping a list of timers in flight in the workqueue end. :(
> >
> > [1] https://elixir.bootlin.com/linux/v6.13.7/source/kernel/workqueue.c#=
L2489
>
> It looks like panthor handles this by only having a single delayed work
> item on each queue and using cancel_delayed_work_sync before calling
> destroy_workqueue.
>
> Tejun, what do you suggest? The goal of the Rust API is to make it
> impossible to accidentally trigger a UAF, so we need to design the API
> to prevent this mistake.

Ok, looks like I'm not the only one with this problem.
https://lore.kernel.org/all/20250404101543.74262-2-phasta@kernel.org/

I think the most natural behavior is that destroy_workqueue() should
also wait for delayed work items, since the workqueue does not know
how to cancel them. Anyone who wants them cancelled can manually
cancel those work items before calling destroy_workqueue(), and that
would be no different from what they have to do today.

I thought about implementation approaches. The first thought that
sprang to mind is add a list of all delayed work items, but now I
think we can do better. We can have an atomic counter tracking the
number of delayed work items, and have destroy_workqueue() do this:

retry:
drain_workqueue(wq);
if (has_delayed_work_items(wq)) {
    wait_for_delayed_to_be_scheduled(wq);
    goto retry;
}

where wait_for_delayed_to_be_scheduled() either waits for the counter
to hit zero, or waits for at least waits for one of them to be
scheduled. For example, maybe wait_for_delayed_to_be_scheduled() could
add a dummy work item *without* waking up the worker threads, and then
wait for that work item to get executed, which would effectively mean
that it sleeps until something else wakes up a worker.

Thoughts?

Alice
