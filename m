Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC0422F75B
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 12:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336354; cv=pass; b=IaQwRGhZOHxQ60gD8ITm0zbc7ybD5L0l5wILyEUlxd7u+6Db5APaGEHyBPb2aXGm5KrwFgZMEY1iKpep9f17Uwvv29/Pj0PM+hOuw2IF4FEFJ6BNW9/s1YSrFGyQuJFRpb7UFzNRZulLaHusKYpQhAaQauWpVoH3ofcN/MNemhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336354; c=relaxed/simple;
	bh=mSHMwU5BfHIT05fR+QiDed79kmin3rLDoqTtPLjIU6c=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PJHCE4YqiJF0KgpnePk9IQFptl7rRnX/wpUeGn1JLszhHo0m8xvflCMZ2fPsN/ySafd8lMMtJauPrCulY0ooXODs7BBQJkpFU5b2OwWCyKkQMiRaYb2nKemgeeFJc6zgYO3nFN42hE4Z9+dTUhZQxd5wLOX2+EZSCcU64f8q6Rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=T/dFT9+x; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="T/dFT9+x"
ARC-Seal: i=1; a=rsa-sha256; t=1750336330; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SwSvOPCAhr2hRsBtq33SR0yOKAqey/dbZ297638Y2R5+MIXWnG17zkjeK1lScBZmWqlt0ANvfjziLZP1EGQ5sGQw9r33cNJMwqq6U4vh0aRLxTYZXhoaf94wIUxq3Jqovi6RXSqPPtP/SsWtwlD5srm6VjHjGZwhxRGI4DA0DrA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750336330; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gV7kHexhdT3tXQhvcd7rYNJY8AUTwv8DrCPlHuLQr38=; 
	b=TyHw93sLtsJT8jYzgtDzCHChmpKd/JSRLWWs5S6aXVItpq9Z59IvhxUXqaYe8QmmDc12UmRRBjB7/oJ1eifQJjCiE95jH9HmEth7oy9zHIdy1EEw7Y0fZz8gJLoC2ajH+3rNFr8bJnPcypNEkzrTT4U/E9gsHL6vQs5D/EOzLdU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750336330;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=gV7kHexhdT3tXQhvcd7rYNJY8AUTwv8DrCPlHuLQr38=;
	b=T/dFT9+xKGAG19B75w2eviIDhZsVMoYwun0M4vTwgqnmvXT5X4Pj14WvNhClo6Qo
	z7qEblsXX2KR9BcAxfa1WqjGmoJAtSull5agl1KCi4mRHRel+j0Kbcb/GIU1B9bLWKs
	SeUVx3pckeeGotQJRuMITl3+eBSayeHcVvvW2Vog=
Received: by mx.zohomail.com with SMTPS id 1750336328222956.9802327737766;
	Thu, 19 Jun 2025 05:32:08 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <6DB37626-8817-4939-AE8E-6A463186A550@collabora.com>
Date: Thu, 19 Jun 2025 09:31:53 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Beata Michalska <beata.michalska@arm.com>,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 aliceryhl@google.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 a.hindborg@kernel.org,
 tmgross@umich.edu,
 alyssa@rosenzweig.io,
 lyude@redhat.com,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <567676AF-092E-4EC8-960E-70FAEDB1A2B2@collabora.com>
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux> <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
 <6DB37626-8817-4939-AE8E-6A463186A550@collabora.com>
To: Benno Lossin <lossin@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External



> On 19 Jun 2025, at 09:26, Daniel Almeida =
<daniel.almeida@collabora.com> wrote:
>=20
> Hi Benno,
>=20
>> On 19 Jun 2025, at 08:01, Benno Lossin <lossin@kernel.org> wrote:
>>=20
>> On Thu Jun 19, 2025 at 12:55 PM CEST, Danilo Krummrich wrote:
>>> On Thu, Jun 19, 2025 at 12:21:02PM +0200, Beata Michalska wrote:
>>>> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
>>>> index 445639404fb7..12b296131672 100644
>>>> --- a/rust/kernel/drm/ioctl.rs
>>>> +++ b/rust/kernel/drm/ioctl.rs
>>>> @@ -139,7 +139,7 @@ pub mod internal {
>>>>                            // asserted above matches the size of =
this type, and all bit patterns of
>>>>                            // UAPI structs must be valid.
>>>>                            let data =3D unsafe {
>>>> -                                &*(raw_data as *const =
$crate::types::Opaque<$crate::uapi::$struct>)
>>>> +                                &mut *(raw_data as *mut =
$crate::uapi::$struct)
>>>=20
>>> I think we have to document the guarantees we rely on to create this =
mutable
>>> reference.
>>=20
>> If the C side is using pointers to read/write the value concurrently,
>> this is wrong, it needs to be wrapped in Opaque.
>>=20
>> ---
>> Cheers,
>> Benno
>=20
> How can this happen, exactly? Can you provide an example that =
corroborates it?
>=20
> The general pattern for drivers is to fill an uapi type and then wait =
on an

The general pattern for userspace, sorry.

=E2=80=94 Daniel


