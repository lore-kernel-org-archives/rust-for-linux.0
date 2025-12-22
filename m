Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3912DA762;
	Mon, 22 Dec 2025 14:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414168; cv=pass; b=dTWGlPvRvCnJdGTtZXit/HFN38mrlQjTngyWI6EkjU+GL0nbhDYLjI4yhbQZYl81RChGJe9h9NWUFuFvK1USqTX6Ry07+JhI8lYvhEuiTQvdAbdWz/qPaYeCDHkBSPAzQoz22FGwfQkrAfBpD1XXQXHNmUX5EWWR5J0R/uktuns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414168; c=relaxed/simple;
	bh=1joZclT2KG9hxoR0qmal07yTpn15llb8dy9SU750EdY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fBdO9EBHJ7Lvr7GddqzXvnHixbzSpJLBpoXjVR4iqExbWY2PhdD4A3NlwJCmXc60Jf3IdyuXCk8XPiECVNnPOr27Iz6+u0eS2QivrUxdFkuKylqMx/MQLhiGRiHhG1K2vEGLAI0FHNjup2FhUGfer4JJjl8ky+QhitxCponcvMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=OkHS9zxH; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="OkHS9zxH"
ARC-Seal: i=1; a=rsa-sha256; t=1766414153; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=caTSEnqzUetcqlZINEs5GdO8RuP+WRnlBPeXk39srvcUICB+1p6ONVBuwvrwRhmhGHLzjkm0oYJ/Qxr7O2bn2GoWvWqSXiGDDw/tSdbmf8eKf7LRoBNYIvS9uCoBfFuBSbKt1QBqw1QC36wok88fzMmQWliK8hFn7xJVzYgdA1E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766414153; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XeVUgx3jIgz8Fo1ywZqzDrJ3mE8s393aMSW4aScMyPo=; 
	b=Uh9eWQcsffI5k3J2AYZ4umbyaoBiOuHQ0DwwuuND2Z1jfR+Z2hZnG+SUX60yLsB4aBHT1OoyTG/fA7X/lpIM//9N/lue3rUX91Un0UPc63sii6QgAWtJ8gpUJfAE9dKjyIRDVVO2dK8QhEqq97LRw6uG9qn4W1b5onGjpNQMn2I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766414152;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=XeVUgx3jIgz8Fo1ywZqzDrJ3mE8s393aMSW4aScMyPo=;
	b=OkHS9zxHju7r+6U8dj7HtqOvehONzounGOqmukB6Gy6gU1owdgOFm4OvFeWnHQnX
	g9mrFQ1FDMaLF9VIC35h42GgEDAgBd9QmZZ+bPCZFXY3uYWdotZgvnsi9xx/Z4mP3ll
	WKgGtXEU5Qz2Haa+K8bjv0ymPiUwmW3kqA7xicGU=
Received: by mx.zohomail.com with SMTPS id 1766414151414787.9414092534792;
	Mon, 22 Dec 2025 06:35:51 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: regulator: replace `kernel::c_str!` with C-Strings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251222-cstr-regulator-v1-1-430e3d517025@gmail.com>
Date: Mon, 22 Dec 2025 11:35:35 -0300
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Tamir Duberstein <tamird@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1B3A437A-5A9E-4109-A202-CD3172596929@collabora.com>
References: <20251222-cstr-regulator-v1-1-430e3d517025@gmail.com>
To: Tamir Duberstein <tamird@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 22 Dec 2025, at 09:15, Tamir Duberstein <tamird@kernel.org> wrote:
>=20
> From: Tamir Duberstein <tamird@gmail.com>
>=20
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>=20
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> rust/kernel/regulator.rs | 9 +++------
> 1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
> index 2c44827ad0b7..4f7837c7e53a 100644
> --- a/rust/kernel/regulator.rs
> +++ b/rust/kernel/regulator.rs
> @@ -122,12 +122,11 @@ pub fn devm_enable_optional(dev: &Device<Bound>, =
name: &CStr) -> Result {
> ///
> /// ```
> /// # use kernel::prelude::*;
> -/// # use kernel::c_str;
> /// # use kernel::device::Device;
> /// # use kernel::regulator::{Voltage, Regulator, Disabled, Enabled};
> /// fn enable(dev: &Device, min_voltage: Voltage, max_voltage: =
Voltage) -> Result {
> ///     // Obtain a reference to a (fictitious) regulator.
> -///     let regulator: Regulator<Disabled> =3D =
Regulator::<Disabled>::get(dev, c_str!("vcc"))?;
> +///     let regulator: Regulator<Disabled> =3D =
Regulator::<Disabled>::get(dev, c"vcc")?;
> ///
> ///     // The voltage can be set before enabling the regulator if =
needed, e.g.:
> ///     regulator.set_voltage(min_voltage, max_voltage)?;
> @@ -166,12 +165,11 @@ pub fn devm_enable_optional(dev: &Device<Bound>, =
name: &CStr) -> Result {
> ///
> /// ```
> /// # use kernel::prelude::*;
> -/// # use kernel::c_str;
> /// # use kernel::device::Device;
> /// # use kernel::regulator::{Voltage, Regulator, Enabled};
> /// fn enable(dev: &Device) -> Result {
> ///     // Obtain a reference to a (fictitious) regulator and enable =
it.
> -///     let regulator: Regulator<Enabled> =3D =
Regulator::<Enabled>::get(dev, c_str!("vcc"))?;
> +///     let regulator: Regulator<Enabled> =3D =
Regulator::<Enabled>::get(dev, c"vcc")?;
> ///
> ///     // Dropping an enabled regulator will disable it. The refcount =
will be
> ///     // decremented.
> @@ -193,13 +191,12 @@ pub fn devm_enable_optional(dev: &Device<Bound>, =
name: &CStr) -> Result {
> ///
> /// ```
> /// # use kernel::prelude::*;
> -/// # use kernel::c_str;
> /// # use kernel::device::{Bound, Device};
> /// # use kernel::regulator;
> /// fn enable(dev: &Device<Bound>) -> Result {
> ///     // Obtain a reference to a (fictitious) regulator and enable =
it. This
> ///     // call only returns whether the operation succeeded.
> -///     regulator::devm_enable(dev, c_str!("vcc"))?;
> +///     regulator::devm_enable(dev, c"vcc")?;
> ///
> ///     // The regulator will be disabled and put when `dev` is =
unbound.
> ///     Ok(())
>=20
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-regulator-dc3f6d3fc384
>=20
> Best regards,
> -- =20
> Tamir Duberstein <tamird@gmail.com>
>=20
>=20

Reviewed-by: Daniel Almeida <Daniel.almeida@collabora.com>

