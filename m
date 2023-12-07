Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="FaDt5exg"
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C8B1717
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Dec 2023 12:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1701980528; x=1702239728;
	bh=uJSND0rxUIaQSNMIcl3FEGD0TOMeemf0Jpuoq4FqA1o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FaDt5exgc4gRIStEIuctEsxtbjMiHrEXxCl6hXCl4U76PpBJUnY5/dflD4X4A9uQJ
	 cokabxPmFDSJM7ulWQdXwSOTj0ntKhg3hd55W4CCySVv9ongeuq4V/NUjcbMpAcxSC
	 K9QuoG0U5H9+7uSJKKti4dFeDk01MWvonuGJDiV87A45dO6OK/KA7OKXl4IxABwdwy
	 9//peOXdMCIv45qae3HwYNyjrR3lPZ+LWhfzfyJcvF7mbS0fUe6Ngr4lgI+2I87UB/
	 CuH7jmVLXuxhGamsEXK8DWQt3bbGhjO7X/ku43Gljln8yCNn9OPHBepfcxB7cq1IET
	 ppsSxMVsWhwqw==
Date: Thu, 07 Dec 2023 20:21:48 +0000
To: Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: sync: add `CondVar::notify_sync`
Message-ID: <n18Cdl9DQXfuGtD6d664Mn0rrPfxebZs31-3vQfu5N0vP0ZgfHNwBZYC4qYgU1GD-4Ue4bUhgNqs40-u8t0baAzlQ0cMMiSzTgjQnhcG50o=@proton.me>
In-Reply-To: <20231206-rb-new-condvar-methods-v1-1-33a4cab7fdaa@google.com>
References: <20231206-rb-new-condvar-methods-v1-0-33a4cab7fdaa@google.com> <20231206-rb-new-condvar-methods-v1-1-33a4cab7fdaa@google.com>
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
> Wake up another thread synchronously.
>=20
> This method behaves like `notify_one`, except that it hints to the
> scheduler that the current thread is about to go to sleep, so it should
> schedule the target thread on the same CPU.
>=20
> This is used by Rust Binder as a performance optimization. When sending
> a transaction to a different process, we usually know which thread will
> handle it, so we can schedule that thread for execution next on this
> CPU for better cache locality.
>=20
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/sync/condvar.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
> index b679b6f6dbeb..9861c6749ad0 100644
> --- a/rust/kernel/sync/condvar.rs
> +++ b/rust/kernel/sync/condvar.rs
> @@ -155,6 +155,12 @@ fn notify(&self, count: i32, flags: u32) {
>          };
>      }
>=20
> +    /// Calls the kernel function to notify one thread synchronously.
> +    pub fn notify_sync(&self) {
> +        // SAFETY: `wait_list` points to valid memory.
> +        unsafe { bindings::__wake_up_sync(self.wait_list.get(), bindings=
::TASK_NORMAL) };

I took a look at the C function (i.e. __wake_up_common) and there I
found this:

    lockdep_assert_held(&wq_head->lock);

So I think this function requires that the lock is held, how are you
ensuring this?

--=20
Cheers,
Benno
