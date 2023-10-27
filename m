Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A95BA26
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Oct 2023 07:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="U+uTx61a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972DAC433C8;
	Fri, 27 Oct 2023 07:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698390979;
	bh=0kCRFFEDAEiFojVvKYc0Pehje2ltCVV+Sg6HEHQvuqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U+uTx61aQZiGyyALxtyZEs6htdCKeyqzo0svYA+G5D8t9UExo0VpXGRugKHoDNJHl
	 R6qA4pBjPLeWr/axMEHjo5M+f/3KmcruNavLkEzvtwF85vvEagXTkC0TGzCgR2spei
	 2B066omxzUhuDYDPlDZwGpg8AmZ3Gj0IVfT2i7/A=
Date: Fri, 27 Oct 2023 09:16:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: fix relative links to kernel header files
Message-ID: <2023102703-stiffness-chill-29bd@gregkh>
References: <20231026.110919.517001374342898485.fujita.tomonori@gmail.com>
 <CANiq72=dAYc=EQnJOuBvV5cKLo85O=A1AP03F9B6nJdDwdAT1w@mail.gmail.com>
 <20231026.204058.2167744626131849993.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026.204058.2167744626131849993.fujita.tomonori@gmail.com>

On Thu, Oct 26, 2023 at 08:40:58PM +0900, FUJITA Tomonori wrote:
> Relative links to kernel header files are broken due to the move of
> the output path. Some of the links have been broken before that.
> 
> Fixes: 48fadf440075 ("docs: Move rustdoc output, cross-reference it")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---

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

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
