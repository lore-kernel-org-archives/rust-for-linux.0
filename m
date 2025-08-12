Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A6D23957D
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 11:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754999806; cv=none; b=nlBAFtMTFipDE193rv7G4FUjblw/N6aYoVmbg8Gq353RamAuFnCyCiuuQS7uP9vdx0Tnwmhp7kRJcbBO27+PuTsD4hIrjnssk9Ge7u6aiiBCqLzTcoEcoGLxKCJrRj9FNHc8JV4+3vzm8o5rtH0u4fSaJyVxYtT12v+uNcF/oJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754999806; c=relaxed/simple;
	bh=L59cdlYWNOMjIqrs8sYZQ0799IERFE+fVLvztWf+GdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3PsrXt93/pzi2XT8wAJLWL5y1hRYd6Vr3N38AOpAxLFB3s4MnEcrk0mfzzqBGvgPAFXFjq96QGS9rkDY8WR9X4Lfx1Ym+1B/ISYGWTVkcxt0KPfqj29DECajSA8NvTot8qPkG4oZ7cDugnmhjCvWMPVv58khPyOj6T6AowBsPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S0FhjdZC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S0FhjdZC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E0D0C4CEF4;
	Tue, 12 Aug 2025 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754999805;
	bh=L59cdlYWNOMjIqrs8sYZQ0799IERFE+fVLvztWf+GdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0FhjdZCTnaDFcuIouk+4CxtSd6NdZYYz8TY5wjhNJtKQpJ8Kb86eryD1xYV2Iun6
	 16U+cXvL1Mj76D+kYKMyQP15IpKZnXEAbdr1hS38JU6XKv9Nyehnuru7Ih3nhUq/aY
	 Z4XNHIHoOmzkWfvTAN2wu11HY9Bjq2a1PCknerTg=
Date: Tue, 12 Aug 2025 13:56:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: trev <trev@trevrosa.dev>
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, rafael@kernel.org,
	dakr@kernel.org, arlied@gmail.com,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	"aliceryhl@google.com" <aliceryhl@google.com>, vireshk@kernel.org,
	nm@ti.com, sboyd@kernel.org,
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
	brauner@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	tmgross@umich.edu, rust-for-linux@vger.kernel.org,
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, jack@suse.cz
Subject: Re: [PATCH] rust: aref: make `AlwaysRefCounted::inc_ref` an
 associated function
Message-ID: <2025081221-cloning-able-a6ed@gregkh>
References: <CACvsgUCBk5Dt2yBSy9_NA0z38-wP68vvBX7XDYgJGinTURT1kQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACvsgUCBk5Dt2yBSy9_NA0z38-wP68vvBX7XDYgJGinTURT1kQ@mail.gmail.com>

On Tue, Aug 12, 2025 at 07:09:11PM +0800, trev wrote:
> `AlwaysRefCounted::inc_ref` is a function that shouldn't be called lightly.
> 
> To prevent accidentally calling it, `inc_ref` is now changed to be an
> associated function.
> 
> Modifies all `AlwaysRefCounted` implementors to work with this change.
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1177
> Signed-off-by: Trevor Chan <trev@trevrosa.dev>

This doesn't match up with your "From:" line :(

