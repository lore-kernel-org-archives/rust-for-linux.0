Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3242BEC5E
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765961756; cv=pass; b=Mqq5DaPFPK3zJ6NcP8PxF5Q3yRyt4RiCDihGJfCIRI1Mo8DoIPfhn8MSTRUVezxlR8XM9TQL90xR0yTXJxDEvNZIccwonmZAJQ5OL/D00kH1x65ILQXWpFZI6vXC88XhuvT2PlZsVeJGxWlJ8WPr46geeIs4NazC+y25/uPJUj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765961756; c=relaxed/simple;
	bh=pdSNAMzU0dYiODL4hGX3ra+6iuIwjN+4DsS49s7aBYE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=WPddPE6X0jbA373z++IywtmQbnOG5M1BeySBq/irqbUqAeW2PtloHtR0x03FGt6n5MPgesc5fzKKGK34/BhRx5cKGMRhHo+l5UWVecjtPJetpO09mYSlPjcCtdAyvRRzt2+YBjYK8s1U/BD5nxxuLOtZ/B32g3TlJbTY9PaB5HI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=IWH0PLo3; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="IWH0PLo3"
ARC-Seal: i=1; a=rsa-sha256; t=1765961706; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I9rbaCxsZXhyT7jE2Wk+22p950598jhAk/Gf+3kYqXGzswHYY1cb69DZOCldQsNNzWd7V3dMulu2LcDRoVrWhynK7g40aTSYajp5DdawN7bqbbwi9awfgV53e60o3/0Elmf6Hxsd012dIqUlHimNqgTKmG/Tn70Mr2ctVIS+Snc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765961706; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pdSNAMzU0dYiODL4hGX3ra+6iuIwjN+4DsS49s7aBYE=; 
	b=U3WF7YlEDPx8EVmU34MyMy/e1+Y7J11Dn3fUYDTvn0pW8rqB4YdK3B2d82G+xpXbxxj00+W9odo97co5DOuhYm5yIOUi1uiZYrE8ZuPbP2eh8sZ3lsiPwj+mcIbOvDawQZ5jQp/4025Qq/quydCB2l15W1xK1Nd7n3eD64KZQE0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765961706;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=pdSNAMzU0dYiODL4hGX3ra+6iuIwjN+4DsS49s7aBYE=;
	b=IWH0PLo3H0/J8cTA1DTdYQYlucMaRcLEQtIfKRRH2TupiWfiZqSIx5sHI/MpK238
	IwGca7WyLAU7DJ/iht7Kj8ItjNESiTvQJuvtS4pjewDbvS3MQkMXw0fW0ZeZVT8E+kR
	bwYhVuwf1a9Mo3R2vbFjVC+bzHCBUVPbcet3Rs6Q=
Received: by mx.zohomail.com with SMTPS id 1765961704452980.6410829158114;
	Wed, 17 Dec 2025 00:55:04 -0800 (PST)
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
In-Reply-To: <20251215121001.5a0cc42c@nimda>
Date: Wed, 17 Dec 2025 05:54:46 -0300
Cc: Alice Ryhl <aliceryhl@google.com>,
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
Message-Id: <55E30790-0370-4910-B8E9-C007052BF285@collabora.com>
References: <20251201102855.4413-1-work@onurozkan.dev>
 <20251201102855.4413-6-work@onurozkan.dev> <aTA6f8gK60h6qaHs@google.com>
 <86E0C8EE-393D-4C6A-9C28-BB036A1FFAD6@collabora.com>
 <aTFPRv2ahM_KA3AB@google.com> <20251215121001.5a0cc42c@nimda>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 15 Dec 2025, at 06:10, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> On Thu, 4 Dec 2025 09:07:18 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>=20
>> On Wed, Dec 03, 2025 at 02:23:14PM -0300, Daniel Almeida wrote:
>>>=20
>>>=20
>>>> On 3 Dec 2025, at 10:26, Alice Ryhl <aliceryhl@google.com> wrote:
>>>>=20
>>>> On Mon, Dec 01, 2025 at 01:28:54PM +0300, Onur =C3=96zkan wrote:
>>>>> Yeah :(. We could get rid of them easily by keeping the class
>>>>> that was passed to the constructor functions but that becomes a
>>>>> problem for the from_raw implementations.
>>>>>=20
>>>>> I think the best solution would be to expose ww_class type from
>>>>> ww_acquire_ctx and ww_mutex unconditionally (right now it
>>>>> depends on DEBUG_WW_MUTEXES). That way we can just access the
>>>>> class and verify that the mutex and acquire_ctx classes match.
>>>>>=20
>>>>> What do you think? I can submit a patch for the C-side
>>>>> implementation. It should be straightforward and shouldn't have
>>>>> any runtime impact.
>>>>=20
>>>> I think there is a better solution. We can create a different
>>>> type for every single class, like how
>>>> rust/kernel/sync/lock/global.rs creates a different type for
>>>> every single mutex. Then, you know that the classes are the same
>>>> since the class is part of the type.
>>>=20
>>> I don=E2=80=99t think this would work with the from_raw() functions. =
What
>>> class would you assign then? I think this is precisely what sparked
>>> the current solution.
>>=20
>> There can be a way to create a type for a C-defined class, and
>> from_raw() can require that you don't use the same Rust type for
>> different C classes.
>>=20
>=20
> Do you think this is a better alternative? IMO it doesn't seem worth
> it for what it's doing. Current approach adds less complexity and is
> easier to maintain. It's not just helping from_raw functions, the =
class
> validation is being much simpler without having to deal with storing
> class references or creating new types.
>=20
> I am holding off the next version because we don't have a clear
> consensus on this.
>=20
> - Onur
>=20
>> Alice


I am frankly not sure whether what Alice suggested is an improvement =
either.
Having the class stored seems like a much simpler solution to the =
problem.

> Then when you call from_raw(), you call
>=20
> Mutex::<T, MY_C_CLASS>::from_raw(ptr_to_mutex)

That=E2=80=99s what we are trying to avoid in the first place. It does =
not really
matter that from_raw() is unsafe, because this is not really about UB, =
but
rather about trying to avoid broken code if possible.

IMHO, if we can check this, then I propose that we do. Hence why we are =
storing
the class.


=E2=80=94 Daniel=
