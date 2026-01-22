Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D5B3469E4
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 19:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769111182; cv=none; b=UFFPcxXn8Bk9xQN0HtFvuX31EiwUudTYG8qgKTt/NbfiVGYe4ODi/L2usQze1C7QIKam4P5qyqkONl0cfrfM39O+Jv6QSgzZOhmSSAC37Ua04IzCS+8g3ggOAaEPTPJEQZhWkECYsGR8hC65elmFCPrl7PR1Ay3nH7DhACyEHhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769111182; c=relaxed/simple;
	bh=TN8arzSGhBApGLLCHhBbYeBIMyt6PlxpwkFRnn9kLYo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Dc/8axnWmW1jxzw3HWcX+YHtBfTHVpR0EbrQnsZKIaI29DDw3hr5HswntPlh+6DIDWhbbURwk2XX80BngAJZF5R4Inxo3P5MEb4EVsL/oIC0Upv/JIatb6URd15ozuyO86abyORE+hZq8sxp5Bmr4Nql4+pO8+KO1MLqAOVJqcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmlBlkRr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmlBlkRr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D816CC116C6;
	Thu, 22 Jan 2026 19:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769111179;
	bh=TN8arzSGhBApGLLCHhBbYeBIMyt6PlxpwkFRnn9kLYo=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=tmlBlkRrxjrblX0ToEJ9/v1bqxDvynGzITgcx4dvamHzPYcTvaVkJ/AJvv6SuURPf
	 JTbCb0fKUINNpT3cw984O1q/olFHS12FBHjn9hFh9+eYE/pVyCaxQa9n6l4QXnmLb7
	 IA6M0OECVXcA8xYgHgoeqekTU4mu4QgY4ZUTET08M08dQO42eU+dWtI+SpmXoRDzZb
	 FZKDwUFiK9REttU1T9FUjzKQq/a5LS5LJ5sl08ervqwTmbA1DSpCribDSQMjev0Mcs
	 YbjN21otNpjiHe/7b9XztPqo9OGTbu8r4jlymxIWiJxsw3TAALjAPlGan5yT6FV5cS
	 jd1QVIWHtV7/g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 20:46:16 +0100
Message-Id: <DFVDKMMA7KPC.2DN0951H3H55Y@kernel.org>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Deborah Brouwer"
 <deborah.brouwer@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <daniel.almeida@collabora.com>,
 <aliceryhl@google.com>, <boris.brezillon@collabora.com>
To: "Mark Brown" <broonie@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
 <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk>
In-Reply-To: <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk>

On Thu Jan 22, 2026 at 12:22 PM CET, Mark Brown wrote:
> On Thu, Jan 22, 2026 at 01:58:40AM +0100, Miguel Ojeda wrote:
>
>> From what I understand, this is only reproducible with Rust 1.80.0
>> (unsupported upstream), and was fixed in Rust 1.80.1. Did you
>> reproduce it elsewhere? I asked Mark where his toolchain comes to see
>> what could be done there (e.g. in his distribution).
>>=20
>> If it is just in Rust 1.80.0, and if a distribution still uses that
>> one, and for some reason they don't want to use/backport the fix in
>> 1.80.1, then we could consider something more global, i.e. ignoring
>> that lint altogether for that version, since it also fails for another
>> trait in `bounded.rs` (that is why I knew about this).
>
> As I said on the other thread I'm seeing this with what appears to be
> 1.85.0 in Debian stable.

That's pretty odd, I can only reproduce the ones you reported in the linux-=
next
report with 1.80.0.

If I run 1.85.0, I *instead* see the following ones from clippy:

  CLIPPY [M] drivers/gpu/drm/tyr/tyr.o
warning: operator precedence can trip the unwary
  --> drivers/gpu/drm/tyr/gpu.rs:51:13
   |
51 |             shader_present | u64::from(regs::GPU_SHADER_PRESENT_HI.rea=
d(dev, iomem)?) << 32;
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^ help: consider parenthesizing your expression: `shade=
r_present | (u64::from(regs::GPU_SHADER_PRESENT_HI.read(dev, iomem)?) << 32=
)`
   |
   =3D help: for further information visit https://rust-lang.github.io/rust=
-clippy/master/index.html#precedence
   =3D note: `-W clippy::precedence` implied by `-W clippy::all`
   =3D help: to override `-W clippy::all` add `#[allow(clippy::precedence)]=
`

warning: operator precedence can trip the unwary
  --> drivers/gpu/drm/tyr/gpu.rs:55:13
   |
55 |             tiler_present | u64::from(regs::GPU_TILER_PRESENT_HI.read(=
dev, iomem)?) << 32;
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^ help: consider parenthesizing your expression: `tiler_p=
resent | (u64::from(regs::GPU_TILER_PRESENT_HI.read(dev, iomem)?) << 32)`
   |
   =3D help: for further information visit https://rust-lang.github.io/rust=
-clippy/master/index.html#precedence

warning: operator precedence can trip the unwary
  --> drivers/gpu/drm/tyr/gpu.rs:58:26
   |
58 |         let l2_present =3D l2_present | u64::from(regs::GPU_L2_PRESENT=
_HI.read(dev, iomem)?) << 32;
   |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^ help: consider parenthesizing your expression: `=
l2_present | (u64::from(regs::GPU_L2_PRESENT_HI.read(dev, iomem)?) << 32)`
   |
   =3D help: for further information visit https://rust-lang.github.io/rust=
-clippy/master/index.html#precedence

I wonder if this is Debian specific?
