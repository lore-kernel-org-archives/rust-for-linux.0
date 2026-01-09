Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A1335CB7C;
	Fri,  9 Jan 2026 17:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767979482; cv=none; b=XA36V7rRuHuMGarcvlwsHmZxEmkuIwxBLDhAKNlwSE5BdUNCkOiAS++NhchyusAwaFvlsI9lRdTgEFzfpDjEAlzPYWkTP9WgVj8ZaTH0/SPJdID5Uag0/VNttiSwV9AKCFaQJ5PRnOhRB/VYNkmB0l3FeXimX6IdC1Q8SKVPKpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767979482; c=relaxed/simple;
	bh=tGoh5mQzpK9X/rAY7wUEdFSrSkBRWdfRLJyk8pYdTxA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KOt6doTPEYlNHzOTugcHaT3Z8XthU3Gx3bBlCPxJzNUdFHDs43RII8loEfGudhD0xi5skRHfnwdaLIEia5B0D892sGx9M44BbEXaS3dbvy9c3LpTTZaxcnKgxu9qsfjdx9FsPlpfKS+BQACJldlGXQe04nz0vuGEu2DkGehdANs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWQhmZ6K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWQhmZ6K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD84CC4CEF1;
	Fri,  9 Jan 2026 17:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767979482;
	bh=tGoh5mQzpK9X/rAY7wUEdFSrSkBRWdfRLJyk8pYdTxA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=CWQhmZ6K9kOTXnLuQaJ9eIbVk8kWEE8jbDjqK2kWB3jVXOd6QYTneSkgDpCTTyzWv
	 fiTvrSiw6CWp/PggUu1MuBoMI8s/R7VbQ40VZHBt8PxfiT3j7ZPTGxMjbIVh1K8sOa
	 4Tb2v1ucH+/cW8HUd3qA6Z+54C6PWYWoUXQFk+dtEppCUZ8KNeAsjq3JR49Sl/H+7h
	 ND+rWRfS7bUwMHn+hOOtFrqDcTL8dc0RAoJlR11h321UQZb0LNTHIJidOWocx6nCB8
	 kjrxw1pNeNPBAmJcuv0zXAGkzVdpMJTVRGPUtLgNOswGFkJFTlblX/WWYBYpcACDEQ
	 xAh6b+006BoQw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 18:24:37 +0100
Message-Id: <DFK8F3L2BMS2.3G1BAQSU145IH@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 08/12] rust: pin-init: rewrite the initializer macros
 using `syn`
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Alban Kurti"
 <kurti@invicto.ai>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-9-lossin@kernel.org>
 <DFK3R2EK1JGL.FFW73JGUSGP5@garyguo.net>
In-Reply-To: <DFK3R2EK1JGL.FFW73JGUSGP5@garyguo.net>

On Fri Jan 9, 2026 at 2:45 PM CET, Gary Guo wrote:
> On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
>> +    let init_kind =3D get_init_kind(rest, &mut errors);
>> +    let zeroable_check =3D match init_kind {
>> +        InitKind::Normal =3D> quote!(),
>> +        InitKind::Zeroing =3D> quote! {
>> +            // The user specified `..Zeroable::zeroed()` at the end of =
the list of fields.
>> +            // Therefore we check if the struct implements `Zeroable` a=
nd then zero the memory.
>> +            // This allows us to also remove the check that all fields =
are present (since we
>> +            // already set the memory to zero and that is a valid bit p=
attern).
>> +            fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
>> +            where T: ::pin_init::Zeroable
>> +            {}
>> +            // Ensure that the struct is indeed `Zeroable`.
>> +            assert_zeroable(#slot);
>> +            // SAFETY: The type implements `Zeroable` by the check abov=
e.
>> +            unsafe { ::core::ptr::write_bytes(#slot, 0, 1) };
>
> Can this be `#slot.write(::pin_init::zeroed())`?

That could overflow the stack?

>> +        },
>> +    };

>> +        InitKind::Zeroing =3D> quote! {
>> +            // We use unreachable code to ensure that all fields have b=
een mentioned at most once.
>> +            // Since the user specified `..Zeroable::zeroed()` at the e=
nd, all missing fields will
>> +            // be zeroed. This struct initializer will still be type-ch=
ecked and complain with a
>> +            // very natural error message if a field is mentioned more =
than once, or doesn't exist.
>> +            #[allow(unreachable_code, clippy::diverging_sub_expression,=
 unused_assignments)]
>> +            // SAFETY: this code is never executed.
>> +            let _ =3D || unsafe {
>> +                let mut zeroed =3D ::core::mem::zeroed();
>> +                ::core::ptr::write(slot, zeroed);
>
> Looks like the comment explaining why this is done gets missed.

Good catch!

>> +                zeroed =3D ::core::mem::zeroed();
>> +                ::core::ptr::write(slot, #path {
>> +                    #(
>> +                        #fields: ::core::panic!(),
>> +                    )*
>> +                    ..zeroed
>
> Would just ::core::mem::zeroed() here work or does it have same inference=
 issue?
> IIUC the type inference should work here as ..Default::default() works.

I haven't checked this, will do so.

Cheers,
Benno
