Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BDD319877;
	Mon, 29 Dec 2025 14:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767017243; cv=none; b=dqic6aprDXD5VMbdOgfJgvOL/HcZ4PqGcdMv2PuUDoj5+kg/ie/9hyb44KJ75qx97+ms92f7Vh5Q2snnCmhmqwfnL0qKg1s7w+9JEGl8Q6afzmYHVEblaD6YNVBewhCS45dDyIk4L3vBJXbob/Va5+qbknc8yAJr/TGoMcSZWMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767017243; c=relaxed/simple;
	bh=OuOjJ0B9zVdy62aXrzIv01xAH/upi94h6BnOId5oLZk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=SIoV0w/2WQ3TIA0VpJQvoyfA7un6WDHw/MNcL/008ULsJfSVH0nV55L8ZwOZ31TRzgUV+9cuDmjscqgretnWCNr4TrWBkTohylGOtYipuhWrSNmqS2IXUwy3qIYhxpBlk9Ru5mYux8KcnEIXuy9h6gbvcyGne0gtbMZf4NeoLMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJtM6Wmv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJtM6Wmv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E70FC16AAE;
	Mon, 29 Dec 2025 14:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767017242;
	bh=OuOjJ0B9zVdy62aXrzIv01xAH/upi94h6BnOId5oLZk=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=UJtM6Wmv7pfqxVSHyLhgs8txevr4sZF+aWxNUkjxdc2jlLFeYD4iraCPWip+TNwTN
	 VR0/XrIBvTsgYliDQC9yx5QezOIw8qBeQaRIvFI5sjPHpPM04JLXD8ZvjXScOpq1mS
	 Sc8POOcQx28/GV4ahCnVzdFkBolvvatVXIX16kF9yKm46yMUS+GiUe6LlSkD26+ycA
	 0km3op9m8BXsZ8ZTPlv4TmkUl3dCwNoNscFE8rXMCE7JShwPIVEAXVN88P8GUwQWQd
	 yzvGAxEHDZBp7rFroyNQunU2YMl9S5uP5dctxjjSpzSBGhdWm/SHvdNOMVw0gGfLbC
	 Whvq8wOQ0V1sA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Dec 2025 15:07:18 +0100
Message-Id: <DFARC0ZSLQUS.30H5E9NMYJGJ9@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 2/3] docs: ABI: sysfs-devices-soc: Fix swapped sample
 values
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Lee
 Jones" <lee@kernel.org>
To: "Matthew Maurer" <mmaurer@google.com>
References: <20251226-soc-bindings-v4-0-2c2fac08f820@google.com>
 <20251226-soc-bindings-v4-2-2c2fac08f820@google.com>
In-Reply-To: <20251226-soc-bindings-v4-2-2c2fac08f820@google.com>

On Fri Dec 26, 2025 at 9:17 PM CET, Matthew Maurer wrote:
> The sample values for `family` and `machine` were swapped relative to
> what the driver actually does, and doesn't match the field description.
>
> Reviewed-by: Lee Jones <lee@kernel.org>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Applied to driver-core-linus, thanks!
