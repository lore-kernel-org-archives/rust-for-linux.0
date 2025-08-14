Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E649207A08
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755184981; cv=none; b=ntCZFsuPmX5GFqWVGp/uhF/frwsnxbPUQsvPUV8bh+wbOAZyCE/aScBp3CCU8ffJVpagLl/2JXGvjPyqFIgKiwLDGTr4bjvRMcsq1F54fkE772pfpPXguuWbVBI0O+AL/PC9vqRN1v9Ph+cxm2jacpCFgNPuZBVI+JepKoXP3H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755184981; c=relaxed/simple;
	bh=O7ZW23+LFmUZh72BGlXJqbj3TIFCDm1JySrm5jqogKs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=uWS5tPKFxANxtw9IWbXm8PmCA5FqnrpRbN8+lyXbgFCD4CGl+Lg/zeztr0OsuPQMvYmzs+j5Fapw0/I21cV2d5EdArsRRy6gKMJRoIq7XyLLPApIyMJDDCfXNUezDV+1ZOSg1H7WrfjJPASsOhoHWYaEIUrjs0ALSPPJVbIv7AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/NsYI16; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/NsYI16"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6CEC4CEED;
	Thu, 14 Aug 2025 15:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755184981;
	bh=O7ZW23+LFmUZh72BGlXJqbj3TIFCDm1JySrm5jqogKs=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=I/NsYI16YhHmMceZjnlQptUQzuWwKRdsqe4b1gHJRpMZeAvbifj4p48amqYFynYWa
	 /HX6qTQw+677x9QUT2AhhrP1Kmm9rkhbQ+CPPhfNbnf1NhFjlkrIQoNoOna8M5A1d5
	 ZEQjUgELZGYWaibZEp1s0RRTX8RTqCGnSvViR8HfFD24c6cEflRE3S60hjLBBcGwIf
	 k8lyYTOmmPiHLaeH3WL0/BmUGazpXHRn7WJYuQgee6D03mAXZ/ZA1D/JwNDZppmcL0
	 fXZer+I5sr1MDvfY6JJY5SPDXE7iduzpPeVqfs6/EaSepEyI6yVgjT7s1GJux4kltS
	 PMWkPAHJd8qsQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 Aug 2025 17:22:57 +0200
Message-Id: <DC295B7454Y8.9RVKVMPORAZ9@kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Simona Vetter" <simona.vetter@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 0/4] Untrusted Data API
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250814124424.516191-1-lossin@kernel.org>
 <2025081416-sufferer-economist-3f00@gregkh>
In-Reply-To: <2025081416-sufferer-economist-3f00@gregkh>

On Thu Aug 14, 2025 at 4:37 PM CEST, Greg KH wrote:
> On Thu, Aug 14, 2025 at 02:44:12PM +0200, Benno Lossin wrote:
>> I didn't have too much time to spend on this API, so this is mostly a
>> resend of v3. There are some changes in the last commit, updating to the
>> latest version of Alice's iov_iter patche series [1] & rebasing on top
>> of v6.17-rc1.
>>=20
>> I think we should just merge the first two patches this cycle in order
>> to get the initial, bare-bones API into the kernel and have people
>> experiment with it. The validation logic in the third patch still needs
>> some work and I'd need to find some time to work on that (no idea when I
>> find it though).
>
> Nice, thanks for reviving this!
>
> And we should at least add an example using it, otherwise it's not going
> to help out much here.  Add it to the misc device driver api?

You mean `rust/kernel/miscdevice.rs`? What parts of that API are
untrusted?=20

---
Cheers,
Benno
