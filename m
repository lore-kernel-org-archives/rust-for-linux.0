Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D2C1C5D5E;
	Mon, 22 Dec 2025 06:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766384373; cv=none; b=hgp6hTqz0bVKtlGTeDnGSdWj8X61IajrGEAdtkn3ZaB8kRA0UiVA76CU7RcnjiT0MRnnki++c0v/zMmutcQB4HL2Un0/lKSaEQggd22l3cwqr1Nu9/cVCFQnFXJAoBUJgmaOzKClysTffjsHZgX0DVlaNZy+GB1cYcx2QsUjySo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766384373; c=relaxed/simple;
	bh=/ZY8CN6yuzaS/ZzWkH++O/BqOMlDDJ+xgTTtHWmRHOE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SkWEzKW+KDZ+pyN8+LK8yf8mDlULs6d0KTEsvTEvGOaHiy6kSYe4WSYTk5n6ZAm8yLa4PnHp7oN5eh+cXX26Jlg1lDbCXXs5LHVVNFHviuQPtYYF3SfwF9a5iPjEMillMwXVXpnloPM0/LhZz7YnrfgTolo+f1+HHOj9WbriiAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCyrCS8r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCyrCS8r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BC8C4CEF1;
	Mon, 22 Dec 2025 06:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766384371;
	bh=/ZY8CN6yuzaS/ZzWkH++O/BqOMlDDJ+xgTTtHWmRHOE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=TCyrCS8rwfuVzl4pGvyBPQSviKfjmfIZHwbmnYoKQsPGvotFtNEwd6k9sR8pVffc2
	 ++z4ELYFGFeX7n6hcG8GR0P31Ov1G1duBAJbIrgA1ye1Z4GTzQiWV+uvYAg1fJOsiy
	 fNdaHH/5jykmYJKJ8uvMNZMN3hWB4a06EpDCj5hTiwZkK2J8XF6tqj64t+rSAaybuZ
	 XqpXvEMxboZv8s8a26Oy5VVM765rwL/i/F0YQQmF3ZKArQiFvr022tek75ldKNG/id
	 +CQwq1sr+i6eB5s9z5fW2LB1ORVH+AbwkUFn8wvQqmuoIaMzS52E0mwAbUGsz9axig
	 2TOcBvuZX3D2A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 07:19:26 +0100
Message-Id: <DF4IZZCCY3OL.3L759760HY8LD@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Waiman Long" <longman@redhat.com>
Subject: Re: [PATCH v16 11/17] rust: sync: lock: Add
 `Backend::BackendInContext`
From: "Benno Lossin" <lossin@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
X-Mailer: aerc 0.21.0
References: <20251215175806.102713-1-lyude@redhat.com>
 <20251215175806.102713-12-lyude@redhat.com>
In-Reply-To: <20251215175806.102713-12-lyude@redhat.com>

On Mon Dec 15, 2025 at 6:57 PM CET, Lyude Paul wrote:
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index bf2d94c1999bd..938ffe1bac06c 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -30,10 +30,15 @@
>  ///   is owned, that is, between calls to [`lock`] and [`unlock`].
>  /// - Implementers must also ensure that [`relock`] uses the same lockin=
g method as the original
>  ///   lock operation.
> +/// - Implementers must ensure if [`BackendInContext`] is a [`Backend`],=
 it's safe to acquire the
> +///   lock under the [`Context`], the [`State`] of two backends must be =
the same.
>  ///
>  /// [`lock`]: Backend::lock
>  /// [`unlock`]: Backend::unlock
>  /// [`relock`]: Backend::relock
> +/// [`BackendInContext`]: Backend::BackendInContext
> +/// [`Context`]: Backend::Context
> +/// [`State`]: Backend::State
>  pub unsafe trait Backend {
>      /// The state required by the lock.
>      type State;
> @@ -47,6 +52,9 @@ pub unsafe trait Backend {
>      /// The context which can be provided to acquire the lock with a dif=
ferent backend.
>      type Context<'a>;
> =20
> +    /// The alternative backend we can use if a [`Context`](Backend::Con=
text) is provided.
> +    type BackendInContext: Sized;
> +

I'm wondering if it'd be better to have a subtrait of `Backend` that
stores all this information instead:

    pub unsafe trait BackendWithContext: Backend {
        type Context<'a>;

        type ContextualBackend: Backend<State =3D Self::State>;
    }

That way, we don't need to specify `()` for the `Context`/`BackendInContext=
`
in e.g. `Mutex`. And the safety requirements also get much simpler: the
state requirement is directly encoded in the trait bound and the other
part loses the `if` condition.

Then only implement the `lock_with` method on `Lock<T, B>` where `B` is
a `BackendWithContext`.

Cheers,
Benno

>      /// Initialises the lock.
>      ///
>      /// # Safety
