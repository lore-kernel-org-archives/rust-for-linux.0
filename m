Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A59330650;
	Fri, 27 Mar 2026 10:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774608395; cv=none; b=A0UMOIY+Lw08BldgflZjydZo+MFJ9co9csA0kb4v/B+KQ2sQU8i7qe6z7Y3cf5yO6/hqci2O6Z460/lP1vEi8yHdqLIxAOnR2x6fjFaAX9TrnqW/Ex3qG1Ljwx/HhDLZj1B/4Xtt8CIvzs2jIRW93f2o56Wpchr3RkuiNjadXs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774608395; c=relaxed/simple;
	bh=mP2ZJNoXx5Lv5rzLG94FftAHgS5FWjxn933KdaYN6bo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BiyOr71Jk7nOl78PqQOHvCYJ3JspX3a5MhSDvf1ljVChF58DDCKTb12wsd9i1z5/LmJxWUwyeZ68L21F/DpGeni10iqnLStPG0vcbIbx25NBNgNQYRjc841PibUT/B1TW9/6t7GgNNntHLAePClxtgNByMzOh6aXYfjs3Whlx1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FM/gy1x/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FM/gy1x/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F45C19423;
	Fri, 27 Mar 2026 10:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774608395;
	bh=mP2ZJNoXx5Lv5rzLG94FftAHgS5FWjxn933KdaYN6bo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FM/gy1x/NNIla3cl97Y3RF1GXA7YhpzW166Yfji94BeSCFonHQ1k3r3AWgxTyczAk
	 LVt0HuppLHPtvhsyAfc/Qzw+xztWvJXgX6JJpeBnqc65lNmf7NtDAwD2jOPUsyU3vx
	 BKosycjW3N01RmVB2nFH3RGEhEYTqOTVmh5nyD9zcc5/WrKOWjYyKJhkYZqvdNUdDB
	 WHuGnmT5OnOKs0Zbwhil/aHWfvOqZNHjwXydPh/bT2xz4+hKTlZx4Vs35E2NEkAmfB
	 rhOtdqHPOuZ0s7F3rBZ+/DFBNSMMbE55joriHGjy61Lqt4PvtutTnLpqHryC78HiWj
	 VMHVRUMUGaU1Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: alistair23@gmail.com, dakr@kernel.org, ljs@kernel.org,
 vbabka@kernel.org, Liam.Howlett@oracle.com, urezki@gmail.com,
 ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev,
 acourbot@nvidia.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v3] rust: Mark all from() for Error functions inline
In-Reply-To: <20260326020406.1438210-1-alistair.francis@wdc.com>
References: <ilw-PmZ_frpKGzxDl2d6k2AvhdzHduYMq6lgUO7hi8Ubiz5g6-tN_pqPY9sc4CKxWuUEBqT5Ke08UZRePE6YbQ==@protonmail.internalid>
 <20260326020406.1438210-1-alistair.francis@wdc.com>
Date: Fri, 27 Mar 2026 11:46:24 +0100
Message-ID: <871ph5y2gv.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

<alistair23@gmail.com> writes:

> From: Alistair Francis <alistair.francis@wdc.com>
>
> Mark all of the existing
>
> impl From<...> for Error {
>     fn from(err: ...) -> Self {
>         ...
>     }
> }
>
> functions as `#[inline]`
>
> There was a recent request [1] to inline the simple from() Error
> functions to avoid the function call overhead.
>
> This patch inlines all of the functions (except for the pin-initi and
> syn) and converts one existing `inline(always)` to `inline` to match
> the styles.
>
> Link: https://lore.kernel.org/all/CAH5fLggOnVguVErjySphX__vs3iYAo4O+J6hrXW546JrWSq5ZA@mail.gmail.com/ [1]
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



