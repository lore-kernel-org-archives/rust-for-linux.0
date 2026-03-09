Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3044389455;
	Mon,  9 Mar 2026 15:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070640; cv=none; b=CwEvNtb5yV5gJ9za1sG8StEDb50vkN3IFTI+gNYl0OJUYPQV8zxv3UZQ3pz4Jtn6voTZm9eMlSYqKpKo3EKjAUwA9dTAOjnPASphTJktzvyisUYeNZ4xpP//Nf2OgU0CiHgC1D0UAc0RY3AIlMaofs0bXpwf70mkTsgsWQ5jffE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070640; c=relaxed/simple;
	bh=3ybwSeod76pQR7YjiZXftNF1P5kZQBu6iqMvoeQc6BA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=OxYjgO1mbqTdpF1si9SXITegzMQP4cDkirtrw8iee7HhYk9G/VDucBtSzaOb1INrmEUw8tPP1erDWSzVklbN5QfERQRDATux7N9v9qqhmJXH8rjwkWddij3Mp9Yp+881bOprhhTtncJ6uLIPuh+HyFJgXP54dlZfD3C/Q0kVBi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZROZrOo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZROZrOo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAD1C4CEF7;
	Mon,  9 Mar 2026 15:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773070640;
	bh=3ybwSeod76pQR7YjiZXftNF1P5kZQBu6iqMvoeQc6BA=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=eZROZrOoGNIwfwvlBXnBXVOHCgdWVzzhfkX2qinom1gj/ZvjejTaMx7C88er6a17C
	 P8+pkcUqEFrkYchCzu3zZ3N74mBxhY0wvGcMVHdebwa9o6dwAnwd+EeuXOtOeE7Y6K
	 u0+wUziPOxkUHRmF7ynlRelYVj56yb+JYI0T3EhK0Cw2CgJhsfw0VVETCP2nxRSz7W
	 pfWZI8+HRIw5tegtq7w5yl/cmmBzvbNpwtKC0zX96QnHe3FTjn3G57q7k0jJQgq4kP
	 ZiZre93Dujh4y+N5iTnLrMVw5VRFETPouX2Ua9rinGCGflYkU9JE/XBj7q52ZQmDCg
	 Ovqcml6Tuz20g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 16:37:15 +0100
Message-Id: <DGYD30Z605PK.NEMCORGS2FTD@kernel.org>
To: "Lee Jones" <lee@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 2/2] mfd: Add initial synology microp driver
Cc: "Markus Probst" <markus.probst@posteo.de>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
References: <20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de>
 <20260308-synology_microp_initial-v2-2-9389963f31c5@posteo.de>
 <2026030827-nautical-overplant-399c@gregkh>
 <8efdf3e1bbf24504d560c12131cade543bec82f5.camel@posteo.de>
 <2026030913-agonizing-shoptalk-ed98@gregkh>
 <7f8d979a881b29398f524f526f52ba9727d95a7c.camel@posteo.de>
 <DGYAFNSJ7576.1E0JZ2W499ZQ7@kernel.org>
 <e43ca445ec7887d3d15676adb7db04f5685f4195.camel@posteo.de>
 <20260309151555.GU183676@google.com>
In-Reply-To: <20260309151555.GU183676@google.com>

On Mon Mar 9, 2026 at 4:15 PM CET, Lee Jones wrote:
> On Mon, 09 Mar 2026, Markus Probst wrote:
>
>> On Mon, 2026-03-09 at 14:32 +0100, Danilo Krummrich wrote:
>> > On Mon Mar 9, 2026 at 1:52 PM CET, Markus Probst wrote:
>> > > Yes. I will split it into multiple drivers using the aux bus in the
>> > > next revision.
>> >=20
>> > Independent of the other discussion whether this belongs into the kern=
el in the
>> > first place, reading over the cover letter and commit message I unders=
tood the
>> > following.
>> >=20
>> >   "Synology uses a microcontroller in their NAS devices connected to a=
 serial
>> >   port [...]" controlling LEDs, fan speeds, a beeper, etc.
>> >=20
>> >   I.e. it muliplexes several physical functions that belong to differe=
nt
>> >   subsystems, such as hwmon, input, etc. over a single serial port.
>> >=20
>> > This sounds like a textbook candidate for MFD to me.
>
> Then you do not know what a textbook candidate for MFD is. :)
>
> What part of the MFD API does this device utilise?

I did *not* say this driver - as in the code that was posted - is a textboo=
k
example for MFD.

I said that the hardware that is supposed to be fully supported eventually =
is a
textbook candidate for an MFD driver, i.e. it should use things like
devm_mfd_add_devices().

I think this was obvious from what I wrote above.
