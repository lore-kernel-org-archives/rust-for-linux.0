Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0FCB640;
	Sat, 10 Jan 2026 23:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768087107; cv=none; b=k3cSonDPwSxP5R9pi2lXs2qmsY14UEXsc8yA10/TodPjNchssrGIX8IYc9A9Te/9RKqpwH1hzgU+0jxfE2nRVEvXgD9yxWNpPy/xP9OwaszWA/hA4vpyTjKnYRVkBkHOZk41uIBLWcFOMjIglIAiEuGBEGXJAtR4Sv8zCopoRVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768087107; c=relaxed/simple;
	bh=OV3KsFGhkoZ0Ojg2CCPKYr821NTJApnEABBiGDV2/EM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=fOXNzlU6oFXPQ3+KZShuIF7Hf3aAPgLcTMnSatq1FspAHufXeMPiMPqKYFtQvXRbm88CpJuwJOzm2Wtwf9lmgWS2ZG16LfM1sdClQp03pKxi2GY8reP78BXqtxXQtR+qRXhHwASOCb8cBmRbGUkeW6+VnvzWNtNuTBjxeYdg+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUxC8xgE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUxC8xgE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F97C4CEF1;
	Sat, 10 Jan 2026 23:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768087107;
	bh=OV3KsFGhkoZ0Ojg2CCPKYr821NTJApnEABBiGDV2/EM=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=VUxC8xgE+EmZaZ8KWH+lDppsTuXJ1wSNVCJou74gDJCBtfljPOxwoDfeiAbln3Owh
	 Fb0sMOcy5LYvu+02OhTBJfmOEPFhDViILwplLC/tgJ29Hm45eqjYGFFPEGbNlP8WcA
	 zMmYhOcZW0bh9ZrJhcPvypmcewDvsG8hj5ORKHw+SNUv7Sdc+wYpndzqmp6ceV8N6c
	 w4Xbz8KQOQVKxY+ZgbmcMxi3xUYi4z5LOMqfmLR7uv1EhCRTYfNTJt4XOUkQvE7ekh
	 uga6ypQWS2OAbT3NpRWOZVhnw8Dc3btXmmtzbZ8M8r7cg66KHemGTH4YsyaHM8DLWV
	 zvlHfhdtRadiQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Jan 2026 00:18:22 +0100
Message-Id: <DFLAKHLT86N8.11AVQHO5M8UC2@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Alban Kurti"
 <kurti@invicto.ai>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 08/12] rust: pin-init: rewrite the initializer macros
 using `syn`
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-9-lossin@kernel.org>
 <DFK3R2EK1JGL.FFW73JGUSGP5@garyguo.net>
 <DFL43YZQJFBM.3D4VE24MIKLYZ@kernel.org>
 <DFL5I47BBJOB.3RLOS601BRLFU@garyguo.net>
In-Reply-To: <DFL5I47BBJOB.3RLOS601BRLFU@garyguo.net>

On Sat Jan 10, 2026 at 8:20 PM CET, Gary Guo wrote:
> On Sat Jan 10, 2026 at 6:14 PM GMT, Benno Lossin wrote:
>> On Fri Jan 9, 2026 at 2:45 PM CET, Gary Guo wrote:
>>> On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
>>>> +                quote! {
>>>> +                    {
>>>> +                        #value_prep
>>>> +                        // SAFETY: TODO
>>>> +                        unsafe { #write(::core::ptr::addr_of_mut!((*#=
slot).#ident), #value_ident) };
>>>
>>> This should be `&raw mut` now?
>>
>> Yes, but that involves adding workarounds for 1.81 and earlier. I'll
>> leave it for a future series.
>
> You can just enable `raw_ref_op` feature globally. We've already enabled =
it for
> the kernel crate.

It must be possible to compile the pin-init crate using a stable
compiler. Enabling an already stable feature still causes a compiler
error (last time I checked). So we unfortunately can't enable it without
workarounds.

Cheers,
Benno
