Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795382814;
	b=WzYjhdCYwmZQLufNHvxkpb/bVwlWIin+DDZgp26BNHTUrdI7+HUutQQxZAlDoIi6+Da/
	 f/fI97Rr60RwsmxGTdSSuyrg7S2kQsiajfRrj+5KdtdICGp1E/oNoaHb+O2pygwdy8py8
	 2iAdMld/PP5cFOlf+FSie+3GzILhfssSVngiQ2vIRAo/vs6q/JkFwfWThkzzr+k51NCji
	 VYQ9RUKLNwFHs/vIPDVAMpcE6svtzep/wUPTdy/DKh7g4WWeeJv07PAT9R669Gbikwcx4
	 cjRu8e5WmWeoeaZEVy+N56Se+rG29pRYbRv/tWtXvi4YFuVp4PN5cVHZ9elet7nZWkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795382814;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=jsDS/or0ZVK6HGVKSX4EnqK/vovBXxaPLUaDJcNOoUA=;
	b=rABif54Mgb3LCP6NWrnV5PpCWL3iEL/UtHdnYOiHlCRvbq+HSMvdXJPp1UeqU+KRFHYY
	 seZ/Vrc2f2m3U3sQeVC0JtRgjLm0+wD+WP8bqmrPd/grEvthu2lQnFTTDJl9uqHl59sKJ
	 zPR9Q3tMw5oVB4FSw6fjdgimUENVQjQ00h2ez/mdb0HUn/nEq8a09I2PLo/76GOHT37GZ
	 uPkqQ8e0Miyt+CkrYkcNwjzaafvWxYD+9OQc73N2TkWbDf+wu4Sri6u7hSOOYzdK0kpUk
	 Ov0GjjvjAtW5yNVL9M2nArzwEsMVBLjmwHbXrZ+upivTjhAAFLdUeYlCT+5lHY7t6bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xANBxYUI;
	arc=none smtp.remote-ip=95.215.58.50
Received: from mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808B6606A320
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 21:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 808B6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xANBxYUI
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Uow9eIxLhRXEAVGxWSlS7vx9hm4sdE+4FNVYGS631Rc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795382811; v=1; x=1795987611;
 b=xANBxYUITi9B5efgDjY21YP7+PE0dMcqBar8Ng3EmiStWfVHanEK6c560pHB4t/9gsezaBaH
 rvwhOT1xv/6Y/QStO/Re8XRrr8GbhcQ5ytx93CZbsQfCiK63G6ZX07+KW7qX58pKratQgFo8Vuq
 NBJqFOjimS3cokAJfeWpVizM=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0d161315944e3b4a;
	Sun, 22 Nov 2026 21:26:51 +0000
X-Mizu-Trace-ID: 0d161315944e3b4a
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Mark Brown <broonie@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Shuai Liu <847807867@qq.com>, linux-iio@vger.kernel.org,
 linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v7 3/4] rust: add minimal IIO subsystem abstractions
Date: Sun, 22 Nov 2026 21:26:50 +0000
Message-ID: <179538281024.9825.4132712997497273037@linux.dev>
In-Reply-To: <20261109155743.83740-4-muchamadcoirulanwar@gmail.com>
References: <20261109155743.83740-1-muchamadcoirulanwar@gmail.com>
 <20261109155743.83740-4-muchamadcoirulanwar@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Clippy shows two issues in iio.rs:

1. Line 332 -- ..unsafe { zeroed() } in VTABLE. The SAFETY reasoning is
   already written above the const, but clippy's undocumented_unsafe_blocks
   wants its own comment immediately above that specific line.

2. Line 408 -- unsafe { (&*priv_ptr).channels() }, drop the &:
   unsafe { (*priv_ptr).channels() }. needless_borrow, no semantic change.

Cheers
Igor
