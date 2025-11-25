Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1691A231C91;
	Tue, 25 Nov 2025 19:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764100581; cv=pass; b=tHu2GURGxMb3c6iRUk/z7pWn5mF++2xWhw73GSOlPjDuJQtI195mlBVNchlR1SjO/y7+gcJC0ssRkdr8uyO7MJ3AR3v3t5fOE0xk6LfcoOrm8yuBNKIreAvUjxTSDXJZdjEOWkoTXdITBjfC1gfFN5zYk1cgTHTXKk/VhcSquDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764100581; c=relaxed/simple;
	bh=1+RcE95W4dAt9+ZbiWI3CqL3IhonstrpxspgkdcCCgA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=UK1/2vW4OHueOVL6kbxCWcnXOvq89WiLij2A409u8k/TyyYMJgr9VaWiHMIFvC6kg/zpFh0ZmlSvnbqX/Sw0S58aAKSmzlxDsAbSx0WUWQgdHgOzOysX1TGOtAQYTKd07zhgXrN+D7ES1S+Iaag/e4vDpYo6mEU2dY3HriZsOHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Nhz6oVEM; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Nhz6oVEM"
ARC-Seal: i=1; a=rsa-sha256; t=1764100551; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fbgQq0TkHDu9hMCb/+1VQgavMZHPjFvmgTYQ5JfJeeeq8F0trtT3wMzY2+kNguMuaNduiw+U2A1bNfKQswLAARbBvFYjZKj+W6n9dGSuDR6OYEz00NE2dhwVxbVVUeSb25cZoS/DpPrY0nyMfGA4fwexAQGb67KVN86Mim34KZs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764100551; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RR6a0lAAiqr4SvmPESDTuOinEgXrBkSfaL04R0jFQpM=; 
	b=m8wpiT23LiaDQV3KcLWm+j7ifHJw07VtE7rCkrfDzPQYXhigF5NrJBg4B3FrlkQTsAdyoqRclmZINKWIoV853n5s9gTaJbjeek0fnKJCQdn4ueWKbSmoDXOcJ44XgTGHr6AB//55LQldBV5cWpcThJiByfRfISkczqbss8u5ZbE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764100551;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=RR6a0lAAiqr4SvmPESDTuOinEgXrBkSfaL04R0jFQpM=;
	b=Nhz6oVEM/s6Gz7APh9L3DJohGLYreL5eR61/I3QYguO8ZBRthYTCTPXTz3hsdnQe
	e8sF1nWz6uZoaEACtDDnPdBs5fI1D/ygfaKhvmPAaYGubfOgJetunk3zy6WVnlQhqu9
	quwbHNtAWopZeeMwcNPVO865qRTJ/LuFKg2juR4U=
Received: by mx.zohomail.com with SMTPS id 1764100548428637.646508154793;
	Tue, 25 Nov 2025 11:55:48 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5] rust: add new macro for common bitmap operations
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251109-feat-add-bitmask-macro-v5-1-9d911b207ef4@gmail.com>
Date: Tue, 25 Nov 2025 16:55:32 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 felipe_life@live.com,
 linux-kernel@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <57A5C181-9D72-483C-BC7D-DCE744C508D1@collabora.com>
References: <20251109-feat-add-bitmask-macro-v5-1-9d911b207ef4@gmail.com>
To: Filipe Xavier <felipeaggger@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Filipe,

Thanks for working on this, this is much cleaner and will cut down on =
the
boilerplate. It works just fine on Tyr.


> On 9 Nov 2025, at 10:31, Filipe Xavier <felipeaggger@gmail.com> wrote:
>=20
> We have seen a proliferation of mod_whatever::foo::Flags
> being defined with essentially the same implementation
> for BitAnd, BitOr, contains and etc.
>=20
> This macro aims to bring a solution for this,
> allowing to generate these methods for user-defined structs.
> With some use cases in KMS and upcoming GPU drivers.
>=20
> Link: =
https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/=
We.20really.20need.20a.20common.20.60Flags.60.20type
> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Suggested-by: Lyude Paul <lyude@redhat.com>
> ---
> Changes in v5:
> - Docs: improve macro documentation.
> - Link to v4: =
https://lore.kernel.org/r/20251026-feat-add-bitmask-macro-v4-1-e1b59b4762b=
c@gmail.com
>=20
> Changes in v4:
> - Use enum: changed flag type from struct to enum.
> - Minor fix: airect casting (flag as $ty) instead of field access =
(.0).
> - Link to v3: =
https://lore.kernel.org/r/20250411-feat-add-bitmask-macro-v3-1-187bd3e4a03=
e@gmail.com
>=20
> Changes in v3:
> - New Feat: added support to declare flags inside macro use.
> - Minor fixes: used absolute paths to refer to items, fix rustdoc and =
fix example cases.
> - Link to v2: =
https://lore.kernel.org/r/20250325-feat-add-bitmask-macro-v2-1-d3beabdad90=
f@gmail.com
>=20
> Changes in v2:
> - rename: change macro and file name to impl_flags.
> - negation sign: change char for negation to `!`.=20
> - transpose docs: add support to transpose user provided docs.
> - visibility: add support to use user defined visibility.
> - operations: add new operations for flag,=20
> to support use between bit and bitmap, eg: flag & flags.
> - code style: small fixes to remove warnings.
> - Link to v1: =
https://lore.kernel.org/r/20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476=
b@gmail.com
> ---
> rust/kernel/impl_flags.rs | 229 =
++++++++++++++++++++++++++++++++++++++++++++++
> rust/kernel/lib.rs        |   2 +
> rust/kernel/prelude.rs    |   1 +
> 3 files changed, 232 insertions(+)
>=20
> diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
> new file mode 100644
> index =
0000000000000000000000000000000000000000..c1086677678408f46c4832e2110c761f=
ab017055
> --- /dev/null
> +++ b/rust/kernel/impl_flags.rs
> @@ -0,0 +1,229 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/// Common helper for declaring bitflag and bitmask types.
> +///
> +/// This macro handles:
> +/// - A struct representing a bitmask, and an enumerator representing =
bitflags which
> +/// may be used in the aforementioned bitmask.
> +/// - Implementations of common bitmap op. ([`::core::ops::BitOr`], =
[`::core::ops::BitAnd`], etc.).
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
> +/// let read_write: Permissions =3D Permission::Read | =
Permission::Write;
> +///
> +/// assert!(read_write.contains(Permission::Read));
> +/// assert!(read_write.contains(Permission::Write));
> +/// assert!(!read_write.contains(Permission::Execute));
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
> +            /// Returns an empty instance of `type` where no flags =
are set.
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

Please keep the current implementation but also provide a =
contains_any(flags: Flags)
and contains_all(flags: Flags) method so users don't have to manually =
do:

if flags.contains(flag1) || flags.contains(flag2) ... =
flags.contains(flagN), or:
if flags.contains(flag1) && flags.contains(flags2) .. etc

This is much faster:

if flags.contains_any(flag1 | flag2 | flagN), or:
if flags.contains_all(flag1 | flag2 | flagN)

With the small change above,

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

> +        }
> +    };
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index =
28007be98fbad0e875d7e5345e164e2af2c5da32..57b789315deda3d2fa8961af79cad446=
2fff7fa8 100644
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
> index =
baa774a351ceeb995a2a647f78a27b408d9f3834..085f23502544c80c2202eacd18ba1901=
86a74f30 100644
> --- a/rust/kernel/prelude.rs
> +++ b/rust/kernel/prelude.rs
> @@ -27,6 +27,7 @@
> #[doc(no_inline)]
> pub use super::dbg;
> pub use super::fmt;
> +pub use super::impl_flags;
> pub use super::{dev_alert, dev_crit, dev_dbg, dev_emerg, dev_err, =
dev_info, dev_notice, dev_warn};
> pub use super::{pr_alert, pr_crit, pr_debug, pr_emerg, pr_err, =
pr_info, pr_notice, pr_warn};
>=20
>=20
> ---
> base-commit: edc5e6e019c99b529b3d1f2801d5cce9924ae79b
> change-id: 20250304-feat-add-bitmask-macro-6424b1c317e2
>=20
> Best regards,
> --=20
> Filipe Xavier <felipeaggger@gmail.com>
>=20
>=20

=E2=80=94 Daniel=
