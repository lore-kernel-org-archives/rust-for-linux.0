Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D101292ED
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 10:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707213669; cv=none; b=h3ceyks0c8KlkIgKJskPQ3s0TpEosWoIkK2lHcHxQqH+/zJMyrkAAd3vK1Dd5VGHQ96dU6G9Vuea0cCN8xLfDu6ZuJf7Px3cnh+ytjQSzfS7eDtv1wWSuQO7b7WmDYaZ7Bvy1Lt0sidXdHJ3anfaY3Tr0l+EiFInd2WDSh4Ehhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707213669; c=relaxed/simple;
	bh=4yDUgELYvHhiuwBbP+4+hTtF30grvzq3WahAKOg8EpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+CpX/ba+iDpNWlDCc7+mncQuPs3joqC5rNGwcltuaJXV+RhQyturDZJLZzJ0yzvIyilr9XsjgxhgD2J+zgkP1TZFsKJlHy+xYI6e8JJN5gYiodmluAOub51XW4/ba5a4DBM2+2n7DIr+QlbfKZcfS4sCh79svcjNSgiJZL+SRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=JXrv96xq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nR20Yq3I; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="JXrv96xq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nR20Yq3I"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 069BF11400AE;
	Tue,  6 Feb 2024 05:01:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 06 Feb 2024 05:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1707213662; x=1707300062; bh=0txj/yQEaR
	u3KPfodDCUDtdOF0yL/+n/APGS528fyw0=; b=JXrv96xqOvHjL9MbIV+aFGGLKM
	IVZsYEYHSPhU+OTLjmqNyKXFgW/rd4FQ3XShBNyk8nd5MubcsuMTEKUGEUX14VYI
	wPH1RO4IBFSdVoJJZVKG79AUD5NUnbjl4VzwDes/UvEmBoOlDNaTrPDRD1JxBvuU
	IOtPcBWk+4V5ZnwWUCV02y1zdl4/stUPMNaiFI0NA8fdgFhlSXKnZTkWNs83f8N6
	Y/TQuR8hDir5mNlhdp2KTR/qpMai3GugfbKz1hmufcmZ3YbJMuOE/sofaIPWPQOp
	vINlLXeiNXXgikZ7VBOrlLAvpoVd6svMPTMxcpWnusvA6i9XXcH7JRcZ1csw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707213662; x=1707300062; bh=0txj/yQEaRu3KPfodDCUDtdOF0yL
	/+n/APGS528fyw0=; b=nR20Yq3IaeKJLShTOtvHgIGOqmEQmOIhyHxQF/tgbzS/
	WnxF++83kLli/zQqJFA58OaWyxYkXbaoHPkB4f+GuMEauirZUGHC1g2ng/g9v9lO
	uGOfwYCAwus0F2WQxnxHuXoTBydjqQUZBU2N9y/hfVXRev70J477L3zVxLyxWmbP
	EC15YSMWWzqJarZUh/1Ze8MxUqCjLe0zrPqdF6IAl5zqzswmY6WzyMQCKewUJcvA
	+e5s3JYeiRFFF67g1BVkB8u3RR9EOeo+psnbpkbYr0IAfJmj8ssCK4V1/OfxyPP6
	ZJF9buhHVBhVLdpR5UlK4n5TIb3icG1eaK9yeOkf8g==
X-ME-Sender: <xms:XQPCZemEAxCZDchuLJ0nf4V3jI3WWMVfLGlW8Balb41kvawpoqkQ4Q>
    <xme:XQPCZV0Jq9chDP2auEZZhzgdG5dTlbe1Iw8GRM8ct6XmrdQ-vIOWthXq1pzqsV96P
    7Oeb2POEEFspA>
X-ME-Received: <xmr:XQPCZcriWL1iQmz5Vj_MWPhKRq-AfBmCO3OopaKq2KI5GfnYgQVjvLjO6ex3jA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedvfedgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:XQPCZSl4tf3jiuPUaRJMV2JO-Vl-aMl4Nbuc1prnTz6rEVVsvS6ZZw>
    <xmx:XQPCZc3DSKDna0T9XDMsXEhgW0V_Ahj9YPkPJptQCTOQr97Vv4njSw>
    <xmx:XQPCZZsoyGbPpYrC8QU5K0IVM4tPwTLte0kX5yQm1JmkkQtZwlalJw>
    <xmx:XgPCZWOBP6beFI8xVVzREWkVFkK2WB2SyfCjEQvLvsac0S0HB628Ng>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Feb 2024 05:01:01 -0500 (EST)
Date: Tue, 6 Feb 2024 10:01:00 +0000
From: Greg KH <greg@kroah.com>
To: Thomas Bertschinger <tahbertschinger@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	rust-for-linux@vger.kernel.org,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v2] rust: place generated init_module() function in
 .init.text
Message-ID: <2024020646-browbeat-cozily-0bf2@gregkh>
References: <20240206012535.480193-1-tahbertschinger@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206012535.480193-1-tahbertschinger@gmail.com>

On Mon, Feb 05, 2024 at 06:25:35PM -0700, Thomas Bertschinger wrote:
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index d62d8710d77a..e54293faf523 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -222,10 +222,14 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
>              }};
>  
>              // Loadable modules need to export the `{{init,cleanup}}_module` identifiers.
> +            /// # Safety
> +            /// This function must only be called once, during module initialization, because it
> +            /// may be freed after it returns.

"once" is not right, it can be called zillions of times, it's just that
it can't be called _AFTER_ module_init() is over for the file, as it
will no longer be present in memory.

So technically, the wording you added here isn't correct, sorry.

thanks,

greg k-h
