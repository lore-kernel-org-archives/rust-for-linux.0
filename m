Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9D82F44
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Oct 2024 02:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727836136; cv=none; b=QZmFDr23tphQB+L2TrDcRCQj9qcUvcgz/0S7EP7Pn1VUZ4nPP5p/V1DHA8OqIjfYIx2UCnIhhlbvxq9kM9iaJS83WkbM4aDoDGkcmqjoBx018HKaMGSr2sx/VHloJ9voHn3v1NeTTajNM842UasNg8k3hj4bp8ehFHatYgyc6nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727836136; c=relaxed/simple;
	bh=WZf5sN/WQKskdtb8AJdISQGWX3yMwPGgium2PUAU77g=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mQt/skFMBhYCPXfKatuoS4JOEWym10eb7gNzvQ4z7bj4Y391ZtFQZzHc0ukKPbHg1xIb2u5trCUce8WW6ol/ot6sWC65uW8P/Gs2jN+yM4Z3eN7f5r65N0Nw4QFa6Tq6/PPsC48nHNbgNs3mcaWwLHHSln2W2j4U9JD0tof4VmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=VnR6s7iz; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="VnR6s7iz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1727836132; x=1728095332;
	bh=KBGWDqFgO70YMuq2MQkivUcqJyC4Hn0Tv20HjEnAjHU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VnR6s7izLNZOMJh8LzBtNPNMJu+0WvAqrDbYYfNACbCK/FyojvaMBvt90JRGjmUTF
	 tI7H40fJeXxDKvJcUdMWF6R8iyI3ZA++DzwfKiX3M0b4KvrqGjGJtz589wlO4nXl8W
	 p3QxUmm7crg+6CN+1TBqSweoSXnZAJkX8n9iRlJK7vGX9UsS9EOlae3gfrIb3sgqsE
	 2Jb+6AxRjQlWLb+dNti73VrpKfI8z35jEvN+Fsd2lzFDnL3vgmRgtb6M5j3lkFGrvk
	 O4+u5SGXJ7gPjireX5szcV7gH/ZXMDGyGChSFncNRJ4/ZPx5/epatYyC6BaA2KIOAI
	 6b8lQt0LuISdQ==
Date: Wed, 02 Oct 2024 02:28:48 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
From: Patrick Miller <paddymills@proton.me>
Cc: Patrick Miller <paddymills@proton.me>
Subject: [PATCH v5 1/2] docs: rust: make section names plural
Message-ID: <20241002022749.390836-1-paddymills@proton.me>
Feedback-ID: 45271957:user:proton
X-Pm-Message-ID: cc372f466e477aedaa985a1766d1317f7afc919e
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------48448c36b2b2cb915c726d5e1c290852645cd300b290d3fdf1c45c0165a1ba7d"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------48448c36b2b2cb915c726d5e1c290852645cd300b290d3fdf1c45c0165a1ba7d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: Patrick Miller <paddymills@proton.me>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Miller <paddymills@proton.me>
Subject: [PATCH v5 1/2] docs: rust: make section names plural
Date: Tue,  1 Oct 2024 22:27:47 -0400
Message-ID: <20241002022749.390836-1-paddymills@proton.me>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0

Fixes existing rust documentation section headers to be use plural names.

Signed-off-by: Patrick Miller <paddymills@proton.me>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1110
---
 rust/kernel/init.rs     | 2 +-
 rust/kernel/list/arc.rs | 2 +-
 rust/kernel/sync/arc.rs | 2 +-
 rust/macros/lib.rs      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index a17ac8762d8f..98889ddf9828 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -746,7 +746,7 @@ macro_rules! try_init {
 /// Asserts that a field on a struct using `#[pin_data]` is marked with `#[pin]` ie. that it is
 /// structurally pinned.
 ///
-/// # Example
+/// # Examples
 ///
 /// This will succeed:
 /// ```
diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index d801b9dc6291..611ce07cd290 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -4
64,7 +464,7 @@ impl<T, U, const ID: u64> core::ops::DispatchFromDyn<ListArc<U, ID>> for ListArc
 
 /// A utility for tracking whether a [`ListArc`] exists using an atomic.
 ///
-/// # Invariant
+/// # Invariants
 ///
 /// If the boolean is `false`, then there is no [`ListArc`] for this value.
 #[repr(transparent)]
diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 3021f30fd822..3d3c100b0c0d 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -436,7 +436,7 @@ fn from(item: Pin<UniqueArc<T>>) -> Self {
 /// There are no mutable references to the underlying [`Arc`], and it remains valid for the
 /// lifetime of the [`ArcBorrow`] instance.
 ///
-/// # Example
+/// # Examples
 ///
 /// ```
 /// use kernel::sync::{Arc, ArcBorrow};
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index a626b1145e5c..3879e1162866 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -307,7 +307,7 @@ pub fn pinned_drop(args: TokenStream, in
put: TokenStream) -> TokenStream {
 /// literals (lifetimes and documentation strings are not supported). There is a difference in
 /// supported modifiers as well.
 ///
-/// # Example
+/// # Examples
 ///
 /// ```ignore
 /// use kernel::macro::paste;
-- 
2.46.2


--------48448c36b2b2cb915c726d5e1c290852645cd300b290d3fdf1c45c0165a1ba7d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYIACcFAmb8r+AJEJtRGrsur54RFiEE3KdIkSvUnCve801mm1Eauy6v
nhEAAA1HAQDi+7Cl9x54SDjA1dSCZ5/DMS3Rtu9UDXI7J0Mjhu0HeAD/d42T
4/k/+HWQav5UaHndaWS9pJm5sY4IV1IQcPvIXwU=
=fc/g
-----END PGP SIGNATURE-----


--------48448c36b2b2cb915c726d5e1c290852645cd300b290d3fdf1c45c0165a1ba7d--

