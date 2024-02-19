Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856B6535D8
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Feb 2024 21:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708379897; cv=none; b=jURpCyZd/fNiYJAkoDeE646+qNPIF9ET34qvgKej+aoG0p9fQbl/SVorrj514UJvdoAAhomqr+qToBLjPi5eSDbfmSWgOk4DYn43WQINRpWZ8HMK5ybCKdcDCErZcj6S/uwdltIunE94W8Ju+bWMwAzcqWT/tPdPBDYh8IBBHgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708379897; c=relaxed/simple;
	bh=NuiHBYQ1NdScukyusWhJtmRynewtXxVmqArK9dBXF+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhtuSo2yQE4Ihnt7Yu++7ajOmujSpCnxkKPV0frfetwzn+B0FwaQAvvvZBe7G1pcOoivlL644o45aU11mwIs+oN0vk9WknonKt/Q2DiuGWZ3CGKH+6BK0TUPTaUPEeQ5Ru3T4SfREB6Id7cDaQqUOvFnOw6QYT6NScxJwI8/qJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hPFriK8X; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hPFriK8X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+6njZT41pMDP/lRa665aVGPw2qr6fPoP3dGpcH+e8tw=; b=hPFriK8XRJs6JExUs+mLI/L+cO
	kObB04smFAtIH/ev0OzZgBlob3xHKeX8KCV2SwWbLMH2cAsfhsVz+S/UJMdY/sw5byjoOYch5A8Fb
	v/3qP7B56mHpNfyrwEue6s1fEU2gLu+LCu8xIl9frCk3WZOkzERtFwqNBnuY5jlNXBXMgE5xwBzF4
	aqEVRcSroJY4YLQ1Nd4N8zhu1sjbUstCxlPTejFbKXhlHPZ90Pb+yK/GZ49uL57o/azkaalkhuM6x
	v6+Gapp5h0LoyywktSvRFiG05/OZ5kXu9pUog9Ii/wUXMpuOilr6SIiiN2jWvOJk0xJWZr+bRhBnP
	bSJDzUhA==;
Received: from [179.234.233.159] (helo=[192.168.1.212])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rcBdl-001PIg-TX; Mon, 19 Feb 2024 22:57:34 +0100
Message-ID: <83571d1e-5710-47d6-9a6c-2a0bb5ab5e5a@igalia.com>
Date: Mon, 19 Feb 2024 18:57:26 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: Add `container_of` and `offset_of` macros
Content-Language: en-US
To: Alice Ryhl <aliceryhl@google.com>
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
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <CAH5fLggPRcPc-5C8JY5FR7jQMbdNoc89EU0_QAqhG=6HiySZ=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alice,

On 2/19/24 06:49, Alice Ryhl wrote:
> On Sat, Feb 17, 2024 at 4:33 PM Maíra Canal <mcanal@igalia.com> wrote:
>>
>> From: Asahi Lina <lina@asahilina.net>
>>
>> Add Rust counterparts to these C macros. `container_of` is useful for C
>> struct subtyping, to recover the original pointer to the container
>> structure. `offset_of` is useful for struct-relative addressing.
>>
>> Co-authored-by: Miguel Ojeda <ojeda@kernel.org>
>> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>> Co-authored:by: Léo Lanteri Thauvin <leseulartichaut@gmail.com>
>> Signed-off-by: Léo Lanteri Thauvin <leseulartichaut@gmail.com>
>> Co-authored-by: Wedson Almeida Filho <wedsonaf@google.com>
>> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>
>> Hi,
>>
>> `container_of` is a essential macro to build any sort of driver in the
>> Linux Kernel. Therefore, we need a good and reliable implementation of
>> this macro for the Rust abstractions.
>>
>> Although I checked the version sent by Matt [1], I don't really like the
>> fact that such an essential part of the foundation of any driver would
>> be an unsafe macro. Therefore, I propose this alternative to Matt's
>> implementation, which is Lina's implementation that it is actually safe.
> 
> Well, the addr_of macro in the standard library, which performs the
> opposite operation is also unsafe. So I don't think that having it be
> unsafe is that unreasonable.
> 
>> `container_of` is a dependency for the rustgem driver and this is part
>> of my current efforts to upstream the driver.
>>
>> [1] https://lore.kernel.org/rust-for-linux/20240205-b4-rbtree-v1-1-995e3eee38c0@google.com/
>>
>> Best Regards,
>> - Maíra
>>
>>   rust/kernel/lib.rs | 69 ++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index 5a8594d2f5db..7ae89c676800 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -103,3 +103,72 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
>>       // SAFETY: FFI call.
>>       unsafe { bindings::BUG() };
>>   }
>> +
>> +/// Calculates the offset of a field from the beginning of the struct it belongs to.
>> +///
>> +/// # Examples
>> +///
>> +/// ```rust
>> +/// use kernel::prelude::*;
>> +/// use kernel::offset_of;
>> +/// struct Test {
>> +///     a: u64,
>> +///     b: u32,
>> +/// }
>> +///
>> +/// assert_eq!(offset_of!(Test, b), 8);
>> +/// ```
>> +#[macro_export]
>> +macro_rules! offset_of {
>> +    ($type:ty, $($f:tt)*) => {{
>> +        let tmp = core::mem::MaybeUninit::<$type>::uninit();
>> +        let outer = tmp.as_ptr();
>> +        // To avoid warnings when nesting `unsafe` blocks.
>> +        #[allow(unused_unsafe)]
>> +        // SAFETY: The pointer is valid and aligned, just not initialised; `addr_of` ensures that
>> +        // we don't actually read from `outer` (which would be UB) nor create an intermediate
>> +        // reference.
>> +        let inner = unsafe { core::ptr::addr_of!((*outer).$($f)*) } as *const u8;
>> +        // To avoid warnings when nesting `unsafe` blocks.
>> +        #[allow(unused_unsafe)]
>> +        // SAFETY: The two pointers are within the same allocation block.
>> +        unsafe { inner.offset_from(outer as *const u8) }
>> +    }}
>> +}
> 
> The offset_of macro is already available through the standard library.
> You do not need to add it here.
> 
>> +/// Produces a pointer to an object from a pointer to one of its fields.
>> +///
>> +/// # Safety
>> +///
>> +/// Callers must ensure that the pointer to the field is in fact a pointer to the specified field,
>> +/// as opposed to a pointer to another object of the same type. If this condition is not met,
>> +/// any dereference of the resulting pointer is UB.
>> +///
>> +/// # Examples
>> +///
>> +/// ```rust
>> +/// use kernel::container_of;
>> +/// struct Test {
>> +///     a: u64,
>> +///     b: u32,
>> +/// }
>> +///
>> +/// let test = Test { a: 10, b: 20 };
>> +/// let b_ptr = &test.b;
>> +/// let test_alias = container_of!(b_ptr, Test, b);
>> +/// assert!(core::ptr::eq(&test, test_alias));
>> +/// ```
>> +#[macro_export]
>> +macro_rules! container_of {
>> +    ($ptr:expr, $type:ty, $($f:tt)*) => {{
>> +        let ptr = $ptr as *const _ as *const u8;
>> +        let offset = $crate::offset_of!($type, $($f)*);
>> +        let outer = ptr.wrapping_offset(-offset) as *const $type;
>> +        // SAFETY: The pointer is valid and aligned, just not initialised; `addr_of` ensures that
>> +        // we don't actually read from `outer` (which would be UB) nor create an intermediate
>> +        // reference. The two pointers are within the same allocation block.
>> +        let inner = unsafe { core::ptr::addr_of!((*outer).$($f)*) };
> 
> If your macro is not unsafe, then this line is incorrect. I could call
> `container_of!` with some random dangling pointer, and then it would
> use addr_of! on that pointer, which is not okay because addr_of
> assumes that the pointer is in-bounds of an allocation both before and
> after the offset operation.
> 

Thanks for your explanation, I haven't thought through this point of
view. Anyway, any chance we could land the `container_of!` patch as soon
as possible? It would be nice to have a common understanding of this 
fundamental macro. I would like to send some patches with the DMA fences
abstraction, but I would need `container_of!`.

Best Regards,
- Maíra

> Alice
