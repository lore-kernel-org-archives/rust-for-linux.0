Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795357898;
	b=TPRUY+B9V2rN+01AX+4vUrqQejFkRxDnJPVUc3rrKZNNkV03GJjoGwNyon9Wjx1QNfje
	 Z+2WHV8a8q94cOQVsOov1+IXKrl0NUBE1uJQCyv9Efzkl9fRtMItRnMQPIDVep11ELxYP
	 b6xwDzdE8viH6vymWEf9yqsGvcHfQ3ifjd4RpSTvtUWJESdy+K0DOlCUlEE0LM6Aj20qI
	 JJcb0vZUQPVvztzcTJQ6ibceIJECVWNyAeBFF+Ps8p52qFsp+Valk1cs/BzC3hhE4zWXm
	 D04CPpGsdqIFyA8XqJoNJPjO1sPr31RQok+R7ampJgEXEiIB377GlAaiLBjPMAGwYtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795357898;
	h=Received:From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=kEuos/49BxvXn+7tiGluJ0Y8O79w6clF6lg/iuCdxnc=;
	b=fUEFF2Q/pnjqApCRuPSbYzv+f2G6VPSD3/meKE00/ltEAVUuHc6VSy7TXTQeKvEJvn1K
	 6JVuW5rgnUpdvmkNgKjpFZ1ClRbgubtiFHRcqKt/doCq/2VcMLAT4OOhYLTsrixa5hzuo
	 UVANeY+H6ZDb79/ej4eES0d7PSEtljSr5D6HoHIBTSbyOP3R6UWUU4On7/Ao+Tfu+Ahel
	 pQbHgXquLIc4nk6IBJVLWdoxIV6DyC8eGZOVDWLA0y/eOcJe6NtisK76ul/at+6a9yDfL
	 9iZkMHJwAKuhsLmEjtDbBzAJ94YUTixo2Fd/os+DuWxepsvEfC+2qgOH9YXbH5P6EKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A787606A32A;
	Sun, 22 Nov 2026 14:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72311F000C0;
	Sun, 22 Nov 2026 14:31:34 +0000 (UTC)
From: Gary Guo <gary@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Gary Guo <gary@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261118-dev-project-vis-v1-0-2a5f433bb516@garyguo.net>
References: <20261118-dev-project-vis-v1-0-2a5f433bb516@garyguo.net>
Subject: Re: [PATCH 0/3] rust: pin-init: reduce visibility of projection
 methods to declutter rustdoc
Message-Id: <179535789457.2426615.15352202505890903314.b4-ty@b4>
Date: Sun, 22 Nov 2026 14:31:34 +0000
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 18 Nov 2026 14:31:19 +0000, Gary Guo wrote:
> Currently all types that use `#[pin_data]` will have projection method
> generated and visible in rustdoc. But for many types, all fields are
> private and thus these projection methods are not useful as public APIs.
> 
> Thus, compute a least upper bound (LUB) of field visibility and use that as
> visibility for projection methods instead. This means that if none of the
> fields are accessible publicly, the projection methods won't be as well and
> thus will be hidden from rustdoc.
> 
> [...]

Applied, thanks!

[1/3] rust: pin-init: internal: allow `clippy::large_unopt_stack_frames`
      commit: 5a2024c03eb697463e738bb216b3d321aa278877
[2/3] rust: pin-init: internal: use visibility of the most visible field for projection
      commit: ac4e562262056c02851e33163b19fab9feea6d60
[3/3] rust: pin-init: internal: hide `HasPinData` impl
      commit: 5eb5b404e6e7631a986333f00e7b3b18aafcfaa8

Best regards,
-- 
Gary Guo <gary@garyguo.net>

