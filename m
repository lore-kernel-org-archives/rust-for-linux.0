Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDB63EBF0F;
	Sat, 24 Jan 2026 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769261381; cv=none; b=e63ixsK6USIERjpFksDd2buaOEWeB3D7/XOdp2heUGgTlrhtvq78X6GLDMYxGYObj4CiBuBbMXJbda3CGS5hqaw92FgxUQaliNEpJZtDLE0kwHu/HL2D3y3jpZXR7mHjo/XKfGncN+/hVOD7+vecf21G9S0qBnG2spW2WByr6U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769261381; c=relaxed/simple;
	bh=WuVDWxE1MFEQyWLSNVYwC/Xc2H589TKTJgLy9InRQRE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=fBNVyWZFuotSZ87HgbVW00cAWecHuZDOb+KQjGGK2pr48eAor0Pu2O+lY2r0FueHgUWCGgmvtCUiDcHOeHBsWmJnMhQWMgUQTccNSsy5utmQNYMVlZoPIacX8havvqcEOq5TU3X848KWItoA3hzBG64i3ugh4EuKU2KXJr9ebjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gb9UBnZF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gb9UBnZF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147B8C116D0;
	Sat, 24 Jan 2026 13:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769261381;
	bh=WuVDWxE1MFEQyWLSNVYwC/Xc2H589TKTJgLy9InRQRE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Gb9UBnZF4xTb1ngAYRQHI1osVNTq+aL4eNcHF65vr8h5CXhWhXaM2CUodyUBucK11
	 TulrjPZbuFBIAU5Z+mDUjKTgVqYfcJDD0D5SzhinpNaoVOCyooCLRXQlLd8c+ghTkb
	 zIMoIbUJQx3bEoD4ZQ+w4h026BNrn8Af3gBMuOPrJ2JT4ipRFPOCT6J/kFpdrVYjkh
	 muJfeJ26j/ONbnOfW3xupkVidZ/FiUnY7lwb/PAPjnPYsgULHgJcxooYkysgoKQMlr
	 3oGXjs8s/ET3a59SvVou/4b0/0RshlbGJ92jjCRMUc7nepczA42KADvlOd+KE5QNy6
	 B/ooxyTeWyKCw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 14:29:34 +0100
Message-Id: <DFWUTANX4HBS.QIN5BJPI5MAO@kernel.org>
Subject: Re: [PATCH v2 7/8] gpu: nova-core: remove redundant `.as_ref()` for
 `dev_*` print
Cc: "Gary Guo" <gary@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Lyude Paul" <lyude@redhat.com>,
 "John Hubbard" <jhubbard@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260123175854.176735-1-gary@kernel.org>
 <20260123175854.176735-7-gary@kernel.org>
 <DFWUC9ZS6CCU.3HPTNAO7CU41S@nvidia.com>
In-Reply-To: <DFWUC9ZS6CCU.3HPTNAO7CU41S@nvidia.com>

On Sat Jan 24, 2026 at 2:07 PM CET, Alexandre Courbot wrote:
> On Sat Jan 24, 2026 at 2:58 AM JST, Gary Guo wrote:
>> From: Gary Guo <gary@garyguo.net>
>>
>> This is now handled by the macro itself.
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

We should take this through drm-rust in the next cycle to avoid conflicts.
