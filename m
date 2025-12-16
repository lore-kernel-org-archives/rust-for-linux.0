Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4252D33E340;
	Tue, 16 Dec 2025 09:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765876942; cv=none; b=GXIZN5ZBS6mmWvJFodwUVbi9Q8oIZPX2FvfciyEEmKr/olVncFbek0Ozg++jOejCzsucMWrTgKqbWLKLPzIAf/AvoiaKaW2eSo2p+jHJK48Il6Uf1Yf36HOSO4JH3Kps9jlTTt5/yfkaz77pZJhRXw6zG5bmfmwIpX130YURf20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765876942; c=relaxed/simple;
	bh=VGvR+1VocsFl+CQ7pfvKsbPjnNsQs3mPzYbAczL3mcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPFkE7XGdJiVubV93uXvKQAYlcsX+hqqba+wEspN0IrMfeJa728/2NpdBqGtRZbDRaSh+6xFHgf+0Z9fptEmWqvt4Qpmv6LFJ8Om7rkIHelmz8BKm0QcgbDPtoxbrG3nl7nF2VC/ugI5ccShxmhJNFVQmlwR1ORte+NZAnsEO9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObV2QpAm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObV2QpAm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10BEC4CEF1;
	Tue, 16 Dec 2025 09:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765876941;
	bh=VGvR+1VocsFl+CQ7pfvKsbPjnNsQs3mPzYbAczL3mcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ObV2QpAmMOlJgoyUD/EOXNI9J0+bAxpID/KzV0J/D1DNYO1H38w4tvywvQFMsUHzu
	 lOAJ6PI9l9zjp5dsbwprKj+VUO8ckM7yAOGP3jJ7VJ7z7MuBOjJ8Ixf9bmRqWi+HzB
	 dw1mDw8vEOW9pe6J/9Gx5cX0hmaso4lecvB5wrh/uUwbF4CMmUa/RqckuqkcbKNTE3
	 5tyFaUu0+5xf2ibnpWfTHrYBeWeFAk0bOC7TUt7s6LmQ8kVO+6tPoJGt/6Rb36TmOi
	 4faIfgtU9QcQ+9Bne9hPFkoHtoeMMlHJyoUo67C0PifwIHhHscEvlxGOFRVox+O3ym
	 Yh+E+cZDDjnDQ==
Date: Tue, 16 Dec 2025 09:22:15 +0000
From: Lee Jones <lee@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/3] docs: ABI: sysfs-devices-soc: Fix swapped sample
 values
Message-ID: <20251216092215.GH9275@google.com>
References: <20251216-soc-bindings-v2-0-1fb394cc921a@google.com>
 <20251216-soc-bindings-v2-2-1fb394cc921a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251216-soc-bindings-v2-2-1fb394cc921a@google.com>

On Tue, 16 Dec 2025, Matthew Maurer wrote:

> The sample values for `family` and `machine` were swapped relative to
> what the driver actually does, and doesn't match the field description.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  Documentation/ABI/testing/sysfs-devices-soc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Lee Jones <lee@kernel.org>

> diff --git a/Documentation/ABI/testing/sysfs-devices-soc b/Documentation/ABI/testing/sysfs-devices-soc
> index 5269808ec35f8e2b18516556f886c77f5fac9401..cb6776a4afe02a76fe27ac6fc236babdc7865287 100644
> --- a/Documentation/ABI/testing/sysfs-devices-soc
> +++ b/Documentation/ABI/testing/sysfs-devices-soc
> @@ -17,14 +17,14 @@ Date:		January 2012
>  contact:	Lee Jones <lee@kernel.org>
>  Description:
>  		Read-only attribute common to all SoCs. Contains the SoC machine
> -		name (e.g. Ux500).
> +		name (e.g. DB8500).
>  
>  What:		/sys/devices/socX/family
>  Date:		January 2012
>  contact:	Lee Jones <lee@kernel.org>
>  Description:
>  		Read-only attribute common to all SoCs. Contains SoC family name
> -		(e.g. DB8500).
> +		(e.g. ux500).
>  
>  		On many of ARM based silicon with SMCCC v1.2+ compliant firmware
>  		this will contain the JEDEC JEP106 manufacturer’s identification

-- 
Lee Jones [李琼斯]
