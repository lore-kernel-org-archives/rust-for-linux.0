Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC5413B295
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Apr 2024 07:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714115512; cv=none; b=dnR0yEkCunKkU0tD1VdXCpKkeSYYmQJMYWBx7qmyfGoS3maYTMwxTgGOHH4zBFZJIteZG9NxXUxi9fajPPjQjfDvSgIiz6oWkilrjsz/eIkXm8hscf8nep0mNihQrXALLdy7le6ApbrucbC+/izE/JNcNb2Z9T3dp+L2zuuz8RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714115512; c=relaxed/simple;
	bh=+sz86jtRbMg7SwwzU1wqCqv6zZBXkkWbS53qL1EyX4E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u9UL8hOA9iJx/jPEBxIEtPiudNsHEW0K0X1/HA5oECIAnC53aSrFttzrRR5ZQVvipPcbRV2Bxrn5IVd6S6aO93FVJFB0gRCpBzNQqao1VFCZX+KVkHiBKYlxTQOXchCrvGFj6qp2zIEMXcO5rkIAwBiEB8T9JN+stPL8dE9oQwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=imqDkbLF; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="imqDkbLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1714115508; x=1714374708;
	bh=dpyvbr3LcdkLNBpkmO1oSD6NoCCElh58CU+Cna0btSg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=imqDkbLFlozbOOJXJ3ZrKEUuGyddtWQCK1Gj8aul19RFTl5B3SrXu9q/qTUcKI+tx
	 jb2/YTntLlle91PtvWhFSZCg3hgbPnX6JEnOQlCYKB/WmCqRKUxdisx79brp2hdVg9
	 9k0PXjFEKY7LHyUp1PjhXP1ODedi4MGwKvNphLTBCkLwUCGPXonb23vqXgygYJgkBe
	 MfbORgVwD91pykHqwqWnbT5XWc3Ex3VdIO/K0hcFUX5gUlraVhv5pUb39RNuUzA6wC
	 dKGNAfCQnOKTRG0vv8DA4cjHvdxxpPJGvBUfcJaCSNSvZxWiyjI6I5shLa3f71uVDc
	 yvZaxRChDm0ag==
Date: Fri, 26 Apr 2024 07:11:46 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC v1] rust: add 'firmware' tag support to module! macro
Message-ID: <1c214b8c-cfc5-479a-a5be-4dc1e75931a0@proton.me>
In-Reply-To: <20240426.101055.990464946230867124.fujita.tomonori@gmail.com>
References: <b66e7e78-35bc-48df-9e3b-0a57996491ad@proton.me> <20240420.101421.329379978497339506.fujita.tomonori@gmail.com> <c613d60a-4136-4a4b-a2d3-9c849b245cab@proton.me> <20240426.101055.990464946230867124.fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: ec15d2f5e51628f325bf018ad604aee65bccd46f
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 26.04.24 03:10, FUJITA Tomonori wrote:
> Hi,
>=20
> On Thu, 25 Apr 2024 15:35:44 +0000
> Benno Lossin <benno.lossin@proton.me> wrote:
>=20
>>>> What do the strings in the array mean? If there is documentation on th=
e
>>>> C side, please link to it or explain it again.
>>>
>>> I can't find any on the C side. They are used when building
>>> initrd. How about the following?
>>
>> What does that mean? For the other fields, I know what they mean, but
>> when I see firmware I don't know if what I am thinking is correct.
>> A couple of questions:
>> - How do I know that I need to put anything in that field (and also what
>>     do I need to put there?)?
>=20
> If you implement a device driver which requires firmware and the
> driver is likely added to an initramfs image, you need to put the
> names of firmware in that field.
>=20
>> - Are those firmware files in the kernel tree?
>=20
> I don't think so.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.g=
it/
>=20
>> - How are they "used" when building the initrd?
>=20
> initramfs is used before the real root file system is mounted. So
> device drivers in initramfs can't use firmware on the real root file
> system. An initramfs image needs include drivers with necessary
> firmware. If you put the names of firmware in 'firmware' field, the
> names are embedded in modinfo section in the module file. A tool to
> build an initramfs image can use that information.

Thanks for the answer, can you also put this into the documentation, so
that it is not lost. Please also use markdown back-tics (`) for stuff
that should be rendered in a monospace font (eg the `firmware` field).

>> This might just be my lack of knowledge. But as you did not find any
>> docs on the C side, I think we should take this as an opportunity to
>> improve the state of things.
>>
>> You don't need to answer all of the questions above perfectly, but
>> provide at least some starting point to learn more.
>>
>>> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
>>> index f489f3157383..19175b3e7172 100644
>>> --- a/rust/macros/lib.rs
>>> +++ b/rust/macros/lib.rs
>>> @@ -35,6 +35,7 @@
>>>   ///     author: "Rust for Linux Contributors",
>>>   ///     description: "My very own kernel module!",
>>>   ///     license: "GPL",
>>> +///     firmware: ["file0", "file1"],
>>
>> Changing the example is good, but "file0" is not really meaningful...
>=20
> ["device-driver-fw0", "device-driver-fw1"] are better?

They look better to me.

> Can you tell me your proposal?

This is really not my area of expertise. I have no idea what you would
use here and hoped you knew :)

>> It might also lead people to believe that they need the firmware field,
>> so I think it should be its own example.
>=20
> You want to add the complete example for 'firmware' field like the
> following?
>=20
> /// ```ignore
> /// use kernel::prelude::*;
> ///
> /// module!{
> ///     type: MyDeviceDriverModule,
> ///     name: "my_device_driver_module",
> ///     author: "Rust for Linux Contributors",
> ///     description: "A device driver requres firmware",
> ///     license: "GPL",
> ///     firmware: ["device-driver-fw0", "device-driver-fw1"],
> /// }
> ///
> /// struct MyDeviceDriverModule;
> ///
> /// impl kernel::Module for MyDeviceDriverModule {
> ///     fn init() -> Result<Self> {
> ///         Ok(Self)
> ///     }
> /// }
> /// ```

That looks good, but please add another sentence above like "when
needing to specify firmware, do this...".

>>>   ///     params: {
>>>   ///        my_i32: i32 {
>>>   ///            default: 42,
>>> @@ -74,6 +75,7 @@
>>>   ///   - `description`: byte array of the description of the kernel mo=
dule.
>>>   ///   - `license`: byte array of the license of the kernel module (re=
quired).
>>>   ///   - `alias`: byte array of alias name of the kernel module.
>>> +///   - `firmware`: array of firmware names required by the kernel mod=
ule.
>>
>> I think it is fine to keep the entry in this list, since this list
>> describes the types that are expected for the parameters, but please
>> extend the docs as I detailed above.
>=20
> Where you want the `firmware` explanation? Extending like the
> following works for you?
>=20
> - `firmware`: array of firmware names required by the kernel
>    module. This field is optional, used as a hint to build an initramfs
>    image with firmware included.

I think the list above should only be a short list explaining the types
that are accepted for the various fields.

> If you want the explanation of the 'firmware' field elsewhere, please
> tell me where.

You can put it below the list, maybe in its own section `## Firmware`
for example.

--=20
Cheers,
Benno

