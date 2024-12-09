Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0897D1B425E
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 15:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733756678; cv=none; b=B7l2oWeNl+YJ8WdAh9fWfaGWcP/csMCFoV127NBHlMv8/Of9SLPHBNQ4zwYuSEGI7X8c7ghara6py8RIG7Qtm4UgmhrJDTSo4AQzW/nJUgjFkD9ym8Dp6dOnlSyggxGjKomUeF9IUq19yTlUU6gHlBei8WUG0+yZs5UlMTf6iM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733756678; c=relaxed/simple;
	bh=h8oc3Lw37UkGxzkKwQBBDtZvbTvzK7RFaLehV0PAtZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxhIL+GjB0h64FRgkEtGeog1gtBgicMZthDCRxTSIJiG+8iYSp6eYTGFPXSpzrNDtY6hrFlLdcYcyHNusHuUzx5W+Ui8JWLr/eEUXMsP6X0JSnZmCrqiFymFBSWfJAOJbRRCuBvkevNWBnT+5cA0vZ71qX0lCMMxe+z8OA2pbnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=ms+F0rOJ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="ms+F0rOJ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa642e45241so586962166b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Dec 2024 07:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1733756673; x=1734361473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oZ81OY8PZRpiLaYbJTuke3HGjIqjPOJcHxTnxG/RkOk=;
        b=ms+F0rOJXMzkSJzFV539ZmvQRc2miAJfY9GeqXL0n4HTKj/hqcMckOv8lGEgruVbvX
         l/E+ib1Z+aJaZonTJU6UbAxpeoG2Wn091ndT42onRH/H8kysizbMraRFYgFOZ42yA6nE
         +L47OKxRDNNeVe/X6oSxegWpWlNQETNPSNU3PkaT5zl6weq+MEgHOkLX+0jh/vHAQzN1
         DIXWwgXI7aOuzILeKES/8mw2J3IUL0q+eUwoBnGqjfleihNFyZiMpDyZ9VTPiEa05MGV
         78i8sjnAiWr9JWpjEVTlfMB3cyOrA1NFlwQ6XNMfuWCFfpRxChkCLWZp1tnmsmetzXfA
         3cGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733756673; x=1734361473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZ81OY8PZRpiLaYbJTuke3HGjIqjPOJcHxTnxG/RkOk=;
        b=qHkAIajePGz0DCunhVQp70Wh5fR6H9rGh9RV1sWdx8lNGN86UVjJOEE7R52qk3veCz
         PgxnFPM/G8+DcrmEgYPrNlqas7tlYvjNDlOSWryx6JuDW3dq/MStGClPoFmDg1pQC/I9
         7fHCz5qPJ/+o67onx0WimnAnUHLhjMWp3NiSy0q8t66mLrCBsfYz05ej8k98qmEpYXof
         Qe5ja9XeGa0lOHAfY7fZU7bis6JiO6MlN2apDTVSyL74RwqSGsqAUZk7DxOdNt1XSF5x
         8bTwyV7UP6huViw9t6hKSY4kOW0gec9zoCVVGajsHRvDAilVJVvTwKzpoO6xqb4mXo0M
         Q0jA==
X-Forwarded-Encrypted: i=1; AJvYcCWEEAAElbJ1G/xd4WAw/2ntmglktlJjmdzZYOfe9aR/NnJVgQrfLs/wnJ7SXw91g0aYU2uW+Me0zsDVCDdv3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSrOSKfLjgaR6KqMLteukseXDNjdrMmK1gDjoN5lR/iwwi9OGE
	1uWPijBi5dAEK+1gECeL7ZlO4MVHCoU8nd+M4oGrKns8IY4aFw+PJ/6jfaX9k2I=
X-Gm-Gg: ASbGncsdUYqEi3krzrw30PRnfyF5vsz+fFG3vfxPK5aLFnR7OyhandxaS3R60WFpmXZ
	GMcWVHcHj4TiIIrOtUyjw+oXG8oud4fTvLT5sfSDQ1gzjvhGR7yRW+3ZiS5Osaq506GNohCdoVl
	3M0+lKMMu8pPYGWoJhj37OCEOCTaM9JySw2u4s6jk62kQB2+P6yxuuSMbmPDJJow2jmSbNjdhp7
	oznvVlgPztU6UcoQ9FiVtVkt/dPerdlLUNqysP9yveYFa75KBhfsTIPd1q1
X-Google-Smtp-Source: AGHT+IFJYhtFKZ/goCsw1y5x6kNJJZP4pDJajZF9QfbgU0EgifzVPNTx2RhipjqxVUoadRVreP4Tuw==
X-Received: by 2002:a17:906:3101:b0:aa6:7f95:8501 with SMTP id a640c23a62f3a-aa69cd4e054mr69077566b.23.1733756672697;
        Mon, 09 Dec 2024 07:04:32 -0800 (PST)
Received: from [10.0.5.28] (remote.cdn77.com. [95.168.203.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa689addd0dsm153784266b.6.2024.12.09.07.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 07:04:32 -0800 (PST)
Message-ID: <0c569a5d-4b1d-4346-afa4-dc8373e8f564@sedlak.dev>
Date: Mon, 9 Dec 2024 16:04:31 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] rust: kernel: kobject: basic sysfs implementation
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
References: <20241208131545.386897-1-daniel@sedlak.dev>
 <20241208131545.386897-3-daniel@sedlak.dev>
 <2024120849-mumbling-lucrative-006d@gregkh>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <2024120849-mumbling-lucrative-006d@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/8/24 2:43 PM, Greg KH wrote:
> On Sun, Dec 08, 2024 at 02:15:44PM +0100, Daniel Sedlak wrote:
>> Implement initial support for interacting with sysfs
>> via kobject API from the Rust world. Rust for now does
>> not expose any debug interface or interface for tuning
>> knobs of the kernel module. Sysfs is used for exporting
>> relevant debugging metrics or it can be used for
>> tuning module configuration in the runtime (apart from
>> module parameters).
> 
> sysfs is NOT for debugging, it's for system parameters of devices or
> other things.
> 
> debugfs is for debugging, if you want debugging interfaces, use that
> please!

Your are right, I used wrong wording. What I meant, is statistics (for 
example: `/sys/class/net/*/statistics`).

>> +
>> +/// Reference to the subsystems from the non Rust world.
>> +pub mod subsystems {
>> +    use super::DynamicKObject;
>> +
>> +    macro_rules! declare_kobject {
>> +        ($name:tt, $subsystem_ptr:expr, $($doc:expr),+) => {
>> +            $(
>> +            #[doc = $doc]
>> +            )*
>> +            pub static $name: DynamicKObject = DynamicKObject {
>> +                pointer: kernel::types::Opaque::new(
>> +                    core::ptr::addr_of!($subsystem_ptr).cast_mut(),
>> +                ),
>> +            };
>> +        };
>> +    }
>> +
>> +    declare_kobject!(
>> +        FIRMWARE_KOBJECT,
>> +        bindings::firmware_kobj,
>> +        "Firmware subsystem dynamic KObject."
>> +    );
>> +    declare_kobject!(
>> +        KERNEL_KOBJECT,
>> +        bindings::kernel_kobj,
>> +        "Kernel subsystem dynamic KObject."
>> +    );
>> +    declare_kobject!(
>> +        MM_KOBJECT,
>> +        bindings::mm_kobj,
>> +        "Memory management subsystem dynamic KObject."
>> +    );
>> +    declare_kobject!(
>> +        POWER_KOBJECT,
>> +        bindings::power_kobj,
>> +        "Power subsystem dynamic KObject."
>> +    );
> 
> Please don't export these unless you have a real user.  I doubt rust
> code will be placing stuff in the power of mm kobjects (and if so, the
> maintainers of those subsystems MUST review that.)  Same for the other
> kobjects as well.

Noted.
> 
>> +
>> +    // TODO: Add rests of the exported Kobjects.
>> +}
>> +
>> +/// DynamicKObject is same as [`KObject`], however it does not have any state.
>> +pub struct DynamicKObject {
> 
> Why the funny name, why not just Kobject?
> 
>> +    // The bindings export `extern static *mut bindings::kobejct`, however
>> +    // we need to have double pointer because rustc complains with
>> +    // `could not evaluate static initializer`.
>> +    pointer: Opaque<*mut *mut bindings::kobject>,
>> +}
>> +
>> +unsafe impl Send for DynamicKObject {}
>> +unsafe impl Sync for DynamicKObject {}
> 
> All kobjects should be dynamic, so why is this needed?
> 
> Yes, a few are not, but I really really really do not want any rust code
> to follow the mistakes of C code where that happens if at all possible.
> Let's take the chance to fix the mistakes of our youth when we can.

I wanted to distinguish between kobjects that have a "local" state and 
those that have "global" state. What I mean by that is that for example 
`samples/kobject/kobject-example.c` is setting only a global variable to 
some "global" state, that is why it is called a dynamic kobject without 
generic parameter. On the other hand, `samples/kobject/kset-example.c` 
defines custom structure which represent "local" state, and that is why 
I called it just kobject with generic parameter representing type of 
that "local" state.
> 
>> +/// KObject represent wrapper structure enables interaction with
>> +/// the sysfs, where the KObject represents directory.
>> +///
>> +/// TODO: Add examples?
>> +pub struct KObject<K> {
> 
> Why the "O"?

I was reading The sysfs Filesystem [1], and there it is called Kernel 
Object, so I though that K(ernel)Object looks better, but I am really 
open to anything.

Link: https://www.kernel.org/doc/ols/2005/ols2005v1-pages-321-334.pdf [1]
> 
>> +    data: K,
>> +    pointer: Opaque<bindings::kobject>,
>> +
>> +    // Struct must be `!Unpin`, because kobject pointer is self referential.
>> +    _m: PhantomPinned,
>> +}
> 
> So that's all?  Where is the kobject_get() call?

For now, I did not implement cloning for the KObject. I do have only 
single owned "copy" for which the counter should be incremented in 
`kobject_init_and_add` so I should not need it. Or Am I overlooking 
something?
> 
>> +impl<K> Drop for KObject<K> {
>> +    fn drop(&mut self) {
>> +        // SAFETY: This KObject holds a valid reference, because it was allocated
>> +        // through kobject API.
>> +        unsafe { bindings::kobject_put(self.pointer.get()) }
>> +    }
>> +}
>> +
>> +#[doc(hidden)]
>> +struct KObjTypeVTable;
>> +#[doc(hidden)]
>> +impl KObjTypeVTable {
>> +    unsafe extern "C" fn release_callback(kobj: *mut bindings::kobject) {
>> +        unsafe { bindings::kfree(kobj.cast()) }
>> +    }
>> +
>> +    pub(crate) const KOBJ_TYPE: bindings::kobj_type = bindings::kobj_type {
>> +        release: Some(Self::release_callback),
> 
> Note, release callbacks are REQUIRED for a kobject, can we enforce that
> here somehow?

Yes, it is enforced by the trait `KObjectTextAttribute`, where is 
default implementation for `show()` and `store()`, if user does not 
provide them. If user does not implement the callback then the default 
implementation just return `EIO` for that callback.
> 
>> +        sysfs_ops: ptr::addr_of!(bindings::kobj_sysfs_ops),
> 
> Why would you allow access to a kobject's sysfs_ops?  What needs that?

I wanted to reuse already existing facilities and I did not find the 
need of re implementing that and duplicate that code in Rust.
> 
>> +        ..unsafe { mem::zeroed() }
> 
> What does this do?
> 
This could be implemented more gently, possibly without the `unsafe`, 
however the outcome would be the same. I am initializing the structure 
`release` and `sysfs_ops` pointers and initializing the rest to 0 
effectively setting that to NULL pointers.

>> +
>> +impl<K> KObject<K> {
>> +    /// Attaches KObject to the sysfs root.
>> +    pub fn new_in_root(name: CString, data: K) -> Result<Pin<KBox<Self>>> {
>> +        Self::new(name, ptr::null_mut(), data)
>> +    }
> 
> Please never create a kobject in sysfs's root.  Let's let C code only do
> that for now.  If this does come up in the future, talk to me and we can
> reconsider it.
> 
Noted.
>> +    /// Attaches new KObject to the sysfs with specified KObject parent.
>> +    pub fn new_with_kobject_parent<L>(
>> +        name: CString,
>> +        parent: &KObject<L>,
>> +        data: K,
>> +    ) -> Result<Pin<KBox<Self>>> {
>> +        Self::new(name, parent.pointer.get(), data)
>> +    }
> 
> Where is the parent dropped?  And these function names are not matching
> up with the C api, why not?
> 
A module using this API has an ownership of KObject (possibly the parent 
as well as the returned, newly created, KObject), when the KObject is 
dropped by the module, then the destructor is called for that KObject 
releasing resources.

As for the naming. I am not sure whether we are able (or event want) to 
support all capabilities of the sysfs in Rust and I am unsure whether we 
are able to model the API capabilities **with safety guarantees**, so I 
am more in favor of giving it more Rust idiomatic names.
>> +
>> +    /// Attaches new KObject to the sysfs with specified **dynamic** KObject parent.
> 
> All kobjects are dynamic.  If not, please point them out to me (hint, I
> know a few but we really should fix them.)
> 
>> +    pub fn new_with_dynamic_kobject_parent(
> 
> You should never know, or care, about the lifetyle/cycle of your parent
> kobject, so why need two different functions?
> 
> I'm going to stop here, let's see a real example please.  Wrapping a
> kobject is only a last-resort for me, I really want to see proper users
> of the in-kernel apis we have already before resorting to "raw"
> kobjects.
> 
> Note, the one big offender right now is filesystems, and I will push to
> finally get a "real" filesystem kobject api created so that filesystems
> in rust do NOT have to deal with raw kobjects, but can instead use a
> correct api instead, which will prevent all of the current problems that
> filesystems have when dealing with raw kobjects (see the mailing list
> archives for loads of examples of this.)

Thank you, for highlighting that, I will check that out.
> 
> Also, a final nit, why didn't you cc: the kobject maintainer on all of
> this?  You're lucky I'm on the rust mailing list and happened to noice
> this series to hopefully save you some time :)

I am sorry, still getting familiar with the mailing list process, and I 
just forgot.

Thank you for your valuable feedback

Daniel



