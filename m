Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A17214E2F2;
	Sat,  7 Mar 2026 07:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772867763; cv=none; b=btdPttESmGgD2MJPNOEsjEYwTj499wVCXpFE4gAiYDVbsacvFo6c2DjqlwhaEJR8ye7ULumYcGNVEXnYsryH0IV/8qgRou+ZI0/UEU3kOyP4wl7ncFLdJ2EVFy+KOc/s/aEy+qrlSyflAOSzLG/592na4Sa0I+tTBjMl4Afj80k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772867763; c=relaxed/simple;
	bh=k4mUFgM9fOGA3a5pMOzimU8k/I8BGQtKkNPZCG7rRfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEWJyPHw/vYDWuTIXziGEXnrPMqMNFStq91RnAPM30O9vxr3qy8QRPKcC5x70vsIAII9bDS9QTLD04dMGnEXf2fkMqvxXc7PDeXmtYMXA9M47nour6sDnoyG8HXXjYB+mdhz7KpK6Bi1R4aNgiRV5RpiJzu0+GlxI67RDl1TmQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Li29UBFm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Li29UBFm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646FDC19422;
	Sat,  7 Mar 2026 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772867763;
	bh=k4mUFgM9fOGA3a5pMOzimU8k/I8BGQtKkNPZCG7rRfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Li29UBFm9mTpPrN1axkbGQ+qJJxtMKs4NRVyN5QpMn46/6VACS2Li3j7WlshMGJQy
	 Bw0t6RiSdXa/GorjsnpuFTx1tfwMg6r9ascs+p1nsOZyJ98NGRl+XVTuoMgCX7qvPk
	 Jy8tW/2ZUaMyhUXzfA6KK76qz8clm/j0zItjgmbg=
Date: Sat, 7 Mar 2026 08:15:48 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: Add initial synology microp driver
Message-ID: <2026030742-concave-dastardly-801e@gregkh>
References: <20260306-synology_microp_initial-v1-0-fcffede6448c@posteo.de>
 <20260306-synology_microp_initial-v1-2-fcffede6448c@posteo.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-synology_microp_initial-v1-2-fcffede6448c@posteo.de>

On Fri, Mar 06, 2026 at 07:38:30PM +0000, Markus Probst wrote:
> Add a initial synology microp driver, written in Rust, to the staging tree.
> The driver targets a microcontroller found in Synology NAS devices. It
> currently only supports controlling of the power led, status led, alert
> led and usb led. Other components such as fan control or handling
> on-device buttons will be added once the required rust abstractions are
> there.
> ---
>  MAINTAINERS                                        |   6 +
>  drivers/staging/Kconfig                            |   2 +
>  drivers/staging/Makefile                           |   1 +
>  drivers/staging/synology_microp/Kconfig            |   4 +
>  drivers/staging/synology_microp/Makefile           |   2 +
>  drivers/staging/synology_microp/TODO               |   8 +
>  drivers/staging/synology_microp/command.rs         |  48 +++++
>  drivers/staging/synology_microp/led.rs             | 229 +++++++++++++++++++++
>  drivers/staging/synology_microp/synology_microp.rs |  73 +++++++
>  rust/uapi/uapi_helper.h                            |   2 +
>  10 files changed, 375 insertions(+)

No signed-off-by?

And why staging?  That's for stuff that needs obvious cleanups done to
it, you don't list that here.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index e9e83ab552c7..a1f8dec31db2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25143,6 +25143,12 @@ L:	linux-fbdev@vger.kernel.org
>  S:	Maintained
>  F:	drivers/staging/sm750fb/
>  
> +STAGING - SYNOLOGY MICROP DRIVER
> +M:  Markus Probst <markus.probst@posteo.de>
> +S:  Maintained
> +F: Documentation/devicetree/bindings/mfd/synology,microp.yaml
> +F: drivers/staging/synology_microp/

No tabs?

thanks,

greg k-h
