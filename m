Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C58221F3E
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 09:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205138; cv=none; b=AsPlLvpJZxfVRjxwM/lpj+jwVlxxy/45dgr0MijFrgZJW/FxntEKm86asx2R7R4LUrkgqoUcjZTYI0z329mOOGe1Tz3zcwf2GQWbvFpdukNpO99LdpC6+NzZvveeAl8So9Y/dmghliuBGzB48gCV8sIred27D+uiRFRc0qhyl7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205138; c=relaxed/simple;
	bh=qaRc13yj3jDqel4YbdxnSixDDFAd2kIwBQ1KifrWGAY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pQQVhbiwu7fZ//o8aMOXae1noqLrhsB4SPa+bOqrRD6ODa3cd51UdsGBR5QpfOTxiAqFYvK2Oq0opyKI3HnxzWrkr92tPnShm2eU1DDVqZTLHsnXNN0VgP78KLeuj5X3uoUHz7Be4LWvZl2kllio/29O9DVH5UYVZisF/5l+Fys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=H57yxUN1; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="H57yxUN1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742205134; x=1742464334;
	bh=WqFu5LycX596pqZoCWfzvLKD2r3irid32+mvW07aL0Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=H57yxUN1q0jxKtOy8ay4evmwyO85ZfGWjqoTQRD77npKxLVKFNqkuxlD+/hCPlhan
	 1J8j06m4So326u8Q/3sCQr2zIAowGXlBHcn9sPWN9htw2aJqg/EfOi1P5DlIpEZ3tn
	 YD5Wlm+Vsi2bFwogBDksLtwlPvdKqW4Qw2MrTZZM+6wuMcx4bhUZDs55sgaW2odltl
	 r80kDE09Oz3/ShMh9gueKRhDyEX1JqLPTqAVLk6dxpeckNbFU/t8SfLYbnp/XIoXAy
	 p05HVgbrQDJ3HcTMoRIyQzYkmaJmH7GDjoYNtI+n/7nlubBiMdT11ddCocXpIHzSXh
	 CHA0WCyYDcHig==
Date: Mon, 17 Mar 2025 09:52:07 +0000
To: Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Tamir Duberstein <tamird@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
Message-ID: <D8IG67RM4H53.2K2AW01FZLWJM@proton.me>
In-Reply-To: <Z9ch0fgUI-V-rlGr@pollux>
References: <Z9XIk3WpzruUfh6O@pollux> <Z9bEosVk8-0sgSbw@pollux> <CAJ-ks9nxTkZJa9Okq7ztZTrFvaKd4ovw5SLd3c9q4Kye23RfNg@mail.gmail.com> <Z9bLtgJa3PNB0bkf@pollux> <CAJ-ks9mAS1WHZcRqPzu4qhMOGXP9RNhdHUSbJK79znDvaFRHnA@mail.gmail.com> <Z9bWODCNNEq3xI51@pollux> <D8HVI9K91JWV.NHOPVELH5JE5@proton.me> <Z9cfkKTVKtc3imyK@pollux> <Z9ch0fgUI-V-rlGr@pollux>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: b597a5ddeeb5fdef09517a74e60ede7e5d2bf47c
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun Mar 16, 2025 at 8:09 PM CET, Danilo Krummrich wrote:
> On Sun, Mar 16, 2025 at 07:59:34PM +0100, Danilo Krummrich wrote:
>> But let's define it then; what about:
>>=20
>> "[`Vec::set_len`] takes (or kepps) ownership of all elements within the =
range
>> [0; `new_len`] and abandons ownership of all values outside of this rang=
e, if
>> any."
>>=20
>> The caller may take ownership of the abandoned elements."
>>=20
>> I'd argue that giving up ownership, while offering someone else to take =
it means
>> that it implies that otherwise we'll just end up forgetting about the va=
lue.
>
> Btw. I'd still prefer if we could enforce that the caller has to document=
 what
> should happen to the abandoned value. But I acknowledge that the safety c=
omment
> isn't the scope for it.
>
> It'd be great if e.g. clippy would give us a tool to do something analogo=
us to
> safety comments.
>
> It think it would be useful to enfoce some additional safety documentatio=
n. For
> instance, I think the kernel would much benefit if we could enforce that
> mem::forget() must be justified with a comment, since as mentioned ina pr=
evious
> mail, it can cause fatal bugs, for instance when used on lock guards.

I get where you're coming from, but this probably will very quickly get
out of hand.

For example, I can define `forget` safely:

    fn forget<T>(value: T) {
        struct Cycle<T> {
            this: RefCell<Option<Arc<Self>>>,
            value: T,
        }
        let cycle =3D Arc::new(Cycle { this: RefCell::new(None), value });
        *cycle.this.borrow_mut() =3D Some(cycle.clone());
    }

How would you ensure that this kind of pattern doesn't get written
accidentally (or with many indirections)?

---
Cheers,
Benno

