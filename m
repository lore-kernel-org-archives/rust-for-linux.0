Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286FA32ED22;
	Tue, 10 Feb 2026 20:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756201; cv=none; b=KdrpS4uoCSmtaxx3k8kV+qe4O4IAelLpTc+OXfZvi9qXcCOd03qIB4ysMVnImhjkP98A2NPUpbN9u5YX1+1FQ+5QcRluIaGVrzdx/rqUz8ipo8tctp7GTUCcOLOEEj+gTOatqdJLH0M0xQyiVHZOk3cLXz5eiZsbaxA7Rz2oz48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756201; c=relaxed/simple;
	bh=oI0P9St3Mrn6avPyAMDykmapkvUAMNpRstOS6zhyh4M=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=bdCPubDGB13mIGUNFLbASwr0o46s1P+Af3AZ6dHo01Of73POEa571YnIWnNUtW7XLdopPaJB2rQI12WtrklvDKWu+Df3C4ugMcai9IvFncBkOKFLwh0pQOkXGpriDritUIT4dzq50/4YOfxXjNRkme4CgpuktxkAMXWAz822ujI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzvtMic1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzvtMic1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD4EC116C6;
	Tue, 10 Feb 2026 20:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770756200;
	bh=oI0P9St3Mrn6avPyAMDykmapkvUAMNpRstOS6zhyh4M=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=KzvtMic1jq9UxVqAvO7W11nh2MZ373pVpGutaIpONUanOTm4M4whVKXOtYdAGeid3
	 AOA/xycjlxST8xdjiwrBVn71S+evg1Isgg96uVc0bArMugC99twvDQFyfKWTzKQOIK
	 WnYpHxUBUcGzAryOpFLYGRQu/UXoH+hLef2Lvnexu/npZtho6OVFYQBjG0EukANRuT
	 xy8DkcXZMyN1/M6WjpvSGnaewixXtFFIONegdzwowZ/OsxysQuirm4dSGBto0OX3VA
	 PXmuSPI2/lQ2pGV7RZZCEjytE7es4wKRlnodAF6ulNFmyJktK5e+MrgeL8HqjLvJk6
	 /IhHbD2cS9xEQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 21:43:13 +0100
Message-Id: <DGBKOL8Y6OH8.1X5RHNGCQAMC4@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 0/4] rust: alloc: add Vec shrinking methods
Cc: "Shivam Kalra" <shivamkalra98@gmail.com>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <brauner@kernel.org>, "Carlos
 Llamas" <cmllamas@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
 <0d336a3f-f317-4a70-942a-d87a3faa3a89@gmail.com>
 <aYs5L1aG5S34teKT@google.com> <DGBDHMI9Z4JK.3QHCOS1O8WGLB@kernel.org>
 <CAH5fLghy3_J_in-o=y8yh94+RLn6XihNOTzTiT2kk9DkXBMPVA@mail.gmail.com>
In-Reply-To: <CAH5fLghy3_J_in-o=y8yh94+RLn6XihNOTzTiT2kk9DkXBMPVA@mail.gmail.com>

On Tue Feb 10, 2026 at 9:05 PM CET, Alice Ryhl wrote:
> On Tue, Feb 10, 2026 at 4:05=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
>>
>> On Tue Feb 10, 2026 at 2:57 PM CET, Alice Ryhl wrote:
>> > On Tue, Feb 10, 2026 at 07:08:09PM +0530, Shivam Kalra wrote:
>> >> This is a follow-up to my v3 series:
>> >> https://lore.kernel.org/rust-for-linux/20260207-binder-shrink-vec-v3-=
v3-0-8ff388563427@cock.li/
>> >>
>> >> Hi all,
>> >>
>> >> Thanks for the feedback on v3. Before I respin, I want to confirm
>> >> the direction for v4 to avoid unnecessary iterations.
>> >>
>> >> Proposed changes for v4:
>> >>
>> >> 1. Drop the Shrinkable trait entirely. Make shrink_to() a normal
>> >>    method on Vec<T, A> that calls A::realloc(). (Danilo)
>> >>
>> >> 2. Add a temporary ShrinkQuirk trait to handle the vmalloc workaround
>> >>    (page-boundary check + manual alloc+copy+free) until vrealloc
>> >>    gains in-place shrinking support. (Danilo)
>> >
>> > I don't think you want any new traits at all. What types would even
>> > implement the trait? The special code can go in the realloc() method o=
f
>> > Vmalloc struct in rust/kernel/alloc/allocator.rs.
>>
>> I did not propose to move this into the realloc() functions of the corre=
sponding
>> allocators intentionally, as there is a difference between calling reall=
oc() and
>> shrink_to().
>>
>> I don't want that some user of e.g. Vmalloc::realloc() experiences page =
wise
>> shrinking by copy. This is acceptable for Vec::shrink_to(), but not for
>> realloc() in general.
>
> Ok. In that case we can add a method on KVVec directly for this
> purpose, but I still don't think we need a trait?

KVVec::realloc() should not have this behavior either, we only want it for
VVec::shrink_to() and KVVec::shrink_to(), so I think we need a temporary qu=
irk
trait.

Of course, we could also check for is_vmallloc_addr() in Vec::shrink_to()
directly, but that's too hacky. I want something that can survive a bit in =
case
the vrealloc() rework takes a while.
