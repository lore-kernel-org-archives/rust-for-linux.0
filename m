Received: from sender4-pp-e103.zoho.com (sender4-pp-e103.zoho.com [136.143.188.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2882F30DED7;
	Fri,  6 Feb 2026 21:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770412311; cv=pass; b=MX7XB3b48rGe5D3PxjIYj8LG8/o21BUFRmxyR168+95jGgTL8yOW3YkppvZ8vE0dgA6aD2DEEFNCmchl76/MS8IvmwTjBVkww38L6Ea0nkO0HCZAf1AlsmYioqitILCCEem6qyfQZQcD3MmBIEzI04NaXfGMmrK9Ex6Am9C4fBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770412311; c=relaxed/simple;
	bh=2Qwq9gyfPieQQ2GmZLktYewLmD/YIi7MxlUjPc2pdo4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=F+avnXND7qoUM6GFviHy/ir4XXMYZHceioig6mXXLqeDrRnHo/3oRxU9jxEfZr4q5rZL4JUJg3NSYnny2qA5hFe930CdhdgiK1xMq3ty3JXE3IP9Xm85jy7qhtnC52uj7Hd2YbcVkwm0WpYJZAO81mcgFYYh7pXqMoJs0E1GfGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=BLXBUGkx; arc=pass smtp.client-ip=136.143.188.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="BLXBUGkx"
ARC-Seal: i=1; a=rsa-sha256; t=1770412288; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I5tgg3vKuhLHEhsoALqZtp5zn/HvWrFM71OjZWtx0d6RqJgKEpQExx6U6BEKl6VgoHYW74beLk5RvA+OOHZhsshhJ2L4D+10QwzDqgw5lQcSrirX848uFTdIy41AnI+GpBLRTNma5qazJLpN2zBctMCY1cp2Yj15zB451p3Agsg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770412288; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mnVCloh3i4HPA7F5FN60tsxtkZnMSaKoESfjFkk6RO0=; 
	b=TZsdVvKmYmV2UFj+JgK5jElwH96En4FwQ/I4WPyKCL2B/pI4iSRNdAer3yBGcDkjVz0CjehYtz+ZPxhLigq3HrB7BH2KLgX2Js/rldhmC/N8ItvpdMmuR8X3VDSqZeTM4fqF8SbqyEr7/VMk6S6WuwLgWy8x6D5DgX7i+dUYjvo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770412288;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=mnVCloh3i4HPA7F5FN60tsxtkZnMSaKoESfjFkk6RO0=;
	b=BLXBUGkxOa/gwTPCtNF6V2TKgzvgfl9LpktDM1Tdk0IH7nBAgxmRIWlOoUfE44Mi
	nKUviWw5/AK/914pmETsYKMyqhYK8Gp8Imae3MF7hybNabREHAeme+ACigQcmnCGQ1i
	8WSHn4GW8zgYkzEO64oi4lnkyTWBrekJD8v5T0Ic=
Received: by mx.zohomail.com with SMTPS id 1770412285410489.6840772476079;
	Fri, 6 Feb 2026 13:11:25 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 5/7] rust: io: add `register!` macro
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260129-register-v5-5-c4587c902514@nvidia.com>
Date: Fri, 6 Feb 2026 18:11:06 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Yury Norov <yury.norov@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>,
 Dirk Behme <dirk.behme@de.bosch.com>,
 Steven Price <steven.price@arm.com>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <32419A55-0A24-49F5-A600-21002FFA12C2@collabora.com>
References: <20260129-register-v5-0-c4587c902514@nvidia.com>
 <20260129-register-v5-5-c4587c902514@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 29 Jan 2026, at 10:32, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> Add a macro for defining hardware register types with I/O accessors.
>=20
> Each register field is represented as a `Bounded` of the appropriate =
bit
> width, ensuring field values are never silently truncated.
>=20
> Fields can optionally be converted to/from custom types, either =
fallibly
> or infallibly.
>=20
> The address of registers can be direct, relative, or indexed, =
supporting
> most of the patterns in which registers are arranged.
>=20
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> rust/kernel/io.rs          |    1 +
> rust/kernel/io/register.rs | 1286 =
++++++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 1287 insertions(+)
>=20
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 056a3ec71647..112f43ecbf88 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -11,6 +11,7 @@
>=20
> pub mod mem;
> pub mod poll;
> +pub mod register;
> pub mod resource;
>=20
> pub use resource::Resource;
> diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
> new file mode 100644
> index 000000000000..9d6c265e70c7
> --- /dev/null
> +++ b/rust/kernel/io/register.rs
> @@ -0,0 +1,1286 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A macro to define register layout and accessors.
> +//!
> +//! A single register typically includes several fields, which are =
accessed through a combination
> +//! of bit-shift and mask operations that introduce a class of =
potential mistakes, notably because
> +//! not all possible field values are necessarily valid.
> +//!
> +//! The [`register!`] macro in this module provides an intuitive and =
readable syntax for defining a
> +//! dedicated type for each register. Each such type comes with its =
own field accessors that can
> +//! return an error if a field's value is invalid.
> +//!
> +//! [`register!`]: kernel::register!
> +
> +use crate::io::{
> +    IoCapable,
> +    IoKnownSize, //
> +};
> +
> +/// Trait providing a base address to be added to the offset of a =
relative register to obtain
> +/// its actual offset.
> +///
> +/// The `T` generic argument is used to distinguish which base to =
use, in case a type provides
> +/// several bases. It is given to the `register!` macro to restrict =
the use of the register to
> +/// implementors of this particular variant.
> +pub trait RegisterBase<T> {
> +    /// Base address to which register offsets are added.
> +    const BASE: usize;
> +}
> +
> +/// Trait providing I/O read/write operations for register storage =
types.
> +///
> +/// This trait is implemented for all integer types on which I/O can =
be performed, allowing the
> +/// `register!` macro to generate appropriate I/O accessor methods =
based on the register's storage
> +/// type.
> +#[doc(hidden)]
> +pub trait RegisterIo: Sized {
> +    /// Read a value from the given offset in the I/O region.
> +    fn read<I>(io: &I, offset: usize) -> Self
> +    where
> +        I: IoKnownSize + IoCapable<Self>;
> +
> +    /// Write a value to the given offset in the I/O region.
> +    fn write<I>(self, io: &I, offset: usize)
> +    where
> +        I: IoKnownSize + IoCapable<Self>;
> +}
> +
> +impl RegisterIo for u8 {
> +    #[inline(always)]
> +    fn read<I>(io: &I, offset: usize) -> Self
> +    where
> +        I: IoKnownSize + IoCapable<Self>,
> +    {
> +        io.read8(offset)
> +    }
> +
> +    #[inline(always)]
> +    fn write<I>(self, io: &I, offset: usize)
> +    where
> +        I: IoKnownSize + IoCapable<Self>,
> +    {
> +        io.write8(self, offset)
> +    }
> +}
> +
> +impl RegisterIo for u16 {
> +    #[inline(always)]
> +    fn read<I>(io: &I, offset: usize) -> Self
> +    where
> +        I: IoKnownSize + IoCapable<Self>,
> +    {
> +        io.read16(offset)
> +    }
> +
> +    #[inline(always)]
> +    fn write<I>(self, io: &I, offset: usize)
> +    where
> +        I: IoKnownSize + IoCapable<Self>,
> +    {
> +        io.write16(self, offset)
> +    }
> +}
> +
> +impl RegisterIo for u32 {
> +    #[inline(always)]
> +    fn read<I>(io: &I, offset: usize) -> Self
> +    where
> +        I: IoKnownSize + IoCapable<Self>,
> +    {
> +        io.read32(offset)
> +    }
> +
> +    #[inline(always)]
> +    fn write<I>(self, io: &I, offset: usize)
> +    where
> +        I: IoKnownSize + IoCapable<Self>,
> +    {
> +        io.write32(self, offset)
> +    }
> +}
> +
> +impl RegisterIo for u64 {
> +    #[inline(always)]
> +    fn read<I>(io: &I, offset: usize) -> Self
> +    where
> +        I: IoKnownSize + IoCapable<Self>,
> +    {
> +        io.read64(offset)
> +    }
> +
> +    #[inline(always)]
> +    fn write<I>(self, io: &I, offset: usize)
> +    where
> +        I: IoKnownSize + IoCapable<Self>,
> +    {
> +        io.write64(self, offset)
> +    }
> +}
> +
> +/// Defines a dedicated type for a register, including getter and =
setter methods for its fields and
> +/// methods to read and write it from an [`Io`] region.
> +///
> +/// Example:
> +///
> +/// ```
> +/// use kernel::register;
> +///
> +/// register! {
> +///     /// Basic information about the chip.
> +///     pub BOOT_0(u32) @ 0x00000100 {
> +///         /// Vendor ID.
> +///         15:8 vendor_id;
> +///         /// Major revision of the chip.
> +///         7:4 major_revision;
> +///         /// Minor revision of the chip.
> +///         3:0 minor_revision;
> +///     }
> +/// }
> +/// ```
> +///
> +/// This defines a `BOOT_0` type which can be read from or written to =
offset `0x100` of an `Io`
> +/// region. For instance, `minor_revision` consists of the 4 least =
significant bits of the
> +/// register.
> +///
> +/// Fields are instances of [`Bounded`](kernel::num::Bounded) and can =
be read by calling their
> +/// getter method, which is named after them. They also have setter =
methods prefixed with `with_`
> +/// for runtime values and `with_const_` for constant values. All =
setters return the updated
> +/// register value.
> +///
> +/// ```no_run
> +/// use kernel::register;
> +/// use kernel::num::Bounded;
> +///
> +/// # register! {
> +/// #     pub BOOT_0(u32) @ 0x00000100 {
> +/// #         15:8 vendor_id;
> +/// #         7:4 major_revision;
> +/// #         3:0 minor_revision;
> +/// #     }
> +/// # }
> +/// # fn test<T: kernel::io::IoKnownSize + =
kernel::io::IoCapable<u32>>(bar: &T) {
> +/// # fn obtain_vendor_id() -> u8 { 0xff }
> +/// // Read from the register's defined offset (0x100).
> +/// let boot0 =3D BOOT_0::read(&bar);
> +/// pr_info!("chip revision: {}.{}", boot0.major_revision().get(), =
boot0.minor_revision().get());
> +///
> +/// // Update some fields and write the new value back.
> +/// boot0
> +///     // Constant values.
> +///     .with_const_major_revision::<3>()
> +///     .with_const_minor_revision::<10>()
> +///     // Run-time value.
> +///     .with_vendor_id(obtain_vendor_id())
> +///     .write(&bar);
> +///
> +/// // Or, just read and update the register in a single step.
> +/// BOOT_0::update(&bar, |r| r
> +///     .with_const_major_revision::<3>()
> +///     .with_const_minor_revision::<10>()
> +///     .with_vendor_id(obtain_vendor_id())
> +/// );
> +///
> +/// // Constant values can also be built using the const setters.
> +/// const V: BOOT_0 =3D BOOT_0::zeroed()
> +///     .with_const_major_revision::<3>()
> +///     .with_const_minor_revision::<10>();
> +/// # }
> +/// ```
> +///
> +/// Fields can also be transparently converted from/to an arbitrary =
type by using the bitfield `=3D>`
> +/// and `?=3D>` syntaxes.
> +///
> +/// If present, doccomments above register or fields definitions are =
added to the relevant item
> +/// they document (the register type itself, or the field's setter =
and getter methods).
> +///
> +/// Note that multiple registers can be defined in a single =
`register!` invocation. This can be
> +/// useful to group related registers together.
> +///
> +/// ```
> +/// use kernel::register;
> +///
> +/// register! {
> +///     pub BOOT_0(u8) @ 0x00000100 {
> +///         7:4 major_revision;
> +///         3:0 minor_revision;
> +///     }
> +///
> +///     pub BOOT_1(u8) @ 0x00000101 {
> +///         7:5 num_threads;
> +///         4:0 num_cores;
> +///     }
> +/// };
> +/// ```
> +///
> +/// It is possible to create an alias of an existing register with =
new field definitions by using
> +/// the `=3D> ALIAS` syntax. This is useful for cases where a =
register's interpretation depends on
> +/// the context:
> +///
> +/// ```
> +/// use kernel::register;
> +///
> +/// register! {
> +///     /// Scratch register.
> +///     pub SCRATCH(u32) @ 0x00000200 {
> +///         /// Raw value.
> +///         31:0 value;
> +///     }
> +///
> +///     /// Boot status of the firmware.
> +///     pub SCRATCH_BOOT_STATUS(u32) =3D> SCRATCH {
> +///         /// Whether the firmware has completed booting.
> +///         0:0 completed;
> +///     }
> +/// }
> +/// ```
> +///
> +/// In this example, `SCRATCH_BOOT_STATUS` uses the same I/O address =
as `SCRATCH`, while also
> +/// providing its own `completed` field.
> +///
> +/// ## Relative registers
> +///
> +/// A register can be defined as being accessible from a fixed offset =
of a provided base. For
> +/// instance, imagine the following I/O space:
> +///
> +/// ```text
> +///           +-----------------------------+
> +///           |             ...             |
> +///           |                             |
> +///  0x100--->+------------CPU0-------------+
> +///           |                             |
> +///  0x110--->+-----------------------------+
> +///           |           CPU_CTL           |
> +///           +-----------------------------+
> +///           |             ...             |
> +///           |                             |
> +///           |                             |
> +///  0x200--->+------------CPU1-------------+
> +///           |                             |
> +///  0x210--->+-----------------------------+
> +///           |           CPU_CTL           |
> +///           +-----------------------------+
> +///           |             ...             |
> +///           +-----------------------------+
> +/// ```
> +///
> +/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at =
offset `0x10` of their I/O
> +/// space segment. Since both instances of `CPU_CTL` share the same =
layout, we don't want to define
> +/// them twice and would prefer a way to select which one to use from =
a single definition
> +///
> +/// This can be done using the `Base + Offset` syntax when specifying =
the register's address.
> +///
> +/// `Base` is an arbitrary type (typically a ZST) to be used as a =
generic parameter of the
> +/// [`RegisterBase`] trait to provide the base as a constant, i.e. =
each type providing a base for
> +/// this register needs to implement `RegisterBase<Base>`. Here is =
the above example translated
> +/// into code:
> +///
> +/// ```no_run
> +/// use kernel::register;
> +/// use kernel::io::register::RegisterBase;
> +///
> +/// // Type used to identify the base.
> +/// pub struct CpuCtlBase;
> +///
> +/// // ZST describing `CPU0`.
> +/// struct Cpu0;
> +/// impl RegisterBase<CpuCtlBase> for Cpu0 {
> +///     const BASE: usize =3D 0x100;
> +/// }
> +/// // Singleton of `CPU0` used to identify it.
> +/// const CPU0: Cpu0 =3D Cpu0;
> +///
> +/// // ZST describing `CPU1`.
> +/// struct Cpu1;
> +/// impl RegisterBase<CpuCtlBase> for Cpu1 {
> +///     const BASE: usize =3D 0x200;
> +/// }
> +/// // Singleton of `CPU1` used to identify it.
> +/// const CPU1: Cpu1 =3D Cpu1;
> +///
> +/// # fn test<T: kernel::io::IoKnownSize + =
kernel::io::IoCapable<u32>>(bar: &T) {
> +/// // This makes `CPU_CTL` accessible from all implementors of =
`RegisterBase<CpuCtlBase>`.
> +/// register! {
> +///     /// CPU core control.
> +///     pub CPU_CTL(u32) @ CpuCtlBase + 0x10 {
> +///         /// Start the CPU core.
> +///         0:0 start;
> +///     }
> +/// }
> +///
> +/// // The `read`, `write` and `update` methods of relative registers =
take an extra `base` argument
> +/// // that is used to resolve its final address by adding its `BASE` =
to the offset of the
> +/// // register.
> +///
> +/// // Start `CPU0`.
> +/// CPU_CTL::update(&bar, &CPU0, |r| r.with_start(true));
> +///
> +/// // Start `CPU1`.
> +/// CPU_CTL::update(&bar, &CPU1, |r| r.with_start(true));
> +///
> +/// // Aliases can also be defined for relative register.
> +/// register! {
> +///     /// Alias to CPU core control.
> +///     pub CPU_CTL_ALIAS(u32) =3D> CpuCtlBase + CPU_CTL {
> +///         /// Start the aliased CPU core.
> +///         1:1 alias_start;
> +///     }
> +/// }
> +///
> +/// // Start the aliased `CPU0`.
> +/// CPU_CTL_ALIAS::update(&bar, &CPU0, |r| r.with_alias_start(true));
> +/// # }
> +/// ```
> +///
> +/// ## Arrays of registers
> +///
> +/// Some I/O areas contain consecutive registers that can be =
interpreted in the same way. These
> +/// areas can be defined as an array of identical registers, allowing =
them to be accessed by index
> +/// with compile-time or runtime bound checking. Simply specify their =
size inside `[` and `]`
> +/// brackets, and add an `idx` parameter to their `read`, `write` and =
`update` methods:
> +///
> +/// ```no_run
> +/// use kernel::register;
> +///
> +/// # fn test<T: kernel::io::IoKnownSize + =
kernel::io::IoCapable<u32>>(bar: &T)
> +/// #     -> Result<(), Error>{
> +/// # fn get_scratch_idx() -> usize {
> +/// #   0x15
> +/// # }
> +/// // Array of 64 consecutive registers with the same layout =
starting at offset `0x80`.
> +/// register! {
> +///     /// Scratch registers.
> +///     pub SCRATCH(u32)[64] @ 0x00000080 {
> +///         31:0 value;
> +///     }
> +/// }
> +///
> +/// // Read scratch register 0, i.e. I/O address `0x80`.
> +/// let scratch_0 =3D SCRATCH::read(&bar, 0).value();
> +/// // Read scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
> +/// let scratch_15 =3D SCRATCH::read(&bar, 15).value();
> +///
> +/// // This is out of bounds and won't build.
> +/// // let scratch_128 =3D SCRATCH::read(&bar, 128).value();
> +///
> +/// // Runtime-obtained array index.
> +/// let scratch_idx =3D get_scratch_idx();
> +/// // Access on a runtime index returns an error if it is =
out-of-bounds.
> +/// let some_scratch =3D SCRATCH::try_read(&bar, =
scratch_idx)?.value();
> +///
> +/// // Alias to a particular register in an array.
> +/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
> +/// register! {
> +///     /// Firmware exit status code.
> +///     pub FIRMWARE_STATUS(u32) =3D> SCRATCH[8] {
> +///         7:0 status;
> +///     }
> +/// }
> +/// let status =3D FIRMWARE_STATUS::read(&bar).status();
> +///
> +/// // Non-contiguous register arrays can be defined by adding a =
stride parameter.
> +/// // Here, each of the 16 registers of the array are separated by 8 =
bytes, meaning that the
> +/// // registers of the two declarations below are interleaved.
> +/// register! {
> +///     /// Scratch registers bank 0.
> +///     pub SCRATCH_INTERLEAVED_0(u32)[16, stride =3D 8] @ 0x000000c0 =
{
> +///         31:0 value;
> +///     }
> +///
> +///     /// Scratch registers bank 1.
> +///     pub SCRATCH_INTERLEAVED_1(u32)[16, stride =3D 8] @ 0x000000c4 =
{
> +///         31:0 value;
> +///     }
> +/// }
> +/// # Ok(())
> +/// # }
> +/// ```
> +///
> +/// ## Relative arrays of registers
> +///
> +/// Combining the two features described in the sections above, =
arrays of registers accessible from
> +/// a base can also be defined:
> +///
> +/// ```no_run
> +/// use kernel::register;
> +/// use kernel::io::register::RegisterBase;
> +///
> +/// # fn test<T: kernel::io::IoKnownSize + =
kernel::io::IoCapable<u32>>(bar: &T)
> +/// #     -> Result<(), Error>{
> +/// # fn get_scratch_idx() -> usize {
> +/// #   0x15
> +/// # }
> +/// // Type used as parameter of `RegisterBase` to specify the base.
> +/// pub struct CpuCtlBase;
> +///
> +/// // ZST describing `CPU0`.
> +/// struct Cpu0;
> +/// impl RegisterBase<CpuCtlBase> for Cpu0 {
> +///     const BASE: usize =3D 0x100;
> +/// }
> +/// // Singleton of `CPU0` used to identify it.
> +/// const CPU0: Cpu0 =3D Cpu0;
> +///
> +/// // ZST describing `CPU1`.
> +/// struct Cpu1;
> +/// impl RegisterBase<CpuCtlBase> for Cpu1 {
> +///     const BASE: usize =3D 0x200;
> +/// }
> +/// // Singleton of `CPU1` used to identify it.
> +/// const CPU1: Cpu1 =3D Cpu1;
> +///
> +/// // 64 per-cpu scratch registers, arranged as a contiguous array.
> +/// register! {
> +///     /// Per-CPU scratch registers.
> +///     pub CPU_SCRATCH(u32)[64] @ CpuCtlBase + 0x00000080 {
> +///         31:0 value;
> +///     }
> +/// }
> +///
> +/// let cpu0_scratch_0 =3D CPU_SCRATCH::read(&bar, &Cpu0, 0).value();
> +/// let cpu1_scratch_15 =3D CPU_SCRATCH::read(&bar, &Cpu1, =
15).value();
> +///
> +/// // This won't build.
> +/// // let cpu0_scratch_128 =3D CPU_SCRATCH::read(&bar, &Cpu0, =
128).value();
> +///
> +/// // Runtime-obtained array index.
> +/// let scratch_idx =3D get_scratch_idx();
> +/// // Access on a runtime value returns an error if it is =
out-of-bounds.
> +/// let cpu0_some_scratch =3D CPU_SCRATCH::try_read(&bar, &Cpu0, =
scratch_idx)?.value();
> +///
> +/// // `SCRATCH[8]` is used to convey the firmware exit code.
> +/// register! {
> +///     /// Per-CPU firmware exit status code.
> +///     pub CPU_FIRMWARE_STATUS(u32) =3D> CpuCtlBase + CPU_SCRATCH[8] =
{
> +///         7:0 status;
> +///     }
> +/// }
> +/// let cpu0_status =3D CPU_FIRMWARE_STATUS::read(&bar, =
&Cpu0).status();
> +///
> +/// // Non-contiguous register arrays can be defined by adding a =
stride parameter.
> +/// // Here, each of the 16 registers of the array are separated by 8 =
bytes, meaning that the
> +/// // registers of the two declarations below are interleaved.
> +/// register! {
> +///     /// Scratch registers bank 0.
> +///     pub CPU_SCRATCH_INTERLEAVED_0(u32)[16, stride =3D 8] @ =
CpuCtlBase + 0x00000d00 {
> +///         31:0 value;
> +///     }
> +///
> +///     /// Scratch registers bank 1.
> +///     pub CPU_SCRATCH_INTERLEAVED_1(u32)[16, stride =3D 8] @ =
CpuCtlBase + 0x00000d04 {
> +///         31:0 value;
> +///     }
> +/// }
> +/// # Ok(())
> +/// # }
> +/// ```
> +/// [`Io`]: kernel::io::Io
> +#[macro_export]
> +macro_rules! register {
> +    // Entry point for the macro, allowing multiple registers to be =
defined in one call.
> +    // It matches all possible register declaration patterns to =
dispatch them to corresponding
> +    // `@reg` rule that defines a single register.
> +    (
> +        $(
> +            $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
> +                $([ $size:expr $(, stride =3D $stride:expr)? ])?
> +                $(@ $($base:ident +)? $offset:literal)?
> +                $(=3D> $alias:ident $(+ $alias_offset:ident)? =
$([$alias_idx:expr])? )?
> +            { $($fields:tt)* }
> +        )*
> +    ) =3D> {
> +        $(
> +        $crate::register!(
> +            @reg $(#[$attr])* $vis $name ($storage) $([$size $(, =
stride =3D $stride)?])?
> +                $(@ $($base +)? $offset)?
> +                $(=3D> $alias $(+ $alias_offset)? $([$alias_idx])? )?
> +            { $($fields)* }
> +        );
> +        )*
> +    };
> +
> +    // All the rules below are private helpers.
> +
> +    // Creates a register at a fixed offset of the MMIO space.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ =
$offset:literal
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        $crate::register!(
> +            @bitfield $(#[$attr])* $vis struct $name($storage) { =
$($fields)* }
> +        );
> +        $crate::register!(@io_fixed $name($storage) @ $offset);
> +    };
> +
> +    // Creates an alias register of fixed offset register `alias` =
with its own fields.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) =3D> =
$alias:ident
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        $crate::register!(
> +            @bitfield $(#[$attr])* $vis struct $name($storage) { =
$($fields)* }
> +        );
> +        $crate::register!(@io_fixed $name($storage) @ =
$alias::OFFSET);
> +    };
> +
> +    // Creates a register at a relative offset from a base address =
provider.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ =
$base:ident + $offset:literal
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        $crate::register!(
> +            @bitfield $(#[$attr])* $vis struct $name($storage) { =
$($fields)* }
> +        );
> +        $crate::register!(@io_relative $name($storage) @ $base + =
$offset );
> +    };
> +
> +    // Creates an alias register of relative offset register `alias` =
with its own fields.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) =3D> =
$base:ident + $alias:ident
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        $crate::register!(
> +            @bitfield $(#[$attr])* $vis struct $name($storage) { =
$($fields)* }
> +        );
> +        $crate::register!(@io_relative $name($storage) @ $base + =
$alias::OFFSET );
> +    };
> +
> +    // Creates an array of registers at a fixed offset of the MMIO =
space.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
> +            [ $size:expr, stride =3D $stride:expr ] @ $offset:literal =
{ $($fields:tt)* }
> +    ) =3D> {
> +        static_assert!(::core::mem::size_of::<$storage>() <=3D =
$stride);
> +
> +        $crate::register!(
> +            @bitfield $(#[$attr])* $vis struct $name($storage) { =
$($fields)* }
> +        );
> +        $crate::register!(@io_array $name($storage) [ $size, stride =3D=
 $stride ] @ $offset);
> +    };
> +
> +    // Shortcut for contiguous array of registers (stride =3D=3D size =
of element).
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ =
$size:expr ] @ $offset:literal
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        $crate::register!(
> +            $(#[$attr])* $vis $name($storage) [ $size, stride =3D =
::core::mem::size_of::<$storage>() ]
> +                @ $offset { $($fields)* }
> +        );
> +    };
> +
> +    // Creates an alias of register `idx` of array of registers =
`alias` with its own fields.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) =3D> =
$alias:ident [ $idx:expr ]
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        static_assert!($idx < $alias::SIZE);
> +
> +        $crate::register!(
> +            @bitfield $(#[$attr])* $vis struct $name($storage) { =
$($fields)* }
> +        );
> +        $crate::register!(@io_fixed $name($storage) @ $alias::OFFSET =
+ $idx * $alias::STRIDE);
> +    };
> +
> +    // Creates an array of registers at a relative offset from a base =
address provider.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
> +            [ $size:expr, stride =3D $stride:expr ]
> +            @ $base:ident + $offset:literal { $($fields:tt)* }
> +    ) =3D> {
> +        static_assert!(::core::mem::size_of::<$storage>() <=3D =
$stride);
> +
> +        $crate::register!(
> +            @bitfield $(#[$attr])* $vis struct $name($storage) { =
$($fields)* }
> +        );
> +        $crate::register!(
> +            @io_relative_array $name($storage) [ $size, stride =3D =
$stride ] @ $base + $offset
> +        );
> +    };
> +
> +    // Shortcut for contiguous array of relative registers (stride =3D=3D=
 size of element).
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ =
$size:expr ]
> +            @ $base:ident + $offset:literal { $($fields:tt)* }
> +    ) =3D> {
> +        $crate::register!(
> +            $(#[$attr])* $vis $name($storage) [ $size, stride =3D =
::core::mem::size_of::<$storage>() ]
> +                @ $base + $offset { $($fields)* }
> +        );
> +    };
> +
> +    // Creates an alias of register `idx` of relative array of =
registers `alias` with its own
> +    // fields.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
> +            =3D> $base:ident + $alias:ident [ $idx:expr ] { =
$($fields:tt)* }
> +    ) =3D> {
> +        static_assert!($idx < $alias::SIZE);
> +
> +        $crate::register!(
> +            @bitfield $(#[$attr])* $vis struct $name($storage) { =
$($fields)* }
> +        );
> +        $crate::register!(
> +            @io_relative $name($storage) @ $base + $alias::OFFSET + =
$idx * $alias::STRIDE
> +        );
> +    };
> +
> +    // Generates the bitfield for the register.
> +    //
> +    // `#[allow(non_camel_case_types)]` is added since register names =
typically use SCREAMING_CASE.
> +    (
> +        @bitfield $(#[$attr:meta])* $vis:vis struct =
$name:ident($storage:ty) { $($fields:tt)* }
> +    ) =3D> {
> +        $crate::register!(@bitfield_core
> +            #[allow(non_camel_case_types)]
> +            $(#[$attr])* $vis $name $storage
> +        );
> +        $crate::register!(@bitfield_fields $vis $name $storage { =
$($fields)* });
> +    };
> +
> +    // Generates the IO accessors for a fixed offset register.
> +    (@io_fixed $name:ident ($storage:ty) @ $offset:expr) =3D> {
> +        #[allow(dead_code)]
> +        impl $name {
> +            /// Absolute offset of the register.
> +            pub const OFFSET: usize =3D $offset;
> +
> +            /// Read the register from its address in `io`.
> +            #[inline(always)]
> +            pub fn read<T, I>(io: &T) -> Self where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +            {
> +                let io =3D io.deref();
> +
> +                Self(<$storage as =
$crate::io::register::RegisterIo>::read(io, Self::OFFSET))
> +            }
> +
> +            /// Write the value contained in `self` to the register =
address in `io`.
> +            #[inline(always)]
> +            pub fn write<T, I>(self, io: &T) where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +            {
> +                let io =3D io.deref();
> +
> +                <$storage as =
$crate::io::register::RegisterIo>::write(self.0, io, Self::OFFSET)
> +            }
> +
> +            /// Read the register from its address in `io` and run =
`f` on its value to obtain a new
> +            /// value to write back.
> +            ///
> +            /// Note that this operation is not atomic. In concurrent =
contexts, external
> +            /// synchronization may be required to prevent race =
conditions.
> +            #[inline(always)]
> +            pub fn update<T, I, F>(
> +                io: &T,
> +                f: F,
> +            ) where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +                F: ::core::ops::FnOnce(Self) -> Self,
> +            {
> +                let reg =3D f(Self::read(io));
> +                reg.write(io);
> +            }
> +        }
> +    };
> +
> +    // Generates the IO accessors for a relative offset register.
> +    (@io_relative $name:ident ($storage:ty) @ $base:ident + =
$offset:expr ) =3D> {
> +        #[allow(dead_code)]
> +        impl $name {
> +            /// Relative offset of the register.
> +            pub const OFFSET: usize =3D $offset;
> +
> +            /// Read the register from `io`, using the base address =
provided by `base` and adding
> +            /// the register's offset to it.
> +            #[inline(always)]
> +            pub fn read<T, I, B>(
> +                io: &T,
> +                #[allow(unused_variables)]
> +                base: &B,
> +            ) -> Self where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +            {
> +                let io =3D io.deref();
> +                let offset =3D <B as =
$crate::io::register::RegisterBase<$base>>::BASE + Self::OFFSET;
> +
> +                Self(<$storage as =
$crate::io::register::RegisterIo>::read(io, offset))
> +            }
> +
> +            /// Write the value contained in `self` to `io`, using =
the base address provided by
> +            /// `base` and adding the register's offset to it.
> +            #[inline(always)]
> +            pub fn write<T, I, B>(
> +                self,
> +                io: &T,
> +                #[allow(unused_variables)]
> +                base: &B,
> +            ) where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +            {
> +                let io =3D io.deref();
> +                let offset =3D <B as =
$crate::io::register::RegisterBase<$base>>::BASE + Self::OFFSET;
> +
> +                <$storage as =
$crate::io::register::RegisterIo>::write(self.0, io, offset)
> +            }
> +
> +            /// Read the register from `io`, using the base address =
provided by `base` and adding
> +            /// the register's offset to it, then run `f` on its =
value to obtain a new value to
> +            /// write back.
> +            ///
> +            /// Note that this operation is not atomic. In concurrent =
contexts, external
> +            /// synchronization may be required to prevent race =
conditions.
> +            #[inline(always)]
> +            pub fn update<T, I, B, F>(
> +                io: &T,
> +                base: &B,
> +                f: F,
> +            ) where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +                F: ::core::ops::FnOnce(Self) -> Self,
> +            {
> +                let reg =3D f(Self::read(io, base));
> +                reg.write(io, base);
> +            }
> +        }
> +    };
> +
> +    // Generates the IO accessors for an array of registers.
> +    (@io_array $name:ident ($storage:ty) [ $size:expr, stride =3D =
$stride:expr ]
> +        @ $offset:literal) =3D> {
> +        #[allow(dead_code)]
> +        impl $name {
> +            /// Absolute offset of the register array.
> +            pub const OFFSET: usize =3D $offset;
> +            /// Number of elements in the array of registers.
> +            pub const SIZE: usize =3D $size;
> +            /// Number of bytes separating each element of the array =
of registers.
> +            pub const STRIDE: usize =3D $stride;
> +
> +            /// Read the array register at index `idx` from its =
address in `io`.
> +            #[inline(always)]
> +            pub fn read<T, I>(
> +                io: &T,
> +                idx: usize,
> +            ) -> Self where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +            {
> +                build_assert!(idx < Self::SIZE);
> +
> +                let io =3D io.deref();
> +                let offset =3D Self::OFFSET + (idx * Self::STRIDE);
> +
> +                Self(<$storage as =
$crate::io::register::RegisterIo>::read(io, offset))
> +            }
> +
> +            /// Write the value contained in `self` to the array =
register with index `idx` in `io`.
> +            #[inline(always)]
> +            pub fn write<T, I>(
> +                self,
> +                io: &T,
> +                idx: usize
> +            ) where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +            {
> +                build_assert!(idx < Self::SIZE);
> +
> +                let io =3D io.deref();
> +                let offset =3D Self::OFFSET + (idx * Self::STRIDE);
> +
> +                <$storage as =
$crate::io::register::RegisterIo>::write(self.0, io, offset)
> +            }
> +
> +            /// Read the array register at index `idx` in `io` and =
run `f` on its value to obtain a
> +            /// new value to write back.
> +            ///
> +            /// Note that this operation is not atomic. In concurrent =
contexts, external
> +            /// synchronization may be required to prevent race =
conditions.
> +            #[inline(always)]
> +            pub fn update<T, I, F>(
> +                io: &T,
> +                idx: usize,
> +                f: F,
> +            ) where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +                F: ::core::ops::FnOnce(Self) -> Self,
> +            {
> +                let reg =3D f(Self::read(io, idx));
> +                reg.write(io, idx);
> +            }
> +
> +            /// Read the array register at index `idx` from its =
address in `io`.
> +            ///
> +            /// The validity of `idx` is checked at run-time, and =
`EINVAL` is returned if the
> +            /// access was out-of-bounds.
> +            #[inline(always)]
> +            pub fn try_read<T, I>(
> +                io: &T,
> +                idx: usize,
> +            ) -> ::kernel::error::Result<Self> where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +            {
> +                if idx < Self::SIZE {
> +                    Ok(Self::read(io, idx))
> +                } else {
> +                    Err(::kernel::error::code::EINVAL)
> +                }
> +            }
> +
> +            /// Write the value contained in `self` to the array =
register with index `idx` in `io`.
> +            ///
> +            /// The validity of `idx` is checked at run-time, and =
`EINVAL` is returned if the
> +            /// access was out-of-bounds.
> +            #[inline(always)]
> +            pub fn try_write<T, I>(
> +                self,
> +                io: &T,
> +                idx: usize,
> +            ) -> ::kernel::error::Result where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +            {
> +                if idx < Self::SIZE {
> +                    Ok(self.write(io, idx))
> +                } else {
> +                    Err(::kernel::error::code::EINVAL)
> +                }
> +            }
> +
> +            /// Read the array register at index `idx` in `io` and =
run `f` on its value to obtain a
> +            /// new value to write back.
> +            ///
> +            /// The validity of `idx` is checked at run-time, and =
`EINVAL` is returned if the
> +            /// access was out-of-bounds.
> +            ///
> +            /// Note that this operation is not atomic. In concurrent =
contexts, external
> +            /// synchronization may be required to prevent race =
conditions.
> +            #[inline(always)]
> +            pub fn try_update<T, I, F>(
> +                io: &T,
> +                idx: usize,
> +                f: F,
> +            ) -> ::kernel::error::Result where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +                F: ::core::ops::FnOnce(Self) -> Self,
> +            {
> +                if idx < Self::SIZE {
> +                    Ok(Self::update(io, idx, f))
> +                } else {
> +                    Err(::kernel::error::code::EINVAL)
> +                }
> +            }
> +        }
> +    };
> +
> +    // Generates the IO accessors for an array of relative registers.
> +    (
> +        @io_relative_array $name:ident ($storage:ty) [ $size:expr, =
stride =3D $stride:expr ]
> +            @ $base:ident + $offset:literal
> +    ) =3D> {
> +        #[allow(dead_code)]
> +        impl $name {
> +            /// Relative offset of the register array.
> +            pub const OFFSET: usize =3D $offset;
> +            /// Number of elements in the array of registers.
> +            pub const SIZE: usize =3D $size;
> +            /// Number of bytes separating each element of the array =
of registers.
> +            pub const STRIDE: usize =3D $stride;
> +
> +            /// Read the array register at index `idx` from `io`, =
using the base address provided
> +            /// by `base` and adding the register's offset to it.
> +            #[inline(always)]
> +            pub fn read<T, I, B>(
> +                io: &T,
> +                #[allow(unused_variables)]
> +                base: &B,
> +                idx: usize,
> +            ) -> Self where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +            {
> +                build_assert!(idx < Self::SIZE);
> +
> +                let io =3D io.deref();
> +                let offset =3D <B as =
$crate::io::register::RegisterBase<$base>>::BASE +
> +                    Self::OFFSET + (idx * Self::STRIDE);
> +
> +                Self(<$storage as =
$crate::io::register::RegisterIo>::read(io, offset))
> +            }
> +
> +            /// Write the value contained in `self` to `io`, using =
the base address provided by
> +            /// `base` and adding the offset of array register `idx` =
to it.
> +            #[inline(always)]
> +            pub fn write<T, I, B>(
> +                self,
> +                io: &T,
> +                #[allow(unused_variables)]
> +                base: &B,
> +                idx: usize
> +            ) where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +            {
> +                build_assert!(idx < Self::SIZE);
> +
> +                let io =3D io.deref();
> +                let offset =3D <B as =
$crate::io::register::RegisterBase<$base>>::BASE +
> +                    Self::OFFSET + (idx * Self::STRIDE);
> +
> +                <$storage as =
$crate::io::register::RegisterIo>::write(self.0, io, offset)
> +            }
> +
> +            /// Read the array register at index `idx` from `io`, =
using the base address provided
> +            /// by `base` and adding the register's offset to it, =
then run `f` on its value to
> +            /// obtain a new value to write back.
> +            ///
> +            /// Note that this operation is not atomic. In concurrent =
contexts, external
> +            /// synchronization may be required to prevent race =
conditions.
> +            #[inline(always)]
> +            pub fn update<T, I, B, F>(
> +                io: &T,
> +                base: &B,
> +                idx: usize,
> +                f: F,
> +            ) where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +                F: ::core::ops::FnOnce(Self) -> Self,
> +            {
> +                let reg =3D f(Self::read(io, base, idx));
> +                reg.write(io, base, idx);
> +            }
> +
> +            /// Read the array register at index `idx` from `io`, =
using the base address provided
> +            /// by `base` and adding the register's offset to it.
> +            ///
> +            /// The validity of `idx` is checked at run-time, and =
`EINVAL` is returned if the
> +            /// access was out-of-bounds.
> +            #[inline(always)]
> +            pub fn try_read<T, I, B>(
> +                io: &T,
> +                base: &B,
> +                idx: usize,
> +            ) -> ::kernel::error::Result<Self> where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +            {
> +                if idx < Self::SIZE {
> +                    Ok(Self::read(io, base, idx))
> +                } else {
> +                    Err(::kernel::error::code::EINVAL)
> +                }
> +            }
> +
> +            /// Write the value contained in `self` to `io`, using =
the base address provided by
> +            /// `base` and adding the offset of array register `idx` =
to it.
> +            ///
> +            /// The validity of `idx` is checked at run-time, and =
`EINVAL` is returned if the
> +            /// access was out-of-bounds.
> +            #[inline(always)]
> +            pub fn try_write<T, I, B>(
> +                self,
> +                io: &T,
> +                base: &B,
> +                idx: usize,
> +            ) -> ::kernel::error::Result where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +            {
> +                if idx < Self::SIZE {
> +                    Ok(self.write(io, base, idx))
> +                } else {
> +                    Err(::kernel::error::code::EINVAL)
> +                }
> +            }
> +
> +            /// Read the array register at index `idx` from `io`, =
using the base address provided
> +            /// by `base` and adding the register's offset to it, =
then run `f` on its value to
> +            /// obtain a new value to write back.
> +            ///
> +            /// The validity of `idx` is checked at run-time, and =
`EINVAL` is returned if the
> +            /// access was out-of-bounds.
> +            ///
> +            /// Note that this operation is not atomic. In concurrent =
contexts, external
> +            /// synchronization may be required to prevent race =
conditions.
> +            #[inline(always)]
> +            pub fn try_update<T, I, B, F>(
> +                io: &T,
> +                base: &B,
> +                idx: usize,
> +                f: F,
> +            ) -> ::kernel::error::Result where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + =
::kernel::io::IoCapable<$storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +                F: ::core::ops::FnOnce(Self) -> Self,
> +            {
> +                if idx < Self::SIZE {
> +                    Ok(Self::update(io, base, idx, f))
> +                } else {
> +                    Err(::kernel::error::code::EINVAL)
> +                }
> +            }
> +        }
> +    };
> +
> +    // Defines the wrapper `$name` type and its conversions from/to =
the storage type.
> +    (@bitfield_core $(#[$attr:meta])* $vis:vis $name:ident =
$storage:ty) =3D> {
> +        $(#[$attr])*
> +        #[repr(transparent)]
> +        #[derive(Clone, Copy, PartialEq, Eq)]
> +        $vis struct $name($storage);
> +
> +        #[allow(dead_code)]
> +        impl $name {
> +            /// Creates a bitfield from a raw value.
> +            $vis const fn from_raw(value: $storage) -> Self {
> +                Self(value)
> +            }
> +
> +            /// Creates a zeroed bitfield value.
> +            ///
> +            /// This is a const alternative to the =
`Zeroable::zeroed()` trait method.
> +            $vis const fn zeroed() -> Self {
> +                Self(0)
> +            }
> +
> +            /// Returns the raw value of this bitfield.
> +            ///
> +            /// This is similar to the [`From`] implementation, but =
is shorter to invoke in
> +            /// most cases.
> +            $vis const fn as_raw(self) -> $storage {
> +                self.0
> +            }
> +        }
> +
> +        // SAFETY: `$storage` is `Zeroable` and `$name` is =
transparent.
> +        unsafe impl ::pin_init::Zeroable for $name {}
> +
> +        impl ::core::convert::From<$name> for $storage {
> +            fn from(val: $name) -> $storage {
> +                val.as_raw()
> +            }
> +        }
> +
> +        impl ::core::convert::From<$storage> for $name {
> +            fn from(val: $storage) -> $name {
> +                Self::from_raw(val)
> +            }
> +        }
> +    };
> +
> +    // Definitions requiring knowledge of individual fields: private =
and public field accessors,
> +    // and `Debug` implementation.
> +    (@bitfield_fields $vis:vis $name:ident $storage:ty {
> +        $($(#[doc =3D $doc:expr])* $hi:literal:$lo:literal =
$field:ident
> +            $(?=3D> $try_into_type:ty)?
> +            $(=3D> $into_type:ty)?
> +        ;
> +        )*
> +    }
> +    ) =3D> {
> +        #[allow(dead_code)]
> +        impl $name {
> +        $(
> +        $crate::register!(@private_field_accessors $vis $name =
$storage : $hi:$lo $field);
> +        $crate::register!(
> +            @public_field_accessors $(#[doc =3D $doc])* $vis $name =
$storage : $hi:$lo $field
> +            $(?=3D> $try_into_type)?
> +            $(=3D> $into_type)?
> +        );
> +        )*
> +        }
> +
> +        $crate::register!(@debug $name { $($field;)* });
> +    };
> +
> +    // Private field accessors working with the correct `Bounded` =
type for the field.
> +    (
> +        @private_field_accessors $vis:vis $name:ident $storage:ty : =
$hi:tt:$lo:tt $field:ident
> +    ) =3D> {
> +        ::kernel::macros::paste!(
> +        $vis const [<$field:upper _RANGE>]: =
::core::ops::RangeInclusive<u8> =3D $lo..=3D$hi;
> +        $vis const [<$field:upper _MASK>]: $storage =3D
> +            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
> +        $vis const [<$field:upper _SHIFT>]: u32 =3D $lo;
> +        );
> +
> +        ::kernel::macros::paste!(
> +        fn [<__ $field>](self) ->
> +            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
> +            // Left shift to align the field's MSB with the storage =
MSB.
> +            const ALIGN_TOP: u32 =3D $storage::BITS - ($hi + 1);
> +            // Right shift to move the top-aligned field to bit 0 of =
the storage.
> +            const ALIGN_BOTTOM: u32 =3D ALIGN_TOP + $lo;
> +
> +            // Extract the field using two shifts. `Bounded::shr` =
produces the correctly-sized
> +            // output type.
> +            let val =3D ::kernel::num::Bounded::<$storage, { =
$storage::BITS }>::from(
> +                self.0 << ALIGN_TOP
> +            );
> +            val.shr::<ALIGN_BOTTOM, { $hi + 1 - $lo } >()
> +        }
> +
> +        const fn [<__with_ $field>](
> +            mut self,
> +            value: ::kernel::num::Bounded<$storage, { $hi + 1 - $lo =
}>,
> +        ) -> Self
> +        {
> +            const MASK: $storage =3D $name::[<$field:upper _MASK>];
> +            const SHIFT: u32 =3D $name::[<$field:upper _SHIFT>];
> +
> +            let value =3D value.into_inner() << SHIFT;
> +            self.0 =3D (self.0 & !MASK) | value;
> +
> +            self
> +        }
> +        );
> +    };
> +
> +    // Public accessors for fields infallibly (`=3D>`) converted to a =
type.
> +    (
> +        @public_field_accessors $(#[doc =3D $doc:expr])* $vis:vis =
$name:ident $storage:ty :
> +            $hi:literal:$lo:literal $field:ident =3D> $into_type:ty
> +    ) =3D> {
> +        ::kernel::macros::paste!(
> +
> +        $(#[doc =3D $doc])*
> +        #[doc =3D "Returns the value of this field."]
> +        #[inline(always)]
> +        $vis fn $field(self) -> $into_type
> +        {
> +            self.[<__ $field>]().into()
> +        }
> +
> +        $(#[doc =3D $doc])*
> +        #[doc =3D "Sets this field to the given `value`."]
> +        #[inline(always)]
> +        $vis fn [<with_ $field>](self, value: $into_type) -> Self
> +        {
> +            self.[<__with_ $field>](value.into())
> +        }
> +
> +        );
> +    };
> +
> +    // Public accessors for fields fallibly (`?=3D>`) converted to a =
type.
> +    (
> +        @public_field_accessors $(#[doc =3D $doc:expr])* $vis:vis =
$name:ident $storage:ty :
> +            $hi:tt:$lo:tt $field:ident ?=3D> $try_into_type:ty
> +    ) =3D> {
> +        ::kernel::macros::paste!(
> +
> +        $(#[doc =3D $doc])*
> +        #[doc =3D "Returns the value of this field."]
> +        #[inline(always)]
> +        $vis fn $field(self) ->
> +            Result<
> +                $try_into_type,
> +                <$try_into_type as ::core::convert::TryFrom<
> +                    ::kernel::num::Bounded<$storage, { $hi + 1 - $lo =
}>
> +                >>::Error
> +            >
> +        {
> +            self.[<__ $field>]().try_into()
> +        }
> +
> +        $(#[doc =3D $doc])*
> +        #[doc =3D "Sets this field to the given `value`."]
> +        #[inline(always)]
> +        $vis fn [<with_ $field>](self, value: $try_into_type) -> Self
> +        {
> +            self.[<__with_ $field>](value.into())
> +        }
> +
> +        );
> +    };
> +
> +    // Public accessors for fields not converted to a type.
> +    (
> +        @public_field_accessors $(#[doc =3D $doc:expr])* $vis:vis =
$name:ident $storage:ty :
> +            $hi:tt:$lo:tt $field:ident
> +    ) =3D> {
> +        ::kernel::macros::paste!(
> +
> +        $(#[doc =3D $doc])*
> +        #[doc =3D "Returns the value of this field."]
> +        #[inline(always)]
> +        $vis fn $field(self) ->
> +            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
> +        {
> +            self.[<__ $field>]()
> +        }
> +
> +        $(#[doc =3D $doc])*
> +        #[doc =3D "Sets this field to the compile-time constant =
`VALUE`."]
> +        #[inline(always)]
> +        $vis const fn [<with_const_ $field>]<const VALUE: =
$storage>(self) -> Self {
> +            self.[<__with_ $field>](
> +                ::kernel::num::Bounded::<$storage, { $hi + 1 - $lo =
}>::new::<VALUE>()
> +            )
> +        }
> +
> +        $(#[doc =3D $doc])*
> +        #[doc =3D "Sets this field to the given `value`."]
> +        #[inline(always)]
> +        $vis fn [<with_ $field>]<T>(
> +            self,
> +            value: T,
> +        ) -> Self
> +            where T: Into<::kernel::num::Bounded<$storage, { $hi + 1 =
- $lo }>>,
> +        {
> +            self.[<__with_ $field>](value.into())
> +        }
> +
> +        $(#[doc =3D $doc])*
> +        #[doc =3D "Tries to set this field to `value`, returning an =
error if it is out of range."]
> +        #[inline(always)]
> +        $vis fn [<try_with_ $field>]<T>(
> +            self,
> +            value: T,
> +        ) -> ::kernel::error::Result<Self>
> +            where T: ::kernel::num::TryIntoBounded<$storage, { $hi + =
1 - $lo }>,
> +        {
> +            Ok(
> +                self.[<__with_ $field>](
> +                    =
value.try_into_bounded().ok_or(::kernel::error::code::EOVERFLOW)?
> +                )
> +            )
> +        }
> +
> +        );
> +    };
> +
> +    // `Debug` implementation.
> +    (@debug $name:ident { $($field:ident;)* }) =3D> {
> +        impl ::kernel::fmt::Debug for $name {
> +            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> =
::kernel::fmt::Result {
> +                f.debug_struct(stringify!($name))
> +                    .field("<raw>", &::kernel::prelude::fmt!("{:#x}", =
self.0))
> +                $(
> +                    .field(stringify!($field), &self.$field())
> +                )*
> +                    .finish()
> +            }
> +        }
> +    };
> +}
>=20
> --=20
> 2.52.0
>=20


FWIW, I had a look at this, and it seems fine. It seems like the Deref =
issue that was pointed out
earlier is still present. I will wait for a new version before testing, =
as it appears that a redesign
will take place anyways.

=E2=80=94 Daniel

