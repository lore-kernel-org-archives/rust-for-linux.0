Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28F733EC;
	Tue, 25 Nov 2025 15:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764086066; cv=pass; b=CByLuVwFSOW6giPFcIZmpRSKxtNLnxDo6yBvmVbbwt+0fpr9k6mG4K2487k49YNVYoeiCDG5HSYmWeUkyA20V0xmnjuYLDWNEHcx7wT3C5jSjlhnqqzHiNjdZ297T2wdxSOz6iIP1Jd9mkZP1xDxm+fWfkR9f4Y/z/ccQmYH03g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764086066; c=relaxed/simple;
	bh=zGF9PH0y8pFgayaxubOLiakou6QM3bDButGG924cQ1A=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ZXC1O739VoAwsjyBhrCWhraHosJZ06T7pTF5Fhx0NCzaVngsb+LQlmVcyubZOeIcUNBJid/xTyWidqXI9G1vP4STNaiBEnYCnnkcR6b5excF5TLL6MFC/DuxnHT/ZfBtif9VMM3YwxKYPNmud7No40akHL8rWeAYfnYU8+daCVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Vy0u2IjW; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Vy0u2IjW"
ARC-Seal: i=1; a=rsa-sha256; t=1764086029; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iOqMXqIE6Ft69NaUObhruCnYA0FP47y4mmda+VrNoqvbBHUeNLTCX8bhgyN5sKF65ymwzlEaD5iTTkbIu80JL6xFxpCixL3wZX1YywuieHcAWsTRTTldjRJ6d2gNF0FcXlJdr2s1A4PQVUVKRPpbDidcvf9r7ryGRU4F7p2tsVk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764086029; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GorzMSNVjrbqczcNmakffaTU56fCE/ERi5cBmo7oFr0=; 
	b=bVcqDR4LLxJx/cAvCYmw4pt6HXbsSqV9Czoh+zmNxO/x6+senhVRU9Ar/iRvnz41xNTOgsR4CjgTm5qrfIyMCU0YHWSY6SKKcrr48DmL6/u74Hg3EuLR7SLxdC5K7BOVwgp8oqWZWsBvScG66lb1JgWljJhqH8PasWQU0MDhAII=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764086029;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=GorzMSNVjrbqczcNmakffaTU56fCE/ERi5cBmo7oFr0=;
	b=Vy0u2IjW7a6kmFU6JaNOON/Nd6j4O7xE1AFbC6rmo0k0GQKSIOZ21h5Goga/a7Lm
	Vjl9i9PCuqpbMi6y4QiJPujQWifAT0jDfZeHsXdqe8Oz/ZKyRdyYyDU2LVUS2FxHYig
	F99eJmnR3BoWQ7zOgRzuefzV82bIGt7P4Kl1uAWA=
Received: by mx.zohomail.com with SMTPS id 1764086026194683.2695191154689;
	Tue, 25 Nov 2025 07:53:46 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v7 1/6] rust: add C wrappers for ww_mutex inline functions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251101161056.22408-2-work@onurozkan.dev>
Date: Tue, 25 Nov 2025 12:53:29 -0300
Cc: rust-for-linux@vger.kernel.org,
 lossin@kernel.org,
 lyude@redhat.com,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 a.hindborg@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 dakr@kernel.org,
 peterz@infradead.org,
 mingo@redhat.com,
 will@kernel.org,
 longman@redhat.com,
 felipe_life@live.com,
 daniel@sedlak.dev,
 bjorn3_gh@protonmail.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <34A2E775-A47E-4D4E-A292-E12489F07987@collabora.com>
References: <20251101161056.22408-1-work@onurozkan.dev>
 <20251101161056.22408-2-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 1 Nov 2025, at 13:10, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> Some of the kernel's `ww_mutex` functions are implemented as
> `static inline`, so they are inaccessible from Rust as bindgen
> can't generate code on them. This patch provides C function wrappers
> around these inline implementations, so bindgen can see them and =
generate
> the corresponding Rust code.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
> MAINTAINERS             |  1 +
> rust/helpers/helpers.c  |  1 +
> rust/helpers/ww_mutex.c | 39 +++++++++++++++++++++++++++++++++++++++
> 3 files changed, 41 insertions(+)
> create mode 100644 rust/helpers/ww_mutex.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 545a4776795e..03dca09d189a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14527,6 +14527,7 @@ F: kernel/locking/
> F: lib/locking*.[ch]
> F: rust/helpers/mutex.c
> F: rust/helpers/spinlock.c
> +F: rust/helpers/ww_mutex.c
> F: rust/kernel/sync/lock.rs
> F: rust/kernel/sync/lock/
> F: rust/kernel/sync/locked_by.rs
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 551da6c9b506..58cf14d74516 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -59,4 +59,5 @@
> #include "vmalloc.c"
> #include "wait.c"
> #include "workqueue.c"
> +#include "ww_mutex.c"
> #include "xarray.c"
> diff --git a/rust/helpers/ww_mutex.c b/rust/helpers/ww_mutex.c
> new file mode 100644
> index 000000000000..61a487653394
> --- /dev/null
> +++ b/rust/helpers/ww_mutex.c
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/ww_mutex.h>
> +
> +void rust_helper_ww_mutex_init(struct ww_mutex *lock, struct ww_class =
*ww_class)
> +{
> + ww_mutex_init(lock, ww_class);
> +}
> +
> +void rust_helper_ww_acquire_init(struct ww_acquire_ctx *ctx, struct =
ww_class *ww_class)
> +{
> + ww_acquire_init(ctx, ww_class);
> +}
> +
> +void rust_helper_ww_acquire_done(struct ww_acquire_ctx *ctx)
> +{
> + ww_acquire_done(ctx);
> +}
> +
> +void rust_helper_ww_acquire_fini(struct ww_acquire_ctx *ctx)
> +{
> + ww_acquire_fini(ctx);
> +}
> +
> +void rust_helper_ww_mutex_lock_slow(struct ww_mutex *lock, struct =
ww_acquire_ctx *ctx)
> +{
> + ww_mutex_lock_slow(lock, ctx);
> +}
> +
> +int rust_helper_ww_mutex_lock_slow_interruptible(struct ww_mutex =
*lock, struct ww_acquire_ctx *ctx)
> +{
> + return ww_mutex_lock_slow_interruptible(lock, ctx);
> +}
> +
> +bool rust_helper_ww_mutex_is_locked(struct ww_mutex *lock)
> +{
> + return ww_mutex_is_locked(lock);
> +}
> +
> --=20
> 2.51.2
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
