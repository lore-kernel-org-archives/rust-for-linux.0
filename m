Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37F6293C5D
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Jun 2025 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823879; cv=none; b=NLpOcDf0eE5NiMOekFCKgJLO+goksDNr6uihTeq4GTLQReo8WGZyRyOQ5UX9qXxv5by0Cpaj44fiKTx5hyXXv2X+fqrr66EGw+nY5b+/kp9li4M5sYCzSaZaWN0Yuhx12aCqvc7jME4ksox1IQUcnT8vhIE7M0W+qmSACvy6ojE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823879; c=relaxed/simple;
	bh=bhR4Bb2bwwXTLXLAtF8PnnNR8WQ9nu759oSJREasAeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLMsnIj4v5DKi1EuNm5X0RPnbE8L/uJ3Se9sdpgTA8cxwT2ggAKO3CL2uTuj6sYzMthRuXvyCHEsxWHLnTVlkEuOF/XDdQ/iSFq9W63X6nx5X2e/1bY8fxVtMgKsQtBRcMkEWCqw5bc6hu3aL0zVb1Pw0LW4giupG5ULfSJJGuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSMObpRg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSMObpRg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975F4C4CEEF;
	Fri, 13 Jun 2025 14:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749823878;
	bh=bhR4Bb2bwwXTLXLAtF8PnnNR8WQ9nu759oSJREasAeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSMObpRgyYD8505xSwE+6TE87oiNA0I1ZGarLcXLblMu+Y89Q2jHm/d5SKXBpchY1
	 WP6NiRROohIxLAz+IiEztI4sdV0ClnQUZYkzU7Ha9wujxxJcUmt48FmnfGFVjhY2wc
	 WSKTTKSigbRQE7Mx5DoWXayIgiAr3SkkP1N7RcvEIFGUi1ep29QMPc23/NAg/StDM4
	 hjlKpNiQHZfDpJtp0ozEj6q7WjJmiJcPxgPRdiHeHOfXyFEtonZSvBERm7K/DWZVlD
	 WZKfI0WrdixCqFm18DfeFwaY7mK3lSkpRheS26Z7JgmZyZg/fipcO2kPSJcRV1c60x
	 JOIkueoHGZIrg==
Date: Fri, 13 Jun 2025 16:11:13 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Marcelo Moreira <marcelomoreira1905@gmail.com>, lossin@kernel.org,
	ojeda@kernel.org, rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v4 2/3] rust: revocable: simplify RevocableGuard for
 internal safety
Message-ID: <aEwxgUjYiNaJuzc_@pollux>
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-3-marcelomoreira1905@gmail.com>
 <aEqdur4JTFa1V20U@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEqdur4JTFa1V20U@google.com>

On Thu, Jun 12, 2025 at 09:28:26AM +0000, Alice Ryhl wrote:
> I don't think this change is valid. Consider this code:
> 
> fn takes_guard(arg: RevocableGuard<'_, i32>) {
>     drop(arg);
>     // rcu guard is dropped, so `arg.data` may become dangling now
> }
> 
> This violates the requirement that references that appear in function
> arguments are valid for the entire function call, see:
> https://perso.crans.org/vanille/treebor/protectors.html
> 
> Or the LLVM perspective: When Rust sees a reference in a function
> argument, it adds the LLVM attribute dereferencable to it, which implies
> that the pointer must be valid for *the entire function call*. If the
> memory becomes dangling after the rcu guard is dropped, then this is
> violated and the compiler could perform optimizations that are not
> correct.

Interesting, I wasn't aware of that. I wonder, why can't the compiler catch this
and throw an error?
