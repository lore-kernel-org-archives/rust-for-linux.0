Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8097146A97
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Aug 2024 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723108102; cv=none; b=rtKHxN48nJCHRnp0Mq/vq7zKciOT+vJUr87Dbxb9YB97INVc6uT/y9wSRsNLhOv3Tp0z4/uv5qS41adFXTxr0rJT+6otpx3dg9ii3gLfGUxS6ikpBC8xXV7hWmNU+flggBqEfFe/2qXxpDf7FW1sNhaYA3b5/UgexQpSpSWkVI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723108102; c=relaxed/simple;
	bh=uAc2ZG3ukw60sc6m6JNUFse46tNj8RxOsLbTub41flo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qYQofq6FkK/lVTcKMBDfxKM26Z7znslpUaGd5ubPAAsUd/idVCAFbYvW2NZEI6PJWpBUmSLCGpzHUP5vJYrhiaRfrW9s1Ai8axfc5KIBe/gYNgOdftMDx9baiL1vLL+3BsteCYbCNY3jIRZrXW/6tuaV3QNy/F413G753wTTU8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=TeVL48QW; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="TeVL48QW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=uxdqx6g4jbgnba2mrar46fsg3a.protonmail; t=1723108097; x=1723367297;
	bh=4+O/PRWpVpxDVZY+qCPNm52oMb0TpQQtgaQHZ09Ht5c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TeVL48QW7o2NuQ0aUiX+K5Bqbk5KWEalW+aXv6yejJR2QQW/ldCyy5RYlfiIFyLBe
	 sI9AAhbOpohz/V9xMWeg6eNqpjlD0RRvoWmS5cvP4svc/vYMDoUlyBes5Mvmw6n0DB
	 AkKN/NgaexJiOlRnfZH1TTk0D3/ATOD4RYZ4QtAjkAFTU8RKRdt9xKu8NfJX3kpYrX
	 gz+HM/Ddweq25Wo+lVyuD3hL+GFnX6Jebauy252r/jfSpDiDDqUGGdMdiCC7xZeH+I
	 HfEtxpzY+0KjWOMN67a2KLMdp622MXce7iF9CtLCMuKdvw0DTqpovm3/rmWlR6Xn70
	 ILCcl377xTs1Q==
Date: Thu, 08 Aug 2024 09:08:10 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 18/28] rust: treewide: switch to the kernel `Vec` type
Message-ID: <3237696e-4009-4d3c-b2d4-85d3b4adbb85@proton.me>
In-Reply-To: <20240805152004.5039-19-dakr@kernel.org>
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-19-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: a7f3162e886c0daa82e26e7b3c820f1b72604ab3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05.08.24 17:19, Danilo Krummrich wrote:
> Now that we got the kernel `Vec` in place, convert all existing `Vec`
> users to make use of it.

You missed one in `rust/kernel/uaccess.rs:92`, but this doesn't
prevent it from compiling since the allocator is correctly inferred from
the context.

---
Cheers,
Benno

> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/str.rs            | 12 +++++-------
>  rust/kernel/sync/locked_by.rs |  2 +-
>  rust/kernel/types.rs          |  2 +-
>  rust/kernel/uaccess.rs        | 15 ++++++---------
>  samples/rust/rust_minimal.rs  |  4 ++--
>  5 files changed, 15 insertions(+), 20 deletions(-)

