Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B341A1EE7D5;
	Tue,  6 Jan 2026 22:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767738875; cv=none; b=L7iyD0DLRb9B58AGePSf9uyHgVkCUUD/II9QBqAOdHba7hg1se+dkaHaiguRsIGOcAWxY29GSdYlmHa9XRpJKzMqz+UeAZu7h0k7jZCpZNfQS/8O27acWA9L8o1y8lZEoKiqEquTPDlPMdnDZOUvqh7sLrE+QAm/hGTCgp7Z4KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767738875; c=relaxed/simple;
	bh=MRuGwkFsKg8dk7GOnhw31S3ja+uGeCcZOiBYtiLF9xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ApmwhE5oKmim+1nCLrIIB/Zjz90qJabF56GwxEwJTlEAObG9gFv/X6sxiEyNCf2OS36aXdB66u/5C30xE4QunuWYZIWaVz7tgOWui4pYa6JCIbMoMCAjv3JrPwQhVFLNeqMDpHMld3WbrjBUUxYWNkwl6fco0F3xj/v6tcGlPoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFKUynMi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFKUynMi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A05C116C6;
	Tue,  6 Jan 2026 22:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767738875;
	bh=MRuGwkFsKg8dk7GOnhw31S3ja+uGeCcZOiBYtiLF9xg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bFKUynMiU31p2BmkGdYQ93PDxhFR6Ru9HR1KNDfhNXW5SRiR11XZW8KHcPHRz/w8S
	 tUhdIOXkovKHo/kf0N23yuHWOXW5Ty6yIV8k+J8ahWY4d1agjq+J0BXWjvT03R2pFh
	 s9KRvYtDL2N7VDgNHrv3ZOL+a6+EbxTL5u40clTsm0o2f0lqsWz0DOUXFI/AxNIHIw
	 LMVrfCNL/8M92sD/DaecZEFvj6THMVm9eZqSwtsRUh3nvWvFE8VYYkLf8ehR8mb/8M
	 k0PkgkLf5IG/+ehbbo5KIK4IxZjmInYa1O+8U82hgCojcwBPd/thNkhkF6II1kJ0OT
	 y7ID+LQZ2kc0w==
Message-ID: <f27a000d-70be-4b49-be2e-07921c1b6b0a@kernel.org>
Date: Tue, 6 Jan 2026 23:34:30 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: drm: Improve safety comment when using
 `Pin::into_inner_unchecked`
To: Ewan Chorynski <ewan.chorynski@ik.me>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251228-drm-gem-safety-comment-v2-1-99bb861c3371@ik.me>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251228-drm-gem-safety-comment-v2-1-99bb861c3371@ik.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/28/25 5:15 PM, Ewan Chorynski wrote:
> The safety requirements for `Pin::into_inner_unchecked` state that the
> returned pointer must be treated as pinned until it is dropped. Such a
> guarantee is provided by the `ARef` type. This patch improves the safety
> comment to better reflect this.
> 
> Signed-off-by: Ewan Chorynski <ewan.chorynski@ik.me>
Applied to drm-rust-next, thanks!
