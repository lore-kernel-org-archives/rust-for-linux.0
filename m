Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5F3357D0A;
	Sat, 11 Jul 2026 07:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783756727; cv=none; b=P/bAAIv3v9NA57RkT8W08wwvOOik44O/d425VOeuh4qhYwQGm2OpAxzzNoBE7S+k09vTFB6K8ZxzKFeQ8ajCEOUGdqg0lPmOyShdE3i+RiFgw96rbj5ZNxS2VhUFwnpdO+nyDwCjZXo5WM3r8KcsDQdj2Goe/uAHS5p7XNg2Oyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783756727; c=relaxed/simple;
	bh=GK7qZ1YILbNZiHKcZSe4jNeeSTklQUYIXbYeh/3YPU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vnalorl0HBw/N7vC2dorpOSg5Xkc8h/12+7t1hqeSsg28QTBuBGVZEGKGMCoMYO+9cGt8+68NFI/wvW2IhY6rCNOiFTYmz+DwtV7mSHVZnXBJUZUtB4ARMVit1+jjmS0w1YAfqrSO2prTWzy4NfuYzknCBZ+ggnLuBVDOU35QPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=LtZRcp2/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jKFyXX0B; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="LtZRcp2/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jKFyXX0B"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 3656A1D000BD;
	Sat, 11 Jul 2026 03:58:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 11 Jul 2026 03:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1783756724; x=1783843124; bh=T+tweag4Jk
	1zpRzX6DcoJIGmkct0It8iGiduXO3/Unc=; b=LtZRcp2/SI0bVDYPYw9iTXPjcQ
	aEkmeKqCJsBMwW+oGA22Zc/X3kpifNfrV7h0hyyilycKCU25Fz1ykEKo2Rgbuy5E
	hmoTZx0oKf7RzVsrfVj3bCoRZwWbH6r0MEedc/+8eE+RjGsZ/RNKwCf9D1PsZY4l
	wrvpxFQCpnlUuBGz12FBLNL9HWGh7g9dzaoQxx3UmHB392qnf+5j72l0AYUN7hO6
	W4IlN0A5vvC2JgtVkj12fv/S7/ak1s18qu6EN4jSJTB7Iv6Gl8UfasuaORxJVWCr
	3ieskv4QUcysxqS8cEK1hJQVckVVL/OUoru3I/AD5M1tDJPkzOZdOSTSaF9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783756724; x=1783843124; bh=T+tweag4Jk1zpRzX6DcoJIGmkct0It8iGid
	uXO3/Unc=; b=jKFyXX0BCena3Ci0YWLuMJ/rjSP6qpgzVLJy0JjhzELs/oKRZ0Q
	1gZh/c5O1fduaq2ZAw3E15OpOFew0FHDlIdeOKx8zudyAxPc/dhed7XL89OAFU7e
	dENUfU+QqyNhOmon9U4vXK4AvLd8fO1e73eIdiFyNeTGPVXbrfuVf6yu2aJlKD7r
	7gU0Qh09/s7YwNgnlE0a7VJKubXGoWKN7IssYsALedzozn1+spMTpxLnH15nTJYr
	sSb5vcHQ1qo+rug81FbdbDYB+pHrCkbKDmwbV7KWZ8Y18hMqR3njZjbHPVYFp9TX
	n7yzHXv3fVT3oYAaBOhN7fN6t38bPzMsPew==
X-ME-Sender: <xms:s_dRakTak6lmYVDb9oIEYl5J_K__BmUctsVIOHHRDgDG-3mvEAn-iQ>
    <xme:s_dRarfpSRYKjSFR2hK5VaICxoxKOT4z3CZIM7AETKGbTQPdjFJzFKFF_RaEZkgVi
    ZMgIfRu55iLfNEL50OP2o3bABo-Q2xzTaHuYcq1IBg_VafDhg>
X-ME-Received: <xmr:s_dRahIuiAtDg2aIOVr4CCXRCdsFWvi1UV-EtgYzeaAA6FlszQ2_PmGdUE8YLobgxOHDZq8_oVbbJftOMDgOMdF7iQ>
X-ME-Proxy-Cause: dmFkZTGMI+KVHUFJd+N/LpBKbWn6fy4Lr4p5tKFVNO1z8rueB9wI0mq+ehHLFVPZauDtdA
    kga2MFpsxgrJAGF7tYpvc3dfvn7I8y6O9x0jorDCVpdpExTQvAluOse/fClm2X0kHiIvnw
    Aw93PNFalQfcMJoEoVh5kO3l9S9KLSms/KudSWT6ANIl67kImDVthIh4S34ezfNo0AIZyC
    N28bjX824E3JK5wLsYed7IHtTdWSPhpfrC61KjK/ww3o78xPDfM+1zqyQ/LdhhT2v+IjL1
    NwwpOS0lsX+HXf5z5yvITJjcKzIV/oV0Ul8gF/HNGxJpZynWN/P4PZLTZGS8eKmf8W38bq
    wS0wx+HJDtid9D0vaPsNjXFDK2lYtXfvoduGRuCI1RhTy2WlV3SWvXnfLxx5OoYNWR838Y
    A2cLtkxFLkUHN3sGVA70Acg6iURLrVO3i4l88FJMnupT7l6FDR8/666iJvGJfseaJeopVw
    NXZDxCHwDNL2OU0DVWXNmolGRPlwgsKQKZjnVQUC2MUCyxDGl2cD0ef7uexWrHiXUH70cz
    HJu6ZZl9I23cSLXPRakT2Z3Wyjw1V7W0OdzPQn0nfW1L/ewL28gmuG9+r3qLqvJvQgtLmk
    kHWq8Wmd2UJ14IbIgBJyySk150vSfJ2ppCrMVSPSxnpUaSW/WjscEMPNU9nA
X-ME-Proxy: <xmx:s_dRagHo-GZIVdsi9_OpjRB_EeCam8fOzuw0KE47WOpSGMCSRvfaPw>
    <xmx:s_dRah4DIJQ2EILIoOCEz4azRjPbC5O4GOVTj5wkc7xaa9PZ2NGg_A>
    <xmx:s_dRahPsD1W25_3ha2jvElFPQPPhey7UQa1PSrtIamARcxGtb7SVPQ>
    <xmx:s_dRanLzN74NPSVZGHyV5tkj2xX5OKhjVJcw_ENqkt_IvGzt5GNdfA>
    <xmx:tPdRahG7iGru44wSyNiME8Q5g6ypqTPwiXjdkbmMOOWhL6t1G-_ngeBK>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Jul 2026 03:58:42 -0400 (EDT)
Date: Sat, 11 Jul 2026 09:57:24 +0200
From: Greg KH <greg@kroah.com>
To: kosumi <chankocyo@gmail.com>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
	daniel.almeida@collabora.com, tamird@kernel.org,
	acourbot@nvidia.com, work@onurozkan.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: impl_flags: use bit helper in example
Message-ID: <2026071158-blob-library-3f50@gregkh>
References: <20260711071551.3035420-1-chankocyo@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711071551.3035420-1-chankocyo@gmail.com>

On Sat, Jul 11, 2026 at 03:15:51AM -0400, kosumi wrote:
> Use bit_u32() instead of open-coding shifts in the impl_flags! example.
> This demonstrates the checked bit helper and ensures that bit positions
> remain within the underlying u32 type.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1244
> Assisted-by: OpenCode:openai/gpt-5.6-sol
> Signed-off-by: kosumi <chankocyo@gmail.com>
> ---
>  rust/kernel/impl_flags.rs | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
