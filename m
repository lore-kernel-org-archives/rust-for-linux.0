Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750C12DEA6F
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 23:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767914554; cv=none; b=QNIRPOYYO2VB6DycnznGMBCOQVKT5PNksBU34kLO/2QIzVlQv3qxshvPtoZu2Q3cBpUewLxXAhVoBJchrVdVOAcH/DkvDMpxsj2P/DLgAlfESungIpY8Bsp+6XC8GVq4BBvXrHMjxhCaZbYQeudTgJcHleUwz4htDaV/uCV7qfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767914554; c=relaxed/simple;
	bh=kxeQjR3bGor3yjDqEp6e1fmhAS66TUi25mHlxEF5cDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=AtqLdK+ISLnHUNp18rseQT/X55m0TRLbtXtzU7E+9MHwF7Dm8/fpCkvUfc+j2qdFo/OiAysZa0LLBvlGtK94EZ0rnGdZrYTo0J4HD0+7aP95QuW9vG8aSJ/ZQxi3/oTukDeFb9eE1vFFUzeUyalJNfqKsnoVsaEHcDaUWva4SLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6pNd23w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6pNd23w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F8EC116C6;
	Thu,  8 Jan 2026 23:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767914554;
	bh=kxeQjR3bGor3yjDqEp6e1fmhAS66TUi25mHlxEF5cDY=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=O6pNd23w7l3j/77sIdkXc7l/CsbcmXdqumUGQrMsR7vV7V5fRoRC2WM1lM1G552uX
	 uAU7Atph7xzgCAWroUNMfZAHXMF5AGilQRnn8o7TonDW0y+gStjtrus8fkEGIptv7z
	 bmoof6nk9ryBflQ0XyHLzlv+0+PWrIQ3DHIanJ6yq9VUlKwkA6kJyBG4cI4I95kIK0
	 +JZEnEBgGV2Jzagg4Fz4T21WJN2jtAJHFNTTqaKTND+ZJjI3zJiU9gd9pd/N7ZwN3/
	 9WhfY1Rt3rPXuX5szm38FHi51BtdKhW9kJvIYYucjhNHpsyK/+Nu+G/FgNzJZ68UlF
	 KKkZpjzk0GNyQ==
Message-ID: <e15f1221-c146-4fe1-832b-201979b943ed@kernel.org>
Date: Fri, 9 Jan 2026 00:22:30 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add missing newlines to several
 print strings
To: John Hubbard <jhubbard@nvidia.com>
References: <20260107201647.2490140-1-ttabi@nvidia.com>
 <20260107201647.2490140-2-ttabi@nvidia.com>
 <49a83146-f292-44c3-8ca4-d62cbdc6a438@nvidia.com>
 <7d2b8106-993a-420a-bb4d-1fd8900e360f@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Language: en-US
In-Reply-To: <7d2b8106-993a-420a-bb4d-1fd8900e360f@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/9/26 12:12 AM, John Hubbard wrote:
> Are you comfortable merging these two patches to drm-rust-next? I think
> they are ready to go at this point.

Yes, they are already on my apply list.
