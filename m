Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CAC3BA246
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 05:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488575; cv=none; b=Hx0aYJwpwhItkzaCfp26TgmYGDyJXGgx3KRuo1T4BkTRUDJ05XL6XRVmQ4IX2/nkh2t7TJc+O1sftGs+8bEclhsPYKHl4a1RhNAckp/KAUcxMEW95gmO7i3yVvROn2AJUsg9MzejjlXILmQNB29GcVr2PhCCfNVLjVazkV/vSBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488575; c=relaxed/simple;
	bh=63KdCFVPTbqn2LST8VLw0tLuUKUgQJ7r/WM2ElYyAcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPLTDktHUM9HgKXeQ+sNKEcyhA844h42Y99nXXvsPiEYhzsHIsrDVgH6kHE/sNeoAY9dqiyyEEgbg1+654XSMEystbf1a4panEQP11f3ILNBb7zwahwICJ9/xjRNEosrQKS8wPo/y4tvcwyJh4uLGVh6txBtKFpTDDoA8b4BWB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LENcbzAo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LENcbzAo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493B31F000E9;
	Wed,  8 Jul 2026 05:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783488573;
	bh=16g6jvWsx6pCfhMKw+vX7ZRgLnMo05lkjXbXRf/Wafw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LENcbzAoWxDUfaeb8hclVdjvxgU+FjsCNFDsvaoymJ9fFUZsn+JNOZTk7TZF8i0yX
	 7rmZDFw8okjujq6Sm14W9PRwLinaXnyEgNJt6pm2c7pofuRj9w0uTo6Z8vbfcj/Y5Y
	 FLj+Qugm5owdUvNq1LGCdRzIJbYA6RLCK7XqQ+6M=
Date: Wed, 8 Jul 2026 07:29:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: FUJITA Tomonori <tomo@aliasing.net>
Cc: dakr@kernel.org, ojeda@kernel.org, a.hindborg@kernel.org,
	acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
	boqun@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net,
	lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu,
	work@onurozkan.dev, rust-for-linux@vger.kernel.org,
	fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] rust: bug: Add bug_on macro
Message-ID: <2026070841-unplanned-lagoon-651f@gregkh>
References: <20260707143026.2774023-1-tomo@aliasing.net>
 <DJSF9IBYP207.2UQXDE9IVSRUF@kernel.org>
 <2026070746-roulette-catfish-57d6@gregkh>
 <20260708.074859.867796876307901722.fujita@bee>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708.074859.867796876307901722.fujita@bee>

On Wed, Jul 08, 2026 at 07:48:59AM +0900, FUJITA Tomonori wrote:
> On Tue, 7 Jul 2026 17:20:10 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, Jul 07, 2026 at 04:51:40PM +0200, Danilo Krummrich wrote:
> >> On Tue Jul 7, 2026 at 4:30 PM CEST, FUJITA Tomonori wrote:
> >> > Use of this macro is heavily discouraged. Prefer warn_on() macro with
> >> > recovery code where feasible. See the documentation for C's BUG_ON()
> >> > for guidance on when it is rarely justified.
> >> 
> >> Given that, can you please spell out the motivation for this patch?
> > 
> > I agree, this should probably NOT be added unless there is a real user
> > for it that requires it and we all agree that crashing the system is the
> > only way out.
> 
> bindings::BUG() is already in use today, indirectly, from the kernel
> crate itself and from drivers such as binder and nova-core, via
> panic!()/.exepct().unwrap() on invariants that "can't happen". All of
> those funnel through panic() in kernel/lib.rs (#[panic_handler]),
> which itself calls BUG().
> 
> The motivation for this patch is narrow: replace that bindings::BUG()
> call in lib.rs's panic() with bug_on!(), for a somewhat better
> trace. It isn't adding a new decision to crash the system -- that
> decision is already made at each of the existing panic!()/.expect()
> call sites.

That wasn't obvious that this was the reason why this change was being
introduced, perhaps the changelog should have said that?

thanks,

greg k-h
