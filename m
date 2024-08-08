Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B879F7464;
	Thu,  8 Aug 2024 07:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723102934; cv=none; b=ijqoGAgoUrvcd0k7pF8BG0mLTLYS0v5iy/wcnNCaGJQy39IK0ucjaEqis5dyfc6P2mrIr7HOFiLwL9u/aj04T3QAUrXc+s4CGd8W/B9oPUX+ouBKvpD4ONmY99Y8XODX0EE0KKQ338nWJJM3qIYcpkDotAiMnVTlHAM5KzrKDkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723102934; c=relaxed/simple;
	bh=WS+0Duva5SI9JnbjbPYLF3bEoUwMSCv6DklV+hPmqQw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MW1wLbAzfqDfBLaC+uitrjBajdcVmnEOwXdouY3XkFF7Y3Dkh52lVzhVLRoux/dKCyIQGaQ/YL3KZgP+CZI0xGhs0678SGFJIp4C1lqOwA9/nHGQm2aVQGeUDkNvyaUn4HM3BSWsserhV49HGlPisqUb7MPQlKR4pXdI6L0Zr/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=mSV987O3; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="mSV987O3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723102930; x=1723362130;
	bh=6uHiU/PlDtlwd53/RYkXXLIkT8k+l9vUYb7oeMU5BOU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mSV987O37rTmZw6TYyT95buAkdHM9+qAnPkmpzrMu3LUtKGqJWEkQ1RuqGDkDHm8k
	 eqc7UdoT7X2Y2XW3P8VVuhTgStVo1zYNEPzaNcPJ++W5Uo4QzNXpPV77rxU8jdG5yp
	 VudffcKBy8XU34C9M856swX7IeWAj6wwE76X3r0YjVxNfnLbhfJXFwmrlt6oWFRFe7
	 i1XLIyMnGs0+G4xNNU/ryIcS51mATCRTlgYJe82Q8MxA+8G6C/S1Qwsl5axunF2Abj
	 SLdgMNNYgyTVKuBsi7jpaz6IOVdGXwrEPKJLmNhPhREN0lOnN5iy4zb1BMCqXVTkAA
	 /XO4rS7rfDMyA==
Date: Thu, 08 Aug 2024 07:42:04 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 22/28] rust: error: use `core::alloc::LayoutError`
Message-ID: <42ea66be-ed5b-4b93-8aad-4bf46d0baca9@proton.me>
In-Reply-To: <20240805152004.5039-23-dakr@kernel.org>
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-23-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 799a312ffdc43ecf5d973d597ca2250048613156
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05.08.24 17:19, Danilo Krummrich wrote:
> Use `core::alloc::LayoutError` instead of `alloc::alloc::LayoutError` in
> preparation to get rid of Rust's alloc crate.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/error.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 145f5c397009..2d012cc3881a 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -6,7 +6,7 @@
>=20
>  use crate::{alloc::AllocError, str::CStr};
>=20
> -use alloc::alloc::LayoutError;
> +use core::alloc::LayoutError;
>=20
>  use core::fmt;
>  use core::num::TryFromIntError;
> --
> 2.45.2
>=20

