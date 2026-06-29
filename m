Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424D23DC4D3;
	Mon, 29 Jun 2026 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743854; cv=none; b=UGTfcnTtpSHEsm3jo5ohNOyPdrQMLlAxoNh6pMXcv/xq4YRTn/5u88ieT8ZKQRasn4UVJ842zwNJ/4v8ITqh4dgQArUI2i5XPa/DIufYYjz8+uWW3vjFpvhJY2kWiQZ0J6zVqiK+Qvaej1n4jyEK38L+SKFW8cl8/cd/01W7Bn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743854; c=relaxed/simple;
	bh=JdhXL8OZYDqag3oa6EWNJppeOZO4fKrzuCDDMmRFLVk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=JaWP8iCVY3teXtZ3nDe2Eo/4CgvqEiQ+7yTf9NnNMaC3u4fwrVuoJaT9aSEF58CYvxZY3iNcx+Jij9K576SwcWA299UStzGoo9Id8+4B4/bBTLajmMFNP8jijsf5yxCQoP++T8ivJUyRMrG9pwTrCzeMy/CbQgRiXPBSVR7Z3XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAHVePvQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAHVePvQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDB41F000E9;
	Mon, 29 Jun 2026 14:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782743852;
	bh=wacbruI57Ti0i0ovu54z31bxr/8Arjuy1hvw+9UOUOM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=BAHVePvQvJhywwCFa8jCoRvO3lWUiRfdvfWEoFIGVhpT7UGCnzPQ9HZ6oriWNm18W
	 bHMwbRZXnmtVtfCHMHDQt9Fctmvt3NN7v4FhvNbXqQdufisbLyrR6WhIoPxoF+dhbw
	 9HgOjXOxcm4VuAgfEPF9sLXiD0k/oc/23rhKZRXu6wNa7lmkg3kV0CdjRUnxNYSFIe
	 103jaAF74hSuenitmjmz78f4IPxPE+M0oKKjpCVwW2RqaXHvZaelAtb3faXwH2OHaP
	 1t4O47uHjvVQ1ftSACmAyhwgh8NLD0D2mYJv6lemPCJYw7EeWiJrXbO+ciUZpJ8T1p
	 v5yQLHYbcBfZw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 16:37:25 +0200
Message-Id: <DJLLY8IW19QN.32Q3LWBW6L8AU@kernel.org>
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
 <DJLJ3UNHDAU3.14K32FFFAHY8A@kernel.org> <20260629172714.23433d7c@inno-dell>
In-Reply-To: <20260629172714.23433d7c@inno-dell>

On Mon Jun 29, 2026 at 4:27 PM CEST, Zhi Wang wrote:
> On Mon, 29 Jun 2026 14:23:42 +0200
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>
>> On Mon Jun 29, 2026 at 12:39 PM CEST, Zhi Wang wrote:
>> > - Adopt Danilo's higher-ranked lifetime model for callback-visible
>> >   registration data.
>>=20
>> Thanks! Have you seen my subsequent reply in [1], which achieves the
>> same thing without requiring ForLt, but uses a GAT lifetime instead?
>
> Ah. Sorry, I missed it. Let me re-spin it. Do you mind if I put a
> Co-developed-by tag in the patch? since for Lt and GAT idea are mostly
> from you. :)

Thanks! Sure, that's fine.

