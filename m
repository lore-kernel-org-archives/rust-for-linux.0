Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C113AA3F
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Sep 2024 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726824096; cv=none; b=Hr781tPqWXj54LA0S2Q/bfgcAT/mi3eANRf4iUXsZmmgs81jw9NT4s5b/A+wL/w3afVhDDV0w1pAiV6fK0qOXvQMKFA5nXHkQy3z2KpmezQZHEskV0swJAqhICUiTKywwijvvxXi1AVtEDQqZHl37/HRrDEmVxxCXuCm922EWwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726824096; c=relaxed/simple;
	bh=a3xzDxR4hOMF12yMaAOXiSAnX0HTUFrS/bIHkG5y2Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZqjZLX+yLHIX2ItIAdtmyQd8/3PhYbthvWUZtg0WJBZZub8kuPNoRvKBDwemnIci+T2wT+jJDNJrk6nUoojboXa/ajPjsQJwdGbUYALmTRSYhTY1H08/Niz84wKBeEPXec+xAvNGxNdBPXloowxLksrof2qABIzChSgRAiIgPug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=jzq1MtZc; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="jzq1MtZc"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1726824092; bh=07iy+TIQ9w1xgIqrc6gxgiJP2BJAPePZTYPQI4Ue0Ik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jzq1MtZcF5egHPPdk2U1GyDubUCvSvIVqV+Cp93HPqzZNhGpkEiOCJ08uU1hx1DuS
	 ArapRJeKlLJOrDlHxe2P6Qdx8gf3t9KLFYe1gyJT/BfdUYVoDYbLTeC4XM+YREIYVO
	 Qx+uSO/0dA6RBTQ+iiezXCYLU9vm9Bs44kICJumQ=
To: Aliet Exposito Garcia <aliet.exposito@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: Move `ARef<T>` and `AlwaysRefCounted` to new
 `sync::aref` module
Date: Fri, 20 Sep 2024 11:21:31 +0200
Message-ID: <C4064A5D-2C11-4C39-9F8B-7E487FE95A88@kloenk.dev>
In-Reply-To: <20240918225115.2309224-3-aliet.exposito@gmail.com>
References: <20240918225115.2309224-1-aliet.exposito@gmail.com>
 <20240918225115.2309224-3-aliet.exposito@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain



On 19 Sep 2024, at 0:51, Aliet Exposito Garcia wrote:

> This patch refactors the `ARef` type and `AlwaysRefCounted` trait from
> `types.rs` into a new `sync/aref.rs` module.
> The type and trait definitions remain unchanged.
>  - Adds `rust/kernel/sync/aref.rs` with the definitions of `ARef` and
>     `AlwaysRefCounted`
>  - Removes the same type and trait definitions from `rust/kernel/types.rs`
>  - Updates relevant files to import `ARef` and `AlwaysRefCounted` from
>     `sync/aref.rs`
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1117
> Signed-off-by: Aliet Exposito Garcia <aliet.exposito@gmail.com>

Reviewed-by: Fiona Behrens <me@kloenk.dev>

Thanks,
Fiona

