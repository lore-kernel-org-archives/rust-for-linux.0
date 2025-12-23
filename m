Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D648120E005;
	Tue, 23 Dec 2025 01:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766453560; cv=none; b=fLTem0xchs0e8x7oiTJizd4rXFI7b+2v6t9aE9x7XQkfR4cwdUirqtLF48OAUc1tw0CREXUqW6GZmIgT3CmTdsaclMNmhut7zdKi9dcpP75S+WMVLjXM6EgyeAKBzcCvlsHhBbqDZoNSJs/+D1AjFFEDnhtXymbv1CdRsCGJHWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766453560; c=relaxed/simple;
	bh=MVPgh7F4FJ7HWk7lVpx777u+NAWCHDQnuFOCWHhMk+A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EPBuTcZDX6xUGWb6c8K0ooikCuSyMc5Fi28UNb3lKIfHqcQ+/0E5o9XmTgg2aCIjTapyXrA+s+kPtMUnGpslx4nqiH2vCooIfWeivsvmEusp0DGKpw/kzKNgQGVdrfYuIQJC7yKFNEfmU2T4Sy9ekC5EYIhRt+XCyPNBWFItGtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XO4iJi4I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XO4iJi4I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB69C4CEF1;
	Tue, 23 Dec 2025 01:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766453560;
	bh=MVPgh7F4FJ7HWk7lVpx777u+NAWCHDQnuFOCWHhMk+A=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=XO4iJi4Ie9kt0KM3Cu8iaIp/lyef+HieQv8yzMnuec/QeKskjGjMvtsFwLYvw36Hi
	 rnaqm8LVZzv5qtFTDpZd03DcoRXt9uZv5dQJTSJjSMmX0sU/TMO0OVWc+/OY/wAEYv
	 uN9BgT04/IuJzSYeeSf/Xgi1+V6lgfEzlkoU/lMeKn1doNpmnoSII+jmHbPyamDOVs
	 0bgMIVTI+JfHc9NVvmRZgcr3y9ycIEcu2VhjfjXNHD790PF3T9HWl90oJmgI4JkTKf
	 7Lam2Tv1eoxDfPgSiSLG9FCW610swBnCz/oejKGwrJ45QYA+mplC6MyGRz7zb1I39+
	 wmBUQ4TJ4+ekQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 02:32:36 +0100
Message-Id: <DF57IWUPXAHM.27OHGD93IW5W@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: pin_init_internal: fix rust-analyzer `mod quote`
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>
X-Mailer: aerc 0.21.0
References: <20250319-pin-init-internal-quote-v1-1-19de6a33a257@gmail.com>
 <D8L34IUZGXWX.D2LSS2S2NAN7@proton.me>
 <CAJ-ks9nTmno12ZC4DnLxV_b0NLUK5Kn5K+cRi4BEvKtveQzJjg@mail.gmail.com>
 <D8L5JXRXHX0N.UIFZ5M15FB3S@proton.me>
 <CAJ-ks9mwNiJbr4MN5jfr7KCJc8j=B5=MUfX9XfhPg6yeRiFK=g@mail.gmail.com>
 <CAJ-ks9n6wtA45+sJ2ZiL4KJ4MK0eaWomoDTN6d04oseJ-gmavw@mail.gmail.com>
In-Reply-To: <CAJ-ks9n6wtA45+sJ2ZiL4KJ4MK0eaWomoDTN6d04oseJ-gmavw@mail.gmail.com>

On Mon Dec 22, 2025 at 1:43 PM CET, Tamir Duberstein wrote:
> On Thu, Mar 20, 2025 at 3:15=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
>>
>> On Thu, Mar 20, 2025 at 10:10=E2=80=AFAM Benno Lossin <benno.lossin@prot=
on.me> wrote:
>> >
>> > On Thu Mar 20, 2025 at 2:31 PM CET, Tamir Duberstein wrote:
>> > > On Thu, Mar 20, 2025 at 8:16=E2=80=AFAM Benno Lossin <benno.lossin@p=
roton.me> wrote:
>> > >> I'd rather not have this change, since this will introduce a dangli=
ng
>> > >> symlink upstream [1].
>> > >>
>> > >> [1]: https://github.com/rust-for-Linux/pin-init
>> > >
>> > > I agree it's aesthetically displeasing. I'm not aware of any
>> > > alternative that fixes the development workflow of this crate in the
>> > > kernel.
>> >
>> > I don't think it's too bad, and this code is going away soon-ish
>> > anyways.
>>
>> What would Andreas say? :)
>>
>> I don't think the going away soon argument is relevant in this case -
>> the same applies to the dangling symlink.
>
> 9 months later, this code is still here. What would make it go away?

The pin-init `syn` changes will land this cycle, which removes this
code.

Cheers,
Benno
