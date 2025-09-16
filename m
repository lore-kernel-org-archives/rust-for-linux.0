Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8A82D73BD;
	Tue, 16 Sep 2025 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028340; cv=none; b=IklGR29j/O67sdcey9rlwcJw/dpiA4iUXZ0qOFh3XNbO9io2XuQpq/MdnrFPsxjWfheIqlrCqO+vd6JC+eelsrNyYl4k9ghJ6NfFFzzrH9+frjqi9wlwvbisWI3kAV3jl4H3mOat1zJdXydDvoi7e5v9cLHpMT0J0IXVc6G+43s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028340; c=relaxed/simple;
	bh=+vKg+zuY7JV1SYakYB75V5ftnyRWCPF545ihoHKCkkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJho+/RUaWjiELd08EN9R4lRHrIHrXf+YrFpSVqhUbbqvi6b2dALrFwj8jP/oFzizQxzCENHLG8FQoe+oCP0qwQNWCn+L8yZmcL7lUK2N8y1OuhEYFv2yASulTzyDAdaaGDO0r7+J1obT4FYEqmA/19w94ntJaOsE3CDsA15SJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Gzv3h9iG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Gzv3h9iG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1457C4CEFA;
	Tue, 16 Sep 2025 13:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758028339;
	bh=+vKg+zuY7JV1SYakYB75V5ftnyRWCPF545ihoHKCkkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gzv3h9iGrSMUdGWtXXOoaLke8IbSdowGZUt9/YkwgCWxTjzD7z7XCaqLhl29GLN6f
	 0CR04Asnr4wUUkPVMBsrbtmWxmsKdtpnOgxNfH3z44onBeK+fUbLAMLcN0bgtF5e3X
	 j1wL2MVOt22vlzhYvLTTN7RJSkHwNjNOEjioa1iw=
Date: Tue, 16 Sep 2025 15:12:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jaime Fine <jaimefine6@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, david.m.ertman@intel.com,
	ira.weiny@intel.com, leon@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, onur-ozkan <work@onurozkan.dev>
Subject: Re: [PATCH] rust: auxiliary: fix "initialialized" typo
Message-ID: <2025091642-goofiness-camper-683a@gregkh>
References: <20250916124102.14182-1-jaimefine6@gmail.com>
 <2025091622-overlap-antitoxic-b8a0@gregkh>
 <CAL-mriLdm9NiNBvAqV3BEKVELJ1B1FsZtZL=NOsM_2RipoU0FA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL-mriLdm9NiNBvAqV3BEKVELJ1B1FsZtZL=NOsM_2RipoU0FA@mail.gmail.com>

On Tue, Sep 16, 2025 at 09:01:49PM +0800, Jaime Fine wrote:
> Fixed!

Please slow down and relax.  Take a day at the very least between patch
submissions to fully read the responses and then do a new version.
There is no rush here.

thanks,

greg k-h
