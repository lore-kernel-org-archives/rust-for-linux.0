Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3695E33C192;
	Wed, 25 Mar 2026 22:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774476472; cv=none; b=tkSyVpCP7BertdlEHVjwT+INfAl46c3h81eceO0+Yl6FbxzJ5si4OzXGZLr/imQMJmFPIDc2xoPEKqibcA4C6XX4se9UCXtHzy4QRLUKML7XAsvmXl/+of+cQQ4lWnFZHhdJ0oLBs/8fT2BJnIRlHalRTjOjTRfPfbZ1JoK2NH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774476472; c=relaxed/simple;
	bh=NcB1tNrV2k331HpnvXK6P13pSTP4N1p6wGOoUqa8g7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxjfZpabcVMHabNLkTFs0jEp1gum2XLhqIHTAnIj+OsD5kY808HSJuLl2LdpOl+m0qz5pw+sDhHHT/inkgk448XC4WNBexzNxVHpf3XoPPLmP6l1IWvkWGXHu9o/yBh/RbvugR8uZVgwJmCkKSMtkEFVEdRo2wrNsmaQK0IyUeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D88oFZar; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D88oFZar"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF1BC4CEF7;
	Wed, 25 Mar 2026 22:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774476471;
	bh=NcB1tNrV2k331HpnvXK6P13pSTP4N1p6wGOoUqa8g7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D88oFZarIVNdBkmtRCnpRtyz4XuUeec4pJsYRBx/AZXWn45qHvWZhNZNkLpguYCNa
	 X6tlzfeh3B40nDuuEI0OYvjaeM5mlloJpK3kpUtbyrQ0r1rf1Iq3t5Yk/BYIUeqkHY
	 3to80qQu72Zx5sMebC09ql8sLQ1SH2dUPpa6kFN5qYATpVA1+HHM/nLMUsMf33vuyp
	 6N58XanvBS6qargozEIQtbMYysND8t56TVM1G7oLfpu/wWsSK2zEShTTwdw2y5PHZ7
	 Q0OCUXiOHsOoTrNdWCbzdWCIKFJZBKZT5Z9X2xoaeSUpzNt1MB8BsClkBBEn8ivLeT
	 LjmZdg3C7x8mQ==
Date: Wed, 25 Mar 2026 17:07:49 -0500
From: Rob Herring <robh@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: embedded-controller: Add
 synology,microp device
Message-ID: <20260325220749.GA17597-robh@kernel.org>
References: <20260320-synology_microp_initial-v4-0-0423ddb83ca4@posteo.de>
 <20260320-synology_microp_initial-v4-1-0423ddb83ca4@posteo.de>
 <20260321-rose-armadillo-of-drama-09fdcf@quoll>
 <a6fe54fcf985100fc85450e680e8f7da49e6b067.camel@posteo.de>
 <56ece3e3-871f-4ef7-9ad1-cd7f68f9d003@kernel.org>
 <881644afe920a222a7fa6b2221fcc157c037ccd5.camel@posteo.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <881644afe920a222a7fa6b2221fcc157c037ccd5.camel@posteo.de>

On Sat, Mar 21, 2026 at 01:02:22PM +0000, Markus Probst wrote:
> On Sat, 2026-03-21 at 13:32 +0100, Krzysztof Kozlowski wrote:
> > On 21/03/2026 13:17, Markus Probst wrote:
> > > On Sat, 2026-03-21 at 11:21 +0100, Krzysztof Kozlowski wrote:
> > > > On Fri, Mar 20, 2026 at 11:09:53PM +0100, Markus Probst wrote:
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +    #include <dt-bindings/leds/common.h>
> > > > > +
> > > > > +    embedded-controller {
> > > > > +      compatible = "synology,microp";
> > > > > +
> > > > > +      power-led {
> > > > > +        color = <LED_COLOR_ID_BLUE>;
> > > > > +        function = LED_FUNCTION_POWER;
> > > > > +      };
> > > > > +
> > > > > +      status-led {
> > > > > +        color = <LED_COLOR_ID_MULTI>;
> > > > > +        function = LED_FUNCTION_STATUS;
> > > > > +      };
> > > > 
> > > > Where are other leds? Binding mentions 4.
> > > > 
> > > Status and Power leds exist on every Synology NAS model I am aware of.
> > > But there are models which have additionally a usb or alert led. The
> > > device nodes for those leds should only be present, if they exist
> > > physically on the device.
> > 
> > Then help me to understand - are these different models?
> Yes, even with different CPU architectures.
> How much the "microp" device differs is not clear, but the
> communication protocol is the same.
> > 
> > EC is not a generic purpose component and is tightly coupled with the
> > actual board it is being present on. Unless exactly same board is used
> > in different models (unlikely) then the compatible defines the LEDs and
> > they are not needed in DT.
> So for instance "synology,ds923p-microp", "synology,ds723p-microp" etc.
> ?
> 
> I can do that, but that would be many.

How many is many?

> Having it generic seems more flexible.

Is there firmware for these ECs? If so is it the same or different 
firmware for each device? If the former or the functionality is really 
trivial, then I'd be more comfortable with 1 or a few compatibles. 

Generic means you'll need to add quirk properties when there is some 
difference the OS needs to handle which we'll reject. So stuck with one 
compatible and no way to distinguish different ECs is anything but 
flexible.

Rob
