Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4281C19644B;
	Tue, 13 Oct 2026 14:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900357; cv=none; b=p8nKodMulqITIOduMAOvRlR8Afaw9Mbkn8V01kiNyENVtjJglwrrO3uSHddvbsTCLN0Z+RalWd+4Bk/PmsiNxNN28TPBg5Gdlb7RpRWvzEuZpGbesKckHPWEBPQq1fZNOCWTGlCT9tgcotWSuHIbuVK1Cz3NRRazXzB9bF5ekDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900357; c=relaxed/simple;
	bh=AxX67jWsUuaTtZEoMRvguycN7NXZniKNWCLhrGf4Z6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fmPfRtQB6YMjGlNNxltJ1Yf+iNgHhxORzP/LYVOO/v6mqLoboOAvggKp6hWx1i1UUeABO1QUXNdol2EPDhpjVhUrOkiS6Hp6lx0r/oAWehr5lUSoX5DeV2Zc4ihSEHh2Qi65P00eFyGHz+XnKl4xBYGrN+Rq2a8CHquKL9KUHoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCh9+fKw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCh9+fKw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405971F00898;
	Tue, 13 Oct 2026 14:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791900356;
	bh=wBeiSFuYNJNlJiX0o66jLleHJnMSSH0A/fVVYhXWVUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SCh9+fKwfPFlbm+dqOFxNbpv7nQ6MvOk6LR1Ba/cFLLZuXLTkf3DILdvZq3mPayjT
	 1hvZ9F+NKnqBThyFqIW/IKuOfoThJyPDb/GaPLVoH5sAgQeJOWsV0S44UPkrY+CtYv
	 e3tNkHaOfx0LmP147IciRaRPLxTWxqBRTqkQ6uQuA9CEr5y/tMUBP7mhAWwZJSo07I
	 b139QjHb2uDs2StIe28gJy4GHJh6DpmcS3G2ArfQrEsto1WXuyIw2Wree5mdNlQ93e
	 qr5s+jY9CeqtOinGH2PQxsMVeY4tOoiD1+0KDCduy3QuzMib/58ukzYqgNOCwYkZUu
	 8OkMcFQMKEP0A==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4E0D8F4006A;
	Tue, 13 Oct 2026 10:05:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 13 Oct 2026 10:05:54 -0400
X-ME-Sender: <xms:wjrOauL_y9xJ-Q9kS9hA3cnVud5YCN6J4BD6r5rvR2uCktdRqg8IVg>
    <xme:wjrOauiXXZX8pHFIhf2mdBXpgs1aR-KWtsWFi74OGb-A9vzZD7nCARaKSIp_g7y88
    SrRsmdb3g90REg_u_qARvQMhnkCUrKnGlgdkr5WsAmkkwz8-xHbFGY>
X-ME-Received: <xmr:wjrOag52-BMR6D7SFv4VPK9p2MbcDQoMpNjTCO8xPjIy7j9N9PPqeEOS08auQtWyuKDTWTMtt_MDz9ibAI43YHh5wfYR-rpi>
X-ME-Proxy-Cause: dmFkZTGeM/pPa44CJBwRfpoej23aZ7wQowgrer9EOYnL4S+T9oDjmmM52/dhdIHCsg+Ls6
    9STVkwSeUyJmqbr/FByPDyFPJei87B8sEhOOsEtxIuXosnWBMWLPmykC+c3cd1caU834fA
    80wCdWNyc91VPDdPYrqHQsK/xQgWNtxN6BKUepHqAX/PnZuOKKRb6dEzYWu9dKhbuQoUbE
    G7XwEZDYPrLjZ/ut2ClAMDiY4/rUJqZlbRmcLtiY40La0I/8WAci3ATDWaXoEYW9TItW/4
    x0m4gW/KnRGqvxqgd9MfXICdre5g89hxO1ZNGfnNAu432NftIjHzEhV9Sn+Y3/fBgRt8dg
    kYqEHcBRRMfmeUpDbD+nAfKGMlmoER4GB1UTppxTH06041K9UZJ4EnQLNau3W/1Y+bvDQV
    3J9S7JxKY96URtAj2+1UAR93nwpfvg6hllTRrJ5ukfkstZqh4Zx3RQfODNR0h0o4/Y/HV7
    b0XW0lrdm1KowNdR90sDkhDtJlsCQXaM0yXfc82bDQ9Z++oSfZQI7yNSv8BQAmW+YCNw61
    MmkVRAj/cO/DQ7+ic/kRNMcG1b8d+VzCllBKsEngsPpT+GjtO/wwK23nXtSE6eGgTJIPEZ
    dMngKnTowQ24a0MBY/YXIsU1jdO31r51jqMHJuK4L0F5g/sjd1myHwdeAtRw
X-ME-Proxy: <xmx:wjrOarMJIaUb6vxxRtBCxu7LmsqtyNQuIFYQikBtJHOK-CTEbWLfFw>
    <xmx:wjrOandcnXLXqRpQdPPCjlEaoirihjWnpvwmgZIFZtZLhIqH4RDv3w>
    <xmx:wjrOau2n1uGiZnaL06HjPIeQ3MtOte309yVvgIrPPTCmxirdqlj0yw>
    <xmx:wjrOavMXsvssSlJLPOhRq0cbM2BXsxHsGfYqqHFa-uIHahQUUJjSrQ>
    <xmx:wjrOahfcU7L2PWCVED0xzu6ZglrZ0ExJQ6qjxvqoLmzsTkzSc2xzVD8N>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Oct 2026 10:05:53 -0400 (EDT)
Date: Tue, 13 Oct 2026 07:05:51 -0700
From: Boqun Feng <boqun@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Carlos Llamas <cmllamas@google.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: workqueue: replace deprecated system_wq with
 system_{percpu,dfl}_wq
Message-ID: <as46vy6LubLHHgzP@tardis.local>
References: <20261013-rust-workqueue-system-fix-v1-1-e9ec616e402b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-rust-workqueue-system-fix-v1-1-e9ec616e402b@google.com>

On Tue, Oct 13, 2026 at 01:51:39PM +0000, Alice Ryhl wrote:
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
> Fixes: 64d8eae3f895 ("workqueue: Add warnings and fallback if system_{unbound}_wq is used")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

FWIW:

Reviewed-by: Boqun Feng <boqun@kernel.org>

Regards,
Boqun

> ---
> This patch was previously sent as part of other workqueue series [1][2].
> However it's a fix that is independent of those series, so it's sent on
> its own here.
> 
> [1] https://lore.kernel.org/all/20260726223613.1242940-3-dakr@kernel.org
> [2] https://lore.kernel.org/all/20260807165252.3849875-2-dakr@kernel.org
> 
> Changes since [2]:
>   - Rebase on v7.3-rc7 and also convert the new SpinLockIrq KUnit test,
>     which calls workqueue::system() and otherwise fails to build.
>   - Add Fixes: tag for the commit that made system_wq warn.
>   - Collect Reviewed-by from Daniel.
> ---
[...]
