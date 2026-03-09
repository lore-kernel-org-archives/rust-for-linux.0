Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521361F16B;
	Mon,  9 Mar 2026 13:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773063167; cv=none; b=aueB5ISEPVYuZvL9c9ewhPXJZaHYfxwiDgII+2ErY4/yN7VW5hL5Mlo+sEN3GL1CIi3o5GDH+gdBhSUec9vlN2CQ3ZTLgVjMHP6BZr635+I1QyZ8zMDZ7WQ2HVDUTOO3WJpqYeAHVenfpXbeAH3coBY/txVeekwFT0l5sabsnsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773063167; c=relaxed/simple;
	bh=LlWewtt/WAGkf8AC5DR+E7jrHyfKWDArd9DcvieLuG8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=s6DGh2GkYVvU9b8ay9YZmeQw5eNCpN+MC+RQdo+QRT5S9dIPAqDLSgrTjIK88oSFvO7aGrRCt3Yz72Ea5gt1UbcAc5FqLBFcullZZRjIRV5HDV4vbCMxSHXd1x0EKH+qa9x/Q/2xfve3IGKqcl1ZZ/DLU2Md202ojG2MQmGjPQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7atOvsH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7atOvsH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0277C4CEF7;
	Mon,  9 Mar 2026 13:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773063167;
	bh=LlWewtt/WAGkf8AC5DR+E7jrHyfKWDArd9DcvieLuG8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=F7atOvsHTgTzdzhlsqX8GIWfvtSwV8UXGXIzoEKgeDkVhX86p+WtzrGZzmDK9etRO
	 z7veUnpdlazcaIyxxuVO/3kcge3UOPK5KIQxti2+/9RRp91+TqHhHk6zAYM8jq7Ylj
	 lOASAe2aCXHH1FqtoDzxXhgeplhUWcQd1oupHFJ3Bq9+n0PPf7fDempBK1aiiFOuW/
	 tua3gXPRWv1Ekp65X0PFxg3t1eWvmleOlHHe1qcGHMqVt5ZipeG8SMO0DithyQF1mE
	 6zYOHrlbD4OT+nz6DYQxdnd2+0oZL4n3AbvSQ8YqRbVHJsfLN0srPMLCFnF37J0pa7
	 5ez/bt4MejEDw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 14:32:41 +0100
Message-Id: <DGYAFNSJ7576.1E0JZ2W499ZQ7@kernel.org>
Subject: Re: [PATCH v2 2/2] mfd: Add initial synology microp driver
Cc: "Lee Jones" <lee@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Markus Probst" <markus.probst@posteo.de>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de>
 <20260308-synology_microp_initial-v2-2-9389963f31c5@posteo.de>
 <2026030827-nautical-overplant-399c@gregkh>
 <8efdf3e1bbf24504d560c12131cade543bec82f5.camel@posteo.de>
 <2026030913-agonizing-shoptalk-ed98@gregkh>
 <7f8d979a881b29398f524f526f52ba9727d95a7c.camel@posteo.de>
In-Reply-To: <7f8d979a881b29398f524f526f52ba9727d95a7c.camel@posteo.de>

On Mon Mar 9, 2026 at 1:52 PM CET, Markus Probst wrote:
> Yes. I will split it into multiple drivers using the aux bus in the
> next revision.

Independent of the other discussion whether this belongs into the kernel in=
 the
first place, reading over the cover letter and commit message I understood =
the
following.

  "Synology uses a microcontroller in their NAS devices connected to a seri=
al
  port [...]" controlling LEDs, fan speeds, a beeper, etc.

  I.e. it muliplexes several physical functions that belong to different
  subsystems, such as hwmon, input, etc. over a single serial port.

This sounds like a textbook candidate for MFD to me.

I.e. there is a very loose coupling of the different functions that make up=
 for
entirely independent drivers, except that they share the same serial port
connection.

Whereas the auxiliary bus is more for very complicated devices to be broken=
 down
into more managable (sometimes optional) sub-domains, where the correspondi=
ng
drivers usually have driver specific APIs to interact with each other.

- Danilo
