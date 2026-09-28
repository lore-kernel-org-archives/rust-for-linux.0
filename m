Received: from mta0.migadu.com (out-45.mta0.migadu.com [91.218.175.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD353DDDAC
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 03:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653755; cv=none; b=B5NWkJ4t9zffB6cj9/s4cvLC3q9y1vmnq1TBu2j0JPdKdcSowEDGI+I0mwsKq/upnyrlmQjISwYnbvL1XhA8WfvVqMjxGbeI3QQbzFgt9P+Fa1igA6sv1fq97wkwYhVFzOEM5FVHgPvIBFZq1jhp+yecb776Bm+th+V8d9rEKz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653755; c=relaxed/simple;
	bh=Fvp9hn8BwhRF0NAnwNtaPHEg1s+I/R+7YNBitZfoCQE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=BNOS8SXj0iQH06iFf/6bWkXLAIwHvKVsUjJ4KDWs/UDRslqtAKtX862uiGw++LWJPpF9ksmsoMQQxFtFHtEJVT4CqjdRiCBDKMO7SfMhwMIXE1P7KCvMuZpwePZR+Des72fi32hLD0Y3559yHUZGkxdxUioELYeAEZGYGsMkfGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fgthNkwn; arc=none smtp.client-ip=91.218.175.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fgthNkwn"
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Fvp9hn8BwhRF0NAnwNtaPHEg1s+I/R+7YNBitZfoCQE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790653751; v=1; x=1791258551;
 b=fgthNkwnHtTRZ0n18mQYOmug/n4yaFmTsfNWs97K9XF1iiU+YkoL7MZjDSevG/G3f/cv4638
 5Dx7VhOXVZie83WWw8fTY5Wqivzqyc4P0XuPeGIcBx7KwEdxmOeayPFIviBhBz/+cff9zSGAjxM
 3kS+HFMtf6D0+uDHnk4r6xCg=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 573999a2c23f38af;
	Tue, 29 Sep 2026 03:49:11 +0000
X-Mizu-Trace-ID: 573999a2c23f38af
X-Migadu-Flow: FLOW_OUT
From: Alvin Sun <alvin.sun@linux.dev>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 Ke Sun <sunke@kylinos.cn>, Alvin Sun <alvin.sun@linux.dev>
Subject: Re: [PATCH v2 1/9] rust: sizes: add SZ_4G constant
Date: Mon, 28 Sep 2026 18:30:00 +0800
Message-Id: <20260928-tyr-ioctls-v3-re-miguel-1@kylinos.cn>
In-Reply-To: <CANiq72mdp9hS_U=Mtf5F6Qv8M9=m38xOXtCP_a4c_QtkwhpFEA@mail.gmail.com>
References: <20260902-tyr-ioctls-v1-0-e0fdbf8bd108@kylinos.cn>
 <20260908-tyr-ioctls-v2-0-88bea777df67@kylinos.cn>
 <CANiq72mdp9hS_U=Mtf5F6Qv8M9=m38xOXtCP_a4c_QtkwhpFEA@mail.gmail.com>
X-Mailer: git-send-email 2.43
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

Hi Miguel,

Thank you for the review.

On Mon, Sep 8, 2026 at 9:47 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> SZ_4G is used by the Tyr driver when splitting the GPU VA range into
> user and kernel regions.
>
> The message should explain what changes, e.g. a new paragraph after
> this one like "Thus add a new trait that ... and implement it for
> `u64` because ...".

Done in v3 -- the commit message now includes the explanation.

> +const unsigned long long RUST_CONST_HELPER_SZ_4G = SZ_4G;
>
> Is it added here to be nearby other sizes, or something else?

Yes -- to keep the size-related helpers grouped together.

> +/// Only implemented for `u64`.
>
> Intra-doc link: [`u64`]

Addressed.

The Acked-by is already carried in the commit.

Best regards,
Alvin
