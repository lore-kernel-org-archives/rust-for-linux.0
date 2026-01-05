Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D1C2F0C7E;
	Mon,  5 Jan 2026 10:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767608949; cv=none; b=VLFBw7s4Vn8hCRU3yOuLGtSHZgoUFBKTZf7uMrMjdiRO+n6AMWZU5Wf64h3fRnW0YP50tI/Aa+BoGjrjXdZaMHnTD2Ro012IztHWPyN7AY7fM8ITzd0txn43vjQ99fuQc2EssWYmISuddhlrX/mQ9TOAmc1EHM+BOQla1sb+noc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767608949; c=relaxed/simple;
	bh=ZY10t/C1aiDKwdd1UbY3puinOltwLYQ1DyXZdChX+ug=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=lURSENm5YLPZaXawbOwcQtZRP3avBbWOD5FPnPhz72gP0y+K1klgqBEXDOV3W5NtB+wfWK8bid2BCkGdh+HUirK7EFc4w1keImU8Ns6+UUSENMo9ROcIvcnYoUAcT8rNEXuW8oxlB8c7jCKMBJFHtzxBu5m92hBMymJDcXXwINg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7gJE84s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7gJE84s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B15C19421;
	Mon,  5 Jan 2026 10:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767608949;
	bh=ZY10t/C1aiDKwdd1UbY3puinOltwLYQ1DyXZdChX+ug=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=f7gJE84sdtUUggDQ6srNOAJXkMbLkp28Q6mNDcNb0vpVKgqPcYsnsnTzkd9HzE+rb
	 4ZSP7GnvOwkflwE4x3Tws5bT/cNPyyBbgUjMSFdCM5WGYL8Ux6lWHu/qrgDHDuurRt
	 Vy1ZwD2hccrT3IkU82BsPuSBxFuPH9h71DV+Bru5YojRSTwh/rgxXc5DGAVguhZU+S
	 H7h7KAUqxvCL34c8RkVyBYj0C2yQ6APQq+lGUwC4TLD7866U1bCVpCUKM5rW47FXIE
	 1NkzUbSapRsCwYAAaBlZMXwulxaMv+VtPm+JtPb7B8yHMa5816z3vYh5dgSx+xx+nb
	 urldBqXzJPkzA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 11:29:04 +0100
Message-Id: <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
Cc: "Maurice Hieronymus" <mhi@mailbox.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
In-Reply-To: <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>

On Mon Jan 5, 2026 at 10:02 AM CET, Benno Lossin wrote:
> On Sun Jan 4, 2026 at 9:07 PM CET, Maurice Hieronymus wrote:
>> Add a derive macro that implements kernel::fmt::Display for enums.
>> The macro outputs the exact variant name as written, preserving case.
>>
>> This supports all enum variant types: unit, tuple, and struct variants.
>> For variants with data, only the variant name is displayed.
>
> I don't think we should be adding this. Display is designed for
> user-facing output and so it should always be carefully designed and no
> automation should exist for it.

In general I agree, but simple stringification of an enum variant for a Dis=
play
implementation is a very common use-case and it seems pretty unfortunate to=
 have
to fall back to either do the below (especially if there are a lot of enum
variants) or having to go the declarative path of doing something as in [1]=
.

Especially in combination with things like FromPrimitive and ToPrimitive it=
 gets
us rid of the cases where we need such declarative macro mess.

Eventually, drivers will most likely implement their own proc macro for thi=
s or
repeat the declarative macro pattern over and over again.

Maybe we should just pick a more specific name for such a derive macro than
macros::Display.

Maybe something along the lines of macros::EnumVariantDisplay? We could als=
o
have an optional argument indicating whether it should be converted to lowe=
r /
upper case.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/nova-core/gpu.rs#n25
