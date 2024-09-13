Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A271C2303
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 11:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726226826; cv=none; b=n5i349nZNUTrRKKNIKlPTRJbbwXOA3OfYbaxIWgfpiHm+5RJIZrtpJ/NBt23zSlTFskxtlsIZu6/uISOJL/9r+7e2y9QvUYNSEjHjt6I0C33xKS9cgFPecKxpSzn5g6k8tCN3y72UDpITSKdo5EHLhZ7fQkvYxHbEoHDuTb11bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726226826; c=relaxed/simple;
	bh=ky0TdyIyrVFxc3aAAZuvBkWqkIGTHJbsgch9DPlIP/8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fjxcsD7+c+yB5e35q9m3Tc4xH9S01gijD9yaxrborDgUBc3AaAzvtFKZa67w1Lf0R9uU773x3s+boBv1GwocCeKcNZpJgfjs7d21SIVRV3gvqI0iV0yrcXGL19JGYVLOt/67XG5BS14BgU33l6dIIbWiSa4cim7kOvymMJv7B0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=NwGWk3B3; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="NwGWk3B3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=mymo6dm3fnenhlki4virglchpi.protonmail; t=1726226820; x=1726486020;
	bh=sqN1ZjDR1QCOKea2Iu3vGUK5jUJjmnFVBK2O4w9EBYI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NwGWk3B37SKG1/9akNFyZWPZVv+4IXTCqM5VZsCRB8YmExUyzUF7d119Oc29srTAu
	 cYWdQVB9LY11wGNcaYvhM9IyQCW0wCSdSxDpHqW9rTO3VAPjBFQ+RNUWTqYPX8B1yt
	 z6BPAj+Um6ZwuR8gzEJBMKwC2xWq6eIREfkoXg2dMnqRleFpaKtuUDrHx1zuwanKz7
	 ZNUYciHEWKwxlnomEnvBqCKT0odgaI4HoQmh+dVVjUeGgi4ugHUPorGmIJHZXLQ89Z
	 R8IF/9GSti8Kn12kq7l/jjRJH76gZvVw53iZSIMsi1xVcosI5/mpPb0VAtVhVRgMXg
	 KRbZ3cbwi9mAA==
Date: Fri, 13 Sep 2024 11:26:57 +0000
To: Greg KH <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] rust: add untrusted data abstraction
Message-ID: <20240913112643.542914-2-benno.lossin@proton.me>
In-Reply-To: <20240913112643.542914-1-benno.lossin@proton.me>
References: <20240913112643.542914-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 595c738b00e228be66972e6b60c691bd5c438429
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When reading data from userspace, hardware or other external untrusted
sources, the data must be validated before it is used for logic within
the kernel. This abstraction provides a generic newtype wrapper that
prevents direct access to the inner type. It does allow access through
the `untrusted()` method, but that should be a telltale sign to
reviewers that untrusted data is being used at that point.

Any API that reads data from an untrusted source should return
`Untrusted<T>` where `T` is the type of the underlying untrusted data.
This generic allows other abstractions to return their custom type
wrapped by `Untrusted`, signaling to the caller that the data must be
validated before use. This allows those abstractions to be used both in
a trusted and untrusted manner, increasing their generality.
Additionally, using the arbitrary self types feature, APIs can be
designed to explicitly read untrusted data:

    impl MyCustomDataSource {
        pub fn read(self: &Untrusted<Self>) -> &Untrusted<[u8]>;
    }

To validate data, the `Validator` trait is introduced, readers of
untrusted data should implement it for their type and move all of their
validation and parsing logic into its `validate` function. That way
reviewers and later contributors have a central location to consult for
data validation.

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/kernel/types.rs | 248 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 247 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 9e7ca066355c..20ef04b1b417 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -8,9 +8,10 @@
     cell::UnsafeCell,
     marker::{PhantomData, PhantomPinned},
     mem::{ManuallyDrop, MaybeUninit},
-    ops::{Deref, DerefMut},
+    ops::{Deref, DerefMut, Index},
     pin::Pin,
     ptr::NonNull,
+    slice::SliceIndex,
 };
=20
 /// Used to transfer ownership to and from foreign (non-Rust) languages.
@@ -532,3 +533,248 @@ unsafe impl AsBytes for str {}
 // does not have any uninitialized portions either.
 unsafe impl<T: AsBytes> AsBytes for [T] {}
 unsafe impl<T: AsBytes, const N: usize> AsBytes for [T; N] {}
+
+/// Untrusted data of type `T`.
+///
+/// When reading data from userspace, hardware or other external untrusted=
 sources, the data must
+/// be validated before it is used for logic within the kernel. To do so, =
the [`validate()`]
+/// function exists and uses the [`Validator`] trait. For raw bytes valida=
tion there also is the
+/// [`validate_bytes()`] function.
+///
+///
+/// [`validate()`]: Self::validate
+/// [`validate_bytes()`]: Self::validate_bytes
+#[repr(transparent)]
+pub struct Untrusted<T: ?Sized>(T);
+
+impl<T: ?Sized> Untrusted<T> {
+    /// Marks the given value as untrusted.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # mod bindings { unsafe fn read_foo_info() -> [u8; 4] { todo!() } =
};
+    /// fn read_foo_info() -> Untrusted<[u8; 4]> {
+    ///     // SAFETY: just an FFI call without preconditions.
+    ///     Untrusted::new_untrusted(unsafe { bindings::read_foo_info() })
+    /// }
+    /// ```
+    pub fn new_untrusted(value: T) -> Self
+    where
+        T: Sized,
+    {
+        Self(value)
+    }
+
+    /// Marks the value behind the reference as untrusted.
+    ///
+    /// # Examples
+    ///
+    /// In this imaginary example there exists the `foo_hardware` struct o=
n the C side, as well as
+    /// a `foo_hardware_read` function that reads some data directly from =
the hardware.
+    /// ```
+    /// # mod bindings { struct foo_hardware; unsafe fn foo_hardware_read(=
_foo: *mut Foo, _len: &mut usize) -> *mut u8 { todo!() } };
+    /// struct Foo(Opaque<bindings::foo_hardware>);
+    ///
+    /// impl Foo {
+    ///     pub fn read(&mut self, mut len: usize) -> Result<&Untrusted<[u=
8]>> {
+    ///         // SAFETY: just an FFI call without preconditions.
+    ///         let data: *mut u8 =3D unsafe { bindings::foo_hardware_read=
(self.0.get(), &mut len) };
+    ///         let data =3D error::from_err_ptr(data)?;
+    ///         let data =3D ptr::slice_from_raw_parts(data, len);
+    ///         // SAFETY: `data` returned by `foo_hardware_read` is valid=
 for reads as long as the
+    ///         // `foo_hardware` object exists. That function updated the
+    ///         let data =3D unsafe { &*data };
+    ///         Ok(Untrusted::new_untrusted_ref(data))
+    ///     }
+    /// }
+    /// ```
+    pub fn new_untrusted_ref<'a>(value: &'a T) -> &'a Self {
+        let ptr: *const T =3D value;
+        // CAST: `Self` is `repr(transparent)` and contains a `T`.
+        let ptr =3D ptr as *const Self;
+        // SAFETY: `ptr` came from a shared reference valid for `'a`.
+        unsafe { &*ptr }
+    }
+
+    /// Gives direct access to the underlying untrusted data.
+    ///
+    /// Be careful when accessing the data, as it is untrusted and still n=
eeds to be verified! To
+    /// do so use [`validate()`].
+    ///
+    /// [`validate()`]: Self::validate
+    pub fn untrusted(&self) -> &T {
+        &self.0
+    }
+
+    /// Gives direct access to the underlying untrusted data.
+    ///
+    /// Be careful when accessing the data, as it is untrusted and still n=
eeds to be verified! To
+    /// do so use [`validate()`].
+    ///
+    /// [`validate()`]: Self::validate
+    pub fn untrusted_mut(&mut self) -> &mut T {
+        &mut self.0
+    }
+
+    /// Unwraps the data and removes the untrusted marking.
+    ///
+    /// Be careful when accessing the data, as it is untrusted and still n=
eeds to be verified! To
+    /// do so use [`validate()`].
+    ///
+    /// [`validate()`]: Self::validate
+    pub fn into_inner_untrusted(self) -> T
+    where
+        T: Sized,
+    {
+        self.0
+    }
+
+    /// Dereferences the underlying untrusted data.
+    ///
+    /// Often, untrusted data is not directly exposed as bytes, but rather=
 as a reader that can
+    /// give you access to raw bytes. When such a type implements [`Deref`=
], then this function
+    /// allows you to get access to the underlying data.
+    pub fn deref(&self) -> &Untrusted<<T as Deref>::Target>
+    where
+        T: Deref,
+    {
+        Untrusted::new_untrusted_ref(self.0.deref())
+    }
+
+    /// Validates and parses the untrusted data.
+    ///
+    /// See the [`Validator`] trait on how to implement it.
+    pub fn validate<V: Validator<Input =3D T>>(&self) -> Result<V::Output,=
 V::Err> {
+        V::validate(self)
+    }
+}
+
+impl Untrusted<[u8]> {
+    /// Validate the given bytes directly.
+    ///
+    /// This is a convenience method to not have to implement the [`Valida=
tor`] trait to be able to
+    /// just parse some bytes. If the bytes that you are validating have s=
ome structure and/or you
+    /// will parse it into a `struct` or other rust type, then it is very =
much recommended to use
+    /// the [`Validator`] trait and the [`validate()`] function instead.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # fn get_untrusted_data() -> &'static Untrusted<[u8]> { &[0; 8] }
+    ///
+    /// let data: &Untrusted<[u8]> =3D get_untrusted_data();
+    /// let data: Result<&[u8], ()> =3D data.validate_bytes::<()>(|untrust=
ed| {
+    ///     if untrusted.len() !=3D 2 {
+    ///         return Err(());
+    ///     }
+    ///     if untrusted[0] & 0xf0 !=3D 0 {
+    ///         return Err(());
+    ///     }
+    ///     if untrusted[1] >=3D 100 {
+    ///         return Err(());
+    ///     }
+    ///     Ok(())
+    /// });
+    /// match data {
+    ///     Ok(data) =3D> pr_info!("successfully validated the data: {data=
}"),
+    ///     Err(()) =3D> pr_info!("read faulty data from hardware!"),
+    /// }
+    /// ```
+    ///
+    /// [`validate()`]: Self::validate
+    pub fn validate_bytes<E>(
+        &self,
+        validator: impl FnOnce(&[u8]) -> Result<(), E>,
+    ) -> Result<&[u8], E> {
+        let raw_data =3D self.untrusted();
+        validator(raw_data).map(|()| raw_data)
+    }
+}
+
+impl<T, I> Index<I> for Untrusted<[T]>
+where
+    I: SliceIndex<[T]>,
+{
+    type Output =3D Untrusted<I::Output>;
+
+    fn index(&self, index: I) -> &Self::Output {
+        Untrusted::new_untrusted_ref(self.0.index(index))
+    }
+}
+
+impl<T> Untrusted<[T]> {
+    /// Gets the length of the underlying untrusted slice.
+    pub fn len(&self) -> usize {
+        self.0.len()
+    }
+}
+
+/// Validates untrusted data.
+///
+/// # Examples
+///
+/// ## Using an API returning untrusted data
+///
+/// Create the type of the data that you want to parse:
+///
+/// ```
+/// pub struct FooData {
+///     data: [u8; 4],
+/// }
+/// ```
+///
+/// Then implement this trait:
+///
+/// ```
+/// use kernel::types::{Untrusted, Validator};
+/// # pub struct FooData {
+/// #     data: [u8; 4],
+/// # }
+/// impl Validator for FooData {
+///     type Input =3D [u8];
+///     type Output =3D FooData;
+///     type Err =3D Error;
+///
+///     fn validate(untrusted: &Untrusted<Self::Input>) -> Result<Self::Ou=
tput, Self::Err> {
+///         let untrusted =3D untrusted.untrusted();
+///         let untrusted =3D <[u8; 4]>::try_from(untrusted);
+///         for byte in &untrusted {
+///             if byte & 0xf0 !=3D 0 {
+///                 return Err(());
+///             }
+///         }
+///         Ok(FooData { data: untrusted })
+///     }
+/// }
+/// ```
+///
+/// And then use the API that returns untrusted data:
+///
+/// ```ignore
+/// let result =3D get_untrusted_data().validate::<FooData>();
+/// ```
+///
+/// ## Creating an API returning untrusted data
+///
+/// In your API instead of just returning the untrusted data, wrap it in [=
`Untrusted<T>`]:
+///
+/// ```
+/// pub fn get_untrusted_data(&self) -> &Untrusted<[u8]> {
+///     todo!()
+/// }
+/// ```
+pub trait Validator {
+    /// Type of the input data that is untrusted.
+    type Input: ?Sized;
+    /// Type of the validated data.
+    type Output;
+    /// Validation error.
+    type Err;
+
+    /// Validate the given untrusted data and parse it into the output typ=
e.
+    ///
+    /// When implementing this function, you can use [`Untrusted::untruste=
d()`] to get access to
+    /// the raw untrusted data.
+    fn validate(untrusted: &Untrusted<Self::Input>) -> Result<Self::Output=
, Self::Err>;
+}
--=20
2.46.0


