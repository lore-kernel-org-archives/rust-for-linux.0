Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ScdRc/0F"
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD705172B
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Dec 2023 01:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1702027865; x=1702287065;
	bh=tIeS2/Jye7HIPtEZsp8KCwBQkwu9VpdtO7V1kQXigqc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ScdRc/0Fvy3evj5RN7U6t2wLpBinuZSAnS6GluqehDBmCcrk/iL1MV2YChWPZBoc5
	 3ayvN+vz/q66pPKbS8IQCkFdy6MDouWErb2wG+v4vmiDtTG2jn844nkLltxTu4MPhM
	 1oBsK8Ww+d5wIOS/6gMQWx51Hlym0ktkQjnymZpIJKf3JASfcFsB9lyk94BvTqQhHI
	 oFi7YzjUTZWZE6bjJvt1mDPhh5nvjOw8w1zULBBhkmwp1UUwQXIY0uoxKoZAQMel1V
	 xmhcQ/cqZx5LtJyCgq3+r1ERBVXKUfr+tCP9EuQyGhUyT4pErhyZg/GkSPu/4wGQqT
	 uhvDTwiMAdQ+A==
Date: Fri, 08 Dec 2023 09:30:41 +0000
To: Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: sync: add `CondVar::notify_sync`
Message-ID: <2TyvgVxGiHf9tLVgLAuw9h9gjv5iM0f_5KE0bM4PGIWrnNXRASVZ-UwxnI4v1XQEIp6mkbTTg9Sr7jEigChMd5Sxhpnd2NV8IDJ9sDXgIPo=@proton.me>
In-Reply-To: <CAH5fLgi37LER-G-ozc13TWGGxraFmP3QVYqX7oBoahyKwgfznQ@mail.gmail.com>
References: <20231206-rb-new-condvar-methods-v1-0-33a4cab7fdaa@google.com> <20231206-rb-new-condvar-methods-v1-1-33a4cab7fdaa@google.com> <n18Cdl9DQXfuGtD6d664Mn0rrPfxebZs31-3vQfu5N0vP0ZgfHNwBZYC4qYgU1GD-4Ue4bUhgNqs40-u8t0baAzlQ0cMMiSzTgjQnhcG50o=@proton.me> <CAH5fLgi37LER-G-ozc13TWGGxraFmP3QVYqX7oBoahyKwgfznQ@mail.gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/8/23 08:29, Alice Ryhl wrote:
> On Thu, Dec 7, 2023 at 9:22=E2=80=AFPM Benno Lossin <benno.lossin@proton.=
me> wrote:
>>
>> On 12/6/23 11:09, Alice Ryhl wrote:
>>> Wake up another thread synchronously.
>>>
>>> This method behaves like `notify_one`, except that it hints to the
>>> scheduler that the current thread is about to go to sleep, so it should
>>> schedule the target thread on the same CPU.
>>>
>>> This is used by Rust Binder as a performance optimization. When sending
>>> a transaction to a different process, we usually know which thread will
>>> handle it, so we can schedule that thread for execution next on this
>>> CPU for better cache locality.
>>>
>>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>>> ---
>>>  rust/kernel/sync/condvar.rs | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
>>> index b679b6f6dbeb..9861c6749ad0 100644
>>> --- a/rust/kernel/sync/condvar.rs
>>> +++ b/rust/kernel/sync/condvar.rs
>>> @@ -155,6 +155,12 @@ fn notify(&self, count: i32, flags: u32) {
>>>          };
>>>      }
>>>
>>> +    /// Calls the kernel function to notify one thread synchronously.
>>> +    pub fn notify_sync(&self) {
>>> +        // SAFETY: `wait_list` points to valid memory.
>>> +        unsafe { bindings::__wake_up_sync(self.wait_list.get(), bindin=
gs::TASK_NORMAL) };
>>
>> I took a look at the C function (i.e. __wake_up_common) and there I
>> found this:
>>
>>     lockdep_assert_held(&wq_head->lock);
>>
>> So I think this function requires that the lock is held, how are you
>> ensuring this?
>=20
> No, we don't need to hold a lock. The call stack is:
>=20
> 1. __wake_up_sync
> 2. __wake_up_sync_key
> 3. __wake_up_common_lock
> 4. __wake_up_common
>=20
> And __wake_up_common_lock will lock wq_head->lock before calling
> __wake_up_common.

Seems like I just looked at the wrong function.

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

--=20
Cheers,
Benno
