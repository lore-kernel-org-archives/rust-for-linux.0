Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149213C07A;
	Fri, 23 Jan 2026 22:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769208996; cv=none; b=CDhYzjpImNvJzHY2ws6O+Fjdskd5+n1JnBYccfoHE0HdAtY6kkK6hQfsI8neOQazo/SyYEUyEi2jHyfVjHdWTAWkl+LEa1kItBDgpEw5fevoc/ei/Mh1CTp3qwoHvRHcurWalKPtiW2oZwLouzIGY3JDfwaVxMBBzt9zSh9qZ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769208996; c=relaxed/simple;
	bh=/6g3cDzZphJRLnsHpmvZ+lPv6SHLVjST/3lolBvSoTM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=h7VPfw/P4nyHTcm24RyqAnvPrgzuABT2JKRCrir3vdZRAZoDe4TqGaU3u81L/WKQAy5GlExI6ir1Jeo4tIBnLXsPDRLEl9DV8OmulE2PVkZCtSlHs5eCRoMhuDp0m11o29nc/W2yndqd1N7luXRGvwRl8mDnFAnpmfyS8Z5KT6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DOuL9eRa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOuL9eRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E11AC4CEF1;
	Fri, 23 Jan 2026 22:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769208995;
	bh=/6g3cDzZphJRLnsHpmvZ+lPv6SHLVjST/3lolBvSoTM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=DOuL9eRaaF5+Y/awLRXXNpMzyPILM1AoYFrb4KbkIez33Gjp4CAJHhbDwK+6FeOC7
	 6CPrD0idcY3T71jqMdcglj+f3O+FK9p3UmxIqYNBJwgLAej31rMrI0NalR+43MtZ9Z
	 e1j8hB39y9KLNnLksM8XXVosJQKqb6QnQS/UT58oysjvbUjj7dv76xh+dEegLloMwz
	 Z6uDTsRsvhgnlyy5UeJykEKAOkAf8BZQ+cVtGLYk+TnksWTNFgX5omPS20xoEBlqzm
	 PqEFia/bJj1WZYyRHLH1GQN+0MAYbXBLBci0r4oMHdK7NO0mM5fYHQ30Wn3hOSMQcx
	 SPFMN0ntfERnQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 23:56:29 +0100
Message-Id: <DFWC8TMTJHTB.1MZ1HC0KMR06F@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Waiman Long" <longman@redhat.com>
Subject: Re: [PATCH v17 11/16] rust: sync: Expose lock::Backend
From: "Benno Lossin" <lossin@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
X-Mailer: aerc 0.21.0
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-12-lyude@redhat.com>
In-Reply-To: <20260121223933.1568682-12-lyude@redhat.com>

On Wed Jan 21, 2026 at 11:39 PM CET, Lyude Paul wrote:
> Due to the addition of sync::lock::Backend::Context, lock guards can be
> returned with a different Backend than their respective lock. Since we'll
> be adding a trait bound for Backend to GlobalGuard in order to support
> this, users will need to be able to directly refer to Backend so that the=
y
> can use it in trait bounds.
>
> So, let's make this easier for users and expose Backend in sync.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
>  rust/kernel/sync.rs | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index 48a7cae86c50c..ce31154198cea 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -30,6 +30,7 @@
>  pub use lock::spinlock::{
>      new_spinlock, new_spinlock_irq, SpinLock, SpinLockGuard, SpinLockIrq=
, SpinLockIrqGuard,
>  };
> +pub use lock::Backend;
>  pub use locked_by::LockedBy;
>  pub use refcount::Refcount;
>  pub use set_once::SetOnce;

