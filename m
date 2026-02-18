Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1053321D7;
	Wed, 18 Feb 2026 23:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771457022; cv=none; b=tGaQ95YaQW/lUGI+8qYEfAaVkKoZJn6DqHBdUOgD5XZUsPwwx7aMO2UKLr6zs9VVRQ0Qm6zgT59On1yLw/sDRibzCaEbtcZtYdDc/YcuoQ4yeVjpn7hkDxIaN8djiLkwKqJkliywxYxT7d71XbsFv3pf3CShLTUFWE1yPhZm/b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771457022; c=relaxed/simple;
	bh=q0iO2ljlV0MFFC/vV07sdCxQMgbw432DuvfkuBRn4gM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=i+06uY2l/dn9A95wov88bVDMIMBu7C4jTFfexmCJ2n0wGrxtlMPphMtyfaN+6W1OWBAKGdU1hVOaLYigcuC89b+czwIn9ky6m3N1K9T+aF67sCl+MNnFMUwJ1ZAVVbR6nFRBDubmnlXpE0xdJv24leRLPcfHpk0XPcJqB3aaivU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUrVkqPg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUrVkqPg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82C0C116D0;
	Wed, 18 Feb 2026 23:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771457022;
	bh=q0iO2ljlV0MFFC/vV07sdCxQMgbw432DuvfkuBRn4gM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=nUrVkqPgItrxOCe2NunlWOI0X9iDkWaR4VmlQaUZSP4r4ilF6N5RCnEglIFzPNfrL
	 4Z7srVAihVudfix6XmV0DyQ+7aL5Cl5bN6HoaWPId2Hx3+lbkn3enPSIcVDlXlXeeJ
	 bzqHJrtsT6U2EdBGpgqqZ1BQ8Wzkk2esZTl2qqO88aO3DmksX1IXhfx7yHjbT8jzlE
	 xCaZGZYeVeOsRIJGf3FieWCvsNsiFah6GG4LghXL2ZzR4SxsXZlPDJ7Fsn7t+1zx/M
	 BOBYZ8ETtM3cOzHTP3sux4V43fMFPu7kjYnsvvD6gf94xmxXNwFD3vegP/Dn/jxPF4
	 BSeK+u19tQ7yg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 00:23:36 +0100
Message-Id: <DGIH3QYWSOG9.2E6DVO2CNGOHI@kernel.org>
Subject: Re: [PATCH v3] gpu: nova-core: fix stack overflow in GSP memory
 allocation
Cc: <tim.kovalenko@proton.me>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Tim Kovalenko via B4 Relay"
 <devnull+tim.kovalenko.proton.me@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260217-drm-rust-next-v3-1-9e7e95c597dc@proton.me>
In-Reply-To: <20260217-drm-rust-next-v3-1-9e7e95c597dc@proton.me>

On Wed Feb 18, 2026 at 5:01 AM CET, Tim Kovalenko via B4 Relay wrote:
> Changes in v3:
> - Addressed the comments and re-instated the PteArray type.
> - PteArray now uses `init` instead of `new` where it writes to `self`
>   page by page.
> - PteArray just needs a pte pointer obtained from the `gsp_mem.as_slice_m=
ut`.
>
> I hope I understood everything in the V2 email chain and implemented it c=
orrectly :)

What I meant in the v2 discussion is that we can see how the patch series f=
rom
Gary [1] goes and once landed base this fix on top of it, so we can avoid a=
n
intermediate (conflicting) solution.

If, for some reason, [1] does not progress as expected, we could still fall=
 back
to using as_slice_mut(). So, given that this fix is not super urgent, the i=
dea
is to wait a bit, see how things go and then take the corresponding directi=
on.

But don't worry, this is your first contribution and it is not on you at al=
l --
I should have explained it better.

For now I suggest to wait a bit more, see how [1] goes and then let's follo=
w up
on this.

Thanks,
Danilo

> - Link to v2: https://lore.kernel.org/r/20260213-drm-rust-next-v2-1-aa094=
f78721a@proton.me

[1] https://lore.kernel.org/rust-for-linux/20260214053344.1994776-1-gary@ga=
ryguo.net/
