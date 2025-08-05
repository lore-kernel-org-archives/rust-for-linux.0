Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE141DB95E
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Aug 2025 17:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754414332; cv=none; b=nUN/oNBJXatQ1ANwfti2JEjlQy2UBympMFiIMRrcJuGpiG6+owzrwVBMIKa+7DzvXrnVt9qowGoOEte+cMEk1OeoGnWj1kNxI7Pou81MWIhWmORk2GRBBPlSdh7boTWuTxXxnRIiASUzO02kuD7wYYx5Ict5xqOIHcYdZ1AM4xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754414332; c=relaxed/simple;
	bh=UDsEmz4GX3dTtadis27vz+GnH2XY2iY3jWk0J0AZHEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Utmk74H7Lxn8FURqNEGNlECgm/rUehNu0OpuFwGNDrDkT60/31w2EHgx4d+oZpKgJwmsdBiswjr6qwT2AgD411WrfGtrpmocgxLCZ7lkE+Dg6QJs2uv6na3Im5EU6vGUtGrqm6W+v26Pg4iWAqqMMYo1QvvP6DPgCUcEE6bm/VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A41cr3r4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A41cr3r4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD677C4CEF0;
	Tue,  5 Aug 2025 17:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754414332;
	bh=UDsEmz4GX3dTtadis27vz+GnH2XY2iY3jWk0J0AZHEA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A41cr3r4439cfpD4IXRLLvP4i+ynIezNrQ2esiTpz+1pc/GSQJEtOBDIZiL0skVwF
	 zi8MKMA25WsjnEiLVyUz4PZHouzi4aaJETOlCt4wFLSSLngY4Bjqad6F+MFc8qLrNs
	 bBvyeElRyIU/OTyNF03Jz5pEgNEULJA0Id1rkstNYWzL8AqIcJtP2feDldsRUcVq+S
	 wNC6sPjnjF8+xuaM+rtgiRE2/mDriVTXi/hDVg8ZHfUk/1ypgnJaaOr45k8ZfIRQwx
	 TbHu0bdF56yugr8xiTVFubMuXmMbhFep9QMPwTMI7ovk9r7c28FfZH+rtSxkoikxC5
	 91sJ/1gNcsKMQ==
Message-ID: <22860836-079a-4ba9-b084-a0f117cc7390@kernel.org>
Date: Tue, 5 Aug 2025 19:18:47 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: page: implement BorrowedPage
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, abdiel.janulgue@gmail.com, acourbot@nvidia.com,
 rust-for-linux@vger.kernel.org
References: <20250804195023.150399-1-dakr@kernel.org>
 <731A34A7-92AD-47EA-A17A-C25FA94A5144@collabora.com>
 <DBUIBXEOODEH.R2NYIGUDBZC7@kernel.org>
 <oJV7Dbb0WIqVDvEQYxKm15gegn1eV8jTjJlyAsIBXAMzvosERx5xNzOnZed0pr6XptgohYU0S9xXqA-wDnw_FA==@protonmail.internalid>
 <B8A7994C-62C0-4BDA-A401-C788444C8934@collabora.com>
 <87sei58zo9.fsf@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <87sei58zo9.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/5/25 7:07 PM, Andreas Hindborg wrote:
> As far as I know, "[PATCH v11 0/4] New trait OwnableRefCounted for
> ARef<->Owned conversion." [1] is the latest and greatest.

Thanks -- I wasn't aware since myself and other relevant maintainers are not
Cc'd.
