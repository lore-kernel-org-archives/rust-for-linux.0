Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792511434;
	b=0l8KKNggJm5MvGteZZp2vjz58Gsvqdd1K0QzR0I6qgD0LzjLZJJ+SAOYdFgCL7MuoF4p
	 UCqXZmKPQDI/adN+iYxV5qjCPyIIbvaUOhivL7bhFhQcPV3QzYZgRkXirhIZY0svyUz3/
	 gRgBad0P+d1DExVrAf9QcemZln0cpSDJy07vN+eTkycl0P6A5k/zCeNv1VRQGejZQADLF
	 P784CFrQ/ClpwfK0LrPljNxu271hCf72VxyZTKCHsT6bf1p2z1hxJ5fsb24i620E2kvlu
	 E0BNKDW+YU3ZBUTJbVtFrB90WsoQw8Mv9ic+sGLNoe0tRrifrm+yj6I3jPGlZiyOgjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792511434;
	h=Received:Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=t0bi4tUQr/an9lqfPaXouTWkicH+9GlX4LzyE5eMtI0=;
	b=yWyB4ikmB3Fi+bqZoOMMlhq2y0nCsZevMvFzIKyBWsSNiC0osu0TvxU1BmuNMRI81rKC
	 hQqegD6f/3UFiatv70q8mySLph4shJsUtYHtB+7jlBFgDrvyqPt3gTMRUGcKs6J9HsZXP
	 R4l7ZQFeWuxFAyTcQhwB2A90v7Y7ehpA1scy7kcZM/0XhfZ1TLyA5L/HqKDOpkNlVBpdo
	 FbVwfvf+5M8lMCgrs3ZTp0PdklbFBqaQU5dj2WygyCmLytnCSbWQIVldp4D0iGwP4TO2T
	 +aZrvwXrbFF6FBiZT3BDh6IgsYjZxxx15TJmRdLeiZ5HdgbDp0oMzM+feJqMHyK7kAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB9C606A31E;
	Tue, 20 Oct 2026 15:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55091F000C4;
	Tue, 20 Oct 2026 15:50:33 +0000 (UTC)
Date: Tue, 20 Oct 2026 05:50:02 -1000
Message-ID: <72dfeedcd55b27783c86f1a3ab461865@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Carlos Llamas <cmllamas@google.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: workqueue: replace deprecated system_wq with system_{percpu,dfl}_wq
In-Reply-To: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
References: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, Oct 14, 2026 at 09:08:35AM +0000, Alice Ryhl wrote:
> From: Danilo Krummrich <dakr@kernel.org>
>
> system_wq is deprecated and triggers a runtime warning:
>
> 	[    0.857414] workqueue: work func ...WorkItemPointerKy0_E3runB7_ enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Replace system() with system_percpu() and system_dfl(), to match the
> previous behavior of the deprecated system() and convert doc examples
> and tests to system_dfl().
>
> system_unbound_wq is deprecated in the same way, in favor of
> system_dfl_wq. Since system_unbound() has no users, just remove it as
> well.
>
> Fixes: 64d8eae3f895 ("workqueue: Add warnings and fallback if system_{unbound}_wq is used")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

--
tejun
