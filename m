Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE7021353
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Feb 2024 21:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707513295; cv=none; b=KK8H/jayIRAP5MKL5FvaSvV/0/yDyQ4HelOfotF/jNrWonHKavQEeXJrbj5wmfSIxU7BupBPBdSuowVmsmMrhwJXNRTblKgM8xicEn54yszGdC1goPYACgTM0AYfTu/EoVNQPdYg+peXZMDl6R7HC1L7CO+jfjWiNlch0PaYjc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707513295; c=relaxed/simple;
	bh=RODrRa0S1LPOpbKTfj4S4vNZF1ROFG+Y+PyzzfMjwPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKrar1qvDR3M7xqu4OkOGMw9B3FSS2rJdcBrQBtXqTxZjzJ+0IjJW6iYVA7vg7Wj0t9N4eNwvzU08YtwtovNlsuN57Eywy8DIeUQCSSAZMfIpY4sXgfFWipDgV4h/d0YJOEZqYFHg9ODB8Faj6RaimDeHE2hy1IltWMDn0ufVYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=orPM0hM9; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="orPM0hM9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hxgSiTpMn6r3oOEdlof/EFcJyMAFJ67QkywsTtCaZFA=; b=orPM0hM98hMn/8Sa71F+A9jMA5
	PaTRa0ZJymSvRr+6z64TdmMTTyhPZObgS5cP5Sd0BYwpK2UUhrSVb7Z/ItnlbzZceT86xxw/CCwDK
	EwMWWz/sTmMBszWMBSPBTOCfbNZ8FgKTVr0hxtT5/AVhI9oDN8o1VZcqQbWEOLk1oNJiRG7XCreLB
	Yh36SI8jJAfksBXPcIrkqmis9wCDrMhpH6wjeCoBzew4Kk7CV7lcgO3tMNEsUEhXYxLog5kLHUPaH
	jGaT7lKDbmw6/JKhFts1xbt1tVIlkH5Q2q02C9gvAU4eTl2wrMyRYnaWXzmfOr/kTbdRrewdj2cs6
	t/rjo5sA==;
Received: from [179.234.233.159] (helo=[192.168.1.212])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rYYCS-00FiP0-LL; Fri, 09 Feb 2024 22:14:20 +0100
Message-ID: <240096f5-127e-46b3-a500-31fea786907c@igalia.com>
Date: Fri, 9 Feb 2024 18:14:13 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] rust: xarray: Add an abstraction for XArray
Content-Language: en-US
To: Benno Lossin <benno.lossin@proton.me>, Asahi Lina <lina@asahilina.net>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, Matthew Wilcox <willy@infradead.org>
Cc: rust-for-linux@vger.kernel.org, kernel-dev@igalia.com
References: <20240116151728.370238-1-mcanal@igalia.com>
 <beb27c71-e138-435a-93ca-3fc702bf6459@proton.me>
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
In-Reply-To: <beb27c71-e138-435a-93ca-3fc702bf6459@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/1/24 07:48, Benno Lossin wrote:
> On 1/16/24 16:06, Maíra Canal wrote:
>> From: Asahi Lina <lina@asahilina.net>
>>

[...]

>> +        let old = unsafe {
>> +            bindings::xa_store(
>> +                self.xa.get(),
>> +                index.try_into()?,
>> +                new.cast_mut(),
>> +                bindings::GFP_KERNEL,
>> +            )
>> +        };
>> +
>> +        // SAFETY: `xa_store` returns the old entry at this index on success or
>> +        // a XArray result, which can be turn into an errno through `xa_err`.
>> +        to_result(unsafe { bindings::xa_err(old) })?;
>> +        guard.dismiss();
>> +
>> +        Ok(if old.is_null() {
>> +            None
>> +        } else {
>> +            // SAFETY: The old value must have been stored by either this function or
>> +            // `insert_between`, both of which ensure non-NULL entries are valid
>> +            // ForeignOwnable pointers.
>> +            Some(unsafe { T::from_foreign(old) })
>> +        })
>> +    }
>> +
>> +    /// Replaces an entry with a new value, dropping the old value (if any).
>> +    pub fn set(&self, index: usize, value: T) -> Result {
>> +        self.replace(index, value)?;
>> +        Ok(())
>> +    }
>> +
>> +    /// Looks up and returns a reference to an entry in the array, returning a `Guard` if it
>> +    /// exists.
>> +    ///
>> +    /// This guard blocks all other actions on the `XArray`. Callers are expected to drop the
>> +    /// `Guard` eagerly to avoid blocking other users, such as by taking a clone of the value.
>> +    pub fn get(&self, index: usize) -> Option<Guard<'_, T>> {
> 
> I would not expect `get` to lock the object, perhaps this should be
> renamed? Any suggestions?

I believe that `get` is pretty convenient and ergonomic. I thought about 
`locked_get` or `get_locked`, but it sounds weird.

> 
>> +        // SAFETY: `self.xa` is always valid by the type invariant.
>> +        unsafe { bindings::xa_lock(self.xa.get()) };
>> +
>> +        // SAFETY: `self.xa` is always valid by the type invariant.
>> +        let guard = ScopeGuard::new(|| unsafe { bindings::xa_unlock(self.xa.get()) });
>> +
>> +        // SAFETY: `self.xa` is always valid by the type invariant.
>> +        //
>> +        // As we are taking advantage of the lock to protect the data structures
>> +        // that we are storing in the XArray, we need to call xa_lock() before
>> +        // calling xa_load(), which we did.
> 
> I looked at the C code and `xa_load` states:
> 
> /**
>   * xa_load() - Load an entry from an XArray.
>   * @xa: XArray.
>   * @index: index into array.
>   *
>   * Context: Any context.  Takes and releases the RCU lock.
>   * Return: The entry at @index in @xa.
>   */
> 
> So do you really need the lock before calling load?

"If you want to take advantage of the lock to protect the data 
structures that you are storing in the XArray, you can call xa_lock() 
before calling xa_load(), then take a reference count on the object you 
have found before calling xa_unlock(). This will prevent stores from 
removing the object from the array between looking up the object and 
incrementing the refcount. You can also use RCU to avoid dereferencing 
freed memory, but an explanation of that is beyond the scope of this 
document."

 From https://docs.kernel.org/core-api/xarray.html

Best Regards,
- Maíra

> 
>> +        let p = unsafe { bindings::xa_load(self.xa.get(), index.try_into().ok()?) };
>> +
>> +        NonNull::new(p as *mut T).map(|p| {
>> +            guard.dismiss();
>> +            Guard(p, self)
>> +        })
>> +    }
>> +
>> +    /// Removes and returns an entry, returning it if it existed.
>> +    pub fn remove(&self, index: usize) -> Option<T> {
>> +        // SAFETY: `self.xa` is always valid by the type invariant.
>> +        let p = unsafe { bindings::xa_erase(self.xa.get(), index.try_into().ok()?) };
>> +        if p.is_null() {
>> +            None
>> +        } else {
>> +            // SAFETY: All pointers stored in the array are pointers obtained by
> 
> By the type invariant of `Self`, all pointers...
> 
>> +            // calling `T::into_foreign`.
>> +            Some(unsafe { T::from_foreign(p) })
>> +        }
>> +    }
>> +
>> +    /// Allocates a new index in the array, optionally storing a new value into it, with
>> +    /// configurable bounds for the index range to allocate from.
>> +    ///
>> +    /// If `value` is `None`, then the index is reserved from further allocation but remains
>> +    /// free for storing a value into it.
>> +    fn insert_between(&self, value: Option<T>, min: u32, max: u32) -> Result<usize> {
>> +        let new = value.map_or(core::ptr::null(), |a| a.into_foreign());
>> +        let mut id: u32 = 0;
>> +
>> +        let guard = ScopeGuard::new(|| {
>> +            if !new.is_null() {
>> +                // SAFETY: If `new` is not NULL, it came from the `ForeignOwnable` we got
>> +                // from the caller.
>> +                unsafe { T::from_foreign(new) };
>> +            }
>> +        });
>> +
>> +        // SAFETY: `self.xa` is always valid by the type invariant. If this succeeds, it
>> +        // takes ownership of the passed `T` (if any). If it fails, we must drop the
>> +        // `T` again.
> 
> The second sentence should not be part of the safety comment (but it
> can be a normal comment).
> 
>> +        let ret = unsafe {
>> +            bindings::xa_alloc(
>> +                self.xa.get(),
>> +                &mut id,
>> +                new.cast_mut(),
>> +                bindings::xa_limit { min, max },
>> +                bindings::GFP_KERNEL,
>> +            )
>> +        };
>> +
>> +        if ret < 0 {
>> +            Err(Error::from_errno(ret))
>> +        } else {
>> +            guard.dismiss();
>> +            Ok(id as usize)
>> +        }
>> +    }
>> +
>> +    /// Allocates a new index in the array, storing a new value into it, with configurable
>> +    /// bounds for the index range to allocate from.
>> +    pub fn alloc_limits(&self, value: T, min: u32, max: u32) -> Result<usize> {
>> +        self.insert_between(Some(value), min, max)
>> +    }
>> +
>> +    /// Allocates a new index in the array, storing a new value into it.
>> +    pub fn alloc(&self, value: T) -> Result<usize> {
>> +        self.alloc_limits(value, 0, u32::MAX)
>> +    }
>> +
>> +    /// Reserves a new index in the array within configurable bounds for the index.
>> +    ///
>> +    /// Returns a `Reservation` object, which can then be used to store a value at this index or
>> +    /// otherwise free it for reuse.
>> +    pub fn reserve_limits(&self, min: u32, max: u32) -> Result<Reservation<'_, T>> {
>> +        Ok(Reservation(
>> +            self,
>> +            self.insert_between(None, min, max)?,
>> +            PhantomData,
>> +        ))
>> +    }
>> +
>> +    /// Reserves a new index in the array.
>> +    ///
>> +    /// Returns a `Reservation` object, which can then be used to store a value at this index or
>> +    /// otherwise free it for reuse.
>> +    pub fn reserve(&self) -> Result<Reservation<'_, T>> {
>> +        Ok(Reservation(
>> +            self,
>> +            self.insert_between(None, 0, u32::MAX)?,
>> +            PhantomData,
>> +        ))
>> +    }
>> +}
>> +
>> +#[pinned_drop]
>> +impl<T: ForeignOwnable> PinnedDrop for XArray<T> {
>> +    fn drop(self: Pin<&mut Self>) {
>> +        let mut index: core::ffi::c_ulong = 0;
>> +        let mut entry;
>> +
>> +        // SAFETY: `self.xa` is valid by the type invariant, and as we have
>> +        // the only reference to the `XArray` we can safely iterate its contents
>> +        // and drop everything.
> 
> The second part is not needed? Since `xa_find` will take the lock.
> 
