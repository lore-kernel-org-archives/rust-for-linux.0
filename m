Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1291133985;
	Fri, 23 Jan 2026 22:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769207171; cv=none; b=H6rB8APmHj+Vtdlg79l8lQlxE21hoysSEzvR/PQt3eBaTx8w+55kX+qEWNJBlu1t/AIh3o60uzUdVR/hSDrCyjb0tJa5eegrztJOqh7DGwxW/+yYWfkPa4smYu+OaEB6IKWM/OdGsy0iIh66y7VzSbEB1LwLST2/hosDPXkwmn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769207171; c=relaxed/simple;
	bh=Y0l882GiNPYYgokByt489HrpXiwugynpxcJbqzaDqDk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=F+wgx7E3MJ8GjUuxDsMpLEOXJB961Lz9pzDlzu84DcM7/ZTX2zsZSIM91LHE1ks3j16t9eC+QNmQFplSObLZMC6p2h7PSq6Ex6lWjnC3+4QGwqwnQnVyXibKUxcMHrXHzFh9pGCxHWxKpiOH/QbTmHh6rPK/hwF7J0fwsgOIcwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPvnAQhq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPvnAQhq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BC5C4CEF1;
	Fri, 23 Jan 2026 22:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769207170;
	bh=Y0l882GiNPYYgokByt489HrpXiwugynpxcJbqzaDqDk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=vPvnAQhq0SIgMo8IdxruWXajdfaCyQ5gC8pE7V24bbKjJxK1XI0Sg3r+4Qu4HDIvA
	 bJ6j+FV6kzaDOPOF9BlU7G15rYXmE/D8eTn8hWLLi/eCAiJZKQgyUZL5VnzKUQsyg2
	 YZDOhyr+o56qxTub8veNzoJzGlxk9rlZ10akjp1CGoy8k38x7NgfAn8GkT16FQBb+w
	 bT+IFpaUATDLE9nTZ+dEP8A+RlqeIKaFVmXrp3bHnYkjn/nmB4bVNh5Mb9gCi84eUP
	 P4wkxQLcR0mot4T7nKKVBYgIe5RcCYecddltsgYI75k7v0eBU6lux1QsEIKEfyAB1M
	 UKCSsUhuBAu+w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 23:26:05 +0100
Message-Id: <DFWBLJAUQMJG.3KT6BQU7VG402@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Waiman Long" <longman@redhat.com>
Subject: Re: [PATCH v17 09/16] rust: sync: Add SpinLockIrq
From: "Benno Lossin" <lossin@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
X-Mailer: aerc 0.21.0
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-10-lyude@redhat.com>
In-Reply-To: <20260121223933.1568682-10-lyude@redhat.com>

On Wed Jan 21, 2026 at 11:39 PM CET, Lyude Paul wrote:
> diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/sp=
inlock.rs
> index d7be38ccbdc7d..3fdfb0a8a0ab1 100644
> --- a/rust/kernel/sync/lock/spinlock.rs
> +++ b/rust/kernel/sync/lock/spinlock.rs
> @@ -3,6 +3,7 @@
>  //! A kernel spinlock.
>  //!
>  //! This module allows Rust code to use the kernel's `spinlock_t`.
> +use crate::prelude::*;
> =20
>  /// Creates a [`SpinLock`] initialiser with the given name and a newly-c=
reated lock class.
>  ///
> @@ -139,3 +140,231 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
>          unsafe { bindings::spin_assert_is_held(ptr) }
>      }
>  }
> +
> +/// Creates a [`SpinLockIrq`] initialiser with the given name and a newl=
y-created lock class.
> +///
> +/// It uses the name if one is given, otherwise it generates one based o=
n the file name and line
> +/// number.
> +#[macro_export]
> +macro_rules! new_spinlock_irq {
> +    ($inner:expr $(, $name:literal)? $(,)?) =3D> {
> +        $crate::sync::SpinLockIrq::new(
> +            $inner, $crate::optional_name!($($name)?), $crate::static_lo=
ck_class!())
> +    };
> +}
> +pub use new_spinlock_irq;
> +
> +/// A spinlock that may be acquired when local processor interrupts are =
disabled.

This hasn't been updated with my previous suggestion and I don't see a
reply on the mailing list. Am I missing something?

With that fixed:

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno
