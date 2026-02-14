Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2812521E087;
	Sat, 14 Feb 2026 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771080029; cv=none; b=ROpnPLbuPI8rJ8kuq8JqDrG0a5Ex75hYrzmaH1JMxrhNT6yo14q+pP/V7KmF6OJMdlA/NpnCZOuqi9oWuotV3F3IQ+2+qxGRb6v3gHm0XYjkSILZyYqSUPBhB7vazwZr8OBD5wAV19GgvKnhDXsOqxWHXt7an7/sq+iqekzEM9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771080029; c=relaxed/simple;
	bh=DJx8J/E/+UMRqgUMY1gHrEUtAh95aVLkeCRlpA88iHc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=A2to5Rn3AzttMcAwIdFOCQ3ZJ+BRo5S9TRBxDfcXgSFfh635rdpMmMrcHJrXvGFeTUrQVmXpGgf1AHvpOqLYiNnd7BB7SxkSdDPEuHtVVgYK9xKf3vq7aJX0nwRly/WBDn0cMUrnqjfD7U+qoB+KWtfMorUPfxmsgo6EOrKKPAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abo2VnaB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abo2VnaB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374D1C16AAE;
	Sat, 14 Feb 2026 14:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771080028;
	bh=DJx8J/E/+UMRqgUMY1gHrEUtAh95aVLkeCRlpA88iHc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=abo2VnaBy4/ofdxStFWcuc5wfYByG2SHFZV7RbS+yEOJf53fQ4WISKF3YYUQzmTnz
	 7C3VxfWT+Vav8JyXRd03JoWuwHOlaFiRhOycGyMOsGWUHFseLxkmNV70EtR68bFvCT
	 Q0tj/93puqL+wuIUsj/qWCCwy4mNY85wP637CRFkGFmEu1LRLqhOKuaCuFQuLkcXXw
	 UTBky/cIEtK0qoKpcwBqC538pPw0jhT9xVuSAk6njiQVtmDydMe81jQ3mK/een/uFG
	 FCi4hWyV2zJj+9Gocn72+RfNc5Q+knxrnOuL5w1pERzmkA3KLQzsOngR8lhUX6JthK
	 mOM1HhfPomt6g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 15:40:21 +0100
Message-Id: <DGERGXTEJ2B2.24F7OWLIZZAK7@kernel.org>
Cc: "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Uladzislau
 Rezki" <urezki@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: alloc: allow different error types in
 `KBox::pin_slice`
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, "Andreas Hindborg"
 <a.hindborg@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260214-pin-slice-init-v1-1-0b174fbb1844@kernel.org>
 <DGEQZHTOW6FC.2SWNBWY9XE3LD@kernel.org>
In-Reply-To: <DGEQZHTOW6FC.2SWNBWY9XE3LD@kernel.org>

On Sat Feb 14, 2026 at 3:17 PM CET, Danilo Krummrich wrote:
> On Sat Feb 14, 2026 at 2:28 PM CET, Andreas Hindborg wrote:
>> @@ -333,24 +333,31 @@ pub fn pin(x: T, flags: Flags) -> Result<Pin<Box<T=
, A>>, AllocError>
>>      /// assert_eq!(s[3].d.lock().a, 20);
>>      /// # Ok::<(), Error>(())
>>      /// ```
>> -    pub fn pin_slice<Func, Item, E>(
>> +    pub fn pin_slice<Func, Item, E, E2>(
>>          mut init: Func,
>>          len: usize,
>>          flags: Flags,
>>      ) -> Result<Pin<Box<[T], A>>, E>
>>      where
>>          Func: FnMut(usize) -> Item,
>> -        Item: PinInit<T, E>,
>> -        E: From<AllocError>,
>
> I think we should keep this bound and just add:

The `Into` trait bounds are the idiomatic ones for functions consuming
things. See https://doc.rust-lang.org/std/convert/trait.Into.html:

    Prefer using Into over From when specifying trait bounds on a
    generic function to ensure that types that only implement Into can
    be used as well.

I should've said something to Andreas, since he created the commit
message (but this patch has left my L3 cache).

Cheers,
Benno

> 	E: From<E2>,
>
>> +        Item: PinInit<T, E2>,
>> +        AllocError: Into<E>,
>> +        E2: Into<E>,
>>      {
>> -        let mut buffer =3D super::Vec::<T, A>::with_capacity(len, flags=
)?;
>> +        let mut buffer =3D match super::Vec::<T, A>::with_capacity(len,=
 flags) {
>> +            Ok(buffer) =3D> buffer,
>> +            Err(err) =3D> return Err(err.into()),
>> +        };
>
> This...
>
>>          for i in 0..len {
>>              let ptr =3D buffer.spare_capacity_mut().as_mut_ptr().cast()=
;
>>              // SAFETY:
>>              // - `ptr` is a valid pointer to uninitialized memory.
>>              // - `ptr` is not used if an error is returned.
>>              // - `ptr` won't be moved until it is dropped, i.e. it is p=
inned.
>> -            unsafe { init(i).__pinned_init(ptr)? };
>> +            match unsafe { init(i).__pinned_init(ptr) } {
>> +                Ok(()) =3D> (),
>> +                Err(err) =3D> return Err(err.into()),
>> +            }
>
> ...and this match becomes unnecessary then.

