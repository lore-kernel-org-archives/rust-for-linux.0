Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D982C029E
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 05:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762234029; cv=none; b=Fn5rXbYVjdTF1NfVy48BW+zya8tX2HQe3B92DZOIow+E2j3SRyMVaUr3xxKJVeyoThL6U/d8PFzjc2iiq8DE59NmhhgZveZZ3oMPg/TRBMuwCxA0NwC9CPAXs0+NUs2UOZtGDhIeYeYm5O2wYq4+Fegd0lk7ix+FtBHHU+tgVLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762234029; c=relaxed/simple;
	bh=pEokGhO3sI+ILAZgJE0TqElwh0Q/AnhyB+3EpVEWXQ0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kn/zJ13F9gN1dlI+o6x91YIwW1Z4O+u6rCYnCWbizwfOvJo2bBzpf2lSOLLiVAHmsdQsTjrINY/3t0NvCE4WPSSPTmBKVabRgagVWhz8LsjsJw2KC1nVesUnfJquStsd8WWovqw556Ovr2mgZJQAiPoD2IXren6Ni9br1bSMI+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Uq/35uRc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Uq/35uRc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F230C4CEF7;
	Tue,  4 Nov 2025 05:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1762234028;
	bh=pEokGhO3sI+ILAZgJE0TqElwh0Q/AnhyB+3EpVEWXQ0=;
	h=Date:From:To:Subject:From;
	b=Uq/35uRczdfOFBJHqBmRmftfsMj01bL+K+DalpJ6R1uPUOk5y4dRV34O8W1cQgO8L
	 zPP2Wj1w15jnRn5MO5o6arZnRFaVFDgSRX0nSrUj0gHZaY1n0Der6LfrUeWFx2vBPw
	 LMdZSrV7aGGGkebBIV8lFR3mOr73cPWvuDBadzzM=
Date: Tue, 4 Nov 2025 14:27:06 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: rust-for-linux@vger.kernel.org
Subject: ABI mismatch build error for 6.17.y and rustc 1.91.0
Message-ID: <2025110452-diligence-share-98d3@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

My laptop just upgraded rustc to 1.91.0 and now I get the following
build error in 6.17.y when doing a 'allmodconfig' build:

  RUSTDOC TK rust/kernel/lib.rs
error: mixing `-Zsanitizer` will cause an ABI mismatch in crate `kernel`
 --> rust/kernel/lib.rs:3:1
  |
3 | //! The `kernel` crate.
  | ^
  |
  = help: the `-Zsanitizer` flag modifies the ABI so Rust crates compiled with different values of this flag cannot be used together safely
  = note: unset `-Zsanitizer` in this crate is incompatible with `-Zsanitizer=kernel-address` in dependency `core`
  = help: set `-Zsanitizer=kernel-address` in this crate or unset `-Zsanitizer` in `core`
  = help: if you are sure this will not cause problems, you may use `-Cunsafe-allow-abi-mismatch=sanitizer` to silence this error

I don't see that on Linus's branch, but maybe I don't have the same
build options enabled there.  Is 6.17.y missing a patch that is in
6.18-rc to resolve this that I just can't seem to find?

thanks,

greg k-h
