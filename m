Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFC523E35F;
	Sun,  8 Mar 2026 18:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772996207; cv=none; b=l2ejvBztwLwc78JGWdOdFKgq8HGgI8UPDhZ+trwRL8djt2dP+7txWuO1Qk1uYGRfhRfA2GIypsS2MKz7w5dsfWJVUWnxjN5ADCrFOhtlXr6pKnNQr8FsjXe1AArH9AVJbPWSv2n2tdlxIcwr2rhFafCIyZ+32uwQ3sYlRDihYWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772996207; c=relaxed/simple;
	bh=1b7PrKCMWI8OXsaOWPp+ifcUI4P+AtBHqjypjS8juqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBHuayz9eflJhMG0yWLnaR7Vr/9I6dZUb6qX7it7eEB/sS1HUJRRVQ8q/fS2izwLhAe8SoWjWc8NB1PZYlqmu2QpwmRUqS8MnC95PyGt6WRd4bPpLwUodURShItgqAWMKPgiyInYupSLNGEfCQaxhQqMLPe2/ov3o90824QLF5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pT4rhOAE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pT4rhOAE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10045C116C6;
	Sun,  8 Mar 2026 18:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772996206;
	bh=1b7PrKCMWI8OXsaOWPp+ifcUI4P+AtBHqjypjS8juqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pT4rhOAE2mrmtIa9HfDNaSx00pIGSsLAzJ6PNa6JHX/SlMrDrPhKXvaG4cV0y9Ste
	 TWJRp3iH0FU5MQQjTdUK2E2tusA8yU3a/BHdAIngiD3V5mEV1AvZ7HNDDMPZwMOtCG
	 B3OeBmGccJfkjJTC7E7Td28V1eFsP0e8spi+vZGs=
Date: Sun, 8 Mar 2026 19:56:44 +0100
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
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: Add initial synology microp driver
Message-ID: <2026030850-quickstep-blinking-b853@gregkh>
References: <20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de>
 <20260308-synology_microp_initial-v2-2-9389963f31c5@posteo.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-synology_microp_initial-v2-2-9389963f31c5@posteo.de>

On Sun, Mar 08, 2026 at 06:41:20PM +0000, Markus Probst wrote:
> +kernel::module_serdev_device_driver! {
> +    type: SynologyMicropDriver,
> +    name: "synology_microp",
> +    authors: ["Markus Probst <markus.probst@posteo.de>"],
> +    description: "Synology Microp driver",
> +    license: "GPL v2",
> +    params: {
> +        check_fan: i32 {
> +            default: 1,
> +            description: "Check for cpu fan failures",
> +        },
> +    },

This is not the 1990's, please do not add new module parameters for no
good reason.  This should be dynamic (why would you NOT want to check
for cpu fan failures?) and per-device, not per-module.

thanks,

greg k-h
