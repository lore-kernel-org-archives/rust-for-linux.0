Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A4CqEikT"
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94026D68
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Dec 2023 06:43:49 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5d0c4ba7081so93750997b3.0
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Dec 2023 06:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701787428; x=1702392228; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WZD0EM5cGaPHhEVDs6IeTDsFoonDp5ja1VtjJCTjqYs=;
        b=A4CqEikT/b+9up74hPMLiEHnErlVVcPtYgrGhXNPnMZ2iUId46d7tz8w6LQSCCReq5
         Nu2fqUNmLkcomVmQ2KjHG9cLgB/0Wi+C/8vMuU1KAunQbCFeTLjiu7PPuRwbrXXyHkla
         G3ZwCeUXnYvDazt1xUGPVmQNzsBH1QMwkB8/4FeIpYVVj18IYzsTKF4p45xTtqYzkZ66
         i9d6qnsU8t7CqxE/1yr+dJqy3+zEeFW9aUZE1GQZRDHkbcqmWDDse9zQC1uGsNAZ6uRx
         UyCPN3K6g4NChrw89SubSjviNqVhmXOB7BMZLZK4hnDeY+xuu/fobOKa8zL6vwFrOAE5
         kqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701787428; x=1702392228;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZD0EM5cGaPHhEVDs6IeTDsFoonDp5ja1VtjJCTjqYs=;
        b=Fe+o+vAhK9PtzaLjvbvaWfCeMe4eC86eDPq9D7aLwNR/irUbWn/jwpcBCrsjU0RvmG
         lTIvDcyUwpvKwiEs2y/2YPwSPbe7gYKNkN3uJNjIK+fGi7U1t/mYWQHZ3Vtx8N0UYYEi
         Rm9ChcXVF4yKDaK2mis8WEFDgukjwdgMkPQ/ZLjiv9Q+rOERVnj6Ab4Wy/Gt2E4nEgYe
         QRfvo64Ihe0qBHMNxHx1yZgJ/ySIkely80prdmxgDeEhk3B5HSk7qSp2u7BoaX2cgk8k
         yvaE/CyrOflesOxsbrNAFX2Njc6ENqNNY4KbeptzzYVSC+JTYo+66a48kw5NizXHc40L
         JM3w==
X-Gm-Message-State: AOJu0Yxd6wFUETxDO4BUbkMkRhoWtkD0Lr7G052jJur2klrFxz4sm1EF
	pzMNtZI7nG1jgOkcTU64l4hyT+f3CprySd0=
X-Google-Smtp-Source: AGHT+IFLoW8f1NTm+nyunXiLErD3gXbKIZlauqfO65/Y2nGSfW6R7tv3Sf+99fVBBvGIC3H+1wip5JAcV5jcBag=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:2d06:b0:5d4:1e95:1e8a with SMTP
 id eq6-20020a05690c2d0600b005d41e951e8amr288127ywb.4.1701787428477; Tue, 05
 Dec 2023 06:43:48 -0800 (PST)
Date: Tue,  5 Dec 2023 14:43:45 +0000
In-Reply-To: <bUU6jGtJ7KdkuVp8UPORb0cmDoU6sRjc1iVRMfgO34u5ySo44Z5MXrnYgE6pfQDFu4-V5CBAuhS8uZDoEA6CsIiLUiWJedNZ2CTf9cRATfQ=@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <bUU6jGtJ7KdkuVp8UPORb0cmDoU6sRjc1iVRMfgO34u5ySo44Z5MXrnYgE6pfQDFu4-V5CBAuhS8uZDoEA6CsIiLUiWJedNZ2CTf9cRATfQ=@proton.me>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231205144345.308820-1-aliceryhl@google.com>
Subject: Re: [PATCH 6/7] rust: file: add `DeferredFdCloser`
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me, brauner@kernel.org
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arve@android.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	cmllamas@google.com, dan.j.williams@intel.com, dxu@dxuuu.xyz, 
	gary@garyguo.net, gregkh@linuxfoundation.org, joel@joelfernandes.org, 
	keescook@chromium.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maco@android.com, ojeda@kernel.org, 
	peterz@infradead.org, rust-for-linux@vger.kernel.org, surenb@google.com, 
	tglx@linutronix.de, tkjos@android.com, viro@zeniv.linux.org.uk, 
	wedsonaf@gmail.com, willy@infradead.org
Content-Type: text/plain; charset="utf-8"

Benno Lossin <benno.lossin@proton.me> writes:
> On 12/1/23 12:35, Alice Ryhl wrote:
>> Benno Lossin <benno.lossin@proton.me> writes:
>>>> +        // SAFETY: The `inner` pointer points at a valid and fully initialized task work that is
>>>> +        // ready to be scheduled.
>>>> +        unsafe { bindings::task_work_add(current, inner, TWA_RESUME) };
>>>
>>> I am a bit confused, when does `do_close_fd` actually run? Does
>>> `TWA_RESUME` mean that `inner` is scheduled to run after the current
>>> task has been completed?
>> 
>> When the current syscall returns to userspace.
> 
> What happens when I use `DeferredFdCloser` outside of a syscall? Will
> it never run? Maybe add some documentation about that?

Christian Brauner, I think I need your help here.

I spent a bunch of time today trying to understand the correct way of
closing an fd held with fdget, and I'm unsure what the best way is.

So, first, `task_work_add` only really works when we're called from a
syscall. For one, it's fallible, and for another, you shouldn't even
attempt to use it from a kthread. (See e.g., the implementation of
`fput` in `fs/file_table.c`.)

To handle the above, we could fall back to the workqueue and schedule
the `fput` there when we are on a kthread or `task_work_add` fails. And
since I don't really care about the performance of this utility, let's
say we just unconditionally use the workqueue to simplify the
implementation.

However, it's not clear to me that this is okay. Consider this
execution: (please compare to `binder_deferred_fd_close`)

    Thread A                Thread B (workqueue)
    fdget()
    close_fd_get_file()
    get_file()
    filp_close()
    schedule_work(do_close_fd)
    // we are preempted
                            fput()
    fdput()

And now, since the workqueue can run before thread A returns to
userspace, we are in trouble again, right? Unless I missed an upgrade
to shared file descriptor somewhere that somehow makes this okay? I
looked around the C code and couldn't find one and I guess such an
upgrade has to happen before the call to `fdget` anyway?

In Binder, the above is perfectly fine since it closes the fd from a
context where `task_work_add` will always work, and a task work
definitely runs after the `fdput`. But I added this as a utility in the
shared kernel crate, and I want to avoid the situation where someone
comes along later and uses it from a kthread, gets the fallback to
workqueue, and then has an UAF due to the previously mentioned
execution...

What do you advise that I do?

Maybe the answer is just that, if you're in a context where it makes
sense to talk about an fd of the current task, then task_work_add will
also definitely work? So if `task_work_add` won't work, then
`close_fd_get_file` will return a null pointer and we never reach the
`task_work_add`. This seems fragile though.

Alice
