Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JVOG2RBX"
Received: from mail-lf1-x14a.google.com (mail-lf1-x14a.google.com [IPv6:2a00:1450:4864:20::14a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B21113
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 07:34:39 -0800 (PST)
Received: by mail-lf1-x14a.google.com with SMTP id 2adb3069b0e04-50c0be8849cso2540226e87.1
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 07:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702308877; x=1702913677; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=stu0ZJZ/iLBAZujmR+p0lyyYHMpojeVivEZwAc09IiI=;
        b=JVOG2RBXpgkYv28ZrIIeKFc+eDkGGcxdfTjlIh4qJJ25AWuruy/dtD+I2U2Kb6CcVp
         fht/4jrJi9scxT7Se98ChBYWUy43uuvyyIPzPShVfqCfsDxL1buvpBxP7pnO6l/lPLl9
         V3vDz9zzsXJIab5sCi4spx68TzQ41RnGtdarog3PIjgMDsh1CHi0a94MyMsXYin43+UC
         E23GXFSV3jvIV0KtKoomLUcWZxSJ5AxeZ2cqzzuL+DCuD0QAcKDZ9AzyD4ThD8PW5ROt
         qbLgHkmRfG+BMlwTjI0zEFWTTcb+g34UJ9148DADPIS/5UmwW23N2z/MTeUMnFoZ/PBh
         35RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702308877; x=1702913677;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=stu0ZJZ/iLBAZujmR+p0lyyYHMpojeVivEZwAc09IiI=;
        b=YFPHw2RLpu6ODholeBUd0qEpPLo0fA+Iazm4DXGPYkuJ+P4bWiADCeZONXadZucouv
         dPxLUapPxtcehtX69+wkhOUNNBTJBmihEsr9YLAupwfay79a+sAYSG2jqW+D5VlULIpu
         lwZAlR05rEW29DEJeYXfKIMjZV9c3ez0ZZcDRGOVquVjV026g+9dqPv1txCUQfbYYBZl
         otUP5haEwQJ+PTF/KLg5fZod2xQCrnCM5paICY4wbAtJIIujSOfI6pLLfZkUU3o7bsOD
         +Pqy5WsUK85oCRFtW8zVW/6sEP2s2ADUNNRWZn2eCMMQ4xnNq50VDvKgok+1Bnb14G50
         HXyw==
X-Gm-Message-State: AOJu0YywEt95X1ludVRPUQqqLOEYs5DkrUxnY0RGh8rBlKhqNJMrLx4R
	GXf8euW4/JGNtNU9Yj63Xjdc8yuZMy0BPuE=
X-Google-Smtp-Source: AGHT+IHe/749pN/R8WQkCJ1upgaYzu708xvKyEorYDCSSeYyZ0ox0S8WXyOzIyQ9xNHiCWGEDFo6MKwF6uX2Tes=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:ac2:4c0a:0:b0:50d:1395:ef0b with SMTP id
 t10-20020ac24c0a000000b0050d1395ef0bmr77884lfq.4.1702308877536; Mon, 11 Dec
 2023 07:34:37 -0800 (PST)
Date: Mon, 11 Dec 2023 15:34:35 +0000
In-Reply-To: <ooDN7KSgDTAyd45wWcPa1VLmvo-fiqwDmffX1Yl8uiesYUcgnCZq5dcd6fGw5sVYMusZGpEI4L5avLCqNXXM7opR627oUp1NB-TIHOwJufg=@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ooDN7KSgDTAyd45wWcPa1VLmvo-fiqwDmffX1Yl8uiesYUcgnCZq5dcd6fGw5sVYMusZGpEI4L5avLCqNXXM7opR627oUp1NB-TIHOwJufg=@proton.me>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231211153435.4162296-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 4/7] rust: file: add `FileDescriptorReservation`
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
> On 12/6/23 12:59, Alice Ryhl wrote:
> > +    /// Commits the reservation.
> > +    ///
> > +    /// The previously reserved file descriptor is bound to `file`. This method consumes the
> > +    /// [`FileDescriptorReservation`], so it will not be usable after this call.
> > +    pub fn fd_install(self, file: ARef<File>) {
> > +        // SAFETY: `self.fd` was previously returned by `get_unused_fd_flags`, and `file.ptr` is
> > +        // guaranteed to have an owned ref count by its type invariants.
> 
> There is no mention of the requirement that `current` has not changed
> (you do mention it on the `_not_send` field, but I think it should also
> be in the safety comment here).
> 
> [...]
> > +impl Drop for FileDescriptorReservation {
> > +    fn drop(&mut self) {
> > +        // SAFETY: `self.fd` was returned by a previous call to `get_unused_fd_flags`.
> 
> Ditto.

I'll update this.

> > +/// Zero-sized type to mark types not [`Send`].
> > +///
> > +/// Add this type as a field to your struct if your type should not be sent to a different task.
> > +/// Since [`Send`] is an auto trait, adding a single field that is `!Send` will ensure that the
> > +/// whole type is `!Send`.
> > +///
> > +/// If a type is `!Send` it is impossible to give control over an instance of the type to another
> > +/// task. This is useful when a type stores task-local information for example file descriptors.
> > +pub type NotThreadSafe = PhantomData<*mut ()>;
> 
> This should be in its own commit.
> 
> Then you can also change the usages of `PhantomData<*mut ()>` in
> `Guard` and `TaskRef`.
> 
> It would be nice to use `NotThreadSafe` as the value instead of
> `PhantomData`, since it is a bit confusing... 
> I think we might be able to also have a constant with the same name
> that is just `pub const NotThreadSafe: NotThreadSafe = PhantomData;`.

I was able to get this to work with a `const`, so I will use that.

Alice
