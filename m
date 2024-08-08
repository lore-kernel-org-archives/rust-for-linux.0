Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C225228
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Aug 2024 06:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723099703; cv=none; b=nyuA/VtCiZEs+DmH1F25u6sPneJ/z/UL2I+1dW9H+CKr7ONWBBFeZGuyoXDo2KeZ6qXKsQuE2DkWOxZ6cJzmZ0cmUNH4LcBe6kd4gl96KsGRcR4+hIILdeaBXu51xktKCqxVHwy3KN+4ERmil7KeVrl+d3Jjj34ABDwzYVrKShw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723099703; c=relaxed/simple;
	bh=YZmqvFtcmiuBdsEDB0/oBBbeoJpGjGMSoYbtqJBMEng=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cuvpU86nEQWX/P9ZgY3H8mq8Ym7ztsjAVz8FVETNMZuKQiRSCjXRgDbZzf3KwoO051jhh1p63nBlnGtibxjqiKJ1rq2tkvhqCCileutDp+KbbcbvMNz2cpLUnZWOVsAv/MvzEQ466PWWM/bm1iTx/W2hsJ+Xd8cgvoqRE/mOfaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=I6n452DY; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="I6n452DY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723099698; x=1723358898;
	bh=2s2voItqU9X1rXU+2ig6xFu7OqKXVF7GesxAQCS6Q6w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=I6n452DY3VTl5WNxYhIlb9F58QM2NWaOge+S9nGok7Z9UiB3wOkmEK3rC4WYAyuJf
	 fy8M9fht8GBHmZe3y49+D1ExR9ds+ZSHzHxrQK0s3xYUijjj9DCAh5JYTihCWpii3e
	 NRfVysMIfSBGyfKQEg8QoU5Z4OuU+rkkv7e9Jmm7K4Z49Ea/P9qqYEDZAs8dk82Z5R
	 4w5Oc5B7QsGd8LPotrA+uR5mc13f79YLw8qSgI1xilCTtX6Rb5SqHIBF7r6jMuRwRi
	 gYwuPxphBFMbWnq9hIAREABiYblGpvRSX5GO76vJQ1PMSrt72XcjLhGX+gOZttgePh
	 CpEtrnTNketlw==
Date: Thu, 08 Aug 2024 06:48:13 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 11/28] rust: alloc: remove `BoxExt` extension
Message-ID: <7a0876a5-624a-448e-a434-fb117fd062e8@proton.me>
In-Reply-To: <20240805152004.5039-12-dakr@kernel.org>
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-12-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 94ed4bab8263ddb41a63ae6fab6325749eda5a89
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05.08.24 17:19, Danilo Krummrich wrote:
> Now that all existing `Box` users were moved to the kernel `Box` type,
> remove the `BoxExt` extension.

In the changes below you also remove the `new_uninit` feature, the
`impl InPlaceInit for Box` and the `impl ForeignOwnable for Box` but
don't mention it here.

---
Cheers,
Benno

> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/alloc.rs         |  1 -
>  rust/kernel/alloc/box_ext.rs | 56 ------------------------------------
>  rust/kernel/init.rs          | 34 +---------------------
>  rust/kernel/lib.rs           |  1 -
>  rust/kernel/prelude.rs       |  4 +--
>  rust/kernel/types.rs         | 23 ---------------
>  6 files changed, 3 insertions(+), 116 deletions(-)
>  delete mode 100644 rust/kernel/alloc/box_ext.rs

