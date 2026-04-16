Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8383539BFF8;
	Thu, 16 Apr 2026 10:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334653; cv=none; b=k8nURHvgMRh4Hk22GGJY1Po1Lgk8jCARLHP1KIbH5dWbcEZQ0aK6AhhrBVdKRlDXheQwbdce1uocJ/VhnBsFz+hHQ0QwXFJAhyQ1SgNGFba6kqM0LsV3HPzIHqws6ez3d02u/lLSm9QmGcjGA9cXa64O+eqwdfpq9/bsNG3aSmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334653; c=relaxed/simple;
	bh=t0H4TjZZeGBfWMY7LYOMeJyR1+PP+ZVaz0ksiDF1ujo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=f31p2SrSxGo4IaeaA/MZo7lQ17RrQeVhSd8Y0t6Fpjj7nv+toa0bqOJFMZBF/GFJNUt9HDN3z6xYb1p+XAZD9Nlp8ZDP6yY2x3zEoOVMXx/1QJWzbbjSJpGtM+j60EAyzty3X+yG0t/J/AQSPMYSyvbqhRdjRbj0TJQBBFA5kFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNpfZqCN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNpfZqCN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0684C2BCAF;
	Thu, 16 Apr 2026 10:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776334653;
	bh=t0H4TjZZeGBfWMY7LYOMeJyR1+PP+ZVaz0ksiDF1ujo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=VNpfZqCNasfVGGzljbFwrbKCGJhpuBK2OqGlCPS7j5G9uip6WxkMcAQx3yYw782PS
	 H26527soaDZES83xxkl+ycWV36ygsgbaXPyHpzG98zT3oFJiBA8+uQ7GnRSHt9oN+H
	 OjHrAcwUtBnJIkei2BqCVv9cFv2//8qf8Ao5a6xsVygEJgkfl9YkNL0UYfPZ0c5cZ9
	 BUvF3upb5Kcv9rS2YPVq2+vBOFjPQO/xntK3RhxCYTVkRKJ4p8UqwlX8ji9pPkwPiB
	 lzRDu3PQIKtMtE5SMqwgxbiutVRZtD6d8pmY9LzlfVAqxIkivIfHVO48aNXqAF8Db3
	 lBhiKb+DVhKxA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Apr 2026 12:17:28 +0200
Message-Id: <DHUI2VX00WY3.EMKKQNDXHC72@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add RUST [SYNC] entry
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Will
 Deacon" <will@kernel.org>, "Ingo Molnar" <mingo@kernel.org>, "Waiman Long"
 <longman@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Mark Rutland" <mark.rutland@arm.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Boqun Feng" <boqun@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260415232830.8128-1-boqun@kernel.org>
In-Reply-To: <20260415232830.8128-1-boqun@kernel.org>

On Thu Apr 16, 2026 at 1:28 AM CEST, Boqun Feng wrote:
> We have two pull requests on Rust synchronization primitives with 10+
> patches in a row for recent cycles, so it makes sense to start the
> effort of handling this area as a group.
>
> Luckily for me, Gary Guo and Alice Ryhl agreed to help as
> co-maintainers, and we also have a talented group of reviewers:
>
> Lyude Paul started the SpinLockIrq work [1] and did an amazing job at
> improving the design and implementation.
>
> Daniel Almeida resolved the Lock<T: !Unpin> issue [2] and he did a fair
> amount of reviews in areas related to synchronization primitives
> already.
>
> Onur =C3=96zkan started the ww_mutex work [3] and did an amazing job at
> consolidating various design requirements and decisions.
>
> Of course, this only reflects my own knowledge, and I believe they did
> way more outside what I'm aware of ;-)
>
> Note that having this MAINTAINERS entry is meant to bring more people
> to help on the synchronization primitives in Rust, which means for patch
> submissions and design discussion, please still involve the
> corresponding maintainers (e.g. LOCKING and ATOMIC),
> scripts/get_maintainers.pl should have this covered.
>
> Link: https://lore.kernel.org/rust-for-linux/20260302232154.861916-1-lyud=
e@redhat.com/ [1]
> Link: https://lore.kernel.org/all/20250828-lock-t-when-t-is-pinned-v2-0-b=
067c4b93fd6@collabora.com/ [2]
> Link: https://lore.kernel.org/rust-for-linux/20260103073554.34855-1-work@=
onurozkan.dev/ [3]
> Signed-off-by: Boqun Feng <boqun@kernel.org>

Acked-by: Danilo Krummrich <dakr@kernel.org>

> ---
>  MAINTAINERS | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..220dee78b225 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23183,6 +23183,20 @@ T:	git https://github.com/Rust-for-Linux/linux.g=
it alloc-next
>  F:	rust/kernel/alloc.rs
>  F:	rust/kernel/alloc/
> =20
> +RUST [SYNC]

NIT: I think we should keep this sorted alphabetically.

> +M:	Boqun Feng <boqun@kernel.org>
> +M:	Gary Guo <gary@garyguo.net>
> +M:	Alice Ryhl <aliceryhl@google.com>
> +R:	Lyude Paul <lyude@redhat.com>
> +R:	Daniel Almeida <daniel.almeida@collabora.com>
> +R:	"Onur =C3=96zkan" <work@onurozkan.dev>
> +L:	linux-kernel@vger.kernel.org
> +L:	rust-for-linux@vger.kernel.org
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rus=
t-sync
> +F:	rust/kernel/sync.rs
> +F:	rust/kernel/sync/
> +
>  RUST [NUM]
>  M:	Alexandre Courbot <acourbot@nvidia.com>
>  R:	Yury Norov <yury.norov@gmail.com>
> --=20
> 2.50.1 (Apple Git-155)

