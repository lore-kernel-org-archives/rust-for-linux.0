Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C5E1552FD
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Aug 2025 17:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754413680; cv=none; b=SxZRliRPINoQRuag9gWXwJpGhiDfXhGWgdHYWoUFPBrVfo1XJ0GzCwNQEXQ/S7ACEaVWxv2L42zdz/Im7yAUM/7pGq+MKmS8PdDRsAQg/7LTVP6Wja0REeSFmV4FI3Ql48s71gCMK8lTYSGxLCrREVUKSoU9kOmkByb7mX07pJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754413680; c=relaxed/simple;
	bh=wpNqNfSCN2AqcBm2ScYSGy1bZWEyeXW/coNkyXBwcMo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KmNs6l2pW7lbJK2UfuQ2JGly3iQooVx07xvQXQflq7NCXLIkxy/9MFa19n1/yPqLQrVgNOPJCUe4x4yba9CXWcRD4IUbLyoJ0LeQq8E1k/C7VkUWAZudVeESdjZXIqoZjICN9lLzXf4DfoxCZJoxOczKNFxPqi5W8CzFe6Nf7fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3d/Z8F9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3d/Z8F9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A22C4CEF0;
	Tue,  5 Aug 2025 17:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754413679;
	bh=wpNqNfSCN2AqcBm2ScYSGy1bZWEyeXW/coNkyXBwcMo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=E3d/Z8F9xI8TG7grQXif7ZrYxQ8tkPmDhtcajXeXgyuPB04gM6T+adcVmxpWPQcMo
	 6uN/5PyTobI3yl1ovGum7YgdiVyJRTMrhd3XlfaLxMrSUq5ENmjwSyZg5BAuWIihic
	 Vs4135RAN0JKE/ZjhlhdVnAAfZKMO8aogSa6lYS7GscHet4jvGk/tfo7vR5ooi5sCY
	 W2HcoKX4GnIoKJ/6ZD/h1zCUbon5bqn4+t45Oclck78nk72eULtOF61daNirZ7waLz
	 YGtMz03KzjyhkFLLWwVV/NYMpbvTTdZzYxlDtKrzkfKoylWrsJ7xuKXxIIcv6XY/1m
	 ebCbVJEFDpYcw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich
 <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, abdiel.janulgue@gmail.com,
 acourbot@nvidia.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: page: implement BorrowedPage
In-Reply-To: <B8A7994C-62C0-4BDA-A401-C788444C8934@collabora.com>
References: <20250804195023.150399-1-dakr@kernel.org>
 <731A34A7-92AD-47EA-A17A-C25FA94A5144@collabora.com>
 <DBUIBXEOODEH.R2NYIGUDBZC7@kernel.org>
 <oJV7Dbb0WIqVDvEQYxKm15gegn1eV8jTjJlyAsIBXAMzvosERx5xNzOnZed0pr6XptgohYU0S9xXqA-wDnw_FA==@protonmail.internalid>
 <B8A7994C-62C0-4BDA-A401-C788444C8934@collabora.com>
Date: Tue, 05 Aug 2025 19:07:50 +0200
Message-ID: <87sei58zo9.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Daniel Almeida" <daniel.almeida@collabora.com> writes:

>> On 5 Aug 2025, at 09:53, Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> On Tue Aug 5, 2025 at 2:30 PM CEST, Daniel Almeida wrote:
>>> Hi Danilo,
>>>
>>>> On 4 Aug 2025, at 16:50, Danilo Krummrich <dakr@kernel.org> wrote:
>>>>
>>>> Currently, a Page always owns the underlying struct page.
>>>>
>>>> However, sometimes a struct page may be owned by some other entity, e.=
g.
>>>> a vmalloc allocation.
>>>>
>>>> Hence, introduce BorrowedPage to support such cases, until the Ownable
>>>> solution lands.
>>>
>>> I guess it=E2=80=99s a good idea to expand this part somewhat. Taken as=
 it is,
>>> there is no way to know what =E2=80=9Cthe Ownable solution=E2=80=9D is.
>>
>> What do you suggest?
>>
>> I can link where the type has been proposed by Boqun [1].
>>
>> [1] https://lore.kernel.org/rust-for-linux/ZnCzLIly3DRK2eab@boqun-archli=
nux/
>
> Just this link is fine IMHO. I wasn=E2=80=99t aware of this discussion.
>

As far as I know, "[PATCH v11 0/4] New trait OwnableRefCounted for
ARef<->Owned conversion." [1] is the latest and greatest.


Best regards,
Andreas Hindborg


[1] https://lore.kernel.org/r/20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me

