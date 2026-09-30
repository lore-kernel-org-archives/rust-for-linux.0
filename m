Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051C95187F2;
	Wed, 30 Sep 2026 18:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790792452; cv=none; b=UFSxbfy5SqS2DosyWLe28f4V/UBciQqlBcMfr86R4K+wcNRD1T2zOPIRMIWJ7OIcBLGb5KVS3oUzWIddOg81KW3ZJhrWx4GpGesWoW/wp+AW4Ou4mqv674bUVFBaAjL9qfU6jfI8FhVvyhWq7opTyWEx5l2Cxj/DDSoj9a7GcL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790792452; c=relaxed/simple;
	bh=iKB0Xr798o8BJ/ut3lm9p2YkMA5yP6qEFVA1Z1Go+O0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jh9ImACMibPl2L7fGkbfuCXtFToJzVcTmDEcLJ1gaBfJ2sbq8ZxY8TC+GJKlpTZxC2Q4MLQTszwnb6PZcHBAkRka3xixceNM1ohXrgFWBJ/dxfJgi5Y3YYaiPL/L6Z8lSMQewDNBFmxMXrLXG97a+RIodBAoloUulhFeM1fKK7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnYqD3A7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnYqD3A7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1EF1F00898;
	Wed, 30 Sep 2026 18:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790792450;
	bh=iKB0Xr798o8BJ/ut3lm9p2YkMA5yP6qEFVA1Z1Go+O0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZnYqD3A7oykjQNYGXJK1Vx9gr4KPzsnjxa7+IC058q+p7gjS0Gi04R+9dr0Oz26Y8
	 G6OclGLe+7e2ZGmDppUKwPvanz+aiesTF3pC9Z1nxKsyxyNAjeG/GZfiE3d6AUFQfn
	 ESDIuK/Zj8HZTJwCKZM65bxLklrxW7CqUIgvNft1GFiEfg0yDq8y4Uj/bgsopQZ5VE
	 n8itb6h/+OMlnk6cp/FDn1+jASJS9BhWpmBhcibpv3OoNdyBAQzrqLSCiCpgpGy9Wb
	 P7Q3XZHYqeUwc5BV7K510bvK4qqLIEjwk5tCmF9S1Af/ClWhcabiFj/dU3sH4TT3f8
	 OZrtdon53UWWw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Filipe Xavier <felipeaggger@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Filipe Xavier <felipe_life@live.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Filipe
 Xavier <felipeaggger@gmail.com>
Subject: Re: [PATCH v2] rust: impl_flags: add conversions for raw flag
 representations
In-Reply-To: <20260920-add-from-raw-conversions-v2-1-cef8e6e23ae2@gmail.com>
References: <20260920-add-from-raw-conversions-v2-1-cef8e6e23ae2@gmail.com>
Date: Wed, 30 Sep 2026 20:20:37 +0200
Message-ID: <875wzmbnyi.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Filipe Xavier <felipeaggger@gmail.com> writes:

> Extend the impl_flags! macro to support conversions between generated flag
> types and raw C/UAPI integers. Implement TryFrom<Repr> for individual flags
> (exact variant match) and flag sets (rejecting unknown bits), along with an
> unsafe from_raw() constructor for flag sets. Additionally, add BitOr and
> BitOrAssign implementations between the raw representation and flag types.
>
> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Suggested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>

I feel like I already sent a patch for at least part of this [1]. Please
go review that one and maybe use it as a dependency.

Best regards,
Andreas Hindborg

[1] https://lore.kernel.org/all/20260605-impl-flags-additions-v2-1-0d27242f460b@kernel.org/

