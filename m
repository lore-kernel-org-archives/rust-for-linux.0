Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A32B184
	for <rust-for-linux@vger.kernel.org>; Sat,  2 Aug 2025 00:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754092820; cv=none; b=ZRp7R5n+9F5+b6AssKFSPUtBFLmc0/SQLJB+ofctlwFhK0Dsh2UpfHDD3EeS4kVX1JigzJKYssNQo1laO579Wf3h98/xw2TO2M7LgDzQ9sFy4R6j2iGgjsRJtpD77GDcgAi9k6xObaoXvW/FYOlfI5QNBXcQAiMaS/BEalneYTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754092820; c=relaxed/simple;
	bh=DD7H503m0oiQfyOQ/IZhwQFebV7539426/6uc2Evyi8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=EEzN6vodZSqC9Va1oWfEoZwgZZVddbGqMLM7f7qaOxpdlezlO0bZn6zLAAIy4VUb9hkT/8NCmrz/3v0+8PKmVCGsbZCfTv5OL5QmMn5XdrLrqJKNZPjrnLQhcDHizffwiFYZsM0mS3gKx+lKTbnyfIKkU1AOe+REKIdm3pc9Ejo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D828F6K2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D828F6K2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6592C4CEE7;
	Sat,  2 Aug 2025 00:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754092820;
	bh=DD7H503m0oiQfyOQ/IZhwQFebV7539426/6uc2Evyi8=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=D828F6K2yLaBtCC/oz4jctmBOKmZhqXEkd7s1EzZtYd8TDfWRp9M4svqJGnXHmo5p
	 Q8TfSAkUF6EuUmXcGDR9Tn4nrhZLZ1seOIC54e6WggwD49/xFJoCkD3QXeUg6BPOGb
	 sI9xozYpjDPeSe42yZMZMsrXr/Dp7o9so1Ol/CizT2eaHHeO5Mc5cW1yNKBVB67hUN
	 e3AsQNc9lhdpu/q5DXbUNFLWTGV87RVznSP7jvzBp76SouWe+TNvZ7x8mQBd+9ttEY
	 2A3OzS6E4StG7i5NJPj+0z9mOGoemEvlhk/zkkn9hBDYYNGoL+tnva6AjQbcWrInkq
	 g9hsEEBxJgRTQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 02 Aug 2025 02:00:15 +0200
Message-Id: <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>
To: "Igor Korotin" <igor.korotin.linux@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
In-Reply-To: <20250801154042.14327-1-igor.korotin.linux@gmail.com>

(Cc: Wolfram)

On Fri Aug 1, 2025 at 5:40 PM CEST, Igor Korotin wrote:
> Implement the core abstractions needed for I2C drivers, including:
>
> * `i2c::Driver` =E2=80=94 the trait drivers must implement, including `pr=
obe`
>
> * `i2c::Device` =E2=80=94 a safe wrapper around `struct i2c_client`
>
> * `i2c::Adapter` =E2=80=94 implements `driver::RegistrationOps` to hook i=
nto the
>   generic `driver::Registration` machinery
>
> * `i2c::DeviceId` =E2=80=94 a `RawDeviceIdIndex` implementation for I2C d=
evice IDs
>
> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
> ---
>  MAINTAINERS                     |   7 +
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/i2c.rs              | 391 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  4 files changed, 401 insertions(+)
>  create mode 100644 rust/kernel/i2c.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4f03e230f3c5..767beaa0f7c2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11514,6 +11514,13 @@ F:	include/linux/i2c.h
>  F:	include/uapi/linux/i2c-*.h
>  F:	include/uapi/linux/i2c.h
> =20
> +I2C SUBSYSTEM [RUST]

Has this been agreed with Wolfram off-list? (I'm asking since I haven't see=
n a
reply from him in v2.)

In case you just did not receive an answer yet, it's fine to proceed with a
proposal as you do here. However, please make sure to keep Wolfram in the l=
oop.
:)

In either case, which tree should patches flow through?

> +M:	Igor Korotin <igor.korotin.linux@gmail.com>
> +R:	Danilo Krummrich <dakr@kernel.org>

If you'd like me to keep an eye on this as well, this is fine with me.

> +L:	rust-for-linux@vger.kernel.org
> +S:	Maintained
> +F:	rust/kernel/i2c.rs
> +
>  I2C SUBSYSTEM HOST DRIVERS
>  M:	Andi Shyti <andi.shyti@kernel.org>
>  L:	linux-i2c@vger.kernel.org
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 84d60635e8a9..81796d5e16e8 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -53,6 +53,7 @@
>  #include <linux/file.h>
>  #include <linux/firmware.h>
>  #include <linux/fs.h>
> +#include <linux/i2c.h>
>  #include <linux/ioport.h>
>  #include <linux/jiffies.h>
>  #include <linux/jump_label.h>
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> new file mode 100644
> index 000000000000..fafcae92cfdb
> --- /dev/null
> +++ b/rust/kernel/i2c.rs
> @@ -0,0 +1,391 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! I2C Driver subsystem
> +
> +// I2C Driver abstractions.
> +use crate::{
> +    acpi, container_of, device,
> +    device_id::{RawDeviceId, RawDeviceIdIndex},
> +    driver,
> +    error::*,
> +    of,
> +    prelude::*,
> +    types::Opaque,
> +};
> +
> +use core::{
> +    marker::PhantomData,
> +    ptr::{addr_of_mut, NonNull},
> +};
> +
> +/// An I2C device id table.
> +#[repr(transparent)]
> +#[derive(Clone, Copy)]
> +pub struct DeviceId(bindings::i2c_device_id);
> +
> +impl DeviceId {
> +    const I2C_NAME_SIZE: usize =3D 20;
> +
> +    /// Create a new device id from an I2C 'id' string.
> +    #[inline(always)]
> +    pub const fn new(id: &'static CStr) -> Self {
> +        build_assert!(
> +            id.len_with_nul() <=3D Self::I2C_NAME_SIZE,
> +            "ID exceeds 20 bytes"
> +        );
> +        let src =3D id.as_bytes_with_nul();
> +        // Replace with `bindings::acpi_device_id::default()` once stabi=
lized for `const`.
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut i2c: bindings::i2c_device_id =3D unsafe { core::mem::zer=
oed() };
> +        let mut i =3D 0;
> +        while i < src.len() {
> +            i2c.name[i] =3D src[i];
> +            i +=3D 1;
> +        }
> +
> +        Self(i2c)
> +    }
> +}
> +
> +// SAFETY: `DeviceId` is a `#[repr(transparent)]` wrapper of `i2c_device=
_id` and does not add
> +// additional invariants, so it's safe to transmute to `RawType`.
> +unsafe impl RawDeviceId for DeviceId {
> +    type RawType =3D bindings::i2c_device_id;
> +}
> +
> +// SAFETY: `DRIVER_DATA_OFFSET` is the offset to the `driver_data` field=
.
> +unsafe impl RawDeviceIdIndex for DeviceId {
> +    const DRIVER_DATA_OFFSET: usize =3D core::mem::offset_of!(bindings::=
i2c_device_id, driver_data);
> +
> +    fn index(&self) -> usize {
> +        self.0.driver_data as _

This cast shouldn't be needed.

> +    }
> +}
> +
> +/// IdTable type for I2C
> +pub type IdTable<T> =3D &'static dyn kernel::device_id::IdTable<DeviceId=
, T>;
> +
> +/// Create a I2C `IdTable` with its alias for modpost.
> +#[macro_export]
> +macro_rules! i2c_device_table {
> +    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $ta=
ble_data: expr) =3D> {
> +        const $table_name: $crate::device_id::IdArray<
> +            $crate::i2c::DeviceId,
> +            $id_info_type,
> +            { $table_data.len() },
> +        > =3D $crate::device_id::IdArray::new($table_data);
> +
> +        $crate::module_device_table!("i2c", $module_table_name, $table_n=
ame);
> +    };
> +}
> +
> +/// An adapter for the registration of I2C drivers.
> +pub struct Adapter<T: Driver>(T);
> +
> +// SAFETY: A call to `unregister` for a given instance of `RegType` is g=
uaranteed to be valid if
> +// a preceding call to `register` has been successful.
> +unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> =
{
> +    type RegType =3D bindings::i2c_driver;
> +
> +    unsafe fn register(
> +        pdrv: &Opaque<Self::RegType>,

Rather idrv or similar I think; same for various cases below.

> +        name: &'static CStr,
> +        module: &'static ThisModule,
> +    ) -> Result {
> +        let i2c_table =3D match T::I2C_ID_TABLE {
> +            Some(table) =3D> table.as_ptr(),
> +            None =3D> core::ptr::null(),
> +        };
> +
> +        let of_table =3D match T::OF_ID_TABLE {
> +            Some(table) =3D> table.as_ptr(),
> +            None =3D> core::ptr::null(),
> +        };
> +
> +        let acpi_table =3D match T::ACPI_ID_TABLE {
> +            Some(table) =3D> table.as_ptr(),
> +            None =3D> core::ptr::null(),
> +        };

I suppose other than platform drivers, I2C drivers can't match by name, hen=
ce I
think we should fail if none of the above is provided.

> +
> +        // SAFETY: It's safe to set the fields of `struct i2c_client` on=
 initialization.
> +        unsafe {
> +            (*pdrv.get()).driver.name =3D name.as_char_ptr();
> +            (*pdrv.get()).probe =3D Some(Self::probe_callback);
> +            (*pdrv.get()).remove =3D Some(Self::remove_callback);
> +            (*pdrv.get()).shutdown =3D Some(Self::shutdown_callback);
> +            (*pdrv.get()).id_table =3D i2c_table;
> +            (*pdrv.get()).driver.of_match_table =3D of_table;
> +            (*pdrv.get()).driver.acpi_match_table =3D acpi_table;
> +        }
> +
> +        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
> +        to_result(unsafe { bindings::i2c_register_driver(module.0, pdrv.=
get()) })
> +    }
> +
> +    unsafe fn unregister(pdrv: &Opaque<Self::RegType>) {
> +        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
> +        unsafe { bindings::i2c_del_driver(pdrv.get()) }
> +    }
> +}
> +
> +impl<T: Driver + 'static> Adapter<T> {
> +    extern "C" fn probe_callback(pdev: *mut bindings::i2c_client) -> ker=
nel::ffi::c_int {
> +        // SAFETY: The I2C bus only ever calls the probe callback with a=
 valid pointer to a
> +        // `struct i2c_client`.
> +        //
> +        // INVARIANT: `pdev` is valid for the duration of `probe_callbac=
k()`.
> +        let pdev =3D unsafe { &*pdev.cast::<Device<device::CoreInternal>=
>() };
> +
> +        let info =3D
> +            Self::i2c_id_info(pdev).or_else(|| <Self as driver::Adapter>=
::id_info(pdev.as_ref()));
> +
> +
> +        from_result(|| {
> +            let data =3D T::probe(pdev, info)?;
> +
> +            pdev.as_ref().set_drvdata(data);
> +            Ok(0)
> +        })
> +    }
> +
> +    extern "C" fn remove_callback(pdev: *mut bindings::i2c_client) {
> +        // SAFETY: `pdev` is a valid pointer to a `struct i2c_client`.
> +        let pdev =3D unsafe { &*pdev.cast::<Device<device::CoreInternal>=
>() };
> +
> +        // SAFETY: `remove_callback` is only ever called after a success=
ful call to
> +        // `probe_callback`, hence it's guaranteed that `Device::set_drv=
data()` has been called
> +        // and stored a `Pin<KBox<T>>`.
> +        drop(unsafe { pdev.as_ref().drvdata_obtain::<Pin<KBox<T>>>() });
> +    }
> +
> +    extern "C" fn shutdown_callback(pdev: *mut bindings::i2c_client) {
> +        let pdev =3D unsafe { &*pdev.cast::<Device<device::Core>>() };

Missing safety comment, please make sure to compile with CLIPPY=3D1. I thin=
k I
also saw some checkpatch.pl warnings.

> +
> +        T::shutdown(pdev);
> +    }
> +
> +    /// The [`i2c::IdTable`] of the corresponding driver.
> +    fn i2c_id_table() -> Option<IdTable<<Self as driver::Adapter>::IdInf=
o>> {
> +        T::I2C_ID_TABLE
> +    }
> +
> +    /// Returns the driver's private data from the matching entry in the=
 [`i2c::IdTable`], if any.
> +    ///
> +    /// If this returns `None`, it means there is no match with an entry=
 in the [`i2c::IdTable`].
> +    fn i2c_id_info(dev: &Device) -> Option<&'static <Self as driver::Ada=
pter>::IdInfo> {
> +        let table =3D Self::i2c_id_table()?;
> +
> +        // SAFETY:
> +        // - `table` has static lifetime, hence it's valid for read,
> +        // - `dev` is guaranteed to be valid while it's alive, and so is=
 `pdev.as_ref().as_raw()`.
> +        let raw_id =3D unsafe { bindings::i2c_match_id(table.as_ptr(), d=
ev.as_raw()) };
> +
> +        if raw_id.is_null() {
> +            None
> +        } else {
> +            // SAFETY: `DeviceId` is a `#[repr(transparent)` wrapper of =
`struct i2c_device_id` and
> +            // does not add additional invariants, so it's safe to trans=
mute.
> +            let id =3D unsafe { &*raw_id.cast::<DeviceId>() };
> +
> +            Some(table.info(<DeviceId as crate::device_id::RawDeviceIdIn=
dex>::index(id)))
> +        }
> +    }
> +}
> +
> +impl<T: Driver + 'static> driver::Adapter for Adapter<T> {
> +    type IdInfo =3D T::IdInfo;
> +
> +    fn of_id_table() -> Option<of::IdTable<Self::IdInfo>> {
> +        T::OF_ID_TABLE
> +    }
> +
> +    fn acpi_id_table() -> Option<acpi::IdTable<Self::IdInfo>> {
> +        T::ACPI_ID_TABLE
> +    }
> +}
> +
> +/// Declares a kernel module that exposes a single i2c driver.
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +/// kernel::module_i2c_driver! {
> +///     type: MyDriver,
> +///     name: "Module name",
> +///     authors: ["Author name"],
> +///     description: "Description",
> +///     license: "GPL v2",
> +/// }
> +/// ```
> +#[macro_export]
> +macro_rules! module_i2c_driver {
> +    ($($f:tt)*) =3D> {
> +        $crate::module_driver!(<T>, $crate::i2c::Adapter<T>, { $($f)* })=
;
> +    };
> +}
> +
> +/// The i2c driver trait.
> +///
> +/// Drivers must implement this trait in order to get a i2c driver regis=
tered.
> +///
> +/// # Example
> +///
> +///```
> +/// # use kernel::{acpi, bindings, c_str, device::Core, i2c, of};
> +///
> +/// struct MyDriver;
> +///
> +/// kernel::acpi_device_table!(
> +///     ACPI_TABLE,
> +///     MODULE_ACPI_TABLE,
> +///     <MyDriver as i2c::Driver>::IdInfo,
> +///     [
> +///         (acpi::DeviceId::new(c_str!("LNUXBEEF")), ())
> +///     ]
> +/// );
> +///
> +/// kernel::i2c_device_table!(
> +///     I2C_TABLE,
> +///     MODULE_I2C_TABLE,
> +///     <MyDriver as i2c::Driver>::IdInfo,
> +///     [
> +///          (i2c::DeviceId::new(c_str!("rust_driver_i2c")), ())
> +///     ]
> +/// );
> +///
> +/// kernel::of_device_table!(
> +///     OF_TABLE,
> +///     MODULE_OF_TABLE,
> +///     <MyDriver as i2c::Driver>::IdInfo,
> +///     [
> +///         (of::DeviceId::new(c_str!("test,device")), ())
> +///     ]
> +/// );
> +///
> +/// impl i2c::Driver for MyDriver {
> +///     type IdInfo =3D ();
> +///     const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> =3D Some(=
&I2C_TABLE);
> +///     const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> =3D Some(&O=
F_TABLE);
> +///     const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> =3D Som=
e(&ACPI_TABLE);
> +///
> +///     fn probe(
> +///         _pdev: &i2c::Device<Core>,
> +///         _id_info: Option<&Self::IdInfo>,
> +///     ) -> Result<Pin<KBox<Self>>> {
> +///         Err(ENODEV)
> +///     }
> +///
> +///     fn shutdown(_pdev: &i2c::Device<Core>) {
> +///     }
> +/// }
> +///```
> +pub trait Driver: Send {
> +    /// The type holding information about each device id supported by t=
he driver.
> +    // TODO: Use `associated_type_defaults` once stabilized:
> +    //
> +    // ```
> +    // type IdInfo: 'static =3D ();
> +    // ```
> +    type IdInfo: 'static;
> +
> +    /// The table of device ids supported by the driver.
> +    const I2C_ID_TABLE: Option<IdTable<Self::IdInfo>> =3D None;
> +
> +    /// The table of OF device ids supported by the driver.
> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> =3D None;
> +
> +    /// The table of ACPI device ids supported by the driver.
> +    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> =3D None;
> +
> +    /// I2C driver probe.
> +    ///
> +    /// Called when a new i2c device is added or discovered.
> +    /// Implementers should attempt to initialize the device here.
> +    fn probe(dev: &Device<device::Core>, id_info: Option<&Self::IdInfo>)
> +        -> Result<Pin<KBox<Self>>>;
> +
> +    /// I2C driver shutdown
> +    ///
> +    /// Called when

Yes? :)

> +    fn shutdown(dev: &Device<device::Core>) {
> +        let _ =3D dev;
> +    }
> +}
> +
> +/// The i2c client representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct i2c_c=
lient`. The
> +/// implementation abstracts the usage of an already existing C `struct =
i2c_client` within Rust
> +/// code that we get passed from the C side.
> +///
> +/// # Invariants
> +///
> +/// A [`Device`] instance represents a valid `struct i2c_client` created=
 by the C portion of
> +/// the kernel.
> +#[repr(transparent)]
> +pub struct Device<Ctx: device::DeviceContext =3D device::Normal>(
> +    Opaque<bindings::i2c_client>,
> +    PhantomData<Ctx>,
> +);
> +
> +impl<Ctx: device::DeviceContext> Device<Ctx> {
> +    fn as_raw(&self) -> *mut bindings::i2c_client {
> +        self.0.get()
> +    }
> +}
> +
> +// SAFETY: `Device` is a transparent wrapper of a type that doesn't depe=
nd on `Device`'s generic
> +// argument.
> +kernel::impl_device_context_deref!(unsafe { Device });
> +kernel::impl_device_context_into_aref!(Device);
> +
> +// SAFETY: Instances of `Device` are always reference-counted.
> +unsafe impl crate::types::AlwaysRefCounted for Device {
> +    fn inc_ref(&self) {
> +        // SAFETY: The existence of a shared reference guarantees that t=
he refcount is non-zero.
> +        unsafe { bindings::get_device(self.as_ref().as_raw()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The safety requirements guarantee that the refcount i=
s non-zero.
> +        unsafe { bindings::put_device(addr_of_mut!((*obj.as_ref().as_raw=
()).dev)) }

You can also use &raw mut.

> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<C=
tx> {
> +    fn as_ref(&self) -> &device::Device<Ctx> {
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a=
 pointer to a valid
> +        // `struct i2c_client`.
> +        let dev =3D unsafe { addr_of_mut!((*self.as_raw()).dev) };

Same here.

> +
> +        // SAFETY: `dev` points to a valid `struct device`.
> +        unsafe { device::Device::from_raw(dev) }
> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Devi=
ce<Ctx> {
> +    type Error =3D kernel::error::Error;
> +
> +    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> =
{
> +        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is =
a valid pointer to a
> +        // `struct device`.
> +        if unsafe { bindings::i2c_verify_client(dev.as_raw()).is_null() =
} {
> +            return Err(EINVAL);
> +        }
> +
> +        // SAFETY: We've just verified that the type of `dev` equals to
> +        // `bindings::i2c_client_type`, hence `dev` must be embedded in =
a valid
> +        // `struct i2c_client` as guaranteed by the corresponding C code=
.
> +        let pdev =3D unsafe { container_of!(dev.as_raw(), bindings::i2c_=
client, dev) };
> +
> +        // SAFETY: `pdev` is a valid pointer to a `struct i2c_client`.
> +        Ok(unsafe { &*pdev.cast() })
> +    }
> +}
> +
> +// SAFETY: A `Device` is always reference-counted and can be released fr=
om any thread.
> +unsafe impl Send for Device {}
> +
> +// SAFETY: `Device` can be shared among threads because all methods of `=
Device`
> +// (i.e. `Device<Normal>) are thread safe.
> +unsafe impl Sync for Device {}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index c2d1b9375205..0780c3e746fc 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -86,6 +86,8 @@
>  #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
>  pub mod firmware;
>  pub mod fs;
> +#[cfg(CONFIG_I2C =3D "y")]
> +pub mod i2c;
>  pub mod init;
>  pub mod io;
>  pub mod ioctl;
> --=20
> 2.43.0

