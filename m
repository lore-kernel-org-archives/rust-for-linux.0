Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EB83B47D0;
	Fri,  2 Oct 2026 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933092; cv=none; b=u6X625d8JNNH0lMAYpbPSFNfilcXxBCBjZHjbezCNNdGNxqI//SnAY+X1ti1zjbevAtnJ2RbR6IaU/Vlmrqz0UblDoLpp/uUadbipMeK5MS/eKg9NxU8T+vSKzB9kr/ktX5KAg1XDqSeeFUGWqRoxuwve1GiohugZglizrNmRaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933092; c=relaxed/simple;
	bh=w3Bjz9dcD6RI5n9PbwOBCd5YdLRwlzPVm58BVXg/OwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOQ52WRBV4odyvRZwZIjhcR9iqlBY5GkhcSMVONfHzTmHvsRAfOJURXiX4XZluTv26/DsyN/3MM6ko9P9WMiAkaYxWwvRXkrBcApmPN85nzRF3TMHM4+vAM+EmfMojqANpq0Dx1KDhW1Lml1mZ1nLoBSzxEH7gQqynEw6+0P+G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cCcm1OD3; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cCcm1OD3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UlTUJH7rhWUzuOb9A3DL5nJMQg8wjWfvtyqsGIW4Y9s=; b=cCcm1OD3i+DfaqBxAYj5dLOD8J
	qDRGmLWUr6GHe0Nq9US7IpbNd2wHbnTDMMJhX5h3woU1nXgs4XDKAU96GVvrkoooVjiaNdH60M0Lx
	A1gKe+u0c6NfVPyJmXXBBvyshsU2dx7XVDyhQ0FQSWssAbjj9T7mFl2Y56pGl1BVQjNjRDgiLSpQd
	yeF4X2h9hHeDbKPUyaCt+a33V47AGt/0eubgyaJjFC06JfUfJx5D5juJgDA3tpuAym2o/WSf57JDq
	ZkSzVwZQbRVmcolTG2E4K76brOy7/osc80jCJa1yqsHzl3EeO7pyWOYuXwgmudxGYstntCmTrkDhb
	J9uUEoZQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCZVP-00000005mok-34qb;
	Fri, 02 Oct 2026 09:24:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A72C6300390; Fri, 02 Oct 2026 11:24:38 +0200 (CEST)
Date: Fri, 2 Oct 2026 11:24:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C
 function
Message-ID: <20261002092438.GA2823843@noisy.programming.kicks-ass.net>
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org>

On Tue, Sep 29, 2026 at 07:56:48PM +0200, Andreas Hindborg wrote:
> This function returns the maximum number of CPUs that can be online.
> 
> The wrapper is needed by the Rust null block driver.

What does it need it for?
