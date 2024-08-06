Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C8E18D635
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Aug 2024 16:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722960430; cv=none; b=bLf7m3V4TOXQ5755NoBjpvxA/BFRfBamJLyTIl/M72uHlLDF0jSifWWQT3hPgQcew2JYl+g82wVinviGWeTvKeLZN+kwOCbS2/4cJ+V1/BNAC8T2FRfp/FjsZGdbeiPqjGkiagD0MNPDyXFdKyCqzyf/fZUDiQqhMxVJiRiHcmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722960430; c=relaxed/simple;
	bh=KLm+PWps8aGARJwn8+BNYQaKeVRQecvICMLY1LikY3c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u3lGn21gAjc2ZLolqDFfbMJOxYEBf4643MrsQLmSjvVbhZ3QZGtniQgmmpem9lZZkp0Eo3+KEdJLBKhj7bEF5+P1XScy4EqtZ1iV3jQrkh4V43YvYdphxNCk8uE3vodHD4NiRy+b/AGKqg64FQVy0/b3HMP/82M4wBawoJ5OlCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=bniKvxnE; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="bniKvxnE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1722960426; x=1723219626;
	bh=5CFGbheCF72VGPU2C+9f4dfxfcyjEie2W/gW7Pfy5nM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bniKvxnELU53NIXp7/k3bWpJYZBOYbqTRp4L2dEgwSOK02INPSvgHXPzqKJIV9aF4
	 lRqu1Y9p8blV2cm1ZE7GVe98MtgBHh/fVdWV7L3IsA7usy0Lp+bVDXeins24ggsGPW
	 9EPjPeqf4UOdFUm3ZLlFTSrrnBn2564DKxdawKL0beYqkXmyrofD+nLnTy0ntR941s
	 uf2Y8MQR4CLt4GwhHp/ycpI0i2RFQYs4gBEnvQMZDRYb/HAUxgLaPRBlVrjxbw8TkG
	 RdH2QDnChPwVBi9y0mph1DCiwQ92YoNUNZxDhs26l+5yKRt5FVz74r9sHdZhpk/wNP
	 AIRqyJmO60U3w==
Date: Tue, 06 Aug 2024 16:07:02 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 03/28] rust: alloc: rename `KernelAllocator` to `Kmalloc`
Message-ID: <51ca763d-ad12-47a3-9222-60b76bf1a618@proton.me>
In-Reply-To: <20240805152004.5039-4-dakr@kernel.org>
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-4-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 2b9167085dc89959d33e8c395c7b0f4b4114c1f5
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05.08.24 17:19, Danilo Krummrich wrote:
> Subsequent patches implement `Vmalloc` and `KVmalloc` allocators, hence
> align `KernelAllocator` to this naming scheme.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/alloc/allocator.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

