Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E2817995E
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 17:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742060702; cv=none; b=Bsv1jNtOS7i0dK4MVHMjtQG7W4XsqKmoIdP/y+QMQMS1VDxkFQlXclLqzUE/4WzRbz3BPY/JyaMJHPt6DVGy66hN5FUkjYYwHJz/5vweLAMwwNJ/9AKn0j63MOnBhg2/O25yXGqtcXom2GvN92J1fbGoJ4wMHZx3D+lpXiPF/Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742060702; c=relaxed/simple;
	bh=chOK4Fe6+XJ1YVVwbeerraIbPQTV2HL5q/4lWE/9eEE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BT7YJOJphr7CGfmqB/W3pQd9dJZqMWCbSeDdcP7PgLyJcA4rPdNw1qoavCQZJ3takIVvtCnSyefydEQ4dbAuE1SJDkpDNSXkzJlRmamLoKokF+lzhuDAXEfsyQybGSCpgcha6FTRekOdBSy+7P9r9prR6UawT3hZc7Hmu4Afh38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Ue8KL95a; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Ue8KL95a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=dasjwkyry5h2xmjs73lxb4g4gm.protonmail; t=1742060698; x=1742319898;
	bh=5G06r44mn8oSpAVuU5NLkDjGEv4Q9X6wpjXCmY/zPmw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Ue8KL95aUOrVIuElLZaGaY2qYD0oMOJbCfoRGPIl2218rJPqJ7NzGYC37LgPudGuS
	 xrewgH8V5kqZOfSNvExuYAxGoeldxXJa5Z0qT2eB2Vky+Mx1IHVUFWRVXxbCATO5db
	 mHeqqzGhNAzq5K+EYf5mhaKU7s9NtN5a6mDJZD+deU2o3i4KdMp7njnOTAyhOwPJEz
	 Zciix2HFJY03ovcZgVrbrxna9CFRDMAslyxhF/uE00ZxWCBqg889UmClnxZ6/6xuTJ
	 n4mGKyspU7urRdNiU0TBqysl6UOLwExWTZVkSSraIwusGLoUxytLAujn4l8LpkXBKg
	 7ZPvOn94Xl+OA==
Date: Sat, 15 Mar 2025 17:44:52 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
From: Benno Lossin <benno.lossin@proton.me>
Cc: andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: alloc: add missing invariant in Vec::set_len()
Message-ID: <D8H0Z2LEXW8K.KQMQUZ7MPG5V@proton.me>
In-Reply-To: <20250315154436.65065-2-dakr@kernel.org>
References: <20250315154436.65065-1-dakr@kernel.org> <20250315154436.65065-2-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 1aa0a8a9a91f3e40053ba2f2d4ccf750a35c4d89
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat Mar 15, 2025 at 4:43 PM CET, Danilo Krummrich wrote:
> When setting a new length, we have to justify that the set length
> represents the exact number of elements stored in the vector.
>
> Fixes: 2aac4cd7dae3 ("rust: alloc: implement kernel `Vec` type")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
>  rust/kernel/alloc/kvec.rs | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index 8540d9e2b717..0a4681ad4ce9 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -195,6 +195,9 @@ pub fn len(&self) -> usize {
>      #[inline]
>      pub unsafe fn set_len(&mut self, new_len: usize) {
>          debug_assert!(new_len <=3D self.capacity());
> +
> +        // INVARIANT: By the safety requirements of this method `new_len=
` represents the exact
> +        // number of elements stored within `self`.
>          self.len =3D new_len;
>      }
> =20


