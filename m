Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3B844A721;
	Fri, 27 Feb 2026 16:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772208770; cv=none; b=nkLoTRKlCiIxYOMM67ihR/uRDn0U3alxZ8gkImDlqTe8mG0IgAT8Ta1URKmde7oRakO1UIp8j39OxM6PidFBhWW4puFNcJ1Q0WBTYad+iwEN+urYAlK496+E2e78RnP8pZ51uTNRKTmdd8Er/vk80Qnx+bZNCj4HF5Kj9LuLduc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772208770; c=relaxed/simple;
	bh=L/eAeHRIVJ0mKTXjDpGpxr0FtrcBMgJUdInuQI2XRl0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=DWTpnvKaZoonFKCadBx/vxjT0NZ66hzuYLOwI9iI5f5OcFaizP6kbOm8d9P5IGIic0btqDAlSGPg9Jvc+P9XH13SmyDNXGn1bilJRujLKVM9QfZ4x6jcQXRpb46y3wF3ENBZILipfDgQiNotuufahOxttII9xO8pyxXmdox9NgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Upwh7VBu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Upwh7VBu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1882C116C6;
	Fri, 27 Feb 2026 16:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772208769;
	bh=L/eAeHRIVJ0mKTXjDpGpxr0FtrcBMgJUdInuQI2XRl0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Upwh7VBuS44+din/dH3XEudZq7doRX+djfcsnzm3qpfebuTR6xLKIUG/kOcjnIHk6
	 ya//Jh4HvS5YoecU6iv6wX76sDWWZr7+KfHYHzjVy+e28ioOV3GSPPl0UsXFHTWVGx
	 TYhQjgm5rIwspA9IGnV3d8BJu8vOMjqpXNZbMW6TNrOJaJpAyu30kSDg5k4cvyB6IY
	 tbgwYGhTfqgRdo8pJp++JYG/PSR5+2IL/k2GW40fimzJr+FkOSIM1G5fjRbfepSc0Y
	 OldSx/CCpSoGx5pGtHreOBhvwuSEeJSZ9Zit3K2d0aD/E4Ji2Wc9A157VIeGKqACEi
	 eZKQfUoRVyAdg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 17:12:43 +0100
Message-Id: <DGPVKQT40AOW.35C692Q5RQZ8M@kernel.org>
Subject: Re: [PATCH v3 2/2] rust: workqueue: add creation of workqueues
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Tejun Heo" <tj@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Lai Jiangshan"
 <jiangshanlai@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Philipp Stanner" <phasta@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, "Tamir Duberstein" <tamird@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
 <20260227-create-workqueue-v3-2-87de133f7849@google.com>
 <DGPUOSG5I4GM.1N5AWMP5ZFY4M@kernel.org>
 <DGPVBM93AJXE.35EXIFCRRT9FU@garyguo.net>
In-Reply-To: <DGPVBM93AJXE.35EXIFCRRT9FU@garyguo.net>

On Fri Feb 27, 2026 at 5:00 PM CET, Gary Guo wrote:
> On Fri Feb 27, 2026 at 3:30 PM GMT, Danilo Krummrich wrote:
>> On Fri Feb 27, 2026 at 3:53 PM CET, Alice Ryhl wrote:
>>> +    /// Set the maximum number of active cpus.
>>> +    ///
>>> +    /// If not set, a reasonable default value is used. The maximum va=
lue is `WQ_MAX_ACTIVE`.
>>
>> Should we just mention the default value?
>>
>>> +    #[inline]
>>> +    pub fn max_active(mut self, max_active: u32) -> Builder {
>>> +        self.max_active =3D i32::try_from(max_active).unwrap_or(i32::M=
AX);
>>
>> The workqueue code prints a warning for max_active >  WQ_MAX_ACTIVE. May=
be use
>> debug_assert()?
>>
>> It's also a bit unfortunate that alloc_ordered_workqueue() becomes
>> .max_active(1).
>
> I think ordered workqueue still to have __WQ_ORDERED flag, too?
>
>>
>> At the same time having a separate ordered() method competes with max_ac=
tive().
>
> I don't think its too bad to have both, and before constructing checks th=
at it's
> used correctly:
>
>     warn_on!(self.flags & __WQ_ORDERED !=3D 0 && self.max_active !=3D 1);
>
> but type state works, too.

I think we can ensure this at compile time, so we should do it.
