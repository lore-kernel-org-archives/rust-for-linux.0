Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DpAlR7b1"
Received: from mail-lj1-x24a.google.com (mail-lj1-x24a.google.com [IPv6:2a00:1450:4864:20::24a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4987719F
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Dec 2023 03:32:09 -0800 (PST)
Received: by mail-lj1-x24a.google.com with SMTP id 38308e7fff4ca-2c9c05fe6c0so14403561fa.0
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Dec 2023 03:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701430327; x=1702035127; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nmOZpL58Jg4dcaTG9rxFjgV+iNJy0SUwpN+cVHaOTK8=;
        b=DpAlR7b1gfKaV5G4DkOktOrpkNFTHXN99NM7vnAsBSprhz7htoquvhbyuNIC93w2lb
         YVqejhuUs1rwrz20PNWLEWlh2hvepocBeFFdeC/g/wA4h3WW06bk4kW395yQdKZ4J1YY
         pumiS0Wf3OJdELl8es8SW6FD2+43ag+/5B7YcrJfmEfLkOcwC5GAp2ckBeS1Qs+iUyXY
         wDxDrGglN3SB+rlcUjVCM7FR4tjOvUs8AzyQVibPGp2flrGabO2EHc32CbdYUgio/CVT
         McNk7irD6MHt7hdQBEkDLf46LTKqXfXvsUEZyetRa6YhdAvrBHgQ9ZrMghc9zjywTEIb
         YNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701430327; x=1702035127;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmOZpL58Jg4dcaTG9rxFjgV+iNJy0SUwpN+cVHaOTK8=;
        b=DAMk6qxnaQSh0Pt+jXmaU/k9YvvdkViGlgJmJf5lod0eoqqsqoCgjH/mk1w0x8yj+D
         +iLenREWksjp84Ndl2pZVYdp85hO9jgi07/dJSA5XnSE7tn6mnBUS/X+ON36S0F/7sNf
         /6RykxTJAiwVIjjOZCwY1CwzXAcRO4Thy72cza87YXJKvehH2OsERln+YK6oIqaUEVoe
         14n+Yd5AeFr/Rs4IVIjpb6mqNJ33DUI14TIC5ea0883TOO5BU9rNZt4hqPatdLWwBzIj
         qGmMU0UkAa1/1DMMp+BgPNUayrvbeJeA+8ioKr5gcSqZ2+d0Irsct8A1IqVV8myqtSrH
         m8oA==
X-Gm-Message-State: AOJu0Yxei1aJViq5ZU/cWCe/QvVpZOx/4Zo1ZfUBRCTAzN+B0vpw9SV2
	VB//w2Uz/wLQlpDeeTM9sINCc8H8N2nNNpY=
X-Google-Smtp-Source: AGHT+IGQ9UU+rJ5wMq5QBX+PqlTqstUtITM9JfiPzFSkJIOsOvhOpYJ2qAay+9m2rwj3g7HlQCT29mybUK2Tgd8=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:9984:0:b0:2c9:bacb:ab13 with SMTP id
 w4-20020a2e9984000000b002c9bacbab13mr61192lji.5.1701430326787; Fri, 01 Dec
 2023 03:32:06 -0800 (PST)
Date: Fri,  1 Dec 2023 11:32:04 +0000
In-Reply-To: <_xnOTacjwsOFSA4oog2DJs0VLa1w0EaSPM3rqDUjIZAmNgiq0V0-bJwfVZdDKaydes_rJb30Zz4TyacYImYZHK6i0-LR8AYbQa2T1l0h3K8=@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <_xnOTacjwsOFSA4oog2DJs0VLa1w0EaSPM3rqDUjIZAmNgiq0V0-bJwfVZdDKaydes_rJb30Zz4TyacYImYZHK6i0-LR8AYbQa2T1l0h3K8=@proton.me>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231201113204.2201389-1-aliceryhl@google.com>
Subject: Re: [PATCH 4/7] rust: file: add `FileDescriptorReservation`
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
> On 11/29/23 14:11, Alice Ryhl wrote:
> > +impl FileDescriptorReservation {
> > +    /// Creates a new file descriptor reservation.
> > +    pub fn new(flags: u32) -> Result<Self> {
> > +        // SAFETY: FFI call, there are no safety requirements on `flags`.
> > +        let fd: i32 = unsafe { bindings::get_unused_fd_flags(flags) };
> > +        if fd < 0 {
> > +            return Err(Error::from_errno(fd));
> > +        }
> 
> I think here we could also use the modified `to_result` function that
> returns a `u32` if the value is non-negative.

I'll look into that for the next version.

>> +    /// Commits the reservation.
>> +    ///
>> +    /// The previously reserved file descriptor is bound to `file`. This method consumes the
>> +    /// [`FileDescriptorReservation`], so it will not be usable after this call.
>> +    pub fn commit(self, file: ARef<File>) {
>> +        // SAFETY: `self.fd` was previously returned by `get_unused_fd_flags`, and `file.ptr` is
>> +        // guaranteed to have an owned ref count by its type invariants.
>> +        unsafe { bindings::fd_install(self.fd, file.0.get()) };
>> +
>> +        // `fd_install` consumes both the file descriptor and the file reference, so we cannot run
>> +        // the destructors.
>> +        core::mem::forget(self);
>> +        core::mem::forget(file);
> 
> Would be useful to have an `ARef::into_raw` function that would do
> the `forget` for us.

That makes sense to me, but I don't think it needs to happen in this patchset.

Alice
