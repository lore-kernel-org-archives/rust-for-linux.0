Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AB317996
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Aug 2024 09:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723971793; cv=none; b=dCH2AW8yvvA1JMvDCmQ5BSIoDr0wxOJXMrFHfESrFNaj7zTwCpkboxOdGY0FuaDepJt+NJzzsqVnNZRirMebRsDZjuM29dfcfXe7O3qHLP12JadQIELH0F+8r1HpyTJOoA3C9uAhhEi/LpU4oNDKVlZjndmGIR8AAJ+1Zc1gBxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723971793; c=relaxed/simple;
	bh=7RwrPBr/oRwzEHcMI2wi5whiGgomYmBC406LWG5eodA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wfsu/LgxXce7kO85YkKZ6R1M/MHQ+xTls81U0oXJCI7/3tzW4Vs1zyFOiOvY+kFrf64Lvo9uzGSHGqzBiYF/qdvgvLjVe59XniYED+nZr5NYih1dIFpIoMnLd0E7Z/Fsm/XBQX8uEEE1jGB+GJK53VJIUI/kIypyGxxGPV6NwZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=fyaVHF/L; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="fyaVHF/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723971788; x=1724230988;
	bh=RTOmJ5BzKsEqB+zrBzcRNwx4kmmU7UEBcqj6zA9zipQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fyaVHF/LKIrYM5pCUTYKZiwQH4E+M+aDnf2mJX2olYbd47K8SInVZxZY2QF5/euAd
	 9I92M/LAraN4f5NYf9h40yTMHCfW0u1m53H0uMoHD2l0Z+aC6nZUGHrmxBe1kW1JXs
	 P+odMzYItIaOaPKv/kxJH1N3jmoDgKXMIy4Ttj9iwHrx4ocmBMbV0nZ6ZWm2IukorP
	 zRAqQBjJeyRhue/b3/N20Rz0zkzepOxgJT/sxodUbRp95Mu4TvhBouuyyipD/uxbVa
	 dsPEeUe3jHCFvxQv56Noju+ilVG22YGkxTYz5KIyPz6R74K9a8yiOQf4p4EYv0Nh6B
	 1wbENRTOyVIeA==
Date: Sun, 18 Aug 2024 09:03:01 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com, aliceryhl@google.com
Subject: Re: [PATCH net-next v4 3/6] rust: net::phy implement AsRef<kernel::device::Device> trait
Message-ID: <f480eb03-78f5-497e-a71d-57ba4f596153@proton.me>
In-Reply-To: <20240818.073603.398833722324231598.fujita.tomonori@gmail.com>
References: <a8284afb-d01f-47c7-835f-49097708a53e@proton.me> <20240818.021341.1481957326827323675.fujita.tomonori@gmail.com> <9127c46d-688c-41ea-8f6c-2ca6bdcdd2cd@proton.me> <20240818.073603.398833722324231598.fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 01a0b019d2c2b7d7a1f4ef0712ffa43247ae0e8b
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18.08.24 09:36, FUJITA Tomonori wrote:
> On Sun, 18 Aug 2024 06:01:27 +0000
> Benno Lossin <benno.lossin@proton.me> wrote:
>>>>> +        unsafe { kernel::device::Device::as_ref(addr_of_mut!((*phyde=
v).mdio.dev)) }
>>>>> +    }
>>>>> +}
>>>
>>> SAFETY: A valid `phy_device` always have a valid `mdio.dev`.
>>>
>>> Better?
>>
>> It would be nice if you could add this on the invariants on
>> `phy::Device` (you will also have to extend the INVAIRANTS comment that
>> creates a `&'a mut Device`)
>=20
> How about the followings?
>=20
> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index 5e8137a1972f..3e1d6c43ca33 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -7,8 +7,7 @@
>  //! C headers: [`include/linux/phy.h`](srctree/include/linux/phy.h).
>=20
>  use crate::{error::*, prelude::*, types::Opaque};
> -
> -use core::marker::PhantomData;
> +use core::{marker::PhantomData, ptr::addr_of_mut};
>=20
>  /// PHY state machine states.
>  ///
> @@ -60,6 +59,7 @@ pub enum DuplexMode {
>  ///
>  /// Referencing a `phy_device` using this struct asserts that you are in
>  /// a context where all methods defined on this struct are safe to call.
> +/// This struct always has a valid `mdio.dev`.

Please turn this into a bullet point list.

>  ///
>  /// [`struct phy_device`]: srctree/include/linux/phy.h
>  // During the calls to most functions in [`Driver`], the C side (`PHYLIB=
`) holds a lock that is
> @@ -76,9 +76,9 @@ impl Device {
>      ///
>      /// # Safety
>      ///
> -    /// For the duration of 'a, the pointer must point at a valid `phy_d=
evice`,
> -    /// and the caller must be in a context where all methods defined on=
 this struct
> -    /// are safe to call.
> +    /// For the duration of 'a, the pointer must point at a valid `phy_d=
evice` with
> +    /// a valid `mdio.dev`, and the caller must be in a context where al=
l methods
> +    /// defined on this struct are safe to call.

Also here.

>      unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Se=
lf {
>          // CAST: `Self` is a `repr(transparent)` wrapper around `binding=
s::phy_device`.
>          let ptr =3D ptr.cast::<Self>();
> @@ -302,6 +302,14 @@ pub fn genphy_read_abilities(&mut self) -> Result {
>      }
>  }
>=20
> +impl AsRef<kernel::device::Device> for Device {
> +    fn as_ref(&self) -> &kernel::device::Device {
> +        let phydev =3D self.0.get();
> +        // SAFETY: The struct invariant ensures that `mdio.dev` is valid=
.
> +        unsafe { kernel::device::Device::as_ref(addr_of_mut!((*phydev).m=
dio.dev)) }
> +    }

Just to be sure: the `phydev.mdio.dev` struct is refcounted and
incrementing the refcount is fine, right?

---
Cheers,
Benno

> +}
> +
>  /// Defines certain other features this PHY supports (like interrupts).
>  ///
>  /// These flag values are used in [`Driver::FLAGS`].

