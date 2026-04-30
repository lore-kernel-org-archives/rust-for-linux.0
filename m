Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E21358379
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 05:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777528747; cv=none; b=QIlX37sSFbKX4255grWOhNCyV4RrjbdsHHHvAKt31Zc8Mlu8nICzAETFVq6fY4Kjs2mNb99CUOp7qvzj8mm868lx54oawO9XBLPOeM3x7H6j5CB28V8ZMiJUQ4o/TRGXGEpd51sJ7nNKrxa8W6sscl8+668qS8ikdbU1OD0tBZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777528747; c=relaxed/simple;
	bh=L9LxH+jDRKUt61IPO9Ld1DC2uoBBSLkblJzIKtVPmY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LuZe+fOVLWu3ZKaqBASDASuyyPsFr1mBCXWpFmWkXCXcwXESfRJb5X03TkWDAq7W7Dis5Nfa2rHDTpo7rAy8VKfkS99/XxXdG8HacAtEbdU3QNUfx5D2fFIroJ5KTfLGP3LpupB86jBs8at75m4+B2p73OeXLkfEbwh/UrwQNks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=USQTGrDG; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="USQTGrDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1777528736; x=1777787936;
	bh=B5Omarr62oxGpCxR4JG6XodcfLazFkve1tprmEfr1EA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=USQTGrDGbn9XprsHlsvQx1fAxX6KJ1NC3uVtkdaf2WcS42gGYfbGM7kErCUAgr3Rq
	 OZg6rx4ykQQkl3HLhWpvFh65X9K5bu7VUMl/ZGr+vUHdBzIFQJYlsgjscLgKQDYG1t
	 UgcaYHYV2WaFJ0cSk7CnBiD7keJ7RSuk1NnDWNEAonVkb9Fcvvu0Bj8SUyqOMphWGJ
	 94i6x+9enBk0F9CPBbZS0IPr9uGnjdeSnE2D//VbABqe/Yts6YPpMA3MQJQQK6XgK0
	 sVcjHl13hO7f/jdOH5OlLb1RpmZcNMOmaK3P2NaEYNhURUkLaHvhcVCl8KSXQa6l5w
	 YO51QcWHw4Ycg==
X-Pm-Submission-Id: 4g5k4s3BP2z2SchT
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Sagar Taunk <sagartaunk2@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: workqueue: replace SAFETY TODO for `WorkItemPointer` impl on `Pin<KBox<T>>`
Date: Thu, 30 Apr 2026 08:58:51 +0300
Message-ID: <20260430055852.18927-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260430004857.38281-1-sagartaunk2@gmail.com>
References: <20260430004857.38281-1-sagartaunk2@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Apr 2026 06:18:56 +0530=0D
Sagar Taunk <sagartaunk2@gmail.com> wrote:=0D
=0D
> The original implementation left a `SAFETY: TODO` comment on the=0D
> `WorkItemPointer` implementation for `Pin<KBox<T>>`. This patch documents=
=0D
> the safety requirements that make this implementation sound.=0D
> =0D
> The safety argument relies on three guarantees: `__enqueue` strips the=0D
> `Pin` wrapper via `Pin::into_inner_unchecked` and leaks the box via=0D
> `KBox::into_raw`, producing a `*mut T` whose allocation remains live for=
=0D
> the duration of the queued work; `work_container_of` safely reverses the=
=0D
> `raw_get_work` offset arithmetic to recover the exact `*mut T` that=0D
> `__enqueue` produced; and the workqueue guarantees `run` is called exactl=
y=0D
> once, making `KBox::from_raw` sound.=0D
> =0D
> Signed-off-by: Sagar Taunk <sagartaunk2@gmail.com>=0D
> ---=0D
>  rust/kernel/workqueue.rs | 7 ++++++-=0D
>  1 file changed, 6 insertions(+), 1 deletion(-)=0D
> =0D
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs=0D
> index 74c59f2b1c09..f31412fca303 100644=0D
> --- a/rust/kernel/workqueue.rs=0D
> +++ b/rust/kernel/workqueue.rs=0D
> @@ -881,7 +881,12 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID>=
 for Arc<T>=0D
>  {=0D
>  }=0D
>  =0D
> -// SAFETY: TODO.=0D
> +// SAFETY: The `work_struct` pointer passed to `run` originates from `__=
enqueue`,=0D
> +// which strips the `Pin` wrapper via `Pin::into_inner_unchecked()` and =
leaks the box=0D
> +// via `KBox::into_raw()`, producing a `*mut T`. `work_container_of` the=
n safely reverses=0D
> +// the `raw_get_work` offset to recover that exact `*mut T`. The workque=
ue itself guarantees=0D
> +// that `run` is called exactly once, so `KBox::from_raw()` correctly re=
claims ownership=0D
> +// of the leaked box.=0D
=0D
Not very human readable (at least for me)... Perhaps you can check the note=
s=0D
from ARef<T> and Arc<T> impls? It They should have some parts in common lik=
e=0D
the initialization part.=0D
=0D
- Onur=0D
=0D
>  unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>=0D
>  where=0D
>      T: WorkItem<ID, Pointer =3D Self>,=0D
> -- =0D
> 2.54.0=0D
> =0D
