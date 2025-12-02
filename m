Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC9729AAE3;
	Tue,  2 Dec 2025 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764697389; cv=pass; b=V1/hAxcMr7kzAwZm41omKjpG/WXCbjML3Y/lxkkJAnHpbyJsB6V70ZleEk85MYFp79j2sXVnqmiUp1VNDyrdoRKdtMwm9jrhTdABf+KqEcg+Pfv58ogxazB+axpwe9YKxu3Qt7e319I0j95AK0ThQLKM3OJB4LqQ2lwlaxQ71YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764697389; c=relaxed/simple;
	bh=cWeFeJmiWiUnMsN8mzqDTDJjb0bqPbCmFJoYnh21c/0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=T70vyrhB1HeHrpPoFc82DWBFoylO/HYTmcWFm2bdMq4ZVNeBKyFsDcEPVxcgRytzTLFYNOI/WnSP7PdmLTpFxJn0iXc7AhDDwLxU+JXwchGtj2fXtWVW3cxbozxCJDfi/9hy/yXZEWaEWI+B6BcqHxg6kbKu36fzVJtNhOIYdGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=buFrsSQy; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="buFrsSQy"
ARC-Seal: i=1; a=rsa-sha256; t=1764697366; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JAy5VvjF8wDCWY3mi4I6NYvEdBXUsmUlTC5QX5pTpQZxcFfdiX9iTMu/P2XQBcEl4BHOSedqMl/slU0y7Bie91mJecRzi//9EcOCDPEViQEMoVxg2+ond5dA1J5yum47w/dio5M0ViNQRBT5w9WJO10EwTunyrIiDt05PpwGJVk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764697366; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cWeFeJmiWiUnMsN8mzqDTDJjb0bqPbCmFJoYnh21c/0=; 
	b=Hduc7vWtmhwicCe+V4PqlJDwAnaiVB7nleTIjV1O3e3og9rbkk2Ygn1acaDzeYSzVTCEf8J0KfqPpOh/c3ZokySURuUhlI0iuAryhqF8+L/PUh9u/XQskj8UUZbELKCV5isOXRN8ibctX7heCWcMH/gOVySUCQOOaCRl/lIgk0I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764697366;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=cWeFeJmiWiUnMsN8mzqDTDJjb0bqPbCmFJoYnh21c/0=;
	b=buFrsSQy6kKX5opXYCfKTjuBpj2BUq6VrX2t2/6G26jpdR3/7e7lM99fhP9hLS2W
	iZm1CD32kRLmRb0++ku7QEe6efjOXHN3dcPxR7AcHKudu1OSb1eTOdQEL3VtciQ8Nog
	fOr5Gx7HUBwJGO2y7rj71UZuHDCbFELo8DfAK3Bg=
Received: by mx.zohomail.com with SMTPS id 1764697365160905.3215854582734;
	Tue, 2 Dec 2025 09:42:45 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v8 2/6] ww_mutex: add `ww_class` field unconditionally
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251201102855.4413-3-work@onurozkan.dev>
Date: Tue, 2 Dec 2025 14:42:29 -0300
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
Message-Id: <1371B11E-CAA0-4428-8119-888AD0F9EF09@collabora.com>
References: <20251201102855.4413-1-work@onurozkan.dev>
 <20251201102855.4413-3-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Onur,

> On 1 Dec 2025, at 07:28, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> Removes `DEBUG_WW_MUTEXES` guard on ww_class field
> from ww_acquire_ctx and ww_mutex.
>=20
> This helps us to write much safer Rust abstraction
> in very simple way.

Please extend this a bit. i.e.:

> This helps us to write much safer Rust abstraction in very simple way.

How so? This is what you should expand on in the commit message.

Also the wording/grammar is slightly off.

>=20
> Link: =
https://lore.kernel.org/all/ECC0425A-8B18-4626-8EA8-2F843C45E0A1@collabora=
.com/
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
> include/linux/ww_mutex.h | 8 ++------
> 1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
> index 45ff6f7a872b..c9835035b6d6 100644
> --- a/include/linux/ww_mutex.h
> +++ b/include/linux/ww_mutex.h
> @@ -47,9 +47,7 @@ struct ww_class {
> struct ww_mutex {
> struct WW_MUTEX_BASE base;
> struct ww_acquire_ctx *ctx;
> -#ifdef DEBUG_WW_MUTEXES
> struct ww_class *ww_class;
> -#endif
> };
>=20
> struct ww_acquire_ctx {
> @@ -58,9 +56,9 @@ struct ww_acquire_ctx {
> unsigned int acquired;
> unsigned short wounded;
> unsigned short is_wait_die;
> + struct ww_class *ww_class;
> #ifdef DEBUG_WW_MUTEXES
> unsigned int done_acquire;
> - struct ww_class *ww_class;
> void *contending_lock;
> #endif
> #ifdef CONFIG_DEBUG_LOCK_ALLOC
> @@ -110,9 +108,7 @@ static inline void ww_mutex_init(struct ww_mutex =
*lock,
> {
> ww_mutex_base_init(&lock->base, ww_class->mutex_name, =
&ww_class->mutex_key);
> lock->ctx =3D NULL;
> -#ifdef DEBUG_WW_MUTEXES
> lock->ww_class =3D ww_class;
> -#endif
> }
>=20
> /**
> @@ -147,8 +143,8 @@ static inline void ww_acquire_init(struct =
ww_acquire_ctx *ctx,
> ctx->acquired =3D 0;
> ctx->wounded =3D false;
> ctx->is_wait_die =3D ww_class->is_wait_die;
> -#ifdef DEBUG_WW_MUTEXES
> ctx->ww_class =3D ww_class;
> +#ifdef DEBUG_WW_MUTEXES
> ctx->done_acquire =3D 0;
> ctx->contending_lock =3D NULL;
> #endif
> --=20
> 2.51.2
>=20

With the change above,

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
