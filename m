Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB93D1A0712;
	Tue, 28 Jan 2025 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738062695; cv=none; b=mBLBX87Yt4VyPj3oixVnLOQfLMID1Uiu+LsKzzS30bWEiD37e9YXoD6jgcfnsHA5IXSq++AXYhT63cpXOUmikyfnKxKE5FI+gs/Kf6Vw443n6reJlS/xecorG/L3I7tVxud+s6UvRZjJ3b89p0JuPkEbRugVJI14OIh/svzT5NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738062695; c=relaxed/simple;
	bh=XffKGlunzVMtufxmStDgkb9UaLeqwwuI06v/SY+BOfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SCNWydsk3/6IPVx3A36ChQEXjLnZD+ZAXC3mau5kj7lDTcpfdaEnyQlMsGGNi3zPvko3+FB+mXcVjJGVwu+ksh9VSJ4SKhzStWDQ73nbAFgD7zAXNjer9TK+qAydboPK8ZU2MMF19LjUQ25iBMJ5Qw7DJsRjP7OLMHORTYKt3n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=NzwPUyec; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="NzwPUyec"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1738062690; bh=/fyzoAFt4Kb5izgbqeKxX5rrPnFXRVeszYu0g+n7CsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NzwPUyecN5JJkhg1a+0MivEU1hXJHNaCL4en18GxzySvacVhTejDWnK7Y9F+EXbHJ
	 q1NrzMh0m+zXkkv3CpCnquM/+iwu4HJ/T2wgEe374B54OZCG7N7/tbRQd1FmjO+NNM
	 c9bwRu5/HYNjCdKibs9TJa/DzN3CRfN3jde3kXXo=
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: io: move offset_valid and io_addr(_assert) to IoRaw
Date: Tue, 28 Jan 2025 12:11:29 +0100
Message-ID: <AC732BF8-8806-483B-AC14-66306D763ACF@kloenk.dev>
In-Reply-To: <Z5D_IxCZvcZ_jKd8@pollux>
References: <20250122-rust-io-offset-v1-1-914725ab55ed@kloenk.dev>
 <Z5D_IxCZvcZ_jKd8@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable



On 22 Jan 2025, at 15:22, Danilo Krummrich wrote:

> On Wed, Jan 22, 2025 at 01:38:09PM +0100, Fiona Behrens wrote:
>> Move the helper functions `offset_valid`, `io_addr` and
>> `io_addr_asset` from `Io` to `IoRaw`. This allows `IoRaw` to be reused=

>> if other abstractions with different write/read functions are
>> needed (e.g. `writeb` vs `iowrite` vs `outb`).
>>
>> Make this functions public as well so they can be used from other
>> modules if you aquire a `IoRaw`.
>
> I don't think they should be public. Instead the abstraction for I/O po=
rts
> should be in this file, just like `Io` is.

Will make it private, but would keep the documentation I wrote to make it=
 easier to read the code.

>
> Another option could also be to just extend the existing `Io` abstracti=
on for
> I/O ports.

Was thinking about that on zulip[0] already as well, but unsure if we sho=
uld then remove the current write functions and use iowrite as those are =
the generic new interface as far as I understand, so it works with both i=
omem and portmem.

Thanks,
Fiona

[0]: https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/top=
ic/.60Io.60.20type.20and.20usage.20of.20.60iowrite*.60.2F.60ioread*.60

>
>>
>> Signed-off-by: Fiona Behrens <me@kloenk.dev>
>> ---
>>  rust/kernel/io.rs | 98 +++++++++++++++++++++++++++++++++++-----------=
---------
>>  1 file changed, 63 insertions(+), 35 deletions(-)
>>
>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>> index d4a73e52e3ee68f7b558749ed0108acde92ae5fe..a6d026f458608626113fd1=
94ee5a8616b4ef76fe 100644
>> --- a/rust/kernel/io.rs
>> +++ b/rust/kernel/io.rs
>> @@ -15,6 +15,11 @@
>>  /// Instead, the bus specific MMIO implementation must convert this r=
aw representation into an `Io`
>>  /// instance providing the actual memory accessors. Only by the conve=
rsion into an `Io` structure
>>  /// any guarantees are given.
>> +///
>> +/// # Invariant
>
> You phrased this invariant as if it would be a requirement, but it's mo=
re like a
> something that's always uphold. I'd phrase it as a fact that can be rel=
ied on.
>
>> +///
>> +/// `addr` plus `maxsize` has to fit in memory (smaller than [`usize:=
:MAX`])
>
> "fit in memory" sounds a bit misleading. I think you want to say they h=
ave to be
> in the range of some address space (e.g. PIO).
>
> Besides that, why do we need this at all in this patch? I think it's fi=
ne to
> add, but then it should be separate patch I think.
>
>> +/// and `maxsize` has to be smaller or equal to `SIZE`.
>
> That's wrong, it's the other way around.
>
>>  pub struct IoRaw<const SIZE: usize =3D 0> {
>>      addr: usize,
>>      maxsize: usize,
>> @@ -23,7 +28,7 @@ pub struct IoRaw<const SIZE: usize =3D 0> {
>>  impl<const SIZE: usize> IoRaw<SIZE> {
>>      /// Returns a new `IoRaw` instance on success, an error otherwise=
=2E
>>      pub fn new(addr: usize, maxsize: usize) -> Result<Self> {
>> -        if maxsize < SIZE {
>> +        if maxsize < SIZE || addr.checked_add(maxsize).is_none() {
>>              return Err(EINVAL);
>>          }
>>
>> @@ -32,15 +37,66 @@ pub fn new(addr: usize, maxsize: usize) -> Result<=
Self> {
>>
>>      /// Returns the base address of the MMIO region.
>>      #[inline]
>> -    pub fn addr(&self) -> usize {
>> +    pub const fn addr(&self) -> usize {
>>          self.addr
>>      }
>>
>>      /// Returns the maximum size of the MMIO region.
>>      #[inline]
>> -    pub fn maxsize(&self) -> usize {
>> +    pub const fn maxsize(&self) -> usize {
>>          self.maxsize
>>      }
>> +
>> +    /// Check if the offset plus the size of the type `U` fits in the=
 bounds of `size`.
>> +    /// Also checks if the offset is aligned with the type size.
>> +    #[inline]
>> +    pub const fn offset_valid<U>(offset: usize, size: usize) -> bool =
{
>> +        let type_size =3D core::mem::size_of::<U>();
>> +        if let Some(end) =3D offset.checked_add(type_size) {
>> +            end <=3D size && offset % type_size =3D=3D 0
>> +        } else {
>> +            false
>> +        }
>> +    }
>> +
>> +    /// Check if the offset (plus the type size) is out of bounds.
>> +    ///
>> +    /// Runtime checked version of [`io_addr_assert`].
>> +    ///
>> +    /// See [`offset_valid`] for the performed offset check.
>> +    ///
>> +    /// # Errors
>> +    ///
>> +    /// Returns [`EINVAL`] if the type does not fit into [`IoRaw`] at=
 the given offset.
>> +    ///
>> +    /// [`offset_valid`]: Self::offset_valid
>> +    /// [`io_addr_assert`]: Self::io_addr_assert
>> +    #[inline]
>> +    pub fn io_addr<U>(&self, offset: usize) -> Result<usize> {
>> +        if !Self::offset_valid::<U>(offset, self.maxsize()) {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // Probably no need to check, since the safety requirements o=
f `Self::new` guarantee that
>> +        // this can't overflow.
>> +        self.addr().checked_add(offset).ok_or(EINVAL)
>> +    }
>> +
>> +    /// Check at build time if the offset (plus the type size) is out=
 of bounds.
>> +    ///
>> +    /// Compiletime checked version of [`io_addr`].
>> +    ///
>> +    /// See [`offset_valid`] for the performed offset check.
>> +    ///
>> +    ///
>> +    /// [`offset_valid`]: Self::offset_valid
>> +    /// [`io_addr`]: Self::io_addr
>> +    #[inline]
>> +    pub const fn io_addr_assert<U>(&self, offset: usize) -> usize {
>> +        build_assert!(Self::offset_valid::<U>(offset, SIZE));
>> +
>> +        self.addr() + offset
>> +    }
>>  }
>>
>>  /// IO-mapped memory, starting at the base address @addr and spanning=
 @maxlen bytes.
>> @@ -116,7 +172,7 @@ macro_rules! define_read {
>>          $(#[$attr])*
>>          #[inline]
>>          pub fn $name(&self, offset: usize) -> $type_name {
>> -            let addr =3D self.io_addr_assert::<$type_name>(offset);
>> +            let addr =3D self.0.io_addr_assert::<$type_name>(offset);=

>>
>>              // SAFETY: By the type invariant `addr` is a valid addres=
s for MMIO operations.
>>              unsafe { bindings::$name(addr as _) }
>> @@ -128,7 +184,7 @@ pub fn $name(&self, offset: usize) -> $type_name {=

>>          /// out of bounds.
>>          $(#[$attr])*
>>          pub fn $try_name(&self, offset: usize) -> Result<$type_name> =
{
>> -            let addr =3D self.io_addr::<$type_name>(offset)?;
>> +            let addr =3D self.0.io_addr::<$type_name>(offset)?;
>>
>>              // SAFETY: By the type invariant `addr` is a valid addres=
s for MMIO operations.
>>              Ok(unsafe { bindings::$name(addr as _) })
>> @@ -145,7 +201,7 @@ macro_rules! define_write {
>>          $(#[$attr])*
>>          #[inline]
>>          pub fn $name(&self, value: $type_name, offset: usize) {
>> -            let addr =3D self.io_addr_assert::<$type_name>(offset);
>> +            let addr =3D self.0.io_addr_assert::<$type_name>(offset);=

>>
>>              // SAFETY: By the type invariant `addr` is a valid addres=
s for MMIO operations.
>>              unsafe { bindings::$name(value, addr as _, ) }
>> @@ -157,7 +213,7 @@ pub fn $name(&self, value: $type_name, offset: usi=
ze) {
>>          /// out of bounds.
>>          $(#[$attr])*
>>          pub fn $try_name(&self, value: $type_name, offset: usize) -> =
Result {
>> -            let addr =3D self.io_addr::<$type_name>(offset)?;
>> +            let addr =3D self.0.io_addr::<$type_name>(offset)?;
>>
>>              // SAFETY: By the type invariant `addr` is a valid addres=
s for MMIO operations.
>>              unsafe { bindings::$name(value, addr as _) }
>> @@ -190,34 +246,6 @@ pub fn maxsize(&self) -> usize {
>>          self.0.maxsize()
>>      }
>>
>> -    #[inline]
>> -    const fn offset_valid<U>(offset: usize, size: usize) -> bool {
>> -        let type_size =3D core::mem::size_of::<U>();
>> -        if let Some(end) =3D offset.checked_add(type_size) {
>> -            end <=3D size && offset % type_size =3D=3D 0
>> -        } else {
>> -            false
>> -        }
>> -    }
>> -
>> -    #[inline]
>> -    fn io_addr<U>(&self, offset: usize) -> Result<usize> {
>> -        if !Self::offset_valid::<U>(offset, self.maxsize()) {
>> -            return Err(EINVAL);
>> -        }
>> -
>> -        // Probably no need to check, since the safety requirements o=
f `Self::new` guarantee that
>> -        // this can't overflow.
>> -        self.addr().checked_add(offset).ok_or(EINVAL)
>> -    }
>> -
>> -    #[inline]
>> -    fn io_addr_assert<U>(&self, offset: usize) -> usize {
>> -        build_assert!(Self::offset_valid::<U>(offset, SIZE));
>> -
>> -        self.addr() + offset
>> -    }
>> -
>>      define_read!(readb, try_readb, u8);
>>      define_read!(readw, try_readw, u16);
>>      define_read!(readl, try_readl, u32);
>>
>> ---
>> base-commit: 01b3cb620815fc3feb90ee117d9445a5b608a9f7
>> change-id: 20250122-rust-io-offset-7b39b11e84ac
>>
>> Best regards,
>> -- =

>> Fiona Behrens <me@kloenk.dev>
>>
