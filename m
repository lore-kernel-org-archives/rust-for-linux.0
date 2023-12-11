Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440004F1FD
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 18:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KNEi0IpB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7643C433C7;
	Mon, 11 Dec 2023 18:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702318141;
	bh=9g25Ehd1aekIfL01QP/aMg79SHJ9ZAkE/qfTVEAdxu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNEi0IpBlIceJ6Shp6UBHK5fUP+fvYR+v18gAczthXtsI7IC2oUZ1NoFdEjYCPpNr
	 UQCHA71ep5kvHsNZGK3LST6vYgxIZDNwtmQdkXGiPr7441zUd66RrLNs/9AqomQGJo
	 nkZaTYyUEXWUzxZ/RHnWSG9iJyRNbCZ66nfy6sFo=
Date: Mon, 11 Dec 2023 13:08:59 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: cocci@inria.fr, cfr@inria.fr, rust-for-linux@vger.kernel.org
Subject: Re: Extending support for mailing list archives?
Message-ID: <20231211-economic-seahorse-of-reverence-ad90fb@meerkat>
References: <dbcff3ca-a7ac-4bd8-92cb-02a8821e2257@web.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbcff3ca-a7ac-4bd8-92cb-02a8821e2257@web.de>

On Mon, Dec 11, 2023 at 09:36:45AM +0100, Markus Elfring wrote:
> Hello,
> 
> Discussions will evolve also for the development and application of various
> software components according to the programming language “Rust”.
> https://rust-for-linux.com/coccinelle-for-rust
> https://lore.kernel.org/rust-for-linux/
> 
> How do you think about to support another mailing list archive
> on the platform “https://korg.docs.kernel.org/lore.html”?
> Or:
> Would you like to forward any messages between existing mailing lists?

Sorry, I'm not sure what you're asking me. Is this a new list request, a
request to archive an existing list, or something else altogether?

-K
