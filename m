Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591683F54AA;
	Fri, 27 Mar 2026 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774622095; cv=none; b=PPUBD7NGKQLz4Rk8G+mVmgYYqzrqEpKzXzlxVJZx5sLweqtMtAGNhx0gJh74i/Cj0nhGTVVjwRsHdtwyrgJm3JFyTAegTvR8PIKvcmFzZ4jPAwS8NNyDwXBaDteHNw30BBj6X2J3/YZ8/2iFzw2flV34To2uI3NKdeu5pk+BSE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774622095; c=relaxed/simple;
	bh=Ce96GfDOQsjJUCQAUI77BhtrJ8Li4r/c4uvTh58WqRY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=q1c/4lOolSPkOWoUFpOCDv4SPQJ2/33fTSwMB6/O9bypvLD+JQKW+52pdyYY+EwUUl38IC/IPnyWqsWH8kDvegRL7pAgXhu/Y5A15JkOgy+6xNLK1XGKitG27p6VGL7qBz1+k7IRjBaTYrhGi/l14jZxtupcXY9UoWI7Wb/20PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GUT97jOF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUT97jOF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B3CC2BC87;
	Fri, 27 Mar 2026 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774622094;
	bh=Ce96GfDOQsjJUCQAUI77BhtrJ8Li4r/c4uvTh58WqRY=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=GUT97jOFlL56so1d/nHnA7Z9XNHf3bn1OytkX8n3T1nvZaTXTkQzLslpngPU8H+Wq
	 WQ/oISBEJIpYSZJ6vNXsiWEP7UocNh2jsb6NliHTR5EyKw6/eoRIFwsycp0wkuee9P
	 JRyVJkFcnwIkPbLmL0cP6OwJ4rQnbRcWRUadX7ZWZvtfFTmwK6VdHKsDE2jtbzjvT2
	 cg0g15RrmhPTF0pbxU/3OM9K4tOVaW+nw9hwkNrz7tQ/J8rA+OYdMPa/6MllXdJNi8
	 weauDpZpfVEdECws70fB64IyMg+VKX0E5TgMlu2fF0LP8V50ilJ12rUeLXUba6FWVp
	 2ByQ6RC/HOQhA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 15:34:50 +0100
Message-Id: <DHDN11ONK8AZ.345YPD8NDW5NL@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Alistair Popple" <apopple@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3] gpu: nova-core: gsp: fix undefined behavior in
 command queue code
References: <20260326-cmdq-ub-fix-v3-1-96af2148ca5c@nvidia.com>
In-Reply-To: <20260326-cmdq-ub-fix-v3-1-96af2148ca5c@nvidia.com>

On Thu Mar 26, 2026 at 6:43 AM CET, Alexandre Courbot wrote:
> +        // - Since `data` was created from a valid pointer, both `tail_s=
lice` and `wrap_slice` are
> +        //   pointers to valid arrays.
> +        // - The area starting at `tx` and ending at `rx - 2` modulo `MS=
GQ_NUM_PAGES`,
> +        //   inclusive, belongs to the driver for writing and is not acc=
essed concurrently by
> +        //   the GSP.
> +        // - The caller holds a reference to `self` for as long as the r=
eturned slices are live,
> +        //   meaning the CPU write pointer cannot be advanced and thus t=
hat the returned area
> +        //   remains exclusive to the CPU for the duration of the slices=
.
> +        (unsafe { &mut *tail_slice }, unsafe { &mut *wrap_slice })

I think this does miss the justification for tail_slice and wrap_slice to n=
ot
overlap, i.e. don't we need something like:

	- `tail_slice` and `wrap_slice` point to non-overlapping sub-ranges of `da=
ta` in all
	  branches (in the `rx <=3D tx` case, `wrap_slice` ends at `rx - 1` which =
is strictly less
	  than `tx` where `tail_slice` starts; in the other cases one of the slice=
s is empty),
	  so creating two `&mut` references from them does not violate aliasing ru=
les.

With this considered,

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
