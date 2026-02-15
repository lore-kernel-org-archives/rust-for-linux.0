Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A16923C4FA;
	Sun, 15 Feb 2026 22:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771193440; cv=none; b=CYvHcREIk2Qptz9tbME3merCqOSIwJLkUMekWbN3LQHINVaysUTltoAdZrTTC+llpN19Mfa5HDrO7mmfCFzxd3MJfeihsHpSmnYwJKV/MrXzZkHESE0Oo4PXRmaNe5bv6DwtDdy9CPEC4kCvGiKXJeIH/I1IXv9hZ0c4GkNjR9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771193440; c=relaxed/simple;
	bh=82DuzwpuJ8LVPprKrfIAdLDvoSiOxevRoh74sNCCGOg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=MoaALkd26V2fIWfP8u9X5c4ETVQJWiz+7PxKcDuSerYwH73CM4ho2QEg14Vr/Gqd45ZSg44GLmyEZYnahvKBsuqNcT4U2oTIuOvRabh0jjObhuUYoNBHhxRzDIbqV8uLsATclv0vVoKYx4Y9AK+3WnoIC0/m0XGhcnfJ53wdT+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Npqjunhx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Npqjunhx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDF2C4CEF7;
	Sun, 15 Feb 2026 22:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771193439;
	bh=82DuzwpuJ8LVPprKrfIAdLDvoSiOxevRoh74sNCCGOg=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=NpqjunhxJ5XQSAqTJCO2x00QOz7SUAVi0qaQBgyw4oP71CTsryj1wqTe/sC38shhT
	 9J316T3ChIvjrve5f5RwliyDpD9HvilYHogiRijHu/gGLiPMKunZnXJODPTsmvK53J
	 //MzEdq2yO+JOlJC+hQDVWNLRhOtFKS062zvzIkkPmlZ8RdN3H1rjtmzhp8jWshDdz
	 2EUaMssBO2JqR/JXYS1gEsAFjTXhyBnk1pRjT9CptKprMnDMhYoVofoleAcmKIyO7g
	 m6EXv4Tsa/DwMGSQ+zsEMxfgL5SNcd8Qsc13oACgy0Fzzet3s3Fq41eq0IMT9YmvJR
	 cH6k5VPprRU+Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 23:10:33 +0100
Message-Id: <DGFVO6LW5B9C.18MHNWH1WFM28@kernel.org>
To: "Shivam Kalra via B4 Relay"
 <devnull+shivamkalra98.zohomail.in@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 2/3] rust: alloc: add KUnit tests for KVVec shrink_to
Cc: <shivamkalra98@zohomail.in>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=
 <arve@android.com>, "Todd Kjos" <tkjos@android.com>, "Christian Brauner"
 <brauner@kernel.org>, "Carlos Llamas" <cmllamas@google.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260215-binder-shrink-vec-v3-v5-0-6e5e56d69766@zohomail.in>
 <20260215-binder-shrink-vec-v3-v5-2-6e5e56d69766@zohomail.in>
In-Reply-To: <20260215-binder-shrink-vec-v3-v5-2-6e5e56d69766@zohomail.in>

On Sat Feb 14, 2026 at 9:35 PM CET, Shivam Kalra via B4 Relay wrote:
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index e7bc439538e4..0d5d69296a9f 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -1510,4 +1510,116 @@ fn add(value: &mut [bool]) {
>              func.push_within_capacity(false).unwrap();
>          }
>      }
> +
> +    #[test]
> +    fn test_kvvec_shrink_to() {
> +        use crate::page::PAGE_SIZE;
> +
> +        // Calculate elements per page for u32.
> +        let elements_per_page =3D PAGE_SIZE / core::mem::size_of::<u32>(=
);

NIT: Wouldn't it be a bit more straight forward to just use u8 for all the
tests?

> +    #[test]
> +    fn test_kvvec_shrink_to_empty() {
> +        use crate::page::PAGE_SIZE;
> +
> +        let elements_per_page =3D PAGE_SIZE / core::mem::size_of::<u64>(=
);
> +
> +        // Create a vector with large capacity but no elements.
> +        let mut v =3D KVVec::<u64>::with_capacity(elements_per_page * 4,=
 GFP_KERNEL).unwrap();
> +
> +        assert!(v.is_empty());
> +        let initial_capacity =3D v.capacity();
> +
> +        // Shrink empty vector to zero.
> +        v.shrink_to(0, GFP_KERNEL).unwrap();
> +
> +        // Should have freed the allocation.
> +        assert!(v.capacity() < initial_capacity);

I think this assert!() should rather check for v.capacity() =3D=3D 0.

> +        assert!(v.is_empty());
> +    }
