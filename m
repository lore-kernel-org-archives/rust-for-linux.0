Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039FE1A5B94
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 19:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742152151; cv=none; b=q0dAhURo8wW2bo8zfO6vMREBmuPTEan4X/gIQRdHv82VrjUf+PbrW+tS/qJmwRyiZg1LvqA3UXXsNVGCPimjxMGmrK3W5TbOwTLmkO7zGG0LzkYL/NX9SI5aw42xhLoK6mWz5mqMTxXfvgQAXu/U6X5waYKPb6Je0qAxCvd9iCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742152151; c=relaxed/simple;
	bh=kOWO3ydDguHv0lL5e8+r9sw43/HrKGZWoPGA/vxq4iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDsCh4P50yPzAurc+9mEpX1xfjCe63cqtvHfgAmlz1UAELzJk8Gwc3Q722rHl3E0va1fylh32a1tAm3O36o1LBw+655eisFjn0ewmjLvWKL8k9xh40TjqiN8983wJcbYD3G9FKOxOzojM4hxCXz6qx+DbEPHfb2c4ov8kMb4yM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzFlzUn2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzFlzUn2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77BDC4CEDD;
	Sun, 16 Mar 2025 19:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742152150;
	bh=kOWO3ydDguHv0lL5e8+r9sw43/HrKGZWoPGA/vxq4iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzFlzUn2IICHNoKhrENaryGjxSyeCb5gPvXONu88RCOYcIJmH2b8yRpMHLJovy8uP
	 0Es3KcBFhyb102G8xkskGns9foBoJO23FqK5dXOVj62vIzBh4B6Jm47lp1FKHODNNI
	 U4kHqpcCLNs1TNciBSwpBloZo7zM8yMoLeeCIqjMyA1He643yNQ3S7LVrfzjVIvfiY
	 11DTavo4vasUduH+x4WRkWF62IVJp1W4jp8I/BQWttbHf1V9JWsK2qi3dW9+1DQVAd
	 S5FMfBKupRbhNMXrhVMSGtiTaUbXVScWYmj9UGcM6/Py5+amBmC6bBoAblQh27qP4W
	 kncnWV1yY8QNw==
Date: Sun, 16 Mar 2025 20:09:05 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Tamir Duberstein <tamird@gmail.com>, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of
 Vec::set_len()
Message-ID: <Z9ch0fgUI-V-rlGr@pollux>
References: <Z9XIk3WpzruUfh6O@pollux>
 <CAJ-ks9=vvuXpdCnxPKzDEF_ibxBxzGXbSb7hVGi-vDgZcDQnxw@mail.gmail.com>
 <D8HL95D099MI.2N779RERY6DAE@proton.me>
 <Z9bEosVk8-0sgSbw@pollux>
 <CAJ-ks9nxTkZJa9Okq7ztZTrFvaKd4ovw5SLd3c9q4Kye23RfNg@mail.gmail.com>
 <Z9bLtgJa3PNB0bkf@pollux>
 <CAJ-ks9mAS1WHZcRqPzu4qhMOGXP9RNhdHUSbJK79znDvaFRHnA@mail.gmail.com>
 <Z9bWODCNNEq3xI51@pollux>
 <D8HVI9K91JWV.NHOPVELH5JE5@proton.me>
 <Z9cfkKTVKtc3imyK@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9cfkKTVKtc3imyK@pollux>

On Sun, Mar 16, 2025 at 07:59:34PM +0100, Danilo Krummrich wrote:
> But let's define it then; what about:
> 
> "[`Vec::set_len`] takes (or kepps) ownership of all elements within the range
> [0; `new_len`] and abandons ownership of all values outside of this range, if
> any."
> 
> The caller may take ownership of the abandoned elements."
> 
> I'd argue that giving up ownership, while offering someone else to take it means
> that it implies that otherwise we'll just end up forgetting about the value.

Btw. I'd still prefer if we could enforce that the caller has to document what
should happen to the abandoned value. But I acknowledge that the safety comment
isn't the scope for it.

It'd be great if e.g. clippy would give us a tool to do something analogous to
safety comments.

It think it would be useful to enfoce some additional safety documentation. For
instance, I think the kernel would much benefit if we could enforce that
mem::forget() must be justified with a comment, since as mentioned ina previous
mail, it can cause fatal bugs, for instance when used on lock guards.
