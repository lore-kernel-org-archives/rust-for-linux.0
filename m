Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409DA1B142D;
	Sun, 15 Mar 2026 00:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773536240; cv=none; b=pnYMr8yum0WBdq7Jxo6DjrydcfW8mKM7fI6/aXctu3abLJsbSyiEV1UHuvnNF01KzJJuhcvWQqODaliAe7d/QSuTKHh21e0x/krsmUD+U2247nVPwYD7AHGbX6+xpFA68XMQmvsQ3eXr/v9C+D/JbzrAKSqnBCVyRGEslt0g3u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773536240; c=relaxed/simple;
	bh=wBjE9EDrJ8we4T4vSN9GDPAkC07PO793VyHRATSkeiI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=F6yuuYpNTwenXzpOsleiBjM8PnxdsUsYEYBRAEYkTUWiqDHli5Zi63w3d1DxZpnqNfXzEMpcA0+WKZZJg7kqU85fGzR0m73jcEC5QK7c8Qukixcx0tSPSIhQpvDx0P4uw5/dN7Ir09c6YH/aEdfCI7EgFQVMjJBgkCLEkXD6+2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmavSNYt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmavSNYt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C15C116C6;
	Sun, 15 Mar 2026 00:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773536239;
	bh=wBjE9EDrJ8we4T4vSN9GDPAkC07PO793VyHRATSkeiI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=gmavSNYtDlA0O+bQZcO8mosgzUQRmZ2ILIwZE0YadHuahk6kNdDY2lDGujPebMfXQ
	 a39ZqqW+z3dLU8kwuSlJrauoUgb+dsB72Kg+FWEE7HL6A+sYU/XAhh7S4cI4vm/EuH
	 6u5jVzzaeZ+LN6jumxDR7uZ7d+SRr/vcjDG5xRF7muFzdzk7AG3go6rdbEVndTUOYE
	 gFxlKSDscQx0lZ8bkAhAARMgEW4MK/BBMVw0799LAgwZL0O5vIMmqD3m9iXYDpVZwg
	 kEOMS45nOaizvxBw/N8rnJHpprpuFR8LFifQ+3AUDAZQiw50N9i7QMddXZdtL93s5/
	 AfHfXrFdEtwDg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 01:57:14 +0100
Message-Id: <DH2Y4I8G5FYD.23JGR91DJLAH5@kernel.org>
Subject: Re: [PATCH v9 00/10] rust: add `register!` macro
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Yury Norov" <ynorov@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
In-Reply-To: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>

On Sat Mar 14, 2026 at 2:06 AM CET, Alexandre Courbot wrote:

I've now picked this up in the topic/io topic branch [1]; it will soon be m=
erged
into driver-core-next and drm-rust-next, thanks!

> Alexandre Courbot (10):
>       rust: enable the `generic_arg_infer` feature
>       rust: num: add `shr` and `shl` methods to `Bounded`
>       rust: num: add `into_bool` method to `Bounded`
>       rust: num: make Bounded::get const
>       rust: io: add IoLoc type and generic I/O accessors

    [ Fix incorrect reference to io_addr_assert() in try_update(). - Danilo=
 ]

>       rust: io: use generic read/write accessors for primitive accesses

    [ Slightly improve wording in doc-comment. - Danilo ]

>       rust: io: add `register!` macro

    [ * Improve wording and formatting of doc-comments,
      * Import build_assert!(),
      * Add missing inline annotations,
      * Call static_assert!() with absolute path,
      * Use expect instead of allow.

        - Danilo ]

>       rust: io: introduce `write_reg` and `LocatedRegister`

    [ Replace FIFO with VERSION register in the examples. - Danilo ]

>       sample: rust: pci: use `register!` macro

    [ Fix up kernel import style. - Danilo ]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core=
.git/log/?h=3Dtopic/io
