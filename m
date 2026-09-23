Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD3E2857CC;
	Wed, 23 Sep 2026 21:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197459; cv=none; b=VBqd5zfQKZlol3P1azcqPV1qIZhc/T2g7fFSK3vkakPoHMPsMXrKVo3ettSVyAdT9syb7lxcwLgY1rEcd9EChoFv5UdrEHKNhHUX6NBmzWsK8Q0xU7arnxk88JP7LzJyC4Gjjdt1XXAktURNggndnIPM4o/AS2dl7qCVCsr+jgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197459; c=relaxed/simple;
	bh=eFynEQ1U9RHy2BUoAA1WUWUscueo91hylsSGeL/lrlE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XvOly7Aumgx+W9aSxzPmsb+yARZaLJ29WLii72pIgEG5Pf9+KzHyq/Nm02irVxIJZHT3a+bN9cQkAFSxH2KxUHgVTfeD/lyK/7UbRl3ReWvTTstAmE+wTUhA6uQEfYDsadzkJu2/UdCw5/Bt+EEgjKdPT714Hnt1DEb3fhFHgsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loIuJnyw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loIuJnyw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951F51F000FF;
	Wed, 23 Sep 2026 21:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790197457;
	bh=eFynEQ1U9RHy2BUoAA1WUWUscueo91hylsSGeL/lrlE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=loIuJnywR4dOQ42AYkKA+mTYiS6HxKn20PjLeoAygpLLs+pyYjpCcRQshzSdQBgAi
	 6VNYLe5kQBlx0sM2G4NQybhV+J3IJJgOK92l4T33YLw9vOa1jf/eBo/3IP/MntA4N2
	 Em61sfzs/h4MP92B3ST0WGBbi09EKCq3l31+G5oUg9s/Zd0zz/7G4a/AGwqTTLqOu1
	 XdRSIRRb+pEO56ayQ6Yu9ipHuyt1Tt8oCT0JKqVw/UyEaqyK8Y6RgN97/qQUktocdn
	 Ilv/HhSCK6BKj0BnzK9yc3QCcNWqCSs9+HBPKmn42aWnPniMGcKqKWueFZ4GNm90jD
	 3QTzJYRXtcINg==
Date: Wed, 23 Sep 2026 23:04:10 +0200
From: Daniel Gomez <da.gomez@kernel.org>
To: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Björn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur Özkan <work@onurozkan.dev>, Andrew Morton <akpm@linux-foundation.org>, Julia Lawall <Julia.Lawall@inria.fr>, Corinn Tiffany <corinn.tiffany@inria.fr>, Liam R. Howlett <liam@infradead.org>, Philipp Stanner <pstanner@redhat.com>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Samsung GOST <gost.dev@samsung.com>, Daniel Gomez <da.gomez@samsung.com>
Subject: Re: [PATCH 0/3] Rust XArray
Message-ID: <20260923230234.4-da.gomez@kernel.org>
In-Reply-To: <20260923-rxarray-next-v1-0-92eedf185649@samsung.com>
References: <20260923-rxarray-next-v1-0-92eedf185649@samsung.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-Mailer: lorebird



On 2026-09-23T23:00:26+02:00, Daniel Gomez <da.gomez@kernel.org> wrote:

This is an RFC, not a PATCH.

