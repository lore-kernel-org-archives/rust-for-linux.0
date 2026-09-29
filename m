Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F4A4BFE7E
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 10:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677243; cv=none; b=m3XSBKwuYK8OWFyMxAvywyLihPHlMtXEqPWXLSQnrPlN97jqAt6GU49Uj0qrO3KSekZFXA0DgovWj2/GfGLPaESwfImAOBHLllBdKAZi3aXuzW6/Qs6MEsHiirG9mvtD5jb4pU0daADJAF/GZvNtNSDGgCB0LpqVLHxEFUbnPXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677243; c=relaxed/simple;
	bh=wJ4AaFOJhsi8DkZE3nBfGKbo/MUDIAQkPUUcJaEOtLg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mDP5Pf5k2WKH0lYFAgdGq9gRvvNgRt0peJMeAK7+VHAfnPgSDPE1rHF5P3J3JnPgStLon4Ff0b+HVkNiySMHe8J/qteJzAVVYn0Ll3gfH0arlwRWpkpsCa+N0q4xrUzwZ3uKLtnNylb1ZuzlslqeZC7I/0ZR2kq8aY25hL9rMhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvfcirQ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvfcirQ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BA61F00898;
	Tue, 29 Sep 2026 10:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790677237;
	bh=D3wOBT+COfoR6xl8iBMARodnwxPNFcLWc8aMWEQ9VBA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RvfcirQ2nYosUnPU59G1l1K5Z/NG3pehZUHtqtNc5rF4hCvCPBjzTEjAU2TyC/Dr+
	 MlbSHf6qM+MlYdkzKQJzDOSW0RI54qv4EkCUdsSHNLjPjO6Ys6dmV8Ni7rsAEN7vSp
	 5fggmbQS3xQ93djrSz24UkhWd00m0g973c6mC4FcMnFDFvoBaPTjGNku6Qk4jS+/nh
	 PokxdHYL8y/d99Sn5/qKXKM9xhWNFrKb/9VC+3vB8ZTHKrdApCh5g/98H7BEy8uYfe
	 XMr7gv5NHj6JUgmzVexPmoJ4f2EzCe+WQpozrzcRIfegr2MWVmR4568iAKfz2hAx4A
	 r1YtHVWACCyww==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: gary@garyguo.net, ojeda@kernel.org, FUJITA Tomonori <tomo@flapping.org>
Cc: acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de, 
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
 daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com, 
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, 
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
 rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20260924232530.446588-1-tomo@flapping.org>
References: <20260924232530.446588-1-tomo@flapping.org>
Subject: Re: [PATCH v4 0/2] Add Delta::to_jiffies_timeout()
Message-Id: <179067695521.2043960.4723065133655174729.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:15:55 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Fri, 25 Sep 2026 08:25:28 +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> The first patch makes bindings::HZ resolve to CONFIG_HZ.
> 
> The second patch was previously posted as patch 4 of [1]; patches 1-3
> of that series have been applied. It has been reworked.
> 
> [...]

Applied, thanks!

[1/2] rust: bindings: set HZ to CONFIG_HZ
      commit: 4ebfdb2c8b28eb8ef85b4e4ce65e55bd5a4df8d5
[2/2] rust: time: add Delta::to_jiffies_timeout() for timeout conversion
      commit: a9aba476d42df2537403f97f185a2b1979d0dd97

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


