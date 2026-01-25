Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377A1823DD;
	Sun, 25 Jan 2026 22:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769381129; cv=none; b=UVlOqaP/0RH71Xh1wZRjfVxPc+RuiGCmDkvfxaNz8KTiufw/J0lk8/S+0Dd8wKktK9pmA7xd97Cb4Yj60clK4xM7J8iYr0TgkV4mkflEfkUHE1mlFXKMUkKtBCOL22007AaXVsVyImuRmMru1PY9EvLCwH6c0o6E0i8A9HM9Rv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769381129; c=relaxed/simple;
	bh=qYUbrEIIL+D2hDKBfUMAblOKu2xh9Z6LVfBozxHiHLE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=g/oc2eJXCYkbHRVDZjxqs9RcSQBPkyKmL6QFtMyjb0bu1ar2hdp25mWCZNs5Z7jHMOEC7fgha3TAyR3oxhOKUcmyBnyjXIRhhRFVBtaf0Vj4YVPvK1mwxccnQy0MImmwJd7tdjuy4vMFjHUfA8AEt+iUtR7epams42P6wcjELx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HeqTXh/U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HeqTXh/U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A1DC4CEF1;
	Sun, 25 Jan 2026 22:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769381128;
	bh=qYUbrEIIL+D2hDKBfUMAblOKu2xh9Z6LVfBozxHiHLE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=HeqTXh/USg4CzCQsOwqefxY3gOV5FYFZGdQ1+6mncIDuJx2QRHa0Qd4TzXh+JKxck
	 9eUIHYxu6q5PdicMe0ZR3Z/TEDRZtqHoU6U5FeLa8vMOibtdZjefd5wV8N4DQocglm
	 aZveLm9TOqmtv9zUClNo3/Z1+TsCzS24Q0BBAk7gYC8UC6xWGOT2b6jIxgkf+D+aSr
	 UPO4Xux+W9gXZpiLdv3jG20e89bw5aFFm/LpREsbfmwuMylubxJvXBSXUFZNWkRWAg
	 Ua+u3/BqOuAv8TVOh9j86A2+5QsPV0b0vY7XgQNaxmvgbnonyYHqmK8PynV1Cd5NBb
	 etdu0RJaKCY1A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Jan 2026 23:45:23 +0100
Message-Id: <DFY19EWAGLES.12E5U93X7ESX9@kernel.org>
Subject: Re: [PATCH] rust: auxiliary: use `pin_init::zeroed()` for  device
 ID
Cc: <gregkh@linuxfoundation.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <david.m.ertman@intel.com>, <ira.weiny@intel.com>,
 <leon@kernel.org>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Atharv Dubey" <atharvd440@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251129124706.26263-1-atharvd440@gmail.com>
In-Reply-To: <20251129124706.26263-1-atharvd440@gmail.com>

On Sat Nov 29, 2025 at 1:47 PM CET, Atharv Dubey wrote:
> Replace the previous `unsafe { core::mem::zeroed() }` initialization
> for `bindings::auxillary_device_id` with `pin_init::zeroed()`. This remov=
es
> the explicit unsafe block and uses the safer pinned zero-initialization
> helper.
>
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>

Applied to driver-core-testing, thanks!
