Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698472E54BB;
	Mon, 22 Dec 2025 14:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766413607; cv=pass; b=XQrO9JHWEEoI5+KEk7etrpghbGDMZ5ahJ+dFEy1auTfqCWKLboIWmVe6cfFtDFXtJh5RO/ahFdwEXgOJfCNuh0eR36QvqMQvsAeyRXrNb99X/Xb7iArEF/sYPz3K2UZo4tOi5zkH2eG668Xnpb0XySbrgaC18WsmfGqDol7nw98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766413607; c=relaxed/simple;
	bh=UTYCIC5rrgWUBDp8YhaRahGJUJyvv9BI8J0/jq/0tII=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qKZR/a/UXKjR+/e9ggtmgbm3BvCGQz7fo6iMHRX7L4YzL4+8dn+EJULPZJQWEcCwvz6rNVH2UB1GvWuXHy+J1xIZ/rmvRokWL8sdO3a13e1Xkq4Gnb4EhGMWeKbZPPfTFLAj3dpJA3mNTyW8eSYEXI30r470hN7xEsBbTHRArYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=RGPFno/G; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="RGPFno/G"
ARC-Seal: i=1; a=rsa-sha256; t=1766413583; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nNwYprAeGofE1fAF/CXydXUBl1EiCGtK4uXSc5gOl6TStSZz+e9dcsMfgKZ9nl45RmyeyLbRpXtbDv9U7elvscaRNsKRU8l1As4JbMj2/cyUG0E4WNKT7xyAfMT9kc83knBXz815OymGiHmoFJRxdPlDfTja93EU880UkfsGVa4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766413583; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eQ985Op5KbonnTcZWgKfCTziYRV3/3gx0axUBzPbW7Y=; 
	b=FEV0wxWRbRZN6JeGR6dqtpazhY8k1+ODvAl7HdaDzeGLduAgyVEu4RY2ariRECmpiVJovaQdXmQzDuNLchvOonxQ3UBz+z9IhS2AcF/TkzJ4m20U+fJhPvF61CAe4aGS/M7xSC8sg/VgyLZI8XDXXj9WKrTNiSAbDDShueE7ZOA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766413583;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=eQ985Op5KbonnTcZWgKfCTziYRV3/3gx0axUBzPbW7Y=;
	b=RGPFno/GGh1sDMoqRc1WdirKY219FUFGqitDJ0MMQX82SGvkLtVyqgTnHBbRYYjO
	nUQRr3xky3RpYx1ZinDfGoLEZUmWtA4jmmPEOV7fAt0ZnBIkHzGG0hKNHYeZ92OQQIJ
	eQANunrr14Z1nSwnR5ak6Od7jFuc1gmRdGzFS6RI=
Received: by mx.zohomail.com with SMTPS id 1766413581034566.2173737239702;
	Mon, 22 Dec 2025 06:26:21 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust_binder: replace `kernel::c_str!` with C-Strings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251222-cstr-staging-v1-1-974149ba4a79@gmail.com>
Date: Mon, 22 Dec 2025 11:26:03 -0300
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?utf-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>,
 Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Tamir Duberstein <tamird@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <40D8A5A2-EED9-4E4A-97FE-0C4E3EF2784F@collabora.com>
References: <20251222-cstr-staging-v1-1-974149ba4a79@gmail.com>
To: Tamir Duberstein <tamird@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 22 Dec 2025, at 09:22, Tamir Duberstein <tamird@kernel.org> wrote:
>=20
> From: Tamir Duberstein <tamird@gmail.com>
>=20
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>=20
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> drivers/android/binder/rust_binder_main.rs | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/android/binder/rust_binder_main.rs =
b/drivers/android/binder/rust_binder_main.rs
> index c79a9e742240..519bc2fb310d 100644
> --- a/drivers/android/binder/rust_binder_main.rs
> +++ b/drivers/android/binder/rust_binder_main.rs
> @@ -288,7 +288,7 @@ fn init(_module: &'static kernel::ThisModule) -> =
Result<Self> {
>=20
>         pr_warn!("Loaded Rust Binder.");
>=20
> -        BINDER_SHRINKER.register(kernel::c_str!("android-binder"))?;
> +        BINDER_SHRINKER.register(c"android-binder")?;
>=20
>         // SAFETY: The module is being loaded, so we can initialize =
binderfs.
>         unsafe { =
kernel::error::to_result(binderfs::init_rust_binderfs())? };
>=20
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-staging-e96cbee7d73e
>=20
> Best regards,
> -- =20
> Tamir Duberstein <tamird@gmail.com>
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
