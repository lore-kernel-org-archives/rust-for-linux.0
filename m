Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E151B8EA8
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 16:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723652718; cv=none; b=jp1YVjZKC1qmqLI+7vaNNSYO19HVrbdPHS17iC68nv+48gzPG9H3Yk/LLbJpFjDNW3ytksKi5sa7eXNGSf0u7lTcSE/O0mzz63nudkCXRy2MC5fEHjhjYFU5fxpBydkVowRvhzrDkVdJ2RqeqeOpZxdwamj8j8mwB7brAoUXj7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723652718; c=relaxed/simple;
	bh=j9+tKFjuW6GFWgsPdpRDPnqOsku7GCtJaxfdNZ5k/5s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ciGcsMe1NKNP6BO54XzfKRwuIVM+LBoZ4AHa+VTaLOdgrW0J+2XoS4HBzfa7qniHzqb1Yn7MfjcgbdxiCQMTA2NVRRt78yYsrcWdz7nW1StsBeE6/FXbwESiaeXalEKj/aXyYdHkRq9YzJRlFF+rOZDuqiKnSiXJTMy4sOBkT4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=I47hKbkO; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="I47hKbkO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723652715; x=1723911915;
	bh=IKfUGaTAOHB51bKnbEf+rAr3CdrfW+9USkiN1kmYibU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=I47hKbkO713e2pmuyZXfw1vb4XfUpJnxN4I7GVhx10PiF9JR5/+knmvjtAQghBdqL
	 U2eo+sjn9Zju5ZJKNutwanBRclUpXvfYGIZZHq2hadEJn9SKIwlwSe7a4thDeFa4Fk
	 jGF2Ur7XyASWYbAj5D+Hff+0Bu/7PQDF8nQWL3lIe3QEQpcNlK+TatUzKW6hlw3eLr
	 6SYYab2JKx79x1ZyjOl1+kLqhKh5arrsyP1MCBxkz2th0dNYDiIxTn8zDUIMzhIHnr
	 809pFBzbr94Dzjx1wbWW3BkTWqj8zPqKj7kAGP8jWPzNJTe1PsOKhKxa7McDl8+/vx
	 5kv4/2EVOH9Xw==
Date: Wed, 14 Aug 2024 16:25:10 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 05/26] rust: alloc: add module `allocator_test`
Message-ID: <7b690bb5-9dac-4566-af01-657961f57d62@proton.me>
In-Reply-To: <20240812182355.11641-6-dakr@kernel.org>
References: <20240812182355.11641-1-dakr@kernel.org> <20240812182355.11641-6-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: e996931214727300fd137374c8f6121bec0c1b09
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12.08.24 20:22, Danilo Krummrich wrote:
> `Allocator`s, such as `Kmalloc`, will be used by e.g. `Box` and `Vec` in
> subsequent patches, and hence this dependency propagates throughout the
> whole kernel.
>=20
> Add the `allocator_test` module that provides an empty implementation
> for all `Allocator`s in the kernel, such that we don't break the
> `rusttest` make target in subsequent patches.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/alloc.rs                |  9 +++++++--
>  rust/kernel/alloc/allocator_test.rs | 19 +++++++++++++++++++
>  2 files changed, 26 insertions(+), 2 deletions(-)
>  create mode 100644 rust/kernel/alloc/allocator_test.rs

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

