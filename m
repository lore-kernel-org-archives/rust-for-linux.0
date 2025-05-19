Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E59F2820D7
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 14:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665194; cv=none; b=EJbNKxv3hcE73yivPYXA3JHG1tCIzY2qHZrcIOAILoLLqhAxLBnh7jt6hjm7cO5FfrLQnrzLtVP8F1MqpQhSoZL9Aqp+rHgI8+mITjCfc3rUeAyaomSXqD/EkXIobFDfjdsvabbwWZiyY0tk71QAKMP4hF+3/MQosQCNwEYG9xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665194; c=relaxed/simple;
	bh=AKYw8YDSUZsaHjqytXztHX49OHRCkBpFUHZbpFiL9DM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=W1DR9apWqUWRpJRYHOLJaFcw3SADXQ2fh75vJAcc8zYYPODGixpmRNng2C7xBsCXHgIbpLyUP1oGQ7FBg6/TlSe0bmIQBBseZ0eoYqrSYhT1GWzyfXu9u8D4zW9HabDdk6shUjySsOAHhd3UcXQ/9sxHPBc9wt7qmGxQFkZGIeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYpnW0L7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYpnW0L7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B406BC4CEE4;
	Mon, 19 May 2025 14:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747665194;
	bh=AKYw8YDSUZsaHjqytXztHX49OHRCkBpFUHZbpFiL9DM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=SYpnW0L7yU3FtfDyNt/ekvsAlOyAM3zbqXaenG+5vUMZ7hp/8AlJ54G8ciamLa6a/
	 m6XGay+jeDWA2DV2q9FnE0H5QRPL9ig5sdVA6bX9OmCsN6fN3LEPrc3eyR1bJS8H0x
	 yc42SR9PjhSwxeud0yINEZ9G9HpKiHNBQER45iJOlUDHJEkwfiz+UWQA4kBSepwBmM
	 rf8s1BhAEDCelv3VwH8U7IStOD1pjpLEKil3v33C7KozpSd0I0WNWaUFrYgLhJ6xmp
	 +zQhWL6UT3MVynPgNeG7QbjA6NGjcZJ4EYIu2+D/OYd43xrjUIVPYU/9tfMkH6etfy
	 xsvVZXzPmHfCA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 16:33:10 +0200
Message-Id: <DA07LSLNRJTA.3M5DBYHRUV8K7@kernel.org>
Subject: Re: [PATCH v4] rust: macros: Fix macro referencing core and kernel
 crates
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Igor Korotin"
 <igor.korotin@yahoo.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250516122349.1944895-1-igor.korotin.ref@yahoo.com>
 <20250516122349.1944895-1-igor.korotin@yahoo.com>
 <CANiq72=ErVyyszgnH0W56Bjvakvdcprh-Z0pXt+Pc25q4z_Afg@mail.gmail.com>
In-Reply-To: <CANiq72=ErVyyszgnH0W56Bjvakvdcprh-Z0pXt+Pc25q4z_Afg@mail.gmail.com>

On Mon May 19, 2025 at 4:20 PM CEST, Miguel Ojeda wrote:
> On Fri, May 16, 2025 at 2:35=E2=80=AFPM Igor Korotin <igor.korotin@yahoo.=
com> wrote:
>>
>> diff --git a/rust/kernel/static_assert.rs b/rust/kernel/static_assert.rs
>> index d8120f838260..5e5a0bee9888 100644
>> --- a/rust/kernel/static_assert.rs
>> +++ b/rust/kernel/static_assert.rs
>> @@ -20,7 +20,7 @@
>>  ///
>>  /// ```
>>  /// static_assert!(42 > 24);
>> -/// static_assert!(core::mem::size_of::<u8>() =3D=3D 1);
>> +/// static_assert!(::core::mem::size_of::<u8>() =3D=3D 1);
>
> Hmm... Why are we changing this one?

Yeah this one doesn't seem necessary.

---
Cheers,
Benno
