Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="f304iunJ"
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25CE11F;
	Fri,  8 Dec 2023 11:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1702062266; x=1702321466;
	bh=szxOtb+AV7RFvNenFpj725sXO+o6OshrR9Ibu9AEMoQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=f304iunJ6sJ+1sEOANbB+Eh7YmFU7OK9DgKNQYnM5igJ2fKyUQHlHgxf/p7O8nzYk
	 q3MY8NlmFlG9iS+MPG11aYDb8JSNcszXU/WGZYQZvJWT5QLjaMVuwJOOyRNkFnWFDx
	 H0I0cZML+Tsj6EzaIN3Xlh/o4bmKOkN3Lkk8s2qdcNbZ0x9mr3a2m9zjVi0xzgVnu+
	 Cxga4q2QbTBwVbPK4K99N2Yu4AFVbyxy2MUnsVOAU1vmaUKxrVo3HQ3W1BtMlK5v5D
	 tYqVd5HlHHFS9KoGlhFQYZvqBrPZRA0FtCg4TD2XU6kjKzH28PhIiwYsB8Y4bA5/nG
	 iHfJdjlhUtfTw==
Date: Fri, 08 Dec 2023 19:04:06 +0000
To: Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: sync: add `CondVar::wait_timeout`
Message-ID: <nAEg-6vbtX72ZY3oirDhrSEf06TBWmMiTt73EklMzEAzN4FD4mF3TPEyAOxBZgZtjzoiaBYtYr3s8sa9wp1uYH9vEWRf2M-Lf4I0BY9rAgk=@proton.me>
In-Reply-To: <20231206-rb-new-condvar-methods-v1-2-33a4cab7fdaa@google.com>
References: <20231206-rb-new-condvar-methods-v1-0-33a4cab7fdaa@google.com> <20231206-rb-new-condvar-methods-v1-2-33a4cab7fdaa@google.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/6/23 11:09, Alice Ryhl wrote:
> +    /// Atomically releases the given lock (whose ownership is proven by=
 the guard) and puts the
> +    /// thread to sleep. It wakes up when notified by [`CondVar::notify_=
one`] or
> +    /// [`CondVar::notify_all`], or when the thread receives a signal.
> +    ///
> +    /// Returns whether there is a signal pending.
> +    fn wait_internal_timeout<T, B>(
> +        &self,
> +        wait_state: u32,
> +        guard: &mut Guard<'_, T, B>,
> +        timeout: u64,
> +    ) -> u64
> +    where
> +        T: ?Sized,
> +        B: Backend,
> +    {
> +        let wait =3D Opaque::<bindings::wait_queue_entry>::uninit();
> +
> +        // SAFETY: `wait` points to valid memory.
> +        unsafe { bindings::init_wait(wait.get()) };
> +
> +        // SAFETY: Both `wait` and `wait_list` point to valid memory.
> +        unsafe {
> +            bindings::prepare_to_wait_exclusive(self.wait_list.get(), wa=
it.get(), wait_state as _)

Does `.into()` work here? If for some reason the type here changes, we
probably want to know about it.

> +        };
> +
> +        // SAFETY: Switches to another thread.
> +        let timeout =3D
> +            guard.do_unlocked(|| unsafe { bindings::schedule_timeout(tim=
eout as _) as _ });

Ditto.

--=20
Cheers,
Benno

> +
> +        // SAFETY: Both `wait` and `wait_list` point to valid memory.
> +        unsafe { bindings::finish_wait(self.wait_list.get(), wait.get())=
 };
> +
> +        timeout
> +    }
