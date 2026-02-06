Received: from sender4-pp-e104.zoho.com (sender4-pp-e104.zoho.com [136.143.188.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BB0429810;
	Fri,  6 Feb 2026 18:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770402527; cv=pass; b=bxDK5u1Gn02JNUuxPS1jNfFg508DU4sEj/kU37ELmQirDlP7LKxKOgfZRARznPhixu+Ot1MG7/oFDMjG9JhaxktnpTc7LvIuxp2zmxNQflBgicd9cAElBSBzlkz4zI+2rsFQOQV4bScG9dV35Iv65aOZDcYcD4pF/e4djHrIYq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770402527; c=relaxed/simple;
	bh=WjwoJRlIaWqPKAvqLDoWUHTgVN6Chiw6tnFFUc6glhk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ss4C5V2+yMN03ThSgV/5OPRBJUm1w7Kxn3P7axUC/uY1fVdL1Q01SWXyRUceC+PViHQ7QaVgu4HZywOdAkl91zr/s7NedsDTwzQakJtev05/ck2qYqJ38CQaj3dmg6dNPiOwZGMfNLPxoOi+LfZBrDkiy1I60zPBVb+On/IUJNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Ycs6Qmnd; arc=pass smtp.client-ip=136.143.188.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Ycs6Qmnd"
ARC-Seal: i=1; a=rsa-sha256; t=1770402509; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eHgs4ngbnXEmnxu9Xl7RkCvHBN38Rv3Y/OasdweOdqdwhZ2IBbefarwCmU8qyCJEFqRpE4mWfO9SsTz3XxLR8ElsWr2+txx/LTDrlLbKSR1c7szu8OnrDfDWefUN51k9+XWr0ytH0MStqRXvWucyqjkmJXRd3l6xqeCY2K8wuE8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770402509; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4qBX4pZ1wtL5q3LZ1MWDciHBaEXtIWjCJWOZXS7FxEM=; 
	b=KWlTK2Y5xLZ0QV3FsaIQU33Wy1tBSfrBwIGBCgOvpeHqQPeb5HdC2gm2LzEXDa7BVstQ7PMsD6K80+J0nB4VmauSw3iTxdYfbfm2L38CJQ1rL6+0s6XXQ0BoMZrX/uR4t/Q+iCA0rIXrDhxTVDrUODsrXUGnrsb+86HWPl8HnCc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770402509;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=4qBX4pZ1wtL5q3LZ1MWDciHBaEXtIWjCJWOZXS7FxEM=;
	b=Ycs6Qmnd8Qdm0tcWNOHhJil+Zg77VJJ4WylGEhYi0RjBgWmQH8cnCdTPm2ZNZ4LH
	PrdLkWup0tl1q5jyNhzvABRxriSCTAcCaWUJha89quyspZZY518rmL5zeYBLP1crtY7
	vhC06/7ur70ANxNiSBvTFM92kRLSQC4cikOvMNVY=
Received: by mx.zohomail.com with SMTPS id 1770402506572973.1216891916129;
	Fri, 6 Feb 2026 10:28:26 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 3/7] rust: num: add `as_bool` method to `Bounded<_, 1>`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260129-register-v5-3-c4587c902514@nvidia.com>
Date: Fri, 6 Feb 2026 15:28:08 -0300
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
Message-Id: <879031CB-A9A6-486A-8E01-E557ABB01F41@collabora.com>
References: <20260129-register-v5-0-c4587c902514@nvidia.com>
 <20260129-register-v5-3-c4587c902514@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 29 Jan 2026, at 10:32, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> Single-bit numbers are typically treated as booleans. There is an
> `Into<bool>` implementation for those, but invoking it from contexts
> that lack type expectations is not always convenient.
>=20
> Add an `as_bool` method as a simpler shortcut.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> rust/kernel/num/bounded.rs | 21 +++++++++++++++++++++
> 1 file changed, 21 insertions(+)
>=20
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index 4b929762d5c2..b41ca6df1525 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -1098,3 +1098,24 @@ fn from(value: bool) -> Self {
>         Self::__new(T::from(value))
>     }
> }
> +
> +impl<T> Bounded<T, 1>
> +where
> +    T: Integer + Zeroable,
> +{
> +    /// Returns the value of this [`Bounded`] as a [`bool`].
> +    ///
> +    /// This is a shorter way of writing `bool::from(self)`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::Bounded;
> +    ///
> +    /// assert_eq!(Bounded::<u8, 1>::new::<0>().as_bool(), false);
> +    /// assert_eq!(Bounded::<u8, 1>::new::<1>().as_bool(), true);
> +    /// ```
> +    pub fn as_bool(self) -> bool {
> +        self.into()
> +    }
> +}
>=20
> --=20
> 2.52.0
>=20

I wonder whether this should be into_bool() instead? as_foo() usually =
goes from &self to &Foo.

In any case:

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

