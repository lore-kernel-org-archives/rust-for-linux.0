Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC85200110;
	Thu, 19 Feb 2026 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771516078; cv=none; b=tVfDLVbtneberdBYvh2RNT7xgpy9WEDamxaNAQTatAXXo3ZjobS7GY5SRd5t5bE8Jq7OgF5jCqoWJ5xHwy3Xg7Zh6dFfCAnqpyAoxoacC5sftAN44cBEHU/78IHKfAisZI/gdt1sR0t/0lIW8SUxD2m+YpiPAtLjHrR7tNyHPKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771516078; c=relaxed/simple;
	bh=7RwA9QqM0kXMB/JyxEPhSZSoOaDGQNZG9jNSu9cU8EU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FBqAQNAQQfWCX1MLMb9zXYUb8G4eOmGec5rB8HgpmpovupsuXnadfdmvCcE+/95PSgm5w5/ARR0a9mWapWNhLzT0oEyuhisXDF0NS/eL04M9aZb9LXryCv76RH51XX/2dChcJsGHIPy4GKgFClPwgrlCdpaCTYTFSjEgf9APObE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2E5lQYA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2E5lQYA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E200C4CEF7;
	Thu, 19 Feb 2026 15:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771516077;
	bh=7RwA9QqM0kXMB/JyxEPhSZSoOaDGQNZG9jNSu9cU8EU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=B2E5lQYAeBrDbDyWiAZwX+V8VhyqtaGGl1BJtE59IMl5eU8YdW5SA4Cf9kNGOlbTr
	 zNnDVJAvDK6BSpcP61uls56iRkr8OSlsuYvRtOhkTwCfiwYtLNMImUK5EhiXe42y53
	 p1XNsNAYJ0o1cAgk9Io/JQOv0mfoe3FSD1hyeSBuOvlnjhsAv6sH2J7PWmTND43xOo
	 Oj63xGA61gMCjn2e4ZQ1rCBqHVCZsgMWUXP4Jif+O/RamL284dZ7UeMr/PLugT/YiT
	 hJ/98E0uhDkG86T7sObbJ0tMMGq9r29mL1IizdTX2vU0y7MubB0+o5ssqShiMESpVz
	 DHGqaiDW9GG6Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 16:47:53 +0100
Message-Id: <DGJ21D77TM34.1NRBHWK37PN15@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: irq: move 'static bounds to traits
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20260219-irq-static-on-trait-v1-1-6ede6b743ea3@google.com>
In-Reply-To: <20260219-irq-static-on-trait-v1-1-6ede6b743ea3@google.com>

On Thu Feb 19, 2026 at 10:12 AM CET, Alice Ryhl wrote:
> The 'static bound is required by all irq handlers, so it is simpler to
> specify it on the trait declaration instead of repeating it every time
> the trait is used as a where clause. Note that we already list Sync on
> the trait bound for the same reason.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
> Follow up to:
> https://lore.kernel.org/all/20260214092740.3201946-1-lossin@kernel.org/
> ---
>  rust/kernel/irq/request.rs | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
