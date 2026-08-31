Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48B634DCF3;
	Mon, 31 Aug 2026 05:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788154882; cv=none; b=TkMVzHpWPe9tWv5fD7SHnTfv9GZh1R+lYm2m6FJOFDA+0aXrdAPKnfkoGDZzRicuwuwOYdmYASN9x+wCRaK1w26A+WQS9a8C9RP3vMDjO9s5HgOzwKPdQAcKweQjEvGwkBb0wmNf33UKCOMLc47VIwHPBD3DbTYdTStpjF6fq/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788154882; c=relaxed/simple;
	bh=bTFpGNHluTfPaITb2q3sgxWyvU/Ck6JrFJPE3D92GLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0QbqfMVPVUgp9viLzuHrRHmUd8xvWk+66l+Wzjo4gO/rZ3I4YOtKVUYGfgi/I0a7hCPU6ufe3YG9qZ77Ua8vk4NBreHGGHKT5GJiHOyKnaTMV/QbiJVhJr8r97SKVZqhTOhYfJDXls6cqY5pKKGDUrCaMholHlqNLRVXeDJNlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0C07vC78; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0C07vC78"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9CF1F000E9;
	Mon, 31 Aug 2026 05:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788154881;
	bh=bTFpGNHluTfPaITb2q3sgxWyvU/Ck6JrFJPE3D92GLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0C07vC78S6g1e3ci+njYgKMqQZy96dWVIhXzPzFmYXGOdZbpTyWtaScqHrnvsKs3+
	 0FLlcQBCtUXPd+GQFN1wfI8DDny9COBYbqh+VXiB0xhvhrPH/H/GuRocmtUDoI3eIp
	 3dvv/PkxKMo/FJGvR45Hq9omybj/WWQVQlZ4ITEM=
Date: Mon, 31 Aug 2026 07:39:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: nenkov2004@gmail.com
Cc: rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: binder: Use lower bound for node debug lookup
Message-ID: <2026083127-plexiglas-dutiful-7837@gregkh>
References: <20260831052635.42417-1-nenkov2004@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831052635.42417-1-nenkov2004@gmail.com>

On Mon, Aug 31, 2026 at 07:26:35AM +0200, nenkov2004@gmail.com wrote:
> From: ChrisX101010 <nenkov2004@gmail.com>

We need a real name, thanks.

greg k-h
