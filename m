Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7AA2C21CB;
	Tue,  2 Dec 2025 17:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764697158; cv=pass; b=pOeOCmloOvuDzYu4bo+ZF7HVrUowvCavRF8Fqo6jvmXoKHNI9SX/qGTjq5GAmvjqIul8Js9Z25QFGn6m/KllCVgQRjjsvkDCO63qEIuwFTz239k2BF/14WbZVnbRD5CWvFKNJr+eBQZXlOgKvaHY5d5EKNMIKJOxo63k5YyX0j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764697158; c=relaxed/simple;
	bh=8kSKQ/9vnLRVFjnbI8cBrPDQtPtRAi2y29PC6FcKQMA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=uFURANW7y2Ty5x08w7OnqDjMBbSa707Bln8/bnpZpI3Wm8lpcht1qnV1aikL/62xWZ7QvRWAbRbj8RHUSfW/CVzlVc+bCggWmrmwDXhmAD2JK0SOiE8pzCyKjVUwPMuoY3uXeTpNpX8ODj/lAKam+EX+SLxzi+i68tIKnry9O/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=SvZupDFP; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="SvZupDFP"
ARC-Seal: i=1; a=rsa-sha256; t=1764697125; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lC0tpxoOq/quIpf0FfXffJgjsO3LqOMwJGmpN0dLuI8b2jWYbO1n64L6qOzh3XA5LKTUA9Qe2KQDc940wYVhR0KgSvLiB8VRQQkmA1jd0z0ICzxpWfNIidTdax5l6wi5N3UHJi1PDJQokICa0wIVUuLcUZPOBsrqZgdIZ+LFatE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764697125; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tw4Ms6wJSNJD1s5BL+2AbBXqa/ev7wcOmKNkn0zsPOA=; 
	b=aT5myfeE4BcDtDpPvmpRHr0ThkZ6FJoiXNkzvLBAP17S08GUojokZswySWCCn9Io6enqGBA3/9nebjM36D0/5aQWSPgtWLGb8fd0MQHjFmneQWmP2s2W3Q4nchz/LWc7WvxmESZhc0gFmucnQ2n6m4XyctY9Yz8HjzzYBVk21pg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764697125;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=tw4Ms6wJSNJD1s5BL+2AbBXqa/ev7wcOmKNkn0zsPOA=;
	b=SvZupDFPl0ja8Y5H2dXgyDcZWZMZ6Y8j13VpXjraXF3L2pNZcWOGjaV18pJTMFLF
	WATpeZTjynLV/g8pgLnefNnpLzcxfe1ABpqeQ2oRwBdE0BYMLa4V0GjKi7vqoStHwhc
	7gNSzdaRjk9dj2xpUm+E7eITmg7MS69McfWFQGIg=
Received: by mx.zohomail.com with SMTPS id 1764697124283740.1981073790407;
	Tue, 2 Dec 2025 09:38:44 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v8 1/6] rust: add C wrappers for ww_mutex inline functions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251201102855.4413-2-work@onurozkan.dev>
Date: Tue, 2 Dec 2025 14:38:28 -0300
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
 thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2F879792-3C12-4C8F-8EF1-122F44EF2B19@collabora.com>
References: <20251201102855.4413-1-work@onurozkan.dev>
 <20251201102855.4413-2-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Onur,

> On 1 Dec 2025, at 07:28, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> Some of the kernel's `ww_mutex` functions are implemented as
> `static inline`, so they are inaccessible from Rust as bindgen
> can't generate code on them. This patch provides C function wrappers
> around these inline implementations, so bindgen can see them and =
generate
> the corresponding Rust code.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Did you forget to pick up tags? (b4 trailers -u)

> ---
> MAINTAINERS             |  1 +
> rust/helpers/helpers.c  |  1 +
> rust/helpers/ww_mutex.c | 39 +++++++++++++++++++++++++++++++++++++++
> 3 files changed, 41 insertions(+)
> create mode 100644 rust/helpers/ww_mutex.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e8f06145fb54..bc6ea9cc1588 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14546,6 +14546,7 @@ F: kernel/locking/
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

=E2=80=94 Daniel

