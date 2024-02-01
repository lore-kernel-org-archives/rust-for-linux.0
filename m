Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E4D62155
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Feb 2024 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706801580; cv=none; b=Qb3ciUT5KQFDCy/RBuBbDdw/4hg/+mwT466UTFAVofl74aqGB/Yg34EW14goRosRZCvwSvU75BkVMniB1VEj1/IG68QBGhibGXZNjMwrE8p2kvgJM8XPqRPLDfFdWYrari+pCimMkSENu2ucPgH0JtHff0kAbmEc4N1bTl3qXT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706801580; c=relaxed/simple;
	bh=voHTlwIDG1GLfCV13RrGLsqaJxO7WrAgEl4T+jDATcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JbsW/CbdkcwLsQctDmVd2zIWiXnlFnb8DaNhT+ghJRggxR7SqQ7SrYqVvCN0TYC2EVyL6K7H+OaneM7YBKF3SWGu5gFT3PU1YdZqd7JqAys5rltF4UayijcdIkAa1UBDj2nPUH5q+Nf9WzKTdcTWU8AUJzAy0t80TD3/JQhokrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F2NEtuuu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F2NEtuuu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86AC0C433F1;
	Thu,  1 Feb 2024 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706801579;
	bh=voHTlwIDG1GLfCV13RrGLsqaJxO7WrAgEl4T+jDATcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2NEtuuu71V3wkggFA8937rWtNLfQsjuPftnhcvoeQloGh/io4C3/cI5l/A1DmWce
	 D8jrJQJKYSoVLdPTD4SbFgq5xImQxqSnVzDGee0PdjpwAwxEqp7EpfAn8dULRcWDHn
	 flgMn0TK3wEXVltYHptglulcCXo/DidInlyLzw5s=
Date: Thu, 1 Feb 2024 07:32:58 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Philipp Stanner <pstanner@redhat.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: RfL branch for PCI bindings
Message-ID: <2024020124-dejected-giddy-45db@gregkh>
References: <929f47e0-8aca-471d-b54f-26908321999b@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <929f47e0-8aca-471d-b54f-26908321999b@redhat.com>

On Thu, Feb 01, 2024 at 04:02:17PM +0100, Danilo Krummrich wrote:
> Hi Andreas and Miguel,
> 
> I'd like to come back to our discussion from the last "Rust for DRM" meeting regarding a
> common "rust-pci" branch.
> 
> As discussed, in the context of the Nova project we are interested in using those bindings,
> contribute some more (also in the context of Philipp's recent PCI work) and help moving the
> code upstream.
> 
> With Nova we should have a driver project which should justify further efforts to upstream
> the code.

Patches anywhere?  Can them be submitted again please as I think the
last time I saw them, they needed some work.

thanks,

greg k-h
