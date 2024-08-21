Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620AF13A3E8;
	Wed, 21 Aug 2024 21:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724276117; cv=none; b=jgTjsIOnEJoUm1Y6lUmxuJRX1quyoOB4tz29zExI8ScVShlTc6VpgH7aNQViRD52ilUAWwda/LBNgrEPXgRNQsAE8PmSMIw4gGQlC03LH9txLsVP9Wg1LKOgYWtcx+9LvSVwgCBGpXWHWe/L5/TlIAtN6TQ+wXBj+rxnHjt6KSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724276117; c=relaxed/simple;
	bh=Uc5rW3ULqqhjVDr5/mkHtrTw6nexg2rQmznIIsGOKug=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=noTiyCU6HezOSYF/x0lJ2Mp/pxu4sijzK393sSpGQwmRfadpO7qBfBa356LADMiR9JYyLltNB7jksbcLcJf+JHEjhoSPTwgZYybhsVr5WAh2D3hwb6dH21OH52j9LopmIvHLi8Nk8MQkqSv1TkWUy0pahI14RD/Tf7E7qfNx7v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=PblfomLE; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="PblfomLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=elpwtff7wzd6rj5x2nakqkxmrq.protonmail; t=1724276107; x=1724535307;
	bh=ibH9qiCDNlATlyikpueGmgp5dRHSsxzU+yLNl06j6EE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PblfomLE6muBkqfRqWh7GiLpLnZUsZGj3i/GaUEXcFLUOWqmqoJMN8L8RJZhNbwhu
	 CTi1x+I9d+QByJAElnUKqL6FZ9ShyZxJmudG9NpU+EehoUYSUN3f4vwJMcgTd5f7SL
	 /BUtrqaxLKj6Q0nE9RzqAeRzBUYZE7Vp/aNessljOp+pM8q45EmgI9rgvPdmLLmz4x
	 ryd6cC3fK6AiQ4NwkRPe1Dzabkhektu5tOu3GJA5U/ZjbmpwICZMmuYUP6pCUX/CJz
	 1E3wqGBkVwRGQ32EZIqd5f8tUqVXFSkmQzP6UD8s21te+8NJBwEzrjiiVSpliwB1f4
	 R+Ac7pSD+sbtA==
Date: Wed, 21 Aug 2024 21:34:58 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v6 25/26] kbuild: rust: remove the `alloc` crate and `GlobalAlloc`
Message-ID: <67403b75-682c-4851-8a76-b87fa8e4053b@proton.me>
In-Reply-To: <20240816001216.26575-26-dakr@kernel.org>
References: <20240816001216.26575-1-dakr@kernel.org> <20240816001216.26575-26-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 0eb86b58bf0acf7a80c2b51d282863a30a584ccc
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 16.08.24 02:11, Danilo Krummrich wrote:
> @@ -204,9 +152,6 @@ unsafe fn realloc(
>      }
>  }
>=20
> -#[global_allocator]
> -static ALLOCATOR: Kmalloc =3D Kmalloc;
> -
>  // See <https://github.com/rust-lang/rust/pull/86844>.
>  #[no_mangle]
>  static __rust_no_alloc_shim_is_unstable: u8 =3D 0;

I think Bjorn already mentioned this, but you can also remove this
static, since it was also something that alloc needed.

---
Cheers,
Benno

