Received: from sender4-pp-e103.zoho.com (sender4-pp-e103.zoho.com [136.143.188.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54BB42EEA8;
	Fri,  6 Feb 2026 18:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770402590; cv=pass; b=mGJCPIDF+quWFnrZCn0o+RBkKBg27dIanAk56X0RomQV2qP2g9+Gh+ufqH4jB3NI2Njj5oNVKZWLRTjNGWyiDbN/ZSxBsn2qHw5vn3P3Yo4IvfOcoVC8toAkjb/o3yt3iEp3HVo5f30pmE73p6TSPRyE/XlV63GMsdx1lmeXGrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770402590; c=relaxed/simple;
	bh=u8CEhkdS0J5u6wIR87j7U++tHvUw4xDCf20WZwOa2s8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=k7nbSfnGDOPMkSR5eDACqDotSNtF/vDStGOLKvajxYCFASgJIkMrYB8EdJmxERl00nFijKvo87fXCnC+dKZSLqZf8MaNf7GV9h0bSZmSUNQn1AVS2xF6QAqhlT0aBYtocs+fhS1pFUPqoh/5QY3C9m5qtF5YwMRUSN9RC9OTeWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=BOFH9bbY; arc=pass smtp.client-ip=136.143.188.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="BOFH9bbY"
ARC-Seal: i=1; a=rsa-sha256; t=1770402568; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Bqi7vJFg/8aCCHzBHKj7EwARDdXfatvC65815nN1m5wTgE7uhlsvxIDClOTBIa9dYMKHfGWTk/0PRKnLVw+KvtwqYDlN1dBfcFTQaO0bDQqX7eddZcu643RCriDq2Z7bTnpP+aHwGkb8JyWlkh0LHPbSG1z273UGtfmYa53siWA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770402568; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MGcNtwHNVb9sFA7wezM8qs4S+ftx7DBG1XkDjOk3H8g=; 
	b=QQ70ZGH2yv2a25c1JdFvApLBZTzwI04QEzASbx16jOJsnaiLdAw70HUZz5vj4FEzK7LiLQukH62o8l1dEzQ7uDDwObWKRIuSsIpqkyBO20peM1MOO0kLeiv/dLmXT4H0k/mrBo0sdJGTUg2uKC9oPnqXIvisEXg+IwPto2e5UG4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770402568;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=MGcNtwHNVb9sFA7wezM8qs4S+ftx7DBG1XkDjOk3H8g=;
	b=BOFH9bbYe5yx9PoXTf+PhDaPpqGuWXAR1dkiN9aNRqID2neYq6dg9PlVFygTFiFt
	6+SAQWuYEavxAOAZYGyq9RWYdw0KXwKqWMct1JjEXIGsXW695sDSntcpNENp6KriP3g
	L1/j7tihwyBavuN7o+ugXYgmB9XeA448K4fy6/0w=
Received: by mx.zohomail.com with SMTPS id 1770402565798192.7110631589893;
	Fri, 6 Feb 2026 10:29:25 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 4/7] rust: num: add `into_inner` method to `Bounded`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260129-register-v5-4-c4587c902514@nvidia.com>
Date: Fri, 6 Feb 2026 15:29:10 -0300
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
Message-Id: <BB9E9B40-10F3-425D-BC44-C20B58F6E4EE@collabora.com>
References: <20260129-register-v5-0-c4587c902514@nvidia.com>
 <20260129-register-v5-4-c4587c902514@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 29 Jan 2026, at 10:32, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> This is useful to access the inner value in const contexts.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> rust/kernel/num/bounded.rs | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)
>=20
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index b41ca6df1525..850827033f67 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -388,6 +388,22 @@ pub fn get(self) -> T {
>         *self.deref()
>     }
>=20
> +    /// Returns the wrapped value as the backing type.
> +    ///
> +    /// This is a const-friendly variant of [`Self::get`] that can be =
used in const contexts.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::Bounded;
> +    ///
> +    /// const V: u32 =3D Bounded::<u32, 4>::new::<7>().into_inner();
> +    /// assert_eq!(V, 7u32);
> +    /// ```
> +    pub const fn into_inner(self) -> T {
> +        self.0
> +    }
> +
>     /// Increases the number of bits usable for `self`.
>     ///
>     /// This operation cannot fail.
>=20
> --=20
> 2.52.0
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

