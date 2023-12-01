Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MyZfR5+S"
Received: from mail-lf1-x14a.google.com (mail-lf1-x14a.google.com [IPv6:2a00:1450:4864:20::14a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883511707
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Dec 2023 03:47:53 -0800 (PST)
Received: by mail-lf1-x14a.google.com with SMTP id 2adb3069b0e04-50bd3ac2a8aso1722096e87.3
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Dec 2023 03:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701431272; x=1702036072; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6g1GqQ4TrIojcjyDirpeDTGx+n3XD+xjD29/oGpLNfI=;
        b=MyZfR5+SGN0FhAH/+aiSSa5Fxv2pKfXcJ+75yqnXxvQjqbNBeRDcQcievpFYglujkc
         DhXM1fo4edTrakiCOx0FM97hNtPZ2d3TUjRlBcWqMTBlNK/4vsxmoZySEsnRr/lIbh0o
         u13iyIyylhncz+mzUvZwCrjXs/UfStO5j6AhlIKNWYz42BpacRM98h6iUwOnQglafX7W
         GAOwVQGkKhXO/IieXBopZMOZFizm3nmcYWuhdnIU+tIqdfdw17KzDTYq5s5QV8bCEyoc
         SPyvuLP+6BEN9O+/33w0xAM3ikaYuwNxU1t2+J1Z4htSXGgZ+ufmSa90DdR6GLXR/fFD
         0xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701431272; x=1702036072;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6g1GqQ4TrIojcjyDirpeDTGx+n3XD+xjD29/oGpLNfI=;
        b=WOYFEHyITc3yY3Q9eP353njffemilQY72aA4MKB9gR/+QyhNTfQuGoQpoC4OQ3/Hio
         xWAaovARGmBPT/ZKSVSYNwXn5pTDt1/CSqZOoCUEEuKqHxClZTka3DhRzYDRqatc+Sji
         wILEQOFWAG3ao1GYDOTMHcdj9wpMVpl5blSSxDtN27p8h29dLvl9ZADMYgYGa1/sTmb0
         t1+Hz7y814GSLhmZeTm+Bb9ELyCtZzNTgg1bAFNf50wb63mLdI09p9iUPbkVq/YZpIcX
         rL+MCYgOgvexOIIwfK0epD1JmwMA/lEcPfYCItt/NvMeUoaX+/IL8HUYAD7pJqq84zko
         9ZRA==
X-Gm-Message-State: AOJu0YwZwYDmDZ2eNUcJLPVovuxqxL9HgjUymGYPsEcPihl5Ccqa525B
	uiDD+Xa3PgbQZGUd/ITl5EwnfXMCLjNCrRc=
X-Google-Smtp-Source: AGHT+IGmdHD9ndeAoG99U6CjjEVBhoGpQPpovxP6HXHrU+LrFLBMj6V3Szk+lEYNslRiUnlO96T3DeFoBd52niY=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a19:c207:0:b0:509:440f:3c5 with SMTP id
 l7-20020a19c207000000b00509440f03c5mr41495lfc.1.1701431271741; Fri, 01 Dec
 2023 03:47:51 -0800 (PST)
Date: Fri,  1 Dec 2023 11:47:48 +0000
In-Reply-To: <bH_zaB8RmZZW2QrGBx1ud7-YfKmh6QvTU0jYKC0ns7jjoDkCWYnW3u1qX_YrN5P0VwsZGd7U5r8p-7DxH7pb4-6UUE0htwTkFNdDIYZb4os=@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <bH_zaB8RmZZW2QrGBx1ud7-YfKmh6QvTU0jYKC0ns7jjoDkCWYnW3u1qX_YrN5P0VwsZGd7U5r8p-7DxH7pb4-6UUE0htwTkFNdDIYZb4os=@proton.me>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231201114749.2207060-1-aliceryhl@google.com>
Subject: Re: [PATCH 7/7] rust: file: add abstraction for `poll_table`
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
>> +#[pinned_drop]
>> +impl PinnedDrop for PollCondVar {
>> +    fn drop(self: Pin<&mut Self>) {
>> +        // Clear anything registered using `register_wait`.
>> +        self.inner.notify(1, bindings::POLLHUP | bindings::POLLFREE);
> 
> Isn't notifying only a single thread problematic, since a user could
> misuse the `PollCondVar` (since all functions of `CondVar` are also
> accessible) and also `.wait()` on the condvar? When dropping a
> `PollCondVar` it might notify only the user `.wait()`, but not the
> `PollTable`. Or am I missing something?

Using POLLFREE clears everything. However, this should probably be updated to
use `wake_up_pollfree` instead.

Note that calls to `.wait()` are definitely gone by the time the destructor
runs, since such calls borrows the `PollCondVar`, preventing you from running
the destructor.

Alice
