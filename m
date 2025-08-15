Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C011DF24F
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Aug 2025 07:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755242944; cv=none; b=Z93o56imidKNodv9lIazM0QsgBJ8juQ+/LPooNis59hEXWMmzm0AZIxHiAMGdNW4BAfIZgnStSVXs+Hczoqt5XJ2togG6ovLmrGpUsfIsS0MYD0w9dFK5jUuV/imImV7hThxYZ1O8EVZ6PbFYaC5sne71AhomouoPnOKlfUkFLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755242944; c=relaxed/simple;
	bh=Sd3VPQiKfga6AjzXlYQ5uWGAwwjLJYkJTxxir73nSSw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=XUnaVusivjAJq38VwIH7ny9UvWbiERM8ocdCVkPgAQxAybpyioiKuyIbyc8++hFStmY0ZxyVCLex5BTTD3T/YMUlqg/owgBvOGZ5uDFos5NtGHaj2T5j0/4w6dDvmqj1Ysq6rzVIDZBdYrv4x1ZrXQIYDtHIQ5G298jslDC2BQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJYL7Zr5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJYL7Zr5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA31C4CEEB;
	Fri, 15 Aug 2025 07:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755242943;
	bh=Sd3VPQiKfga6AjzXlYQ5uWGAwwjLJYkJTxxir73nSSw=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=IJYL7Zr5HL0UyGHeKHHDhZM0TJFW8ma3VmqZ171AQIJaUkt5nuDJEWFCJU03idgUL
	 GUtwgiy3Fo6FJuQdmLbLGx/Fz9sbbds8tR1Rs0/qhd3yhQMO2qpZLj/uZVXsCoa3MW
	 vxk7Mak8SF2DtekONHt+SdOV9RSXkh6G2TH8mC+HAn4FMaTxLyNYs+1PRu8iGjTuAC
	 jyeDdrELC62U6ZA+Zj0n6r2obLRFinLznI5qLEHILs7rp4rGeYdqIY/nztpYCq4ZQc
	 +baTs9jFDahqBJqvJXkxwi6FE6gilVnWePoQZu7MXwR21XcT8MqvGvPYktd/OuYNv8
	 DEKFdl5vPXKdQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Aug 2025 09:28:59 +0200
Message-Id: <DC2TOYQG9QEI.2TZ4GFFZGF05W@kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Simona Vetter" <simona.vetter@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 0/4] Untrusted Data API
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250814124424.516191-1-lossin@kernel.org>
 <2025081416-sufferer-economist-3f00@gregkh>
 <DC295B7454Y8.9RVKVMPORAZ9@kernel.org>
 <2025081448-creation-timid-b972@gregkh>
 <DC2BPSUKOWAX.2QTWBJM1ZQPJ3@kernel.org>
 <2025081435-broker-valium-7b22@gregkh>
In-Reply-To: <2025081435-broker-valium-7b22@gregkh>

On Thu Aug 14, 2025 at 8:26 PM CEST, Greg KH wrote:
> On Thu, Aug 14, 2025 at 07:23:45PM +0200, Benno Lossin wrote:
>> On Thu Aug 14, 2025 at 5:42 PM CEST, Greg KH wrote:
>> > On Thu, Aug 14, 2025 at 05:22:57PM +0200, Benno Lossin wrote:
>> >> On Thu Aug 14, 2025 at 4:37 PM CEST, Greg KH wrote:
>> >> > On Thu, Aug 14, 2025 at 02:44:12PM +0200, Benno Lossin wrote:
>> >> >> I didn't have too much time to spend on this API, so this is mostl=
y a
>> >> >> resend of v3. There are some changes in the last commit, updating =
to the
>> >> >> latest version of Alice's iov_iter patche series [1] & rebasing on=
 top
>> >> >> of v6.17-rc1.
>> >> >>=20
>> >> >> I think we should just merge the first two patches this cycle in o=
rder
>> >> >> to get the initial, bare-bones API into the kernel and have people
>> >> >> experiment with it. The validation logic in the third patch still =
needs
>> >> >> some work and I'd need to find some time to work on that (no idea =
when I
>> >> >> find it though).
>> >> >
>> >> > Nice, thanks for reviving this!
>> >> >
>> >> > And we should at least add an example using it, otherwise it's not =
going
>> >> > to help out much here.  Add it to the misc device driver api?
>> >>=20
>> >> You mean `rust/kernel/miscdevice.rs`? What parts of that API are
>> >> untrusted?=20
>> >
>> > mmap() is, but you can't do anything about that...
>>=20
>> Which parameter is untrusted there and why can't I do anything about it?
>
> The whole memory range is untrusted as to what is written there, sorry,
> it was a bad attempt at a joke, the kernel never gets a chance to know
> what is happening.

Ahh that flew over my head :) So we'd either build `Untrusted` directly
into the `VmaNew`/`VmaRef` abstractions -- or if there is a way to have
a trusted `VmaNew`, we can wrap it in `mmap`.

>> > ioctl() is the callback that is taking untrusted data from userspace.
>> > That's one place we have had more kernel buffer overflows then I can
>> > count and ALWAYS needs to be properly verified before anything can be
>> > done with the data there.
>>=20
>> Are the `cmd` & `arg` parameters the untrusted part?
>
> Yes, especially as `arg` is usually a pointer to "something".
>
>> If so we probably
>> should have a single parameter so users can verify them at the same
>> time. Or am I thinking of the wrong thing to verify? (`file` should be
>> already in kernel memory, right?)
>
> Both are usually verified at different places, first `cmd` tells what
> `arg` is going to be, and then the code goes off and parses whatever
> `arg` points to (or contains for simple ioctls).
>
> And for some, `arg` is just a place to write something back, so `arg`
> needs no verification for them, it depends on what `cmd` is.

I still think grouping them together makes sense, since in the
validation function you'd want access to both, right? And these use
cases seem perfect for enums:

    enum MyIoctlArgs {
        WriteFoo(UserPtr<Foo>),
        VerifyBar(UserPtr<Bar>),
        // ...
    }

And then in the validation function you can do:

    const WRITE_FOO_CMD: u32 =3D ...;

    fn validate(cmd: u32, arg: usize) -> Result<MyIoctlArgs> {
        Ok(match cmd {
            WRITE_FOO_CMD =3D> MyIoctlArgs::WriteFoo(UserPtr::from_addr(arg=
)),
            VERIFY_BAR_CMD =3D> MyIoctlArgs::VerifyBar(UserPtr::from_addr(a=
rg)),
            _ =3D> return Err(EINVAL),
        })
    }

So when wrapping them together we could have:

    pub struct IoctlArgs {
        pub cmd: u32,
        pub arg: usize,
    }

And then change the `MiscDevice::ioctl` function to:

    fn ioctl(
        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
        _file: &File,
        _args: Untrusted<IoctlArgs>,
    ) -> Result<isize>

---
Cheers,
Benno
