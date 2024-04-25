Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EFA14B09F
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Apr 2024 15:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714059359; cv=none; b=IqHXUVrEMLsI3TtNBWYLjlyB1P6wOVwU/6Crdzp2yvqPYrBthSC0eBDcsfCHGG1gv5YSpdvGo4BBehFiKrBetK5gC4tidJPEdBumJySBQ0nR4He2LJ57WwyW2Qvis1HHZoNa16vyNn9OUUFnS6AgpIKyIfHUh2fnVThuSyw8/rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714059359; c=relaxed/simple;
	bh=EYFzu7TtQPYBdaMH8b1TB2whJvsDPa20PFjx6wCWMAI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S9tX82QLMPIIAoETt6eDUkxUkMrTUXL79FxyIvqE+etMoU+4bqyUk2gIP8B/Xjx/tnb8R3HBHD44zrKingM8MnELg/eh3RO8nuzLXmClNI/G13hm8HSMZNVMIqzeMCMsJKU5vziZbZve9XFOUpKP8/6OfBGN+s6jtbD0VSEsxSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=lu62jiaB; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="lu62jiaB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1714059349; x=1714318549;
	bh=N4m+Zc5UeyF/ixop+KCMHglQtS528W3Y8nCBh/YrTJA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lu62jiaB6TCRQDmtUXRlt1FDxcUOm9UYL7wRc53UytNpv77FfLUo6Nfbi/W145zmp
	 +h9OjhAbsdTgqk1vsMWmPIMvWeonBNCycFd5w2U1MCQl5atjSHqPsyJJwnXWnEznrN
	 viM1ah3F5TQOr9BC17bKBw65rdR2wZMVvIB6taU5LAaJpwAZdJnpWfMvZb0qah9wUo
	 qRa/BlyhP6aM4mMoy22IPR0XtmjOgFJnXqJgoiVcFE++sp3t7CSo1xQTrbpWSHchW0
	 5NOdBUwbz98d3V/1X+RzUzSx7zxvWCVFUIbR6v1ZjWYbKpBR7JBJooTFiiDQBe1Whv
	 uvtmgiFqn2Msw==
Date: Thu, 25 Apr 2024 15:35:44 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC v1] rust: add 'firmware' tag support to module! macro
Message-ID: <c613d60a-4136-4a4b-a2d3-9c849b245cab@proton.me>
In-Reply-To: <20240420.101421.329379978497339506.fujita.tomonori@gmail.com>
References: <20240419.225353.364631939354183191.fujita.tomonori@gmail.com> <b66e7e78-35bc-48df-9e3b-0a57996491ad@proton.me> <20240420.101421.329379978497339506.fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 7342902969d933f69618aae801f8b5e965b36d2f
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 20.04.24 03:14, FUJITA Tomonori wrote:
> Hi,
>=20
> On Fri, 19 Apr 2024 16:41:36 +0000
> Benno Lossin <benno.lossin@proton.me> wrote:
>=20
>> On 19.04.24 15:53, FUJITA Tomonori wrote:
>>> Hi,
>>>
>>> This patch is necessary for a new QT2025 PHY driver in Rust:
>>>
>>> https://lwn.net/Articles/969888/
>>>
>>> Are there places to be fixed or imporved before sending this in the v2
>>> of the PHY driver patchset?
>>
>> Please also update the documentation.
>>
>> Also what exactly is expected as the parameter to the firmware field?
>=20
> Oops, I overlooked the documentation in rust/macros/lib.rs
>=20
>=20
>> What do the strings in the array mean? If there is documentation on the
>> C side, please link to it or explain it again.
>=20
> I can't find any on the C side. They are used when building
> initrd. How about the following?

What does that mean? For the other fields, I know what they mean, but
when I see firmware I don't know if what I am thinking is correct.
A couple of questions:
- How do I know that I need to put anything in that field (and also what
   do I need to put there?)?
- Are those firmware files in the kernel tree?
- How are they "used" when building the initrd?

This might just be my lack of knowledge. But as you did not find any
docs on the C side, I think we should take this as an opportunity to
improve the state of things.

You don't need to answer all of the questions above perfectly, but
provide at least some starting point to learn more.

> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index f489f3157383..19175b3e7172 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -35,6 +35,7 @@
>  ///     author: "Rust for Linux Contributors",
>  ///     description: "My very own kernel module!",
>  ///     license: "GPL",
> +///     firmware: ["file0", "file1"],

Changing the example is good, but "file0" is not really meaningful...

It might also lead people to believe that they need the firmware field,
so I think it should be its own example.

>  ///     params: {
>  ///        my_i32: i32 {
>  ///            default: 42,
> @@ -74,6 +75,7 @@
>  ///   - `description`: byte array of the description of the kernel modul=
e.
>  ///   - `license`: byte array of the license of the kernel module (requi=
red).
>  ///   - `alias`: byte array of alias name of the kernel module.
> +///   - `firmware`: array of firmware names required by the kernel modul=
e.

I think it is fine to keep the entry in this list, since this list
describes the types that are expected for the parameters, but please
extend the docs as I detailed above.

--=20
Cheers,
Benno

>  #[proc_macro]
>  pub fn module(ts: TokenStream) -> TokenStream {
>      module::module(ts)



