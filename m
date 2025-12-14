Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B9C42A96;
	Sun, 14 Dec 2025 03:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765684482; cv=pass; b=Mt9U2ZeSbSg8MSt4Mi3nS2VwBXey4bQO70mvcxWO5KhGM1qN71bi2rSrXRd4r3MWW3D85XBjM6LDkQi1UVKztat3GjHzNvEpqslWbgEPoWYWE6I/sxw90PgY53nblEW+cfs95mDlSNSvrJha5TaPzkTe9tC6qFCthLCYDtzcaX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765684482; c=relaxed/simple;
	bh=6cWGj4q2neIutjDzzG/DV6nR7p9IF6CuM0bfwsnHaX4=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=JXt8pNfC0LTH1kdn/oSrUdofufiYufl28FSAscs1s38JU+DQvgaByTAHDHye2/z5C6s5ovznLfPZsHTGnHGDx2b0gJOf9LU85M6ySGHSMJebIkjJhUCyu0gqwcoFGZ+Ll3xMWUiAMuUbgbah3eS8clfuTCmxCghEsEmiQWELO+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=CXQjViEf; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="CXQjViEf"
ARC-Seal: i=1; a=rsa-sha256; t=1765684457; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eMTP26ka7lDFFLe8Pyw8Gh7DlXI3olFDUOc/GGeyZuJu3PbQROk2rc5aVsCxyu00GNreLLLlwdwc9JlV/3nESYk3tg+0MYT1yLqKMHv03J+ZEHMARRwduxjCErMXKINKtbdzwZB6eS2o0GkB3nF1EQ6ajFzPt18eUS/6yE7LHpI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765684457; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=e1FPzZm4Ncg3Qj4Khmok/ITQnC1YEtxlHeL0FAStxNI=; 
	b=exzr3Np+f3iQ2JQt5far1/4WYBW93zaOFNSaDj0KlS8DrtCZ1b8pydiBsPijGBRxJcTsj3Qycqz+JKh2LGvvz4GiRMBMkEn0f2bvQTFqX0vIuvHCKhakq2R8ColKtdiqin7Jnlqt8iWRCLb1MFlgTGqTp0QAe4N5M1yH7UnJOIU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765684457;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:Cc:Cc:In-Reply-To:To:To:Reply-To;
	bh=e1FPzZm4Ncg3Qj4Khmok/ITQnC1YEtxlHeL0FAStxNI=;
	b=CXQjViEfLSz5SWo82OpTGgeMLq8Y7IyTlAZMjDxq8ZPoMtDgNkmu/Unr1uLWDrcb
	ZzziwmGzevBQXs1Y8hbbctZ15zqXsBU4TNGA8VrFdqKlqPeYAUHFK14z6yN7M2OSWda
	HYkJrv5BY0JC7PytgmxQmaWnCo/k2YE4/SgSvt64=
Received: by mx.zohomail.com with SMTPS id 1765684454684677.8045498874963;
	Sat, 13 Dec 2025 19:54:14 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Daniel Almeida <daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v6] rust: add new macro for common bitmap operations
Date: Sun, 14 Dec 2025 12:53:59 +0900
Message-Id: <60442AD3-C98A-4643-840E-43C20919B34C@collabora.com>
References: <20251205-feat-add-bitmask-macro-v6-1-31fbbf14b15a@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 felipe_life@live.com, linux-kernel@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>, Filipe Xavier <felipeaggger@gmail.com>
In-Reply-To: <20251205-feat-add-bitmask-macro-v6-1-31fbbf14b15a@gmail.com>
To: Filipe Xavier <felipeaggger@gmail.com>
X-Mailer: iPhone Mail (23C55)
X-ZohoMailClient: External




> On 5 Dec 2025, at 19:16, Filipe Xavier <felipeaggger@gmail.com> wrote:
>=20
> =EF=BB=BFWe have seen a proliferation of mod_whatever::foo::Flags
> being defined with essentially the same implementation
> for BitAnd, BitOr, contains and etc.
>=20
> This macro aims to bring a solution for this,
> allowing to generate these methods for user-defined structs.
> With some use cases in KMS and upcoming GPU drivers.
>=20
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/=
topic/We.20really.20need.20a.20common.20.60Flags.60.20type
> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Suggested-by: Lyude Paul <lyude@redhat.com>
> ---
> Changes in v6:
> - New methods: add new methods contains_any and contains_all.
> - Link to v5: https://lore.kernel.org/r/20251109-feat-add-bitmask-macro-v5=
-1-9d911b207ef4@gmail.com
>=20
> Changes in v5:
> - Docs: improve macro documentation.
> - Link to v4: https://lore.kernel.org/r/20251026-feat-add-bitmask-macro-v4=
-1-e1b59b4762bc@gmail.com
>=20
> Changes in v4:
> - Use enum: changed flag type from struct to enum.
> - Minor fix: airect casting (flag as $ty) instead of field access (.0).
> - Link to v3: https://lore.kernel.org/r/20250411-feat-add-bitmask-macro-v3=
-1-187bd3e4a03e@gmail.com
>=20
> Changes in v3:
> - New Feat: added support to declare flags inside macro use.
> - Minor fixes: used absolute paths to refer to items, fix rustdoc and fix e=
xample cases.
> - Link to v2: https://lore.kernel.org/r/20250325-feat-add-bitmask-macro-v2=
-1-d3beabdad90f@gmail.com
>=20
> Changes in v2:
> - rename: change macro and file name to impl_flags.
> - negation sign: change char for negation to `!`.
> - transpose docs: add support to transpose user provided docs.
> - visibility: add support to use user defined visibility.
> - operations: add new operations for flag,
> to support use between bit and bitmap, eg: flag & flags.
> - code style: small fixes to remove warnings.
> - Link to v1: https://lore.kernel.org/r/20250304-feat-add-bitmask-macro-v1=
-1-1c2d2bcb476b@gmail.com
> ---
> rust/kernel/impl_flags.rs | 243 ++++++++++++++++++++++++++++++++++++++++++=
++++
> rust/kernel/lib.rs        |   2 +
> rust/kernel/prelude.rs    |   1 +
> 3 files changed, 246 insertions(+)
>=20
> diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..aff6f14bc2f6097e78ba21bb13=
d124ff999b376a
> --- /dev/null
> +++ b/rust/kernel/impl_flags.rs
> @@ -0,0 +1,243 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/// Common helper for declaring bitflag and bitmask types.
> +///
> +/// This macro handles:
> +/// - A struct representing a bitmask, and an enumerator representing bit=
flags which
> +/// may be used in the aforementioned bitmask.
> +/// - Implementations of common bitmap op. ([`::core::ops::BitOr`], [`::c=
ore::ops::BitAnd`], etc.).
> +/// - Utility methods such as `.contains()` to check flags.
> +///
> +/// # Examples
> +///
> +/// Defining and using impl_flags:
> +///
> +/// ```
> +/// use kernel::impl_flags;
> +///
> +/// impl_flags!(
> +///     /// Represents multiple permissions.
> +///     #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
> +///     pub struct Permissions(u32);
> +///     /// Represents a single permission.
> +///     #[derive(Debug, Clone, Copy, PartialEq, Eq)]
> +///     pub enum Permission {
> +///         Read    =3D 1 << 0,
> +///         Write   =3D 1 << 1,
> +///         Execute =3D 1 << 2,
> +///     }
> +/// );
> +///
> +/// // Combine multiple permissions using operation OR (`|`).
> +/// let read_write: Permissions =3D Permission::Read | Permission::Write;=

> +///
> +/// assert!(read_write.contains(Permission::Read));
> +/// assert!(read_write.contains(Permission::Write));
> +/// assert!(!read_write.contains(Permission::Execute));
> +/// assert!(read_write.contains_any(Permission::Read | Permission::Execut=
e));
> +/// assert!(read_write.contains_all(Permission::Read | Permission::Write)=
);
> +///
> +/// // Removing a permission with operation AND (`&`).
> +/// let read_only: Permissions =3D read_write & Permission::Read;
> +/// assert!(read_only.contains(Permission::Read));
> +/// assert!(!read_only.contains(Permission::Write));
> +///
> +/// // Toggling permissions with XOR (`^`).
> +/// let toggled: Permissions =3D read_only ^ Permission::Read;
> +/// assert!(!toggled.contains(Permission::Read));
> +///
> +/// // Inverting permissions with negation (`!`).
> +/// let negated =3D !read_only;
> +/// assert!(negated.contains(Permission::Write));
> +/// ```
> +#[macro_export]
> +macro_rules! impl_flags {
> +    (
> +        $(#[$outer_flags:meta])*
> +        $vis_flags:vis struct $flags:ident($ty:ty);
> +
> +        $(#[$outer_flag:meta])*
> +        $vis_flag:vis enum $flag:ident {
> +            $(
> +                $(#[$inner_flag:meta])*
> +                $name:ident =3D $value:expr
> +            ),+ $( , )?
> +        }
> +    ) =3D> {
> +        $(#[$outer_flags])*
> +        #[repr(transparent)]
> +        $vis_flags struct $flags($ty);
> +
> +        $(#[$outer_flag])*
> +        #[repr($ty)]
> +        $vis_flag enum $flag {
> +            $(
> +                $(#[$inner_flag])*
> +                $name =3D $value
> +            ),+
> +        }
> +
> +        impl ::core::convert::From<$flag> for $flags {
> +            #[inline]
> +            fn from(value: $flag) -> Self {
> +                Self(value as $ty)
> +            }
> +        }
> +
> +        impl ::core::convert::From<$flags> for $ty {
> +            #[inline]
> +            fn from(value: $flags) -> Self {
> +                value.0
> +            }
> +        }
> +
> +        impl ::core::ops::BitOr for $flags {
> +            type Output =3D Self;
> +            #[inline]
> +            fn bitor(self, rhs: Self) -> Self::Output {
> +                Self(self.0 | rhs.0)
> +            }
> +        }
> +
> +        impl ::core::ops::BitOrAssign for $flags {
> +            #[inline]
> +            fn bitor_assign(&mut self, rhs: Self) {
> +                *self =3D *self | rhs;
> +            }
> +        }
> +
> +        impl ::core::ops::BitAnd for $flags {
> +            type Output =3D Self;
> +            #[inline]
> +            fn bitand(self, rhs: Self) -> Self::Output {
> +                Self(self.0 & rhs.0)
> +            }
> +        }
> +
> +        impl ::core::ops::BitAndAssign for $flags {
> +            #[inline]
> +            fn bitand_assign(&mut self, rhs: Self) {
> +                *self =3D *self & rhs;
> +            }
> +        }
> +
> +        impl ::core::ops::BitOr<$flag> for $flags {
> +            type Output =3D Self;
> +            #[inline]
> +            fn bitor(self, rhs: $flag) -> Self::Output {
> +                self | Self::from(rhs)
> +            }
> +        }
> +
> +        impl ::core::ops::BitOrAssign<$flag> for $flags {
> +            #[inline]
> +            fn bitor_assign(&mut self, rhs: $flag) {
> +                *self =3D *self | rhs;
> +            }
> +        }
> +
> +        impl ::core::ops::BitAnd<$flag> for $flags {
> +            type Output =3D Self;
> +            #[inline]
> +            fn bitand(self, rhs: $flag) -> Self::Output {
> +                self & Self::from(rhs)
> +            }
> +        }
> +
> +        impl ::core::ops::BitAndAssign<$flag> for $flags {
> +            #[inline]
> +            fn bitand_assign(&mut self, rhs: $flag) {
> +                *self =3D *self & rhs;
> +            }
> +        }
> +
> +        impl ::core::ops::BitXor for $flags {
> +            type Output =3D Self;
> +            #[inline]
> +            fn bitxor(self, rhs: Self) -> Self::Output {
> +                Self(self.0 ^ rhs.0)
> +            }
> +        }
> +
> +        impl ::core::ops::BitXorAssign for $flags {
> +            #[inline]
> +            fn bitxor_assign(&mut self, rhs: Self) {
> +                *self =3D *self ^ rhs;
> +            }
> +        }
> +
> +        impl ::core::ops::Not for $flags {
> +            type Output =3D Self;
> +            #[inline]
> +            fn not(self) -> Self::Output {
> +                Self(!self.0)
> +            }
> +        }
> +
> +        impl ::core::ops::BitOr for $flag {
> +            type Output =3D $flags;
> +            #[inline]
> +            fn bitor(self, rhs: Self) -> Self::Output {
> +                $flags(self as $ty | rhs as $ty)
> +            }
> +        }
> +
> +        impl ::core::ops::BitAnd for $flag {
> +            type Output =3D $flags;
> +            #[inline]
> +            fn bitand(self, rhs: Self) -> Self::Output {
> +                $flags(self as $ty & rhs as $ty)
> +            }
> +        }
> +
> +        impl ::core::ops::BitXor for $flag {
> +            type Output =3D $flags;
> +            #[inline]
> +            fn bitxor(self, rhs: Self) -> Self::Output {
> +                $flags(self as $ty ^ rhs as $ty)
> +            }
> +        }
> +
> +        impl ::core::ops::Not for $flag {
> +            type Output =3D $flags;
> +            #[inline]
> +            fn not(self) -> Self::Output {
> +                $flags(!(self as $ty))
> +            }
> +        }
> +
> +        impl ::core::ops::BitXor<$flag> for $flags {
> +            type Output =3D Self;
> +            #[inline]
> +            fn bitxor(self, rhs: $flag) -> Self::Output {
> +                self ^ Self::from(rhs)
> +            }
> +        }
> +
> +        impl $flags {
> +            /// Returns an empty instance of `type` where no flags are se=
t.
> +            #[inline]
> +            pub const fn empty() -> Self {
> +                Self(0)
> +            }
> +
> +            /// Checks if a specific flag is set.
> +            #[inline]
> +            pub fn contains(self, flag: $flag) -> bool {
> +                (self.0 & flag as $ty) =3D=3D flag as $ty
> +            }
> +
> +            /// Checks if at least one of the provided flags is set.
> +            #[inline]
> +            pub fn contains_any(self, flags: $flags) -> bool {
> +                (self.0 & flags.0) !=3D 0
> +            }
> +
> +            /// Checks if all of the provided flags are set.
> +            #[inline]
> +            pub fn contains_all(self, flags: $flags) -> bool {
> +                (self.0 & flags.0) =3D=3D flags.0
> +            }
> +        }
> +    };
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 28007be98fbad0e875d7e5345e164e2af2c5da32..57b789315deda3d2fa8961af79=
cad4462fff7fa8 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -67,6 +67,8 @@
> #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
> pub mod firmware;
> pub mod fs;
> +#[doc(hidden)]
> +pub mod impl_flags;
> pub mod init;
> pub mod io;
> pub mod ioctl;
> diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> index baa774a351ceeb995a2a647f78a27b408d9f3834..085f23502544c80c2202eacd18=
ba190186a74f30 100644
> --- a/rust/kernel/prelude.rs
> +++ b/rust/kernel/prelude.rs
> @@ -27,6 +27,7 @@
> #[doc(no_inline)]
> pub use super::dbg;
> pub use super::fmt;
> +pub use super::impl_flags;
> pub use super::{dev_alert, dev_crit, dev_dbg, dev_emerg, dev_err, dev_info=
, dev_notice, dev_warn};
> pub use super::{pr_alert, pr_crit, pr_debug, pr_emerg, pr_err, pr_info, pr=
_notice, pr_warn};
>=20
>=20
> ---
> base-commit: edc5e6e019c99b529b3d1f2801d5cce9924ae79b
> change-id: 20250304-feat-add-bitmask-macro-6424b1c317e2
>=20
> Best regards,
> --
> Filipe Xavier <felipeaggger@gmail.com>
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

Lyude, IIUC you were happy with the previous version already? Can you apply o=
n the rust drm branch? The first users will most likely be the GPU drivers s=
o it makes sense to get it there.

=E2=80=94Daniel=

