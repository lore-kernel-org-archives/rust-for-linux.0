Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA4E2D374F;
	Sat,  7 Mar 2026 15:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898174; cv=none; b=adWEDHlGeZCljip686Zy3pvce05On/80WJCQglvzGgyZIN0Efhd2SY+ZOAm7c7RwjwsJMFo2gZeUffvOwdbf+6vHStDUUskBwwFStQbf3W2cSRTAzPMju9r9sYzM67Tic6vDbB1OqsjlOz58YvX/iZkWml81ffyEUeSdEDg+gk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898174; c=relaxed/simple;
	bh=ehW0YER/jsSAeu2XTkHU3OY1IsV5fBv2BY7z1l+oUv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFYWghF/TtQBs/GRejxAQpUIMl+pLgXb7C1iWHt6T3eYmRwS2a01V8czzM9WlDDPbfVGHH4jV6MEGBetex/CV7GNeCJnkRJcgN15JoDGrcpa2x9GKsDpc/wHY4LU6RBeA1PzrjvNCC9xVVSTIVFJwFj1gt+X4fXYKf7De4mBQbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTFeonXl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTFeonXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23602C2BCB3;
	Sat,  7 Mar 2026 15:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772898174;
	bh=ehW0YER/jsSAeu2XTkHU3OY1IsV5fBv2BY7z1l+oUv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTFeonXlSivFn0XCzBSc89IMy2kAm+ykiU6T7MLZA23Y276P67IPXElG8p91ACSa2
	 xfDDXZAQwqfEEpODI6q55Xhoh30K3imHOFW2Hc+eTrucp7BnPEn7SVL3yowO9mA4YR
	 OoR/sO8gyKhkKsN/ibjBce921gtjIFfp8USWQjGIXPD5yr+9+tOqh5rOJVYXypdc4Z
	 pX+PAka8qWvh8Pue4ldKF7yxYJEvUWYNyieH9uPSzfEX+TZhmvRp8/+3hun0zg8GQC
	 W8aaImjFhHotPdDOsiQuxbWJ//+OSgRd75LWsZlJnvS897GhkbzHPG+Va/Vm55k3iw
	 vXeWfyepR5dWQ==
Date: Sat, 7 Mar 2026 16:42:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add binding for synology,microp
 devices
Message-ID: <20260307-nocturnal-ingenious-swine-52f482@quoll>
References: <20260306-synology_microp_initial-v1-0-fcffede6448c@posteo.de>
 <20260306-synology_microp_initial-v1-1-fcffede6448c@posteo.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306-synology_microp_initial-v1-1-fcffede6448c@posteo.de>

On Fri, Mar 06, 2026 at 07:38:28PM +0000, Markus Probst wrote:
> Add the Synology Microp devicetree bindings. Those devices are
> microcontrollers found on Synology NAS devices. They are connected to a
> serial port on the host device.
> 
> Those devices are used to control certain LEDs, fan speeds, a beeper, to
> handle buttons, fan failures and to properly shutdown and reboot the
> device.
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  .../devicetree/bindings/mfd/synology,microp.yaml   | 75 ++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/synology,microp.yaml b/Documentation/devicetree/bindings/mfd/synology,microp.yaml
> new file mode 100644
> index 000000000000..0fcb0b750bf0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/synology,microp.yaml
> @@ -0,0 +1,75 @@
> +%YAML 1.2

You we have tools which save you review time. Most important, save
maintainers/reviewers time from giving feedback on obvious mistakes. You
must use these tools, otherwise maintainers get grumpy by wasting their
time.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof

