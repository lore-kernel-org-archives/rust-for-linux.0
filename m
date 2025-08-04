Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3D328642C
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 17:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754327763; cv=none; b=ifvtMkURalahUuV1rV1oiFhLyXNy7fxfkcrMDPZuWnUdjWYXyR9f3VpWqPM7OIyvb97fQ2tn7GnSTekAu8Kj4vtzHTHSVNVWrXs6msTHgzsQAgsSNE1kM3VOaueDR3Slee4Ha/4ecmBp6keqyRr/dvYCtzfu4u2QvjxBzjkwDXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754327763; c=relaxed/simple;
	bh=M9q1fgaURt58Aeodev2QZtum4Mu9RH6lDLkRVQTR3eU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=q5WOz7RA4spclzhQasErIQ/DQJ89aKfZ3YFhLSVu2B0Opd5f3Ddlf0/CA4BY0A2/EWtEmrAqREbvUalMh0fnLTLHaX0XScHw2KiJP0H7MBB8OlBvcJ4g72O9kKv+acv9xsiUOrC3aAiY9VBACM6ZNpihpT1RcRTI/mQEVHM/FgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhOMiSKg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhOMiSKg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A9AC4CEE7;
	Mon,  4 Aug 2025 17:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754327762;
	bh=M9q1fgaURt58Aeodev2QZtum4Mu9RH6lDLkRVQTR3eU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=rhOMiSKgXVYhPBPU4v4Ype8uhdPsb5BpY42kXXdhWB22X+uMSC8z74nYwfTyq04zz
	 ySxabEj1PaxfvpTcqcjCbPDLa3jXkvdMET5lwjK5p6S5Yssw5xnisVmzzW18G06LVp
	 sj4/Kp+1xGA3IKGJ88vzpDabcmiVRZHPe/wpM9q8DEaD+Y97DBqmOkVw/D62Up6Jf1
	 lHfiumSq8IsEv4zFaJgHf6lXTTlkJvOKe0+UD8DkHlpt2xxGPZnm4wWpVHO4wQKt3Q
	 3eVTOTETUkuhTM/VqTCxdJ35wgdv3gVgwUqroPX0fBBwb/NLnyTMp/EY94Hyjwokv1
	 oIqm/satoCyHA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Aug 2025 19:15:58 +0200
Message-Id: <DBTTAEC8HLGA.QYJ0UZOIDYEZ@kernel.org>
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
Cc: "Igor Korotin" <igor.korotin.linux@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
 <08e89f95-6c95-4998-988c-e25f3cbfb389@gmail.com>
 <DBTQRIGWJDYB.2VNIOFWLKZFG3@kernel.org>
 <3e53e2c8-4988-448e-b2ac-6eaf6d62e050@gmail.com> <aJDbmFx3QAm-TY4L@shikoro>
In-Reply-To: <aJDbmFx3QAm-TY4L@shikoro>

On Mon Aug 4, 2025 at 6:11 PM CEST, Wolfram Sang wrote:
> Thinking about it, there will not be a lot of patches for I2C Rust, or?

I think the changes to expect are mostly in three categories.

  (1) I2C infrastructure changes. For instance, this series contains the bu=
s
      abstractions to probe an I2C (client) driver. So, I assume subsequent=
 work
      may contain infrastructure for I2C regmap, adapter drivers, xfer
      algorithms, etc.

  (2) driver-core infrastructure changes related to the device / driver
      lifecycle.

  (3) Common Rust infrastructure changes.

(2) and (3) may also go through the driver-core and Rust trees, the frequen=
cy is
not too high, but I'd expect a few patches every cycle.

As for (1) I know of at least two Rust I2C drivers people are working on,
DS90UB954 (FDP-Link deserializer) and NCV6336, which I think is a buck
converter.

Depending on what Igor works on (I thought I read it somewhere, but do not
remember), we probably get away without adapter drivers and stuff for now.

Besides the I2C infrastructure they require (which doesn't seem too much at=
 a
first glance), I think we also have to consider how drivers should be route=
d
eventually.

- Danilo
