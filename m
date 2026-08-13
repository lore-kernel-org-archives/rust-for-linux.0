Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D525712E1DC
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 19:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786650758; cv=none; b=Hw2uLcrXwXeOxjAdUfE8JWhYAyNM7oS3Tx4y1ACWxPzRtoBi51wUcTYgst44Ei4lGWq3ShvMcBvF+Z0QPMikPsnot7QRCv1zt5A3dkGPpce/RiJvXTkCJPC7A/wRBRDUR01B0JIxFSHsRql7XqaftteuTgSQGOskDdsgeZyE2uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786650758; c=relaxed/simple;
	bh=H4QbtudIkLUVT7/oahMm/WYUOn840SOus+1/BQ57xqk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=UlIqNEnN+JNke1TxbViWbK+LruFIxan9K9iS3MmPcVYhWqOVJ+3Ryt/steVIdKpZOF5PsaxaZkVMToTBNbSqZZ/eFn2UWDpUacnRkBCMsF30NYHFYVBW6fUtNuG6Od0fm7DRbuqwc2jXJAlu4AzPTia6gVgvrWsXu0l6U7kuHpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=younes.io; spf=pass smtp.mailfrom=younes.io; dkim=pass (2048-bit key) header.d=younes.io header.i=@younes.io header.b=r3kZyTMn; arc=none smtp.client-ip=185.205.69.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=younes.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=younes.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=younes.io header.i=@younes.io header.b="r3kZyTMn"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id DCCC117198A8D
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 21:52:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786650754;
	s=s1; d=younes.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=H4QbtudIkLUVT7/oahMm/WYUOn840SOus+1/BQ57xqk=;
	b=r3kZyTMnKRkf5B9rDGZtXhoPmnCDE811A9cY6KhNW+mut1iWUMqez6dmmNa9fy1h
	Xod6vlUIVWkNPHd2kpJsHdWZpWGNW3+z0t6aHNbjcq1LvEdzY6HjiIKSTJRb29sVFeT
	IWa0lUFRu2oipuOsWnTvqNcCltLmY12LFaP7xDVjx7EulWyh0YUNB4c80X3H3E0338N
	wNAr27tm00SrgdX9ABNm1oHQZqtyaFZYnDmDspuFGMRBFGKynr16ZjJLNphI10OYbA5
	Q1f+pWCxwsrktftYMGe9pt7dJEhwoM1cGfbitGRvhlDf6EEJHbN0wVH8uAESAGFhj8R
	vSqJjmraPg==
Date: Thu, 13 Aug 2026 21:52:34 +0200 (CEST)
From: Younes Akhouayri <git@younes.io>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Rust For Linux <rust-for-linux@vger.kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Ojeda <ojeda@kernel.org>,
	Yu Whisper Personal <yu.whisper.personal@gmail.com>
Message-ID: <OzwfgEC--F-9@younes.io>
In-Reply-To: <DKNU5IBDCA44.28C93KM4IQS44@nvidia.com>
References: <OzuVxu0--J-9@younes.io> <DKNU5IBDCA44.28C93KM4IQS44@nvidia.com>
Subject: Re: From<bool> and Bounded's invariant for signed N = 1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: 017a4576e383ca5e4eccfa1f2259bb19c2dec03584c01d38b9d90ddf5151b20911e3d9ef144c55bbe3dc4f7ace3695f8c3:TurnOnPrivacy!:tutamail

Thank you both for the feedback. Yes, I can send a patch.

Just to confirm the intended scope: excluding signed integers entirely would also remove valid conversions such as Bounded::<i8, 2>::from(true), since signed Bounded values with N >= 2 can represent both 0 and 1.

Would you prefer the simpler unsigned-only restriction, or should the patch preserve signed conversions for N >= 2?


--

Best regards,
Younes



Aug 13, 2026, 15:04 by acourbot@nvidia.com:

> On Thu Aug 13, 2026 at 6:46 PM JST, Younes Akhouayri wrote:
>
>> Hi,
>>
>> There seems to be an invariant violation in the generic From<bool>
>> implementation for Bounded.
>>
>> As I understand it, Bounded<i8, 1> can represent only -1 and 0, while
>> i8::from(true) produces 1. However, this safe code is accepted:
>>
>> let value: Bounded<i8, 1> = true.into();
>> let _raw: i8 = *value;
>>
>> Bounded::<i8, 1>::try_new(1) rejects the same value, but From<bool>
>> passes it directly to the unsafe __new() constructor. The resulting
>> Bounded value violates the invariant relied upon by Deref, whose
>> failure branch calls unreachable_unchecked().
>>
>> Am I missing an intended constraint on this conversion? If not, it
>> seems the signed N = 1 case needs to be excluded or handled
>> differently.
>>
>> Any thoughts?
>>
>
> I think you are correct. There is a `Signedness` associated type on the
> `Integer` trait, so it should be trivial to exclude signed integers - do
> you want to send a patch for that?
>
