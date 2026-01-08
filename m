Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06F0496913
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 13:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879385; cv=none; b=heYnGKum+oUQgu0j8BsxbtSJtT3T9mCbS9Zwvq7VJpySjU0w+WYk6cNB4LVWocWAV4Y7KHjCbYQfll3QkmicJ2jwoWRU9bALkWU6iKA9OslXC/GK9L6EXaSJpWPXGck5NNA3S0f/z/0MmgWa63kjMo/VDblIe936D0wnO2lUa7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879385; c=relaxed/simple;
	bh=0FGDq4ThNIZ3VmojZf39gffqMCrh6VNHHpCJDOVvRSg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Rnm8vZtEYqf9WLvXYPkeWvJfIAMj1TNWavd3pzO5AVWsCKiX78NW1FLGMJHfcDg5NeK1wMmhjmLK4Rld+TI+VGKy1fLaVYMK/BAvBVpw+af7wdR5PlYRNGOy+2iGtDsYrykcfZtTKIqBNVxAInlhpM0gnRyFYq76Cf+NkooDEDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mm2pmZQW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mm2pmZQW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF33C116C6;
	Thu,  8 Jan 2026 13:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767879385;
	bh=0FGDq4ThNIZ3VmojZf39gffqMCrh6VNHHpCJDOVvRSg=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=mm2pmZQWIbCfgetyKxiOAsgncUxGThQNoZTFy5hO6i9SDmk4auYfIGEt9wGbpTpWN
	 L++Kiupb80K1NA55M4IepMMgs5K9mMclF4NegtLpyly30wvm8laazR84oVmAu22vj5
	 eV/tQnRr3UDBuamJYSGoeuR6n7Kbmhc3CB7G1GVi/y8m+eqqWpHyWGKtVlygkBABHD
	 bhP/HsYibS9AXf4VMYmWnKnB+pfKoBO6P5ysRCUPjeX180tJ+rIX815gc1nBuvV3PT
	 wKZEHLBoTOmNEhTamvF6OeWoGxcs6e38hFWW1QG/7PyXgioZVSRI+TyChoMHMnL9f2
	 HHSqOfQZujctg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 14:36:21 +0100
Message-Id: <DFJ8XRR2T22T.3R4FQHF50B4P4@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: add missing newlines to several
 print strings
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>
References: <20260107012414.2429246-1-ttabi@nvidia.com>
 <20260107012414.2429246-2-ttabi@nvidia.com>
 <1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com>
 <CANiq72mKUxGh8cdZW0fXPCg20zoL19HY0GxRSDSYCj68Mp04vw@mail.gmail.com>
 <20260108125523.5c7810ae.gary@garyguo.net>
In-Reply-To: <20260108125523.5c7810ae.gary@garyguo.net>

(Cc: Greg, Rafael)

On Thu Jan 8, 2026 at 1:55 PM CET, Gary Guo wrote:
> In very early days (before RfL is upstreamed), I had a prototype print
> macro that is designed like this:
>
> 	info!("foo"); // pr_info("foo\n");
> 	info!(target: dev, "foo"); // dev_info(dev, "foo\n");
> 	info!(target: dev, once, "foo"); // dev_info_once(dev, "foo\n");
> 	info!(target: dev, ratelimited, "foo"); // dev_info_ratelimited(dev, "fo=
o\n");
>
> There's a trait that is implemented for anything that can be used as a
> printing target.
>
> I still think this is superior than just having our macro mimicking the C
> side (and as a result, having a lot of macros rather than just one for
> each level).

Why do you think this syntax is superior?

One disadvantage for maintainers and reviewers would be that it is less
convinient to grep for pr_*() vs dev_*(), which is something that people
regularly get wrong. I.e. it regularly happens that people use pr_*() where=
 they
actually print in the context of a specific device.

> I think with Rust printing machinary, `pr_cont` is rarely useful, instead
> of calling `pr_info` followed by multiple `pr_cont`, you can just have a
> custom `Display` implementation and print it in one go. This is also free
> from racing against another print and have your lines broken into two
> parts.

This I fully agree with.

> I would be much in favour of vouching deleteing `pr_cont` entirely from
> Rust codebase and always have newlines automatically added.

I don't think it is a good idea to always add newlines. It might be fine if=
 you
only do C code or only do Rust code, but if you are switching back and fort=
h, it
is a horrible inconsistency for muscle memory.

I'm pretty sure that this would turn into a generator for trivial fixup pat=
ches
either removing or adding the trailing '\n'. :)

- Danilo
