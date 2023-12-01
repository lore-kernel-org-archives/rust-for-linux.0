Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gaCdCZS8"
Received: from mail-lf1-x149.google.com (mail-lf1-x149.google.com [IPv6:2a00:1450:4864:20::149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A277170E
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Dec 2023 03:50:55 -0800 (PST)
Received: by mail-lf1-x149.google.com with SMTP id 2adb3069b0e04-50bc7296f75so2340271e87.2
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Dec 2023 03:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701431453; x=1702036253; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/BVYl63ZIrcNFLUa5Nj/riyis5Au6tDAIb2Q4+PiwNE=;
        b=gaCdCZS8Wo+IpU+LvrghZGHSCTDlu2ovMWwXkkq4WgqAeFm2ZldnNzNzYETqGn4oX9
         eiSezNoCyNNLOq/PGtLrxZMYYkKilymI4NS2vIIYP1I0cTK6dfjIagIRyHDRnFQH6o1Q
         e4is4Ikj/5HnQ9VUMspMc6P17oQQEvHsqfsaAKTWAH351ICZ4HJ8pBAmLKbEaRGfM9HM
         VCtYrQyeNByRu2XlXYmzuE0nKhJCtWuGPwDdeoU1/R8DzSe8nxFg8YiILJ1c5AFBWJx9
         jCxytya20EekFz/xA+eAtupMe9j6Lq3+WMEO9ufiQT8WCY4+U4dNJTd9FdaVCCCua7U6
         FAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701431453; x=1702036253;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BVYl63ZIrcNFLUa5Nj/riyis5Au6tDAIb2Q4+PiwNE=;
        b=h3P230jgclKxa2XymvTtxkPnfsCwSNwOJfIuxvQROqNDyNESOPsxw8OODGeHAA6wBs
         7VlsDB6TH4cjNtrNISw2/fTmwR87ySiqBUZmNFxbKuIOsIxHwDd9/3yV5e/FK2CumgmW
         axSHRMO2m3dXgZAalVz2BPR68l6aQD+NLYPHc/7dUSiTE+VHUzryISOvnhPcES4izOPG
         De2068lgTXKMURAG7EKnAAfaSvBpzeAL7dlv8DTdkVyVXOU899a7vxF7gd+joreuaxai
         74RON6oDQ9s0xBLramzd3AcCiaLfbLO5sJWK15GiHqOEaECR3mUK4rpwTVJyfYlEg0L/
         246w==
X-Gm-Message-State: AOJu0YxbPBuFbRnB2F2YGQUKjEPXE1eyRjqUZ2NGkUk09qwpIUDwde49
	muI6TB5S1LxavhL2ZVmvsR+rGIiyGdnzFds=
X-Google-Smtp-Source: AGHT+IHWIVTksmK0edVZGPr78JsVaudS40Jz9JyjF/DFPOEUrS0ZrluBGntBFY5f8ZeB66yp5PYJtPcHyw+v+T8=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6512:2392:b0:50b:d466:bb with SMTP
 id c18-20020a056512239200b0050bd46600bbmr53383lfv.4.1701431453776; Fri, 01
 Dec 2023 03:50:53 -0800 (PST)
Date: Fri,  1 Dec 2023 11:50:51 +0000
In-Reply-To: <ZWkPGF5AS6creWTH@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ZWkPGF5AS6creWTH@boqun-archlinux>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231201115051.2209084-1-aliceryhl@google.com>
Subject: Re: [PATCH 7/7] rust: file: add abstraction for `poll_table`
From: Alice Ryhl <aliceryhl@google.com>
To: boqun.feng@gmail.com
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arve@android.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	brauner@kernel.org, cmllamas@google.com, dan.j.williams@intel.com, 
	dxu@dxuuu.xyz, gary@garyguo.net, gregkh@linuxfoundation.org, 
	joel@joelfernandes.org, keescook@chromium.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maco@android.com, ojeda@kernel.org, 
	peterz@infradead.org, rust-for-linux@vger.kernel.org, surenb@google.com, 
	tglx@linutronix.de, tkjos@android.com, viro@zeniv.linux.org.uk, 
	wedsonaf@gmail.com, willy@infradead.org
Content-Type: text/plain; charset="utf-8"

Boqun Feng <boqun.feng@gmail.com> writes:
>> That said, `synchronize_rcu` is rather expensive and is not needed in
>> all cases: If we have never registered a `poll_table` with the
>> `wait_list`, then we don't need to call `synchronize_rcu`. (And this is
>> a common case in Binder - not all processes use Binder with epoll.) The
>> current implementation does not account for this, but we could change it
>> to store a boolean next to the `wait_list` to keep track of whether a
>> `poll_table` has ever been registered. It is up to discussion whether
>> this is desireable.
>> 
>> It is not clear to me whether we can implement the above without storing
>> an extra boolean. We could check whether the `wait_list` is empty, but
>> it is not clear that this is sufficient. Perhaps someone knows the
>> answer? If a `poll_table` has previously been registered with a
> 
> That won't be sufficient, considering this:
> 
>     CPU 0                           CPU 1
>                                     ep_remove_wait_queue():
>                                       whead = smp_load_acquire(&pwq->whead); // whead is not NULL
>     PollCondVar::drop():
>       self.inner.notify():
>         <for each wait entry in the list>
> 	  ep_poll_callback():
> 	    <remove wait entry>
>             smp_store_release(&ep_pwq_from_wait(wait)->whead, NULL);
>       <lock the waitqueue>
>       waitqueue_active() // return false, since the queue is emtpy
>       <unlock>
>     ...
>     <free the waitqueue>
> 				       if (whead) {
> 				         remove_wait_queue(whead, &pwq->wait); // Use-after-free BOOM!
> 				       }
>       
> 
> Note that moving the `wait_list` empty checking before
> `self.inner.notify()` won't change the result, since there might be a
> `notify` called by users before `PollCondVar::drop()`, hence the same
> result.
> 
> Regards,
> Boqun

Thank you for confirming my suspicion.

Alice
