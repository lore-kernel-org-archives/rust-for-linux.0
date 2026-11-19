Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106404;
	b=0KebHOsQYA5l955vSDqVRU8SBWkfbRRJ8qqd3MNfwojNr/0pF/bBMpIpyAdygJEeTY1z
	 DJI9Uq8YD96R/kJLOi0M6eGIV6vWaFBrVflJ/i1mkLfwSQfDxbxN7QEaygGt2q7MYRdNR
	 HRXH4c/ngqXlS1KbE+yKf+03LL58UHMaDGw3hpjbmWHHU5HcdC9DYO2ENE46MOJkl2my7
	 53xz5g/DO4aRG0knFTjrKRPpjgze/jxcZLw6aVMAr/fegoVaKKg8qsQLYXVNfxMkZW8d2
	 RZJ4mfQwBO/ptMpoeVgprw9ij5EdRG9O15vpy1YhaFsg0v55OHZhyA4kOKAhbzFY0sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106404;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4VzLDqafiDWhFr/DdyeQKRM0NcRyz0FQybaldYQnsfI=;
	b=4DBYg8RXbCNSN8Hrgq8RXh6SOH+8B2jTOubioZQr7aZpfmotlpKWPnu2ijixrQJ1B/+k
	 INtRrcqAC5ASRYLObboBkTbWWpGDKcWNIfZtzZoEmdQvrGlFg6AtA9QP96crqAE05lH+X
	 sOzW4BDcT9EkeXVw/0PAtvv81ptBpd+HUsid2l9Q3fp+jFyrOcHSrRLH0grAiMfAe1m+e
	 MfmKiZhwGieNFXap4U5VMK5MJcknRYs53DjityKlQuRg+YYfgVO82YuO/INSFdLaEdopf
	 epNJahsBpzFHoF09Txq6ZloMz+0vU6kMx50v2wDNwD8ofyOcWjilOZiTUCefEIul9IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eAVFNlJf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44604606A325;
	Thu, 19 Nov 2026 16:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eAVFNlJf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A232E1F000C6;
	Thu, 19 Nov 2026 16:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106404;
	bh=4VzLDqafiDWhFr/DdyeQKRM0NcRyz0FQybaldYQnsfI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=eAVFNlJfeKEpL3/1EoXVrCxRiDu8TI68rMxzUh6PyVPkfJHM6mhJtUlPG251K/mka
	 EmohQMaTJjXvqrIh/PScsUcXS0ekfsl7MlFOs07dLr5sv7T3OtDT9mQTPrU2XNcSdz
	 2jUATcuZqTkfxQaGMPf4FA3hR9HiPMLfo27Nx9wu1DfalCfN3h/8ci6AegDh77/P19
	 r1RBBlIcy8FyzZnOyp3JZGZ3fWqjWS+u8TQGd8ocwC1YMmXOyQmLXeCHCKrn199EJW
	 yIMXO54WsNrzbe7MXbrGJ6klwNF9Z8a6Pl7oc2gK3ynn5DXFkB4n9sRnM23Mc/CNne
	 3zyrFBDTIYYxw==
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfauth.ams.internal (Postfix) with ESMTP id 11CA81980066;
	Thu, 19 Nov 2026 11:40:01 -0500 (EST)
Received: from ams-frontend-01 ([10.64.2.36])
  by ams-compute-01.internal (MEProxy); Thu, 19 Nov 2026 11:40:01 -0500
X-ME-Sender: <xms:YCb_ag4uDpFv27jn8CuOXBWSlmjSm9tRhoOrzPGim8aX3Y3ZfjS0Lg>
    <xme:YCb_aqrLerbacfGddxYK089spM0P86UjoaoqUHYLaKrvD40CZTKlHrpTe3bbFov-g
    3N5rxdrmx8UvjxF5ug4IJtzO9GCyWYSjU5josYIAQaXeb5n4eAaZznI>
X-ME-Received: <xmr:YCb_auKSmnzgaYae-HO4xGpoZPsNEOWRu3byDAEoNTdFoYBf34pzADgAuy0ll66_0A>
X-ME-Proxy-Cause: dmFkZTGCPjoSuxH0fAr9/QnGtf8k3qsXIbYvox3eF/ev855AN0NnwQRh0s20wnNReHI1mY
    1MAs9dMfamltZFMfqcy6+GfGyTX7DTk8ofBSdS7O2AMMfY+YbZOv74NA7tjTng5rsio6fM
    XtC0FXS06fnB4LX3qCH2PP+aSO/+6usSr7B8DOeMITWtWC1smW0U85jJhuwNn94wlYtiqJ
    0Bptk5nAhgHjEWgvXkd6fr442yCMs9se7hPNXEfwwgtHpUZXMHnHRHfE6rAZ5WfD+qMgzP
    +jcqdzVRbn3pucq50T05OEQA0SdBnL3lUgJWZ4+XmwYQTgmc2GfatiBA5e4VzS9+8g5WnD
    LLLJ5hKxn2aE11lvcZIkIotu0LMKbXzm+oiQb1iItFYVu8GSnLRAN0p5vaRWy8E28KH3OS
    XBYDaHmbJ8VccXQJohUWZMOeGSQIQJzJEPwBRg0ylzXnFnEGAS/GUrRgVL1+Ji2cZlGQO2
    XG6VP/e9S3ieVC5SEOr83ezGJm0Pqt2LblcRqG/TW0xsQ/YUnJjrFrkasGYlKNw3a9QW2x
    qnhpHmvwR1Ck8tsXvV6VEpjr9X+1k8LWTLqyv0pydXq+I8touW/KfSnAivDgh2E4aNCks6
    XzIJ3YEYuZ6O/YrpVItZfMLGTTY8pLMiaUo2rtzKcQTlZofeEllU/gQqwW7w
X-ME-Proxy: <xmx:YSb_angtOrQ9cdKh5y_zsmvogKSnnwLAkUcZJOUjnPgDq1iA5uW7OQ>
    <xmx:YSb_an_r9ZfhCeranaw1GK6tWV0JIlirCLc_II0fKPEhsP9idd8L5g>
    <xmx:YSb_aroVVOQ7xVkFNV9SrhBlj7c9_WUmC-WHnmrZ80exb1F4mHP9-Q>
    <xmx:YSb_asNlcCzHNrtb9rCsQuCzQaYJ0JqSjzz_HcwNHZ383jiWP07u6A>
    <xmx:YSb_ap7j7-XMhuElr4Zsoz6DW5WFmRz4yumvWFuIUenOKjyw3leS6wTN>
Feedback-ID: i78584a88:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Nov 2026 11:39:56 -0500 (EST)
Message-ID: <44b2b390-e5bf-49ce-995b-724be11a9ff7@kernel.org>
Date: Thu, 19 Nov 2026 17:39:55 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: drm: gpuvm: rename UniqueRefGpuVm data accessors
To: Alice Ryhl <aliceryhl@google.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Sami Tolvanen <samitolvanen@google.com>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261119-gpuvm-data-rename-v1-1-8eb773435fde@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20261119-gpuvm-data-rename-v1-1-8eb773435fde@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/26 5:36 PM, Alice Ryhl wrote:
> `UniqueRefGpuVm` currently names its shared and mutable data accessors
> `data_ref()` and `data()`, unlike `GpuVmBo::data(&self)` and standard
> Rust naming conventions. Thus, rename them to `data(&self)` and
> `data_mut(&mut self)` for consistency.
> 
> Link: https://lore.kernel.org/r/20261118111653.448550-1-aliceryhl@google.com
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
