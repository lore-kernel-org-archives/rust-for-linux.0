Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4203D55E46
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Feb 2024 22:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708380272; cv=none; b=NcNso65qIz+cOjYYuUnDX28QAdy6E8KsvSNrbGPDAopZJjIdFqzhA0irqqbmta8RxWPgTtdoX92iRVaMKV9qmUSe9MXIxt3PGeX4xPFaw78VOCNfsSO6UzwsgkZgz9PeZlOIJV5jMSp/pJhhlR17OaxZd7WhtB0wNy882y3mQoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708380272; c=relaxed/simple;
	bh=jmCY50iP8PuJQGYoY+RYZpIU9z44xcl/Emg2DmjmU7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b9ywAP8BR6XJqdGmROWYvdEJ84P5WqeL4kBov9xM16TOsZXKzVXhMdaWdyQGOCmey7E1pMKj3eUh6+iroRZXD69QWIEjakhmdsFyNdruFHTwyGPJc9hm/KhCNDVfWc+Xd4Y57IBHfnWepYOA48hSXRFDDQAB+d1M64akNHyJulE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ryhl.io; spf=pass smtp.mailfrom=ryhl.io; dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b=MKXTZm9U; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Hd3QwMVS; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ryhl.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ryhl.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b="MKXTZm9U";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Hd3QwMVS"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 36B5413800DD;
	Mon, 19 Feb 2024 17:04:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 19 Feb 2024 17:04:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1708380269;
	 x=1708466669; bh=RJ8Zv6VESt3ADRV69oHzYv5ZDxZVYD59vvukhxytKNk=; b=
	MKXTZm9UIaqTlynBbPV7jQiRze60H/ePrr3ygFERJVzogkN7HrLLT3m9MBac4pjJ
	G03BA4uCCegKq6rc/xCnsMc748HVsnvM9vq+/sNoOQfut/AJKiAzzhFG+a979Br3
	6ngX+9CA1EiwA+sHNtY3HBkf4ZAh+v+f56aH1uI+juhuNRHfpWOk/bAs2k6lkJNw
	4yrE7cmPO0pABIOS7uQc+UProamRScsO40IxtJDG45pHLDFeS7us5cW/V7BYY4+c
	161veKsXteZvlpWBemOOb/sRkwoiUZHntLDqKlZWT16kHA/XnbyuUosfF9sUsN/a
	mo+mC1ps0NHPQO3ZftN2uA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1708380269; x=
	1708466669; bh=RJ8Zv6VESt3ADRV69oHzYv5ZDxZVYD59vvukhxytKNk=; b=H
	d3QwMVS8FaPYale1GnvF3U6lHO4R0BgxciaE6kdCBTH9NLy8jTtViwspA4Xhfz60
	BTchyPi85hBa12gxKp5ZaMilZnHD9MLVvs0JZKIYBzMkMLWFuOueNmFmu4qJpD/r
	yh1fV3xL4L9D3ZWmLEbeOInJLUF8fVke/5TVtsFk9viEgSAJX9KYJH1rwUjkyIb1
	hl11tUUQ/I7Xl0kcvvFMnis/sbmIjiQuQMeoKp2hxo8WO2hhcNjf9ZAASNUX7bwM
	8Qfxg81UhAHlKUdfrBmOp4bp6eYFK+u6X8UJKwfbggHrJClznYM0VytDdDozAMV7
	EkjEW8Kf+3oLfXkZ5PJVg==
X-ME-Sender: <xms:a9DTZYDu-ejDYmBF7-B0O6hZaRmX0dPBsVWv3Mebo43w0cK4vkYX2A>
    <xme:a9DTZaiop-RIwjeTTjnUlU8pk_5phfHaZv_ju6b5F3PUlQGI-xhJd8yij9rj6zPDO
    m1-XuKTHYaLc_YtWg>
X-ME-Received: <xmr:a9DTZbkXKh85_PmI8V61pPRbOx7YIEDUQowtHbjZ3aWsYx5jxfNy7iPPTn6XFXriJVpHZzVdrsd_xIM24VF7mR1nqEjajqYOCByv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekgdduheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhhi
    tggvucfthihhlhcuoegrlhhitggvsehrhihhlhdrihhoqeenucggtffrrghtthgvrhhnpe
    fgudelgeelheeileehgfejgeelfeefleeigfdtgfetfeelgfefvdeggfdvteejteenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghlihgtvgesrhihhhhlrdhioh
X-ME-Proxy: <xmx:a9DTZey7q6cUNOnojogHEUjYRWuv6QcjI6V7nroMQ82Zh02vTE5mkQ>
    <xmx:a9DTZdTPyNDklmTwTt-Qks3rc01V8QHYU_ExMtLXNP6nD-WsvWsLyw>
    <xmx:a9DTZZaRj0AqWAa4qrXXEAJsQnZsHRl_7O2wM6nJCuHEbcdMkqeijg>
    <xmx:bdDTZfmrghzp1QrcrJfKzFhl0Teufvp9KQaMCtS_rHIvf1OAMEp0Ag>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Feb 2024 17:04:24 -0500 (EST)
Message-ID: <f34fd48b-1670-4a44-928a-7103b83cbc8a@ryhl.io>
Date: Mon, 19 Feb 2024 23:04:22 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: Add `container_of` and `offset_of` macros
Content-Language: en-US-large
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Alice Ryhl <aliceryhl@google.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matt Gilbride <mattgilbride@google.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, rust-for-linux@vger.kernel.org,
 kernel-dev@igalia.com, =?UTF-8?Q?L=C3=A9o_Lanteri_Thauvin?=
 <leseulartichaut@gmail.com>, Wedson Almeida Filho <wedsonaf@google.com>
References: <20240217153315.56128-1-mcanal@igalia.com>
 <CAH5fLggPRcPc-5C8JY5FR7jQMbdNoc89EU0_QAqhG=6HiySZ=w@mail.gmail.com>
 <83571d1e-5710-47d6-9a6c-2a0bb5ab5e5a@igalia.com>
From: Alice Ryhl <alice@ryhl.io>
In-Reply-To: <83571d1e-5710-47d6-9a6c-2a0bb5ab5e5a@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/19/24 22:57, Maíra Canal wrote:
> Hi Alice,
> 
> On 2/19/24 06:49, Alice Ryhl wrote:
>> On Sat, Feb 17, 2024 at 4:33 PM Maíra Canal <mcanal@igalia.com> wrote:
>>>
>>> From: Asahi Lina <lina@asahilina.net>
>>>
>>> Add Rust counterparts to these C macros. `container_of` is useful for C
>>> struct subtyping, to recover the original pointer to the container
>>> structure. `offset_of` is useful for struct-relative addressing.
>>>
>>> Co-authored-by: Miguel Ojeda <ojeda@kernel.org>
>>> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>>> Co-authored:by: Léo Lanteri Thauvin <leseulartichaut@gmail.com>
>>> Signed-off-by: Léo Lanteri Thauvin <leseulartichaut@gmail.com>
>>> Co-authored-by: Wedson Almeida Filho <wedsonaf@google.com>
>>> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>> ---
>>>
>>> Hi,
>>>
>>> `container_of` is a essential macro to build any sort of driver in the
>>> Linux Kernel. Therefore, we need a good and reliable implementation of
>>> this macro for the Rust abstractions.
>>>
>>> Although I checked the version sent by Matt [1], I don't really like the
>>> fact that such an essential part of the foundation of any driver would
>>> be an unsafe macro. Therefore, I propose this alternative to Matt's
>>> implementation, which is Lina's implementation that it is actually safe.
>>
>> Well, the addr_of macro in the standard library, which performs the
>> opposite operation is also unsafe. So I don't think that having it be
>> unsafe is that unreasonable.
>>
>>> `container_of` is a dependency for the rustgem driver and this is part
>>> of my current efforts to upstream the driver.
>>>
>>> [1] 
>>> https://lore.kernel.org/rust-for-linux/20240205-b4-rbtree-v1-1-995e3eee38c0@google.com/
>>>
>>> Best Regards,
>>> - Maíra
>>>
>>>   rust/kernel/lib.rs | 69 ++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 69 insertions(+)
>>>
>>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>>> index 5a8594d2f5db..7ae89c676800 100644
>>> --- a/rust/kernel/lib.rs
>>> +++ b/rust/kernel/lib.rs
>>> @@ -103,3 +103,72 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
>>>       // SAFETY: FFI call.
>>>       unsafe { bindings::BUG() };
>>>   }
>>> +
>>> +/// Calculates the offset of a field from the beginning of the 
>>> struct it belongs to.
>>> +///
>>> +/// # Examples
>>> +///
>>> +/// ```rust
>>> +/// use kernel::prelude::*;
>>> +/// use kernel::offset_of;
>>> +/// struct Test {
>>> +///     a: u64,
>>> +///     b: u32,
>>> +/// }
>>> +///
>>> +/// assert_eq!(offset_of!(Test, b), 8);
>>> +/// ```
>>> +#[macro_export]
>>> +macro_rules! offset_of {
>>> +    ($type:ty, $($f:tt)*) => {{
>>> +        let tmp = core::mem::MaybeUninit::<$type>::uninit();
>>> +        let outer = tmp.as_ptr();
>>> +        // To avoid warnings when nesting `unsafe` blocks.
>>> +        #[allow(unused_unsafe)]
>>> +        // SAFETY: The pointer is valid and aligned, just not 
>>> initialised; `addr_of` ensures that
>>> +        // we don't actually read from `outer` (which would be UB) 
>>> nor create an intermediate
>>> +        // reference.
>>> +        let inner = unsafe { core::ptr::addr_of!((*outer).$($f)*) } 
>>> as *const u8;
>>> +        // To avoid warnings when nesting `unsafe` blocks.
>>> +        #[allow(unused_unsafe)]
>>> +        // SAFETY: The two pointers are within the same allocation 
>>> block.
>>> +        unsafe { inner.offset_from(outer as *const u8) }
>>> +    }}
>>> +}
>>
>> The offset_of macro is already available through the standard library.
>> You do not need to add it here.
>>
>>> +/// Produces a pointer to an object from a pointer to one of its 
>>> fields.
>>> +///
>>> +/// # Safety
>>> +///
>>> +/// Callers must ensure that the pointer to the field is in fact a 
>>> pointer to the specified field,
>>> +/// as opposed to a pointer to another object of the same type. If 
>>> this condition is not met,
>>> +/// any dereference of the resulting pointer is UB.
>>> +///
>>> +/// # Examples
>>> +///
>>> +/// ```rust
>>> +/// use kernel::container_of;
>>> +/// struct Test {
>>> +///     a: u64,
>>> +///     b: u32,
>>> +/// }
>>> +///
>>> +/// let test = Test { a: 10, b: 20 };
>>> +/// let b_ptr = &test.b;
>>> +/// let test_alias = container_of!(b_ptr, Test, b);
>>> +/// assert!(core::ptr::eq(&test, test_alias));
>>> +/// ```
>>> +#[macro_export]
>>> +macro_rules! container_of {
>>> +    ($ptr:expr, $type:ty, $($f:tt)*) => {{
>>> +        let ptr = $ptr as *const _ as *const u8;
>>> +        let offset = $crate::offset_of!($type, $($f)*);
>>> +        let outer = ptr.wrapping_offset(-offset) as *const $type;
>>> +        // SAFETY: The pointer is valid and aligned, just not 
>>> initialised; `addr_of` ensures that
>>> +        // we don't actually read from `outer` (which would be UB) 
>>> nor create an intermediate
>>> +        // reference. The two pointers are within the same 
>>> allocation block.
>>> +        let inner = unsafe { core::ptr::addr_of!((*outer).$($f)*) };
>>
>> If your macro is not unsafe, then this line is incorrect. I could call
>> `container_of!` with some random dangling pointer, and then it would
>> use addr_of! on that pointer, which is not okay because addr_of
>> assumes that the pointer is in-bounds of an allocation both before and
>> after the offset operation.
>>
> 
> Thanks for your explanation, I haven't thought through this point of
> view. Anyway, any chance we could land the `container_of!` patch as soon
> as possible? It would be nice to have a common understanding of this 
> fundamental macro. I would like to send some patches with the DMA fences
> abstraction, but I would need `container_of!`.

When you send a patchset, you can just state in the coverletter that it 
depends on the container_of patch in the rbtree patchset. Then Miguel 
will know that he needs to take that before he can take your patchset.

Of course, if Miguel can take it soon, that's even better.

Alice
