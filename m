Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542CE3659E3;
	Fri,  9 Jan 2026 18:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767981845; cv=none; b=axYWHKmeOgi242V+vYHdSkmtdNwObUzl+6xJcpGSeR5JeylnPGoM6OO25UQCmVp6dZjTIvfgHc64c7a2pPdQ7J+HPWJqv3gLmdNsTl8lc+5qqTPI8s2Gu8RYliH+1enLtruFE9S7KVSIDBk7HykerymrFwjKph2G+Lgn+govKzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767981845; c=relaxed/simple;
	bh=uXDLUs02Wtlz0E22SH8dPAjI8OL8B29ZNOjL6GWrzSY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=E2nVDuSlLpryf7+KjDwpm+XPBqMBUULTKPpwXWiBORlke4C6pFqQjqb1HM2/7i4jyToJghOjWtfjvBbANRI0BZC4zh7ju9+/i5xVLqzAmsjt4F+0WO1tOwCRyZ1vznS2mLHB7Ngy5w6+mIVKTmjyFJW2W0l1QEw5REoJgnLH9pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KD2HyRXA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KD2HyRXA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F24DC4CEF1;
	Fri,  9 Jan 2026 18:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767981844;
	bh=uXDLUs02Wtlz0E22SH8dPAjI8OL8B29ZNOjL6GWrzSY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=KD2HyRXA5nsqeQYov2qmxFPKt1Sl4DfNeIqdpccCHManYSzd7CYyAcrcZYETn7sS3
	 AlT19ToJBrgM59ckFN2+G/ODyAOZMPfkl8Gn7HVUYXT7ROrQHGlzvbAlASOfa92N91
	 2kYZhPrOLODfxje2ylVDSUu7TSOJm+hyAK+XrGTmzHi+uhRZeuN8hoG7jqgISZSnYU
	 biwzqB29XkGOUTfXGDdjIHzF+FSceAam3xL/DkgoyJJ37l+0no74YN7yzJ3ef02N+y
	 HyHdNm0oUsQ63KLibzSyfoPjkRdXQ17FzK+SP/CvmlfFDUtVFSOpcQ+J3ezLvxjqGi
	 9RGApbCqSpf8g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 19:04:00 +0100
Message-Id: <DFK9990IPWNR.33A9FA4GSKZU0@kernel.org>
Cc: "Janne Grunau" <j@jannau.net>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 12/12] rust: pin-init: internal: init: add escape hatch
 for referencing initialized fields
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-13-lossin@kernel.org>
 <DFK4173K583S.DFF6M0ZYY6RC@garyguo.net>
In-Reply-To: <DFK4173K583S.DFF6M0ZYY6RC@garyguo.net>

On Fri Jan 9, 2026 at 2:58 PM CET, Gary Guo wrote:
> On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
>> The initializer macro emits mutable references for already initialized
>> fields, which allows modifying or accessing them later in code blocks or
>> when initializing other fields. This behavior results in compiler errors
>> when combining with packed structs, since those do not permit creating
>> references to misaligned fields. For example:
>>
>>     #[repr(C, packed)]
>>     struct Foo {
>>         a: i8,
>>         b: i32,
>>     }
>>
>>     fn main() {
>>         let _ =3D init!(Foo { a: -42, b: 42 });
>>     }
>>
>> This will lead to an error like this:
>>
>>     error[E0793]: reference to field of packed struct is unaligned
>>       --> tests/ui/compile-fail/init/packed_struct.rs:10:13
>>        |
>>     10 |     let _ =3D init!(Foo { a: -42, b: 42 });
>>        |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>        |
>>        =3D note: this struct is 1-byte aligned, but the type of this fie=
ld may require higher alignment
>>        =3D note: creating a misaligned reference is undefined behavior (=
even if that reference is never dereferenced)
>>        =3D help: copy the field contents to a local variable, or replace=
 the reference with a raw pointer and use `read_unaligned`/`write_unaligned=
` (loads and stores via `*p` must be properly aligned even when using raw p=
ointers)
>>        =3D note: this error originates in the macro `init` (in Nightly b=
uilds, run with -Z macro-backtrace for more info)
>>
>> This was requested by Janne Grunau [1] and will most certainly be used
>> by the kernel when we eventually end up with trying to initialize packed
>> structs.
>>
>> Thus add an initializer attribute `#[disable_initialized_field_access]`
>> that does what the name suggests: do not generate references to already
>> initialized fields.
>>
>> There is space for future work: add yet another attribute which can be
>> applied on fields of initializers that ask for said field to be made
>> accessible. We can add that when the need arises.
>
> An alternative might be checking if the specific field is actually used l=
ater
> and only generate references if so. Although, that might be "too much mag=
ic"?

Sounds like a good idea, I'll consider for a future series.

Cheers,
Benno
