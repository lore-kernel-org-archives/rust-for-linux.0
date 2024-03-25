Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF3C482EB
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 18:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711390499; cv=none; b=SO0As5PkiFwMFIBzrqgSTPeeQJNcDNfQZoDcbc3gjvn2Eqd+FUKIPSEeW4zba0U2SJWedCF1dGq5afLYTjaKrRVr6uW3C+upQeZLzFi9T4qYyOLoAe3EQ8AsdxXlxSx69r7S/xFT8KP4MJ+L5ePTPk4nZSPn2Fn5bKaHctpS8rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711390499; c=relaxed/simple;
	bh=W9PYNcnWVlnaFsguTY2dl1Kh5v2nBkEuAtmsFnB49LU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmuf9pncQXoPa41WKmKB0fQ23EV1jt6Rt0uU2VdoiTE+n1hEPKS1VgNKCEGt+yYZW/z5nMAnr+Xu5dQ6bLcE+TjmUzrEHgymyCLw2cr4RqSSJaONHY5bdZHpMCyk7RAa32d75lDe1yI4wHUb/ssBX2xCCcqBV2iTok3MANyaNOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aO+fpfxX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aO+fpfxX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE2BC433C7;
	Mon, 25 Mar 2024 18:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711390499;
	bh=W9PYNcnWVlnaFsguTY2dl1Kh5v2nBkEuAtmsFnB49LU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aO+fpfxXybd6I2AzfLwb/krgOof5NCrQjytq+jJAHuLWyIyr6RlZpemiREUwBUPN0
	 tZQrx5nTR1JpsSSs+UJzAoae3JiGoiEVnH3DEFSBh/WoAVEOAwcuI7S3WMbTAp3u94
	 xZea5/nHzbZAfhqf9ATee4Yo/zlQvq0OQEAzjwv4=
Date: Mon, 25 Mar 2024 19:14:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 3/8] rust: device: Add a stub abstraction for devices
Message-ID: <2024032538-negligent-likewise-860b@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-4-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325174924.95899-4-dakr@redhat.com>

On Mon, Mar 25, 2024 at 06:49:07PM +0100, Danilo Krummrich wrote:
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
> 
> Add a Device type which represents an owned reference to a generic
> struct device. This minimal implementation just handles reference
> counting and allows the user to get the device name.
> 
> Also, implement the rust_helper_dev_get_drvdata helper.

When a changelog says "also", that's a huge hint it needs to be a
separate commit.  Please do so.

thanks,

greg k-h
