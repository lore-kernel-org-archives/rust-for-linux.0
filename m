Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18315158874;
	Thu, 11 Sep 2025 11:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757590128; cv=none; b=qKoNlWHnTiuFpibtTW4bjOHkd90EFNwwxWDBmPH26fEnrUgx3BBDc1UaOyTP12h0HyF0qO/ufpDYAmiAXTiB/VU7v6LAwNPZG3h7BiHRid976gzR5maZOkjkVkfmatxARHf1jBk6JYQdgcYVN3iNdOUaK30/Nw9N24BYNEQ5EpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757590128; c=relaxed/simple;
	bh=UY6Vyd9BH1p4KqI2qdWiaYaRdhw/Bn6OcYKq1clIIkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XIsDbvE0A1VH8qMhCOn3/KqwLb+nK1HQBab442sqV3hqM8t19yACNJ4HL7lqoKx9+mFTEzvXXDq0oz1a6EmNnNnBzAgM1RG/nkhOCnlXLJJcB9uALYknoR4PoAS3UoP5QgY0iP3dBiyavvL+Ct4Rm4HaGI20tzhTltVFinrImhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKH2rzut; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKH2rzut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EF9C4CEF0;
	Thu, 11 Sep 2025 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757590126;
	bh=UY6Vyd9BH1p4KqI2qdWiaYaRdhw/Bn6OcYKq1clIIkc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aKH2rzut0onVytRDBVM9SWpa/xmSYc7S391EV6F55tCpDuxVRpAZ3b7RdUsglSGA1
	 G0bGIa9oGL7sjOYmpOV8DdsE3tCB8S/FfKGgbYJhIPuP4XhQ/2fvGv2BLa/6vnLQvZ
	 8sBdvacb4B6DwU7u7UXdafICLJVtTEatBtIKaVdpU/Rs6ivX464wp1qfXMtg5DImbq
	 sN6b0YLQcMhgj9ykywlQ5LzLw9taxEVqV/0ar2TWjvjKa0gXE+Lm6nx+LXi5qGFZ+o
	 YAPqlDGiV27tUWWW+osXlQgZ48Hfvg+7KFSP7G1+7fxAfzmKWdn7Ph9CoBN7Kx/laR
	 jbdyzOW78GEqg==
Message-ID: <af4d3fa8-e4f6-41de-bd57-86896b8a2631@kernel.org>
Date: Thu, 11 Sep 2025 13:28:40 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/12] gpu: nova-core: process and prepare more
 firmwares to boot GSP
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/25 1:04 PM, Alexandre Courbot wrote:
> This series makes more progress on the GSP boot process for Ampere GPUs.

With the changes mentioned on the individual patches, the series is:

Acked-by: Danilo Krummrich <dakr@kernel.org>
