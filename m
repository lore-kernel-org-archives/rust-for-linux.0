Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RSyiSAtt"
Received: from mail-lj1-x249.google.com (mail-lj1-x249.google.com [IPv6:2a00:1450:4864:20::249])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BCECF
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Dec 2023 03:35:42 -0800 (PST)
Received: by mail-lj1-x249.google.com with SMTP id 38308e7fff4ca-2c9c5db77b8so14299501fa.1
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Dec 2023 03:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701430541; x=1702035341; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qEkAP1I3qkXnBXX51BCMUCkxCSmzCgvaSA2DFugwU0k=;
        b=RSyiSAttj6AD0qcDKZRtFj4CyqlYT8YxZ7cw64/dQXoKu9MmAKHyBRsLnrcKqd6g3j
         Vx1XIZdXNzihq2Y6fQmgNey96WlGv9CO0vqY2U1c2e+lyledj1LNHnUPIEXIzyzMhPW0
         tx/MLqRbsI0Vlwdcqz/One6ot1LRfUG6ymJtm7WkFHgqi5aJCZjF3MGA4iuwWyizXgO4
         w7l9FULQE6l0e7DCJLFNzp0k6gGATb8jUuZ9wJEsujmiHbE1XfVbrazkrAwwu0X/eaHj
         b1gg4/OucszMKoRTHKxFdHV3VU9MZpoPq3mBSXx+L5eHO42cNlr+8kc5L5oYfKVE/mML
         C6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701430541; x=1702035341;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEkAP1I3qkXnBXX51BCMUCkxCSmzCgvaSA2DFugwU0k=;
        b=gBaYHFcD9wPzV6lBx7gczNQR+S8zHKIIxjmb7VOGg8lSvTUYylNaIxzY1GZsTfl60M
         ZFXTcta0FQEhUodke06yao9p9Ucdvy/VwLWfZ/KryJAPn13pPWYzRv5Ii9AfzBgBEIsA
         h9uO5Sqn/YI69Zd5La571lOheRY1UMwDwBLG19C7l6VXh5nAlyBM06sCFriYL2rkMhIq
         GewbqJykbpjl07Zx/0CrOrfVVMxuH0JqnFw8A/L28sv/OHfXtvnkx25k5ag65gRhtMpV
         JVUz64t1OQgyaX3XM9bOix4jUT/fJoz0k8YazTeoW/XmCFVzZCWbIbJLjClW7ndl4FSZ
         FLlg==
X-Gm-Message-State: AOJu0Yx3jmVSeKWrx1vcEXA4ldirfb2qNBIJTgOSNmLFfIobi6YDN404
	e++bzX+PU/lg1IpMyepkP5lBGqSe8JzEbF0=
X-Google-Smtp-Source: AGHT+IFeTcBN1rZeBuZXq6yiD1BS3gZazpYc5NDt39EiWjUlJlgLZM3L2VCrcBV0qyu1cAqEZnjYwmFr2+yoba0=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:86cd:0:b0:2c9:aecd:306 with SMTP id
 n13-20020a2e86cd000000b002c9aecd0306mr53095ljj.0.1701430541098; Fri, 01 Dec
 2023 03:35:41 -0800 (PST)
Date: Fri,  1 Dec 2023 11:35:38 +0000
In-Reply-To: <LNSA8EeuwLGDBzY1W8GaP1L6gucAPE_34myHWuyg3ziYuheiFLk3WfVBPppzwDZwoGVTCqL8EBjAaxsNshTY6AQq_sNtK9hmea7FeaNJuCo=@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <LNSA8EeuwLGDBzY1W8GaP1L6gucAPE_34myHWuyg3ziYuheiFLk3WfVBPppzwDZwoGVTCqL8EBjAaxsNshTY6AQq_sNtK9hmea7FeaNJuCo=@proton.me>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231201113538.2202170-1-aliceryhl@google.com>
Subject: Re: [PATCH 6/7] rust: file: add `DeferredFdCloser`
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arve@android.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	brauner@kernel.org, cmllamas@google.com, dan.j.williams@intel.com, 
	dxu@dxuuu.xyz, gary@garyguo.net, gregkh@linuxfoundation.org, 
	joel@joelfernandes.org, keescook@chromium.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maco@android.com, ojeda@kernel.org, 
	peterz@infradead.org, rust-for-linux@vger.kernel.org, surenb@google.com, 
	tglx@linutronix.de, tkjos@android.com, viro@zeniv.linux.org.uk, 
	wedsonaf@gmail.com, willy@infradead.org
Content-Type: text/plain; charset="utf-8"

Benno Lossin <benno.lossin@proton.me> writes:
>> +        // SAFETY: The `inner` pointer points at a valid and fully initialized task work that is
>> +        // ready to be scheduled.
>> +        unsafe { bindings::task_work_add(current, inner, TWA_RESUME) };
> 
> I am a bit confused, when does `do_close_fd` actually run? Does
> `TWA_RESUME` mean that `inner` is scheduled to run after the current
> task has been completed?

When the current syscall returns to userspace.

>> +    // SAFETY: This function is an implementation detail of `close_fd`, so its safety comments
>> +    // should be read in extension of that method.
>> +    unsafe extern "C" fn do_close_fd(inner: *mut bindings::callback_head) {
>> +        // SAFETY: In `close_fd` we use this method together with a pointer that originates from a
>> +        // `Box<DeferredFdCloserInner>`, and we have just been given ownership of that allocation.
>> +        let inner = unsafe { Box::from_raw(inner as *mut DeferredFdCloserInner) };
> 
> In order for this call to be sound, `inner` must be an exclusive
> pointer (including any possible references into the `callback_head`).
> Is this the case?

Yes, when this is called, it's been removed from the linked list of task
work. That's why we can kfree it.

>> +        // SAFETY: Since `DeferredFdCloserInner` is `#[repr(C)]`, casting the pointers gives a
>> +        // pointer to the `twork` field.
>> +        let inner = Box::into_raw(self.inner) as *mut bindings::callback_head;
> 
> Here you can just use `.cast::<...>()`.

Will do.

Alice
