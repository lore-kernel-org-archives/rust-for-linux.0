Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2320F2DA749;
	Thu, 30 Apr 2026 15:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777562551; cv=none; b=eHFTimYZEJ+9Q7QmVmHE2eKCt6ufOWJ33ZiWNtM3I+GbJepLm50dPhbOjPybxCl7FkMTW9cFQX2urk4ntXJuhXpbM5gA4qat4VOqp97peqFbn1wk1nx4KuaWN4RPoCugoejIacTToC359c2pNQW3k51QdG2vQuL5dPpatA28Ppo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777562551; c=relaxed/simple;
	bh=7OR9Aj2MjzbGYmPLJPBBskhrfWzRXDzzOcdpttRG7U4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u+MquK/voOH+MUe+gqyLGecwenxUKdhG6Go33NeTQi9C0V4jSCCLlLVK/8sbcvIprGs1xEBkAaZhh+yNlUJqIxXnJnAA6QEdVeDwYwe2V70MN4AQIaVJCsKsjhEf864nCIQMnO6g6zsiXPUYtQkpE14/2qcCkAme0bwgrbIVouA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNYPlwcz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNYPlwcz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9AEC2BCB3;
	Thu, 30 Apr 2026 15:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777562551;
	bh=7OR9Aj2MjzbGYmPLJPBBskhrfWzRXDzzOcdpttRG7U4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mNYPlwczVgyLLTsSqIom5SWRUhJilo3cp+B3WppC8tc5vde7+b+3JxfynTaQJXitD
	 CELki1hDS7aiBEa0EIJOrrGdH5cnpkOTMxIx4hOJK4Oa9n4prE6H/pPTYkx7LtdCFk
	 XhHJ79STZC67KMczGycbaC7Ym4F6Wqkmqh4lfDENIMu/Q5ioSUldDJnCma3+ZgFZjf
	 kSTuY2q9E1CfieEGxsfJXEogoU4G+AymCib7PGXz4Uv7sYeynnRdz9LevANjLhi4o8
	 V991Hu8N7zajfHdTebEcJvd4a/DNfnSnrQ+pXFBceJHHMzxTO6bdI6nzOKSC8NKMgX
	 WUJ30POulqFsQ==
Message-ID: <4060e63f-010f-403d-af18-5d6c94763745@kernel.org>
Date: Thu, 30 Apr 2026 17:22:25 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] rust: add warn_on_err macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Boqun Feng <boqun@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260422-nova-unload-v3-0-1d2c81bd3ced@nvidia.com>
 <20260422-nova-unload-v3-1-1d2c81bd3ced@nvidia.com>
 <CANiq72=7u5O_58b6cnCwGz=j0D1tmf5+9Ntv1mkJZpACWXQpFw@mail.gmail.com>
 <DI6L3WUV1AX9.20T2183TYVJQR@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DI6L3WUV1AX9.20T2183TYVJQR@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/30/26 5:11 PM, Alexandre Courbot wrote:
> Thanks - I will send a separate patch for this shortly, and take it
> alongside the Nova unload series if it can be reviewed quickly.
Do we still need this? It goes away with the lifetime series.
