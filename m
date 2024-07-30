Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CD11A76B7
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 17:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722359691; cv=none; b=LG7HpA6bM/V4Jf9HeBYBJ/9/RmKeEz3fl6U37QfB6IyulLN9d9b1q2R2z0WuwIeL38tgy5VOjA82JpZCCGo+81BzXnV1DT8HEI191jmWqmEcMU5tj09hsWHr3w1so5g8fvGDVSDOEPvjuiAYTG82znNfj/rplFEbVRyNJQ2ap7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722359691; c=relaxed/simple;
	bh=KDWE+vS3sKHAOFqWjXQLBPxwh9m0A/9p2hkTp6D+Bko=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uVEGh2oQWCN/mxisK8DIhb0q+lcUZt5RKKqHMiSsqxUgQhszDghX//56g9VBYMtw7fFoNvzCoxFru5B/5Khq45QeDCleVEKGKJAeRhBM62Qhxn/HqTQwBRkzHtFKguDa+7VeNBfRF6Nk9SY+qpbofuOFJk89cxo5gPujsojz9lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=RQSi7w7m; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="RQSi7w7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1722359685; x=1722618885;
	bh=NGinwHKyoFpi7Py4DC1kYgOPoqTKF5dlqT9ieC+Ma0g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RQSi7w7mKrGo6aZxTcLyfyob2Imgwdse4PYvKvU65m+RdoXZA00U9st25nr1cQ67B
	 zzF8SX+DH2RKVSzuTGD4PLvCLbfUwKDgLxlV5kbX03+SpMBwRgrE1Nrqx87ROCZBxQ
	 yPib0a1fCXBhGnZCI2ITdxFdej4TwnSzzKXknH8OtPJ+hduxhUasyeWZyXgTUpqxmH
	 1oe35T6Q9KiiBX6ncADVQWwx4OVVti7fpiRX0de4W48fw28x8G+vaRmw7MCb+9us7Z
	 tNypGDAWHAjw1UemNKbLKeHGfworYpQF+fv++7B1VgNV1xHIriMX+d4GprbXYE+uLv
	 ddTQ/NL7HPYmw==
Date: Tue, 30 Jul 2024 17:14:39 +0000
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: implement ForeignOwnable for Pin<Box<T>>
Message-ID: <5c49f604-34c1-414f-bf9a-92837c6e07b3@proton.me>
In-Reply-To: <20240730-foreign-ownable-pin-box-v1-1-b1d70cdae541@google.com>
References: <20240730-foreign-ownable-pin-box-v1-1-b1d70cdae541@google.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 17966ed4ed650d191ff32ffbc5e393127d9a199e
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 30.07.24 15:06, Alice Ryhl wrote:
> @@ -89,6 +90,32 @@ unsafe fn from_foreign(ptr: *const core::ffi::c_void) =
-> Self {
>      }
>  }
>=20
> +impl<T: 'static> ForeignOwnable for Pin<Box<T>> {
> +    type Borrowed<'a> =3D Pin<&'a T>;
> +
> +    fn into_foreign(self) -> *const core::ffi::c_void {
> +        // SAFETY: We are still treating the box as pinned.

I don't think that we have the guarantee that the pointee at the pointer
that is returned by `into_foreign` is not moved.
AFAIU `ForeignOwnable` is used to store these pointers in C structures
and never to actually access the value behind the returned pointer. So
we could add the requirement to `into_foreign` (thus making it `unsafe`)
that the pointer should not be dereferenced/used aside from `borrow` and
`from_foreign`. Otherwise I don't see how the call below can be OK.
What do you think?

---
Cheers,
Benno

> +        Box::into_raw(unsafe { Pin::into_inner_unchecked(self) }) as _
> +    }

