Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FC6382287;
	Tue, 18 Aug 2026 14:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063422; cv=none; b=N1oi2xtKbTNFID0sKcOc/E5LQo7avU3BjxTk/aRLn4HwS4xYXGvvfq3UcuROuvYt/rZ1Zi5aCb9FNYyjlqVUDVPskQsmc2GfnOmf1hkczEONEl5tkGu8DZcKnXViEv2k+7k+q3uHCnB0ZYWWmMcjCBgqLw7CcBWRX83K9FiY68M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063422; c=relaxed/simple;
	bh=eA27tlC3H79MKtDpto386smHf/UQtsTeRXvNNBJWA3I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=O2bRD982ZJlyCCv0jOn3ZrQzUdXO0A0EXkrNOC9iH5rOgr/f9jei4X5t039R/4zaxZlEqfS1zmD3CjdZD0Il9t4rYpKS0pIWvbYR3IcEL4FFmEx/Xsn3p2U3XeET9Z9TD50OC6F4nZ09NPsA7dansor7CP5XDuxa/Jg7pVyLrHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKw6Axv2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKw6Axv2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE83E1F000E9;
	Tue, 18 Aug 2026 14:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787063421;
	bh=uSyd6eOBEkdrfVzga7uCbiF7irf04akIh1eFxJ6zvQs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=iKw6Axv2K0gQSwzNIekwFJp1MePiUOUTlu6JANmyGh67m1QNmeQoHOEW712ywDU6h
	 jTKRoIgKadjyk+ZhKTMyBvSKhKZmX5cJwIjoPThn5KdMKl2R0As2ZfDJD/arXliSFD
	 dazqsUEJD/bU7AAntCBvI8yr3gylJ20Z0ZTl0B3DSxBXvKMqW7f5GyFNSLlXmo6EJf
	 wBuq991s0cIU/N4MSNi1857ChGr1uAy03juKKtQfrx3WwpeNQSeWPeCnhC3MLQChel
	 omdt7/E2IKiTiRXXVWtuOAXxyNPFjodmIhYkp4F+uaLdotMuTBXm7XBn2bjp5NyFoI
	 5Wamc4krYixJA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 16:30:16 +0200
Message-Id: <DKS53ZVUOF01.12DKD5ITC77TI@kernel.org>
Subject: Re: [PATCH -next] rust: fwctl: replace `__pinned_init` with
 `raw_try_init`
Cc: "Jason Gunthorpe" <jgg@nvidia.com>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Dave Jiang" <dave.jiang@intel.com>,
 "Saeed Mahameed" <saeedm@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Benno
 Lossin" <lossin@kernel.org>, <linux-next@vger.kernel.org>, "Jonathan
 Cameron" <jic23@kernel.org>, <rust-for-linux@vger.kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
To: "Mark Brown" <broonie@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260818105350.361218-1-ojeda@kernel.org>
 <20260818125558.GB5432@nvidia.com> <DKS3G1HH0835.P8T7VT9VW24I@garyguo.net>
 <20260818132022.GC5432@nvidia.com>
 <0e0c9ee9-ce44-49cf-b5c5-3764f260f1b5@sirena.org.uk>
In-Reply-To: <0e0c9ee9-ce44-49cf-b5c5-3764f260f1b5@sirena.org.uk>

On Tue Aug 18, 2026 at 4:16 PM CEST, Mark Brown wrote:
> So are these updates that are requiring frequent patching up aren't
> forced as a result of some Rust language thing but rather deliberate
> decisions?  In that case I tend to agree with Jason, I'd not expect to
> see changes like these coming in during the merge window without a
> strong reason, and with C changes like these would normally be done in a
> much more coordinated fashion - for example an overlap period like Jason
> suggests, possibly with shared branches.
>
> I'd been under the impression that the reason this was happening a lot
> with Rust was something to do with how the language works.

In general that is the case, the stronger type system makes it more difficu=
lt to
avoid conflicts by preserving compatible APIs (which is also one reason why=
 I
work a lot with shared signed tags).

In this specific case it is indeed what Gary already explained; the API was
removed and unexpectedly gained a new user.
