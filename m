Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489B220C038
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 18:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767377322; cv=none; b=HkB0qSjwpFBBy8jQXyEvLS82NfQciFd5H+mxnLStv26VLNEE7G349oXKXdRrM44GuDu6GqvW2/58tfsh0VD21QtAr5XntGkXJP/jCrKHubUL9fsRZhQmTUvxT8BSlIeCf8y4oLFxpYNDKlWtEl+3Xi/+3zRvg5LFcHuxp30Jeb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767377322; c=relaxed/simple;
	bh=z/xuGbHbhlmHeBiQN9zuOK59vif1dxlVaDuyepiDFWA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=S0mza9BRWnY8icFo1kh9mErwsbcpyezt3Yjrjq8A0i04rjK5mkXpuy5+HETlVAcPDgUp3ta7k8DOFsoV9Ch7Hzo/uovxvf5ojxnP4p4fQvVxX1twFwAZ2ErPdUB12bHh71lzYmAgSNVoNfNTr/r5OPkBOWDPPez/M3YNQ367rcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQCrAuCy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQCrAuCy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A21C116B1;
	Fri,  2 Jan 2026 18:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767377321;
	bh=z/xuGbHbhlmHeBiQN9zuOK59vif1dxlVaDuyepiDFWA=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=IQCrAuCyKnKik4DmAjHaCu+82x8iSwSofnn8vc1XdaCYgLeMU9X0HFhCOzgQ7dIIw
	 M5ZTumDQ/cIoszCeEi1gddRJDr3zBFxKfMpS9G9I9/kUDmO0n+3cHD4UDOEH7gvHbc
	 Ao95ZDcJ5Yl71VN3TwG/S+G1pZfhmMo2okaYjYVC3SWatlBavzwtA7yxiHnF8oDyTh
	 lhtaqDTx3RyBA0gjZLZUB847btJupXdkX8SZ/rGCsYWTD7sjZxPbA7gDD5uo2p6Che
	 C1opftn2ZApRYTV7yP4hvqGs8h30bBLUyV+u9xLLAFKE0cjycWk9q1J4FwNnE3uRAx
	 guHWBC8HLXbTA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Jan 2026 19:08:37 +0100
Message-Id: <DFEAYYWILMPV.E9U3RM7QG14X@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v1 2/2] rust: device: fix broken intra-doc links
Cc: <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <rafael@kernel.org>,
 <aliceryhl@google.com>, <a.hindborg@kernel.org>,
 <abdiel.janulgue@gmail.com>, <bjorn3_gh@protonmail.com>,
 <boqun.feng@gmail.com>, <daniel.almeida@collabora.com>, <gary@garyguo.net>,
 <lossin@kernel.org>, <robin.murphy@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
References: <20251231045728.1912024-1-fujita.tomonori@gmail.com>
 <20251231045728.1912024-2-fujita.tomonori@gmail.com>
In-Reply-To: <20251231045728.1912024-2-fujita.tomonori@gmail.com>

On Wed Dec 31, 2025 at 5:57 AM CET, FUJITA Tomonori wrote:
> The `pci` module is conditional on CONFIG_PCI. When it's disabled, the
> intra-doc like to `pci::Device` cause rustdoc warnings:
>
> warning: unresolved link to `kernel::pci::Device`
>    --> rust/kernel/device.rs:163:22
>     |
> 163 | /// [`pci::Device`]: kernel::pci::Device
>     |                      ^^^^^^^^^^^^^^^^^^^ no item named `pci` in mod=
ule `kernel`
>     |
>     =3D note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
>
> Fix this by making the documentation conditional on CONFIG_PCI.
>
> Fixes: d6e26c1ae4a6 ("device: rust: expand documentation for Device")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to driver-core-linus, thanks!

    [ Keep the "such as" part indicating a list of examples; fix typos in
      commit message. - Danilo ]
