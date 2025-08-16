Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACF923E320
	for <rust-for-linux@vger.kernel.org>; Sat, 16 Aug 2025 10:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755339729; cv=none; b=S2W5doHirVVYhS3b+Ucw9eP5i2iW9UZTwVMnom9PfYVWj+r1Ssnq5mHhlckCU9jX3j2aYJJFRLtkaRTS+35nfSxDsYa4LEIhikdF4VCCjZ2m1Y9KZ4jWH67l0PEaTXCb5O0EHj/kDJKavty7mGMwenzQeqkQ/4jKaFt57z3fARQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755339729; c=relaxed/simple;
	bh=D1AikcVhqwhZIFaQD+fe4Ch12Z5WJ8DrWCx/LtfIHfw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KNyA1lFLd+CQQWB9zmK1GuV72cku6RIE2dcTu1u0lyTMbwYycA/4Iu7pE8IOx9vTTJnsp14Mjm9OOKf+ZFjMAR9IEClKzW2VokkduXub6uHv6wS39XAu/hvtC/H5C0CN2KKiFwUEDOWe7ss1TzmAya0FVLYnjypyMGeBUcetNIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5f7t3Qp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5f7t3Qp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D51C4CEEF;
	Sat, 16 Aug 2025 10:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755339728;
	bh=D1AikcVhqwhZIFaQD+fe4Ch12Z5WJ8DrWCx/LtfIHfw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=l5f7t3Qp2IhD/N+sdbkVyIgQ/zJVa1AxBIrRMVFWKh/5lUZ7pqmCDiaUdikB0wkhA
	 ZcKVrBU/qqqUU1NElNuA7wDXEp+J6s7ejts9osPgKqaeURekPVCqbQyJXS3qvXliZP
	 uFop6HiKxHmxlc2IAH/hhUrEwhUbT1EaWevF3qdh3Fec0RnUyXgekaTBAyDME0P7pF
	 KRG2MZ5vJl898Q7fhPT4p0Lpl5T5nm6IiPFuzoAJs55OklBRbADVNp8YsFV1/RCfxc
	 9y9rn+Gf8qYqGrciSfb9xv7pLc2WtPAl+RD64yoOJIko3NMDv0VrsIq7wyYUdVhdLI
	 lYOvNIJOs9lOQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 16 Aug 2025 12:22:04 +0200
Message-Id: <DC3S011XG6ZJ.2LLG9DCOKD0Z5@kernel.org>
Cc: "Simona Vetter" <simona.vetter@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 0/4] Untrusted Data API
From: "Benno Lossin" <lossin@kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1
References: <20250814124424.516191-1-lossin@kernel.org>
 <2025081416-sufferer-economist-3f00@gregkh>
 <DC295B7454Y8.9RVKVMPORAZ9@kernel.org>
 <2025081448-creation-timid-b972@gregkh>
 <DC2BPSUKOWAX.2QTWBJM1ZQPJ3@kernel.org>
 <2025081435-broker-valium-7b22@gregkh>
 <DC2TOYQG9QEI.2TZ4GFFZGF05W@kernel.org>
 <2025081505-facial-cyclic-af25@gregkh>
In-Reply-To: <2025081505-facial-cyclic-af25@gregkh>

On Fri Aug 15, 2025 at 4:19 PM CEST, Greg KH wrote:
> On Fri, Aug 15, 2025 at 09:28:59AM +0200, Benno Lossin wrote:
>> On Thu Aug 14, 2025 at 8:26 PM CEST, Greg KH wrote:
>> > On Thu, Aug 14, 2025 at 07:23:45PM +0200, Benno Lossin wrote:
>> >> On Thu Aug 14, 2025 at 5:42 PM CEST, Greg KH wrote:
>> >> > On Thu, Aug 14, 2025 at 05:22:57PM +0200, Benno Lossin wrote:
>> >> >> On Thu Aug 14, 2025 at 4:37 PM CEST, Greg KH wrote:
>> >> >> > On Thu, Aug 14, 2025 at 02:44:12PM +0200, Benno Lossin wrote:
>> >> >> >> I didn't have too much time to spend on this API, so this is mo=
stly a
>> >> >> >> resend of v3. There are some changes in the last commit, updati=
ng to the
>> >> >> >> latest version of Alice's iov_iter patche series [1] & rebasing=
 on top
>> >> >> >> of v6.17-rc1.
>> >> >> >>=20
>> >> >> >> I think we should just merge the first two patches this cycle i=
n order
>> >> >> >> to get the initial, bare-bones API into the kernel and have peo=
ple
>> >> >> >> experiment with it. The validation logic in the third patch sti=
ll needs
>> >> >> >> some work and I'd need to find some time to work on that (no id=
ea when I
>> >> >> >> find it though).
>> >> >> >
>> >> >> > Nice, thanks for reviving this!
>> >> >> >
>> >> >> > And we should at least add an example using it, otherwise it's n=
ot going
>> >> >> > to help out much here.  Add it to the misc device driver api?
>> >> >>=20
>> >> >> You mean `rust/kernel/miscdevice.rs`? What parts of that API are
>> >> >> untrusted?=20
>> >> >
>> >> > mmap() is, but you can't do anything about that...
>> >>=20
>> >> Which parameter is untrusted there and why can't I do anything about =
it?
>> >
>> > The whole memory range is untrusted as to what is written there, sorry=
,
>> > it was a bad attempt at a joke, the kernel never gets a chance to know
>> > what is happening.
>>=20
>> Ahh that flew over my head :) So we'd either build `Untrusted` directly
>> into the `VmaNew`/`VmaRef` abstractions -- or if there is a way to have
>> a trusted `VmaNew`, we can wrap it in `mmap`.
>
> Nah, I wouldn't worry about that, mmap() doesn't seem to cause security
> issues as by definition it is just allowing userspace to read/write
> anything to that device or memory, and the kernel doesn't even see it.
> Because of that, the kernel can't really be "broken" with invalid data
> there (hardware can, of course, but that's userspace's fault the kernel
> is just setting up a pipe here.)

I'm guessing that the kernel doesn't usually read these? (if we don't
have a way to read them from the Rust side, we don't need `Untrusted`)

>> >> If so we probably
>> >> should have a single parameter so users can verify them at the same
>> >> time. Or am I thinking of the wrong thing to verify? (`file` should b=
e
>> >> already in kernel memory, right?)
>> >
>> > Both are usually verified at different places, first `cmd` tells what
>> > `arg` is going to be, and then the code goes off and parses whatever
>> > `arg` points to (or contains for simple ioctls).
>> >
>> > And for some, `arg` is just a place to write something back, so `arg`
>> > needs no verification for them, it depends on what `cmd` is.
>>=20
>> I still think grouping them together makes sense, since in the
>> validation function you'd want access to both, right? And these use
>> cases seem perfect for enums:
>>=20
>>     enum MyIoctlArgs {
>>         WriteFoo(UserPtr<Foo>),
>>         VerifyBar(UserPtr<Bar>),
>>         // ...
>>     }
>>=20
>> And then in the validation function you can do:
>>=20
>>     const WRITE_FOO_CMD: u32 =3D ...;
>>=20
>>     fn validate(cmd: u32, arg: usize) -> Result<MyIoctlArgs> {
>>         Ok(match cmd {
>>             WRITE_FOO_CMD =3D> MyIoctlArgs::WriteFoo(UserPtr::from_addr(=
arg)),
>>             VERIFY_BAR_CMD =3D> MyIoctlArgs::VerifyBar(UserPtr::from_add=
r(arg)),
>>             _ =3D> return Err(EINVAL),
>>         })
>>     }
>>=20
>> So when wrapping them together we could have:
>>=20
>>     pub struct IoctlArgs {
>>         pub cmd: u32,
>>         pub arg: usize,
>>     }
>>=20
>> And then change the `MiscDevice::ioctl` function to:
>>=20
>>     fn ioctl(
>>         _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
>>         _file: &File,
>>         _args: Untrusted<IoctlArgs>,
>>     ) -> Result<isize>
>
> I think the problem with this is you now end up with the "I verified
> this is ok, so now I will copy it" bug, where userspace will race with
> the kernel and modify the data after verification but before copying.
>
> Note, Windows is full of these types of bugs as they don't do a call to
> copy_from_user(), but usually just poke at the data directly.  Linux at
> least forces a copy_from_user() call, but it doesn't always work in that
> you still have to validate the data is correct and people forget.
>
> So as long as we can copy the data from userspace first, and then
> validate it, and keep that validated copy around to use, that's great.
> I can't really determine above if that is the case or not, sorry.

So if I understand the current API correctly, the `arg` and `cmd`
parameters are copied from userspace (or rather they are direct
parameters of the syscall), so you can't have the copy-after-validation
bug there. Then in the `ioctl` function one currently just looks at
`cmd` & then decides what to do with `arg`, possibly doing a
`copy_from_user`.

In my suggestion for the API, we just change the first part of the
current approach, combining the two parameters to `ioctl` into a single
struct & making people parse it using the untrusted API.

The API that protects you from the copy-after-validation bug is the
`UserPtr<T>` abstraction. And there I also will add the untrusted API.
For example the `UserPtr::read_all` function would become:

    pub fn read_all<A: Allocator>(self, buf: &mut Untrusted<Vec<u8, A>>, fl=
ags: Flags) -> Result;

This means that you can only read the data into an `Untrusted<Vec<u8>>`
which ensures that the data is validated before use. This API also makes
it harder to have the copy-after-validation bug, since you have to
explicitly call `clone_reader`.

---
Cheers,
Benno
