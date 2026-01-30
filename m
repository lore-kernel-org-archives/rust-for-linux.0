Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B11F355818;
	Fri, 30 Jan 2026 17:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769793509; cv=none; b=Z1iufB8+rTivtmld3u7G7WG0CvTF9bTpgbc0oHozUTeQdLVlhn/3yIvabdRM8kMH8v/CjVHleccrX4IU4U6gQdsy2Hs00j5+cDEsv2nAHwc2z0tivg5iIAA9ipKJ5aSMpMiRVFSalvAJeUZ37Xxp0Pu2Q1frHgGohT9CaVkx/Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769793509; c=relaxed/simple;
	bh=F7W8rHHV/x88JwVWSFQbLnbtawGUdR6rPEtpilbuGeM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=bMug/qCAYhCDxuzG+oKit06tudVfphAHjVngnYWKiB93fpxZZtW3k+/K7sGKAzQr4uuRgvTHzlpcomZbuunjAhG+eIwQTwLGEm9DZa9BdZIUnmRtRrxPoQty5xTCNnOHVRw8h/x/GHk5brzmmSeFCIL3X86ESjh6T0LmS8RtSf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=keT+Ud4s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="keT+Ud4s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD347C4CEF7;
	Fri, 30 Jan 2026 17:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769793508;
	bh=F7W8rHHV/x88JwVWSFQbLnbtawGUdR6rPEtpilbuGeM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=keT+Ud4sgZrbSaADE75Q/7sMx2R9ORde+s2fCCQfRBAl/HyiQZdVSGEkvZU/0Rfma
	 Ak2NxhjkE1ua7Nasp9NjyfQPQolP2Z3VpY63Iflz1HYvrSvOZrGqLn6N3WtBXpTbDy
	 U3R2VHQXuHCbZcyhFuLvRFhC4fOMqfSptUmIE51rU4Wvbu0U+weObHi42UiyEWKqOT
	 155/YSsPZQjCfRfO1sskJB7JUbtuJjFZo7buG452ynpl5dCz8umjLCGV6ZibgkkQzi
	 MrDsWSibtNB30Oy28Ta7cQ9V5bgQM+FwHuBdYmTET5lDPm9d6MTUoHYrBiDCWjXTwT
	 brXtOFiXhZutw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 18:18:23 +0100
Message-Id: <DG23FR9ZVL5S.34ON222I49MIW@kernel.org>
Subject: Re: [PATCH v4 5/7] rust: io: add `register!` macro
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-5-aee3a33d9649@nvidia.com>
 <DG0CVJN57L5F.2I6J4RXMJOGQ@garyguo.net>
 <DG0WY7S2QPQM.37S6PROC464QI@nvidia.com>
 <DG14TFQG2C13.2BFREQR1DV4I@garyguo.net>
 <DG1Q6I5CTD87.RYS7QBJCHZ7T@nvidia.com>
 <DG222YZ4WT33.21A5GG66K9X5O@garyguo.net>
 <DG22Q420ISG8.169OONC5IKK7I@kernel.org>
 <DG232UE5TCK2.3FQARVQKDTUIL@garyguo.net>
In-Reply-To: <DG232UE5TCK2.3FQARVQKDTUIL@garyguo.net>

On Fri Jan 30, 2026 at 6:01 PM CET, Gary Guo wrote:
> `AsRef` won't work for `Io` which is a trait, unlike `Device` which is a =
type. A
> custom trait might work but that's more complex than what Alex purposed.

Are we sure about that? For instance, how do we determine the size of the I=
/O
operation in *_reg()? How can we trust that the type passed to *_reg() is v=
alid
for an arbitrary bit pattern?

I mean, I'm not saying it's possible, but it seems that we end up with a co=
uple
of safety requirements for the base register traits.

> I'm quite fond of the `io.read_reg(REGISTER_REF)` API suggested. It looks=
 quite
> uniform with other I/O acceessor methods, except typed and with constant
> offsets.

It's just a nit, but I find it a bit icky that we have to have something li=
ke
the "_reg" suffix.
