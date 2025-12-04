Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F9B26ED5D;
	Thu,  4 Dec 2025 13:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764854826; cv=pass; b=Rt3oZty3qC/hUPygwrovDAr2xJEnMgi4xODZir/0dIpuO+VxT1R0uWEzzQbq/QPcAR/qcQYGjTVlsMrKxGB1RCqXx+aPScLD7D1NDJF5sZvDXRszrOCde7eBzv6i04IPxhWCprqAJf2I4F9/nvo71AVkAE5TyDzWwoCVKNGyJ0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764854826; c=relaxed/simple;
	bh=96LzJ7oxO+X3Ps6Rh0MmHlwiBxtem8ffrzwAG0xZ20Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=OqybYbWsmbNNP4pbvL5MI6P05eQy2YLwb2BAUrYKpsc0g29bK3SJrjqtUsH4STIQEE4FifzymwwpWKQjfteatOz80Bt3/xyrNwZV+vma38R+qP/uWWeX+J7KJdrGrTuNzVxfjxA2KjXjrjNmAn4mSvzlQxTgVZ9m3JIacoyORJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=DFHNvamc; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="DFHNvamc"
ARC-Seal: i=1; a=rsa-sha256; t=1764854796; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=loqHiuBMnUzipACpIrX6qJC3UDNd9EjFb96hyF8yFFroBQJg6tsxwDgbfmOtnTTdIYUA1SodYWhzONc3UVpNnrauY9QFtrR3+B7jqG+PBV9Y6/QpscSQE+V7llvyq85F3bkMD2qW6FAQ2ErEhCHCXYKLu+cQbH0FG+vNe1N+kko=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764854796; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=96LzJ7oxO+X3Ps6Rh0MmHlwiBxtem8ffrzwAG0xZ20Q=; 
	b=RsZstK8745Gyv+akf+hqTIVq5RBhyW2zNdcaBWwmPTeNAlCyM8MRcVPH6/RrQrjgC/5sVliqxr0GwhvHE720p+zJlRGMs9Eqjy7fZfc0b6agT9qULDy04CoeHQcdZ5C+pTkdCSiuZuNPXXhHyKiqxJNhNhUmQVo+UcABTQ9Rgmo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764854796;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=96LzJ7oxO+X3Ps6Rh0MmHlwiBxtem8ffrzwAG0xZ20Q=;
	b=DFHNvamc8cEKGSHSNefulNGKgcDnLm/mABMrJQkrAJ95IleXMtJxZm7Nbjs2ljV3
	KFta8KiC2yP1JGBfxzhSsRjotQfS6243iYMyMD9APbd9xvmEd0FwIL43CAvm3BiAitQ
	AoKFjASLaTMUAWikgkHmUWWzPbfPPa5/mP6WgXbk=
Received: by mx.zohomail.com with SMTPS id 1764854796182407.7823372204573;
	Thu, 4 Dec 2025 05:26:36 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v8 5/6] rust: ww_mutex: add Mutex, AcquireCtx and
 MutexGuard
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aTFPRv2ahM_KA3AB@google.com>
Date: Thu, 4 Dec 2025 07:26:25 -0600
Cc: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 rust-for-linux@vger.kernel.org,
 lossin@kernel.org,
 lyude@redhat.com,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 a.hindborg@kernel.org,
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
Message-Id: <E1879F44-A852-439A-966D-F074AE48E19C@collabora.com>
References: <20251201102855.4413-1-work@onurozkan.dev>
 <20251201102855.4413-6-work@onurozkan.dev> <aTA6f8gK60h6qaHs@google.com>
 <86E0C8EE-393D-4C6A-9C28-BB036A1FFAD6@collabora.com>
 <aTFPRv2ahM_KA3AB@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 4 Dec 2025, at 03:07, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> On Wed, Dec 03, 2025 at 02:23:14PM -0300, Daniel Almeida wrote:
>>=20
>>=20
>>> On 3 Dec 2025, at 10:26, Alice Ryhl <aliceryhl@google.com> wrote:
>>>=20
>>> On Mon, Dec 01, 2025 at 01:28:54PM +0300, Onur =C3=96zkan wrote:
>>>> Yeah :(. We could get rid of them easily by keeping the class that =
was
>>>> passed to the constructor functions but that becomes a problem for =
the
>>>> from_raw implementations.
>>>>=20
>>>> I think the best solution would be to expose ww_class type from
>>>> ww_acquire_ctx and ww_mutex unconditionally (right now it depends =
on
>>>> DEBUG_WW_MUTEXES). That way we can just access the class and verify
>>>> that the mutex and acquire_ctx classes match.
>>>>=20
>>>> What do you think? I can submit a patch for the C-side =
implementation.
>>>> It should be straightforward and shouldn't have any runtime impact.
>>>=20
>>> I think there is a better solution. We can create a different type =
for
>>> every single class, like how rust/kernel/sync/lock/global.rs creates =
a
>>> different type for every single mutex. Then, you know that the =
classes
>>> are the same since the class is part of the type.
>>=20
>> I don=E2=80=99t think this would work with the from_raw() functions. =
What class
>> would you assign then? I think this is precisely what sparked the =
current
>> solution.
>=20
> There can be a way to create a type for a C-defined class, and

That=E2=80=99s the problem, if we don=E2=80=99t have patch 2, we don=E2=80=
=99t know the class.

What you=E2=80=99re suggesting seems unimplementable to me at first. =
Otherwise, can
you expand some more?

=E2=80=94 Daniel

> from_raw() can require that you don't use the same Rust type for
> different C classes.
>=20
> Alice


