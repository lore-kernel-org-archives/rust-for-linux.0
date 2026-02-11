Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894732D6407;
	Wed, 11 Feb 2026 10:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770804424; cv=none; b=EjfU+5wr0k50YtEwvyfT8Wiojt/Sp46xuL8Ft83V3aMHYqeGO0jeMzOJO6Cu2Hq6hq4qmOMDoXkWI0TUWPgQlwvz+NOK5FEoR5gBs9sHbvoV67wq8xBUWOZy66IMgciObqGNZqATeMF+4B/klH8781Fq2Mzdr9/ojIX7ULVNX8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770804424; c=relaxed/simple;
	bh=n1e+NhXHGXQPurM4og1LWmiGUlOZfxglivmcxzI+eE4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Z21H6+VlLybSLFJxf0N/ZO/jd9+kFZwxkZF5KG4IzuMzgg3ZM89ssjAZX0TfD0Al1mdPe0VrdXZW1uRH0XZ9tSGK4e8P/mkB+FuyKQ/1Rqn6KhbiawPnzFOHao4dIuA/0O/yXEx48unMsa/9oFB+tRvR1M4bvnj3DKQrfekqboo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwLidsnV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwLidsnV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E66C4CEF7;
	Wed, 11 Feb 2026 10:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770804424;
	bh=n1e+NhXHGXQPurM4og1LWmiGUlOZfxglivmcxzI+eE4=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=FwLidsnV2eYHmBOUnVNn2+2FVKwhEH0K34koWvCFEUKtIBOKt8H6wwZVY4Z2O5iLD
	 skNQ9BAL3tAmTx3QK4Bqg1y8XFbiQOkmxLZbuHmJLfUHirghwnbeIdCaiFZ60Sn9p8
	 ayR0MihgmA3rnotvpGU5SppcLvRjJDmd0y436f9xtUQPymuqhRToPZOGKr0FIZ2eeb
	 VIsAFR3kz55mF5xSddwIyMX6t/rLvZtWiT0lGtx1mJioVh2FEpiazustN6Nnflrggv
	 rTap23Z4v+6rdDZKV3lg2QffgppknfB00OBLHFfP+J9OLc4GP3By0MnAYFyL4zomwX
	 EPDoMN4jfCMxg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 11:06:58 +0100
Message-Id: <DGC1RZKMETA7.1O3XLC1N090G8@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 01/33] gpu: nova-core: pass pdev directly to dev_*
 logging macros
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-2-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-2-jhubbard@nvidia.com>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> The dev_dbg!, dev_info!, dev_err!, and dev_warn! macros now accept
> pci::Device directly without requiring an explicit .as_ref()
> conversion to device::Device, thanks to commit a38cd1fea989
> ("rust: device: support `dev_printk` on all devices").
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

There is already [1], which I queued up for when v7.0-rc1 is out.

[1] https://lore.kernel.org/all/20260123175854.176735-7-gary@kernel.org/
