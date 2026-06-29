Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866D34014B8;
	Mon, 29 Jun 2026 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735971; cv=none; b=KZzuDofqTAt8dwZbfXYSdFcpvJ3xBqZdu1xg6uqh7Quts6NVR9/nYDWgKLuUl6h7pQSK1ihBrR99BSjcn18lmQJqUEVKr8TqBrImdTsc+BTq8+wpHFmZFeWUg0uYkibWQYt9Iz0FSmCB01ggyccrgCUVG8j4cIVdLffYk5heSzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735971; c=relaxed/simple;
	bh=GgPSkpOzkxbT7cjHq5hPsow/r6xZYouVFtmo5fppXD8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=VkKLkTFarodRa88GDlgCOKP1/3w2LLoz46xZYQGbFa/uGcmtYGkecOnAQsF0U8nErBUsO2X8HEY5fhLmrLhJcmpEXTII6eP5EfBectmGphA8baIgUdBIL34bCxFQcswIlLs3HKhzQPFCHTiYsacVW+snqAV1yzOv7Sgey7wFG3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEp/zxAS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEp/zxAS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74E01F000E9;
	Mon, 29 Jun 2026 12:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782735970;
	bh=omva5PRViUmF4B/hY92JNsy6FqQ7kvygyoVkds4cU1k=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=SEp/zxASKPlf0IU4KEmddv/33VWME3/6afQzUC6cw8AyAfSibBlEu5K+/DDWbU3Dm
	 OpixQDLnqC6oHlowj0ufGH1FAyBR/f6ArTGOFFcQzwKvMLYGNHo2Y45vfPq/DRwjxY
	 phov4udzcIAIeLVWihuvcsM+lhDQxX09E98XkoU9hxdHc6envMYq58HdTjsoIkcbd2
	 8ANxZDuzTqW9tlxCW6dW8gX9O8njLtxPLeS2Mv0Ew//dtQPXJQqdoBtSBg2d5n4l0s
	 yh/zFkANBlMSW907jMyVtDT44DIHpvBmCUhInu5Afr96qFdK/qJwy61hNtzDgiWiwJ
	 mIuXcyCTr6sJw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 14:26:03 +0200
Message-Id: <DJLJ5NF4GQP6.3HHJFA3R4IJ8K@kernel.org>
Subject: Re: [PATCH v5 0/1] rust: introduce abstractions for fwctl
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <jgg@nvidia.com>, <dave.jiang@intel.com>, <saeedm@nvidia.com>,
 <jic23@kernel.org>, <gary@garyguo.net>, <joelagnelf@nvidia.com>,
 <aliceryhl@google.com>, <kwilczynski@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
 <acourbot@nvidia.com>, <jhubbard@nvidia.com>, <zhiwang@kernel.org>,
 <daniel.almeida@collabora.com>
To: "Zhi Wang" <zhiw@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260629103946.3117152-1-zhiw@nvidia.com>
 <DJLJ3UNHDAU3.14K32FFFAHY8A@kernel.org>
In-Reply-To: <DJLJ3UNHDAU3.14K32FFFAHY8A@kernel.org>

On Mon Jun 29, 2026 at 2:23 PM CEST, Danilo Krummrich wrote:
> On Mon Jun 29, 2026 at 12:39 PM CEST, Zhi Wang wrote:
>> - Adopt Danilo's higher-ranked lifetime model for callback-visible
>>   registration data.
>
> Thanks! Have you seen my subsequent reply in [1], which achieves the same=
 thing
> without requiring ForLt, but uses a GAT lifetime instead?

(Fat-fingered the send before pasting the link.)

[1] https://lore.kernel.org/all/DJJW7X4ESDSM.QCVYK2FC7ZR3@kernel.org/
