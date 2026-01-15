Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795E911CAF;
	Thu, 15 Jan 2026 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768484756; cv=pass; b=Z+NGg818k6UELswktUbGimne9FsndHDKONTL4d4q6oAluwC3zoVJZYlKpHOQDA2TWec8Tot9IcgIt9PhPlB83BquC1m8PQoPUAGDErYUVyGm4exmlYsbE20LZNh7XECXqTU2t918542AHX35u0rACh6By+4KYHldRD4+ucKpavo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768484756; c=relaxed/simple;
	bh=ErKIL7JzFOjrhSsN1FrGcqLLx8sMj2MrWv9UlVb++48=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=XMeMoZuNr1bIgTGb4YH8O2nWyAENZvY3IlyTKPskrLf084ZJK05Io1a50ZlfTUcZ3ByZ6fNH9yFvMwYDS0Av8eKU6yBxRWozepv9C5DbjmOUzTHBMdJLch8AS3rc4aMN5/hBCBJe03R7ipZ2ROBoRgopplQwZ/3D0Y7sVeIbpWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=F9Y+e2Wo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="F9Y+e2Wo"
ARC-Seal: i=1; a=rsa-sha256; t=1768484731; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eRrepVzMXSubwG6GRD6Oj673PKXTv07BhcbvBR5W9RVZbeJWfYrOgdMbu5TVWc76L/B13BUzJzYPu+ImuxCAC3QUc+wIxPG3SeCtoxmholS8r+ZqIvY8QxLULsERGtuT94QaiX0pAlxyWqk+OFcy5lHdsa2m/K2+PtEhCf68XNg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768484731; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LTAQS963k6YD1owOZlUeNB8le+icQtXREoLhPwXEkWs=; 
	b=NPWBVC7nhWNzGGc5kiY+86orz7ypo+suIkLtStcVqMHHOJ9NDSfdAytyOUrTgAxtqOP4fawl3c6RgWOybfiFs3ma/nLsHmd6+qF5ZiN+HBsm55TMCntRhijqU7Tv7KrGoZTBwZ6Wgsh1MNVsxXDM9/KFKwjl6Uw291OmNRXnkeQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768484731;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=LTAQS963k6YD1owOZlUeNB8le+icQtXREoLhPwXEkWs=;
	b=F9Y+e2Wo3g8COkUa5XG0MICC+J+wXv9AuI7K79Dc0a17lQPWNTx72kK7+mywb0qA
	lydvDB1Rv87Ni1OohYsgyh9gMfrRsu6zqu8eokwqdmHILrp/9UNuPvhQEqJLvIJs8eC
	lxTOxRLMwDRMUu2D22kaAEoJKMUKaR34daCjaP2Y=
Received: by mx.zohomail.com with SMTPS id 1768484730106981.135897043117;
	Thu, 15 Jan 2026 05:45:30 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v8] rust: add new macro for common bitflag operations
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DFP6YJB8C5IG.3G4CMUM6YN45S@garyguo.net>
Date: Thu, 15 Jan 2026 10:45:14 -0300
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
 Filipe Xavier <felipeaggger@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 felipe_life@live.com,
 linux-kernel@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FD404241-143B-4B24-B8BF-3D121073F4A9@collabora.com>
References: <2JpjX5S1c2QLiHUftMzVViS7xatVGkJperCPqxJU8ZQ_Opyo4KPge5jcRCPb0Gcgyxb4yeFhm6Y-1X8q3pbNaw==@protonmail.internalid>
 <20260111-feat-add-bitmask-macro-v8-1-3bc0a558ede0@gmail.com>
 <87jyxjf56j.fsf@kernel.org> <87h5snf4yb.fsf@kernel.org>
 <DFP6YJB8C5IG.3G4CMUM6YN45S@garyguo.net>
To: Gary Guo <gary@garyguo.net>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 15 Jan 2026, at 10:19, Gary Guo <gary@garyguo.net> wrote:
>=20
> On Thu Jan 15, 2026 at 12:14 PM GMT, Andreas Hindborg wrote:
>> Andreas Hindborg <a.hindborg@kernel.org> writes:
>>=20
>>> "Filipe Xavier" <felipeaggger@gmail.com> writes:
>>>=20
>>>> We have seen a proliferation of mod_whatever::foo::Flags
>>>> being defined with essentially the same implementation
>>>> for BitAnd, BitOr, contains and etc.
>>>>=20
>>>> This macro aims to bring a solution for this,
>>>> allowing to generate these methods for user-defined structs.
>>>> With some use cases in KMS and upcoming GPU drivers.
>>>>=20
>>>> Link: =
https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/=
We.20really.20need.20a.20common.20.60Flags.60.20type
>>>> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
>>>> Suggested-by: Lyude Paul <lyude@redhat.com>
>>>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>>>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>>>> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
>>>=20
>>> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
>>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>>>=20
>>>=20
>>> I think it would be useful to add:
>>>=20
>>> impl Flags {
>>>     unsafe from_raw(value: Repr) -> {
>>>     ...
>>>     }
>>> }
>>>=20
>>> impl TryFrom<Repr> for Flag {
>>>     // Succeed if `value` is a valid `Flag` enum bit pattern.
>>> }
>>>=20
>>> impl TryFrom<Repr> for Flags {
>>>     // Succeed if `value` is the logical OR of valid enum bit =
patterns.
>>> }
>>=20
>> Also bitwise operations on the underlying type such as
>>=20
>>  impl BitOrAssign<Flag> for u32 {
>>  ...
>>  }
>>=20
>> Not sure if that is possible with the orphan rule, but it would be =
nice.
>> I was trying to
>>=20
>>  lim.features |=3D request::Feature::Rotational;
>=20
> This is allowed by orphan rules, in a similar way that you can =
implement
> `From<Local> for Foreign`.
>=20
> However I don't think this is desirable feature? Why can't a =
conversion be used
> if you're using raw reprs?
>=20
> I think we should discourage the use of raw integers when bitflags can =
be used,
> adding that (or even `TryFrom`) can be a negative incentive.


The flags may be in your uapi or they may otherwise come from C. In that =
case
you=E2=80=99re stuck with a Try=46rom or a manual conversion.

I think a generated Try=46rom shouldn't hurt. Just my 0.02c.

>=20
> Best,
> Gary
>=20
>>=20
>> where `lim: bindings::queue_limits`.
>>=20
>>=20
>> Best regards,
>> Andreas Hindborg


