Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05BD1799F
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 11:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750330881; cv=none; b=PaqlC0aloxcxLEnmPe2UQnhwr0S0SSbwQo5CZKwklVdz++RcrlZnWNpT0gWvLKctKoaLiotcj8rXEIdkxyEpiLi20zwhMdQ5qatVbNdbmIdCI+CFzGtg7jSEZB0jcABUXlwJF3lhhh3HP7P3FejR2fNOjQDDStnu3ZOAEEwMjUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750330881; c=relaxed/simple;
	bh=QrTbq1gC7rkfhVdqmMkNAd0Xgm8URhDFN46HIJPT/dY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fjH9YHkjy+0KGdejyCEoDZRPXKFkec6Idb3+zXXdiuac0ZWOBHLacPetz/rf6Hjw4Oo4nh2t8pbHjCqlYK6aMNV9TtcVLs7wdY+sJc18ymMqvGIw7Z1a2F7X4ywxUVbBahUUmNaMzCoU0iWeoAsVm22HkF10vC5f5uIjyp7kXbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCHt64R3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCHt64R3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563FDC4CEEA;
	Thu, 19 Jun 2025 11:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750330881;
	bh=QrTbq1gC7rkfhVdqmMkNAd0Xgm8URhDFN46HIJPT/dY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=RCHt64R3U0CO/MnZbnnpOQgDE0TAGVSCXx1Y4/h/7hMUp9g5451byBD2ePeT4XtIq
	 5nC8+6JgIZ01Mu0k45EYGi2o/1huaHwf2+Zr9XL7HBIfj4ikPs5PXC5t6oU9Yo36PU
	 ntg1TivIH/sZ/hwxD5nlWI3x6FlCTgdN2d34ym9S1GUNMvTchItAZe243XNuE8VPqq
	 Sgu4tyz0evtT2zJRTT8i5fTVoJQnoMftvZp1q9FIgD9HQ07OfD+UkmKm8K6jNdEAg8
	 YUuC43Epk49kuHOOFGuG2mKn9hrZNyqcp5YI7UXpQoN5M5qCd/iTWeqZQvUE7A5Jxz
	 03dosavRXfQ1A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 13:01:16 +0200
Message-Id: <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <aliceryhl@google.com>,
 <daniel.almeida@collabora.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <alyssa@rosenzweig.io>, <lyude@redhat.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, "Beata Michalska"
 <beata.michalska@arm.com>
X-Mailer: aerc 0.20.1
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux>
In-Reply-To: <aFPsjIFIC1J2qtdc@pollux>

On Thu Jun 19, 2025 at 12:55 PM CEST, Danilo Krummrich wrote:
> On Thu, Jun 19, 2025 at 12:21:02PM +0200, Beata Michalska wrote:
>> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
>> index 445639404fb7..12b296131672 100644
>> --- a/rust/kernel/drm/ioctl.rs
>> +++ b/rust/kernel/drm/ioctl.rs
>> @@ -139,7 +139,7 @@ pub mod internal {
>>                              // asserted above matches the size of this =
type, and all bit patterns of
>>                              // UAPI structs must be valid.
>>                              let data =3D unsafe {
>> -                                &*(raw_data as *const $crate::types::Op=
aque<$crate::uapi::$struct>)
>> +                                &mut *(raw_data as *mut $crate::uapi::$=
struct)
>
> I think we have to document the guarantees we rely on to create this muta=
ble
> reference.

If the C side is using pointers to read/write the value concurrently,
this is wrong, it needs to be wrapped in Opaque.

---
Cheers,
Benno
