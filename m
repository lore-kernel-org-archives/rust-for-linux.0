Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260690;
	b=KCGo6+Oh+s3Lt2Hq5239g+0mad6xHaCzFESehvSaFCHeDOxtyzR6R9mZKemlxPKhrb4v
	 SPLtUN3LDBIeCDvNj50hkrLAe1WIaN2oa+YcAzFQVkivrfuQiiMSlfh1rIJaOd3tzHqQk
	 jfRC1xPDkcleLMaGvI52zs8x5iqdRG3QBFZLJQGmOtNGi3VPkocuRa9Fn5FCdvm4ronQ3
	 tEKvKHqCOdSS9hzo/y7ghMwgRsqaoOxkORab5NQFpAzdL6X9Bjzt+DETQnz5rAQYjEW3z
	 ygXIHD9cxuVvZjmcyfW3Oioxw+chzKIlgbpSNyMHm4Q9MEpYKImDiB4+aLDkOoKi0YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260690;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kS/M9dDAZFrVyzOG9MCxjz/YBGyAC4LVjDAWRbwfpxQ=;
	b=omPJr6rDjVuOYmsHdoxJ70eWg1xbj5M6TCpV8ioBBKQnoqKG4JV6nPCInzxaQltUtRjk
	 w374cFbp40qiC59En4R2jJcaux6GnBs453Df/UXMlvVU6C/u/M5u/iNnMA9+er4698LYu
	 lYcuU62ijiUtrqdlifr12KSdiEdoNnF7buNzouC7nSQ5QvWIfMJ93w8QWvCpxqBaMhwyC
	 wlKHNsHiPgMtluWHmgwayQW80PL+TsIMDBZkPu9Zz60Umwez1YIRCk+i68VGttU+Q+AQy
	 xjJ3GD/IGpJaLaXdetW4CUkVWccl8oW/F0wnnPRuYjW8r/CTqdzN/fLYq6EgDbnofgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dbz1WpQX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F19606A31C;
	Mon,  9 Nov 2026 21:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dbz1WpQX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C38AA1F0089F;
	Mon,  9 Nov 2026 21:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794260690;
	bh=kS/M9dDAZFrVyzOG9MCxjz/YBGyAC4LVjDAWRbwfpxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Dbz1WpQXl0HkR+r8wl7O46eDNQstjWWi36uG8/B2BvikzlOhsWdOeGl3Q7wn35cJo
	 iT7FgZA6cq759u1uIQcDRDIHC8SNpU+t67gjGjHvA2P6JrW5DApdafs/GuKJTicNWI
	 sda+pzd19EX9cF34LFuKWg4MpPiwx0cuI9oCS6hwSbn+a6CjCKP6/hdjxd28gR6xg+
	 NHAFDCCeQIkSuySdLMBVpZrfYT+qgbKbXgbrkxVHi7adx9lNqYnsd5b5GkQSWnGyKZ
	 doncX8uabLXaf6ggsU0qXjwu1g2vAIs/X4Zib4UKVTQzOAFm3JKOsCC/+S7CgN+FiN
	 AQ8cRKR1u469Q==
From: Danilo Krummrich <dakr@kernel.org>
To: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
Cc: Igor Korotin <igor.korotin@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/2] remove TryFrom<&Device> implementations for pci and platform
Date: Mon,  9 Nov 2026 22:44:44 +0100
Message-ID: <20261109214444.3959998-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793818280.git.nico.antinori.7@gmail.com>
References: <cover.1793818280.git.nico.antinori.7@gmail.com>
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

On Wed,  4 Nov 2026 16:50:13 -0300, Nicolás Antinori wrote:
> [PATCH v2 0/2] remove TryFrom<&Device> implementations for pci and platform

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/2] rust: pci: remove TryFrom<&Device> implementation for &pci::Device
      commit: 6a185ac6b46d
[2/2] rust: platform: remove TryFrom<&Device> implementation for &platform::Device
      commit: cecc2e38b631

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
