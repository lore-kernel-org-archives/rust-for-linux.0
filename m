Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469087;
	b=xqE2IEtVjQTztf9VIw2rElFOMDTHsd8f0Vhd4nanvvskgqXMt+YtfRvL+p6Ix27cnN2U
	 kA7Ghfaqw62v0Cl3DPwxPGvQTSdoyGjtBaJ5u36y/XD6WsU1iq0wysO46rfTgYTRW5dZT
	 SD8iBsz+0ht6DJbyPes+7vXskZ66MjHhv+lRTbWvH8UwP/F7pvUOHPNwKZKYapBs5Zmur
	 2UIbqB2lSDLE77hHuZHxkPnM6Jnjn2NI0DlaFMpg+NTVqB3yzqFDE+6lYjjTCAWNaLjqF
	 Kj92wiW3Z6LC5UT8OIR1p6vgMUOKwSlbGpH0EiqYOxvdJWWr/S8A9O4yhjSF8mUkw4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469087;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cq6IKWIDbNjpXPFLCpPgSkSFMVQEhppjAvx+3Gh01GM=;
	b=iJqZV2RfI5IEx7sklf4Gmw4WhywfrUch9qpS4s9TgoLe6n6FOL2caUtLAZgoEjh/RTgZ
	 /5xJaprBcoagD/ZeQnXRTe5peigMnCPiks0qh4eCI/GGvgMngIY4pxO3GLzLzowOVnqgk
	 ingXkCeKPW4s2a8da3O8R1rX6cxDhBKqciw+0g4tWdzEdxygqohOj1Z9W0n6g1kqP4Y2M
	 jVZh/CBhQrSkVjQcddjGESwj/AM1f+yXLVLzHkNBn7wZtwPJ9sGnYF9UhR0cPDk9l/Z6e
	 yYkctv2iCFivnt5tqZv03ZjpFJBBCGWNhthHRVvLyPirzfHPybwM2DtzIWOEYvkqZQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EV17Nl5i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2786C606A321
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Nov 2026 21:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EV17Nl5i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1661C1F000C4;
	Mon, 23 Nov 2026 21:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795469086;
	bh=cq6IKWIDbNjpXPFLCpPgSkSFMVQEhppjAvx+3Gh01GM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EV17Nl5ivxnSJlgzd4GoYSA8ryGBP8bq1rrmS/gqJDgnxd/lG1tfJqHo24NdJM8Dh
	 yr+svb8zeViArD1Wpdtnz3lWYq3EhpnOcZynuRXzvkUz7akiPZhgxOB1sp0rdcB41r
	 QdEUr+8X2y9zWGM1YO7g1vZo2Xq3GudzIQD0bsVTSJGU9fP0MkNxVuVBMj5Te9iwYg
	 E6pE49bAUkkuisy4cNLu0XRzO+2qA1ugZ4vyPQqauKT1jalA/LXhkY50bTkrPsQzAw
	 wHXvHyM4CwTyMjuahnUntrNSTKLVW1YSKUJnpXQEbdZhm9WDm3oDXJ9zlVnoMqjyC2
	 llBB7cPIJLN0w==
From: Danilo Krummrich <dakr@kernel.org>
To: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	Joel Fernandes <jfern@kernel.org>,
	Matthew Auld <matthew.auld@intel.com>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] rust: gpu: buddy: store the allocator inside the Mutex
Date: Mon, 23 Nov 2026 22:24:41 +0100
Message-ID: <20261123212441.1649255-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122072007.14685-1-mbkchelofficialdev@gmail.com>
References: <20261122072007.14685-1-mbkchelofficialdev@gmail.com>
X-Patch-Reply: applied
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 22 Nov 2026 09:20:07 +0200, Ivan Tverdokhleb wrote:
> [PATCH v3] rust: gpu: buddy: store the allocator inside the Mutex

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] rust: gpu: buddy: store the allocator inside the Mutex
      commit: 4325f4aad972

      [ Restore intra-doc link for Opaque. - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
