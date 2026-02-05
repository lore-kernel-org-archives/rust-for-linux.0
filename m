Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5BB331A41;
	Thu,  5 Feb 2026 22:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770329478; cv=none; b=gs4Pf4H2ZlZfbnG8xKF8OilcFGpJn0uKhETMm6nm57cAr1Tw054Ndv9YM8rTxVwekIwgsk4w5Ya2hpWTWgM8LNaoLrn8BJK036CN6iRvksrZ1mo/af6xl+E5egYSkuNw5IHDyL4ypfdCVrP2LIAk9j+HitR0Q8Q+QjxKMerrAtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770329478; c=relaxed/simple;
	bh=O5BY+2fDILkckJlYVL7ebFJsmdn+yduZ1kv/oO3M2gg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=lbyh2Ave/Zenaam1eCAdhHyy1/smYSbZ1OMmlM4hAXo9/FdHtVwlsD9AlrOLxR5MzqPViinwWiU6sjdTacQ/p+EMkIW97R/ICjRyWdh6bNnK78f7YCfuZ3BgddY4DjhluqauYPO4Jo1t3vMZ8S1qK6iw6FwrmHPargKOcprP4CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCAmsHXW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCAmsHXW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2902C4CEF7;
	Thu,  5 Feb 2026 22:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770329477;
	bh=O5BY+2fDILkckJlYVL7ebFJsmdn+yduZ1kv/oO3M2gg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=MCAmsHXWoe5lR7RQu5P7UuEF5LB4RL62vE8gYbxpJPQjDzDoQvBtdR32cgmoJsfnJ
	 gLKSLOfOD05Nl6Mr8bzfzLluch5Hu5AT5mdWx20t+VNJcmS7y7tgUB3xXDnouLSJV0
	 OnmoHVqGCsihSWk7yoCrNbFclQJOKBKKqjpgj24IE2NS6ZyA4XIc9WwR4L6OJ+sMI4
	 ZXOurYAlggozL3rJV4lk5ab/uIp9J+6l669Rs1ZlKX+yCBpXWWFPeZJsqyny93UZZM
	 h+95OKv/zdiaJlVm7yarudSITILz/eFpeJ8Vg2sXOVSl/m6ueuipHrD/Tx8AFH34fc
	 Zs5X8QQHe6UEg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 23:11:10 +0100
Message-Id: <DG7DF76OVGTS.WMT6W8XPG4LK@kernel.org>
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write
 functions
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Gary Guo"
 <gary@garyguo.net>, <rust-for-linux@vger.kernel.org>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Ard
 Biesheuvel" <ardb@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, "Eric Biggers" <ebiggers@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Lyude Paul"
 <lyude@redhat.com>, "Asahi Lina" <lina+kernel@asahilina.net>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <officialTechflashYT@gmail.com>, "Ash Logan" <ash@heyquark.com>, "Roberto
 Van Eeden" <rw-r-r-0644@protonmail.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: "Link Mauve" <linkmauve@linkmauve.fr>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
 <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
 <DG74LUHX3NPX.3BLARQEIFG1DD@garyguo.net>
 <D6227AA2-A727-4F29-B7CD-BE0AAB0A13F1@collabora.com>
 <DG79GRI3NOLS.3ASMS9RJ80IXM@kernel.org> <aYUJuF8bI7mwD4ON@luna>
In-Reply-To: <aYUJuF8bI7mwD4ON@luna>

(Cc: Rob, Saravana)

On Thu Feb 5, 2026 at 10:20 PM CET, Link Mauve wrote:
> On Thu, Feb 05, 2026 at 08:05:08PM +0100, Danilo Krummrich wrote:
>> On Thu Feb 5, 2026 at 6:28 PM CET, Daniel Almeida wrote:
>> >> On 5 Feb 2026, at 12:16, Gary Guo <gary@garyguo.net> wrote:
>> >> I think we should have everything default to little endian, and have =
wrapper
>> >> types that do big endian which require expicit construction, similar =
to
>> >> RelaxedMmio in Alex's series.
>> >
>> > Ah yes, the RelaxedMmio pattern is definitely a good one. I agree that=
 we
>> > should head in this direction.
>>=20
>> I strongly disagree.
>>=20
>> This is a great pattern for relaxed ordering because:
>>=20
>>   (1) We need both strict and relaxed ordering.
>>=20
>>   (2) Relaxed ordering is rare, hence it doesn't hurt to write e.g.
>>=20
>> 	io.relaxed().write()
>>=20
>>   (3) If you by accident just write
>>=20
>> 	io.write()
>>=20
>>       i.e. forget to call relaxed() it s not a bug, nothing bad happens.
>>=20
>> Whereas for endianness it is a bad pattern because:
>>=20
>>   (1) Devices are either little-endian or big-endian. Hence, having to w=
rite
>>=20
>> 	io.big_endian().write()
>>=20
>>       is excessive, we always want big-endian for a big-endian device.
>>=20
>>   (2) It is error prone, if you forget to call big_endian() first, it is=
 a bug.
>>=20
>>   (3) It is unergonomic in combination with relaxed ordering.
>>=20
>> 	io.big_endian().relaxed().write()
>>=20
>>       (Does the other way around work as well? :)
>>=20
>> It makes much more sense to define once when we request the I/O memory w=
hether
>> the device is litte-endian or big-endian.
>>=20
>> This could be done with different request functions, a const generic or =
a
>> function argument, but it should be done at request time.
>
> Could this ever be done in the device tree?  I understand this would
> mean having to change all drivers and all device trees that do big
> endian, but it seems to be the natural location for this information.  I
> have no idea how to structure that though.

I think that's a good idea, for newly supported devices we could probably d=
o
that. For existing ones that might not work. IIRC, there is an expectation =
that
driver should still work with older device trees.
