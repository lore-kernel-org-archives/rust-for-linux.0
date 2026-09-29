Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A143550AC2D;
	Tue, 29 Sep 2026 10:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677308; cv=none; b=FR+z2FaTADKWe8B9sAZRZgfv7GWNh+C1GGQJsHEeK2s/WvIbrDj/hAk4qagn0a+yTpwx9sQYLrselrOBarc5ZAhX+ov35NJCcmMW2YOgs8mEuaIPErQsHoDHvolpEqVZDVuBK8cYXoK99aOIpPEk1n4jYcOyniHzcuqPvszDaUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677308; c=relaxed/simple;
	bh=7JbExTw5L4r2AA5r6Y8xr4htlFxVLO7G93v0oNYtx1w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UFaMXlhQIr5zmnQCvLUW8dbbegviQDdCISEJwRLSmwOV2b0JcdBxn/dfMlUgnm3V8LrBrGpCymIoAYmx/lKTCpyKOG8waUk2AywJ9RbE8z29+UYxoNm5lq66ZrhO03/WIlFpW0MLUf1E1o5TLhpiSKqJVwAb47e5VJ3tf8fmkCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftg50ybj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftg50ybj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5EB21F000FF;
	Tue, 29 Sep 2026 10:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790677307;
	bh=141oiYIQ9BZ/pdF/2yBMkztSPsrnjW1NpRE0KvPLiDs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ftg50ybj5QZfjh5UEKLH623CCCtSr4E3+Xg8RzkgGsDt9q+QP0ODfV7qsgDi7GMe1
	 1EqxEAzSHsVl7ICFaV0T7ZGNxYodLp0dlI1v97WQanR/zix+Pj7c+mQ+0SP7cmY+nN
	 NtRlayd40F/txZlOo9uJh9PR3BgghR9sbl2qsrfuoPdqrnFTcmBv85Bl+RYafpzmHN
	 lOKMlxETtlQh9I3oSFyHooi09g6lwBXfjlTq5j70V1M60ol36ufcw/+S295TIWJ0/F
	 LVOFAybWReNMCHq/a/saS/2HMNiGK4w6Dt2HPJsclf/yi0in/OXp1n7nFvGuoL8g5J
	 EP+bJNPWSNbIw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Breno Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260608-configfs-fix-offset-v1-1-7f01b8fb9e5f@kernel.org>
References: <20260608-configfs-fix-offset-v1-1-7f01b8fb9e5f@kernel.org>
Subject: Re: [PATCH] rust: configfs: fix data offset calculation for
 subsystem callbacks
Message-Id: <179067728855.2045768.12388758107576476365.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:21:28 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Mon, 08 Jun 2026 14:32:00 +0200, Andreas Hindborg wrote:
> `get_group_data()` chooses between `Group::<Parent>::container_of()` and
> `Subsystem::<Parent>::container_of()` based on whether `this` represents
> the root group of a configfs subsystem. It detects this by checking
> `(*this).cg_subsys.is_null()`, but `link_group()` in `fs/configfs/dir.c`
> unconditionally sets `cg_subsys` for every `config_group` attached anywhere
> in a registered subsystem, including the subsystem's own `su_group`. The
> only `config_group` with a NULL `cg_subsys` is the configfs root, on which
> userspace cannot trigger callbacks. The check is therefore always false at
> runtime, and the `Subsystem` branch is dead. Subsystem-level callbacks
> reach the `Group` branch and may read `data` at the wrong offset.
> 
> [...]

Applied, thanks!

[1/1] rust: configfs: fix data offset calculation for subsystem callbacks
      commit: e84c9b64df615e658e47561b835c1364dc48f0c0

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


