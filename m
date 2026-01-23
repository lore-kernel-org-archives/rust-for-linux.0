Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D9F23F424;
	Fri, 23 Jan 2026 18:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192635; cv=none; b=jdjNCAQzJrxQGT/bCBK4Wd27U0qj7rE4LyBtGY82zBJ9CAT0UY2lWEuTT5SNDdym4zJ8H/C8Weu+KDd5dvVgI44ehM4LV/r87BxoerxJCMPBCrFuw1eRxvFnbGq0IzXj5/q10AB/uNEwWKrmQH0n0RGdGW67zeNYIko9OjUI0AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192635; c=relaxed/simple;
	bh=xMknSNPfapOmyGhFdWUQtYjQxvVgwdk57Zk5hXGoEFw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=uxGoHrTXAfNm32ACBnZvPoWmuMKvFbtRt36tIgoqRJkc3K9lGZnfAy2T6crtpBon8YLKq8D8l6PIAoEzCBJckqPVnLL7CZwvN5MTDMsri96u9VM5BC2dx0QSe5uucEztWVU/6G14/ns14ynCldAIx/zVkosxifvhOKBkjYz20LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfgSPXTI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfgSPXTI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE70C4CEF1;
	Fri, 23 Jan 2026 18:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769192634;
	bh=xMknSNPfapOmyGhFdWUQtYjQxvVgwdk57Zk5hXGoEFw=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=MfgSPXTITyA2bOwiNTMe1Ca+STpca5E74oUtGsXYxX2radeKM9ZoCpaEs6Lt1gi/1
	 pBmuTM/t9f4E9S7Nnv7t1VkDDEQiYLt3StJkWm3q+C7xdlvZc1DZq13BbztpQfOpF4
	 FrvY0WWr+RZ8bOrrS90HUPpoBdut7iXsdmKnJcQFPkrcYhaNsSueJ+Xg0V90iqlbIj
	 annLjOmM9q0/kuIp9ORMpMueA3tTkz0b8JBBe5PcGx73blU62MSO8R9dHyToISxRJV
	 Wn2bp0K8LIroOrOSd7mvUKje2NpydRpXpsJERUneCf2iPdMzwsLsIynqEesUIEm3/b
	 h0aAkrnZX8pUg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 19:23:51 +0100
Message-Id: <DFW6G2MYK9KG.212G8OSA6YCQK@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust/drm: Fix Registration::{new,new_foreign_owned}()
 docs
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Alice Ryhl" <aliceryhl@google.com>,
 "David Airlie" <airlied@gmail.com>
References: <20260122221037.3462081-1-lyude@redhat.com>
In-Reply-To: <20260122221037.3462081-1-lyude@redhat.com>

On Thu Jan 22, 2026 at 11:10 PM CET, Lyude Paul wrote:
> Looks like we've actually had a malformed rustdoc reference in the rustdo=
cs
> for Registration::new_foreign_owned() for a while that, when fixed, still
> couldn't resolve properly because it refers to a private item.
>
> This is probably leftover from when Registration::new() was public, so dr=
op
> the documentation from that function and fixup the documentation for
> Registration::new_foreign_owned().
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

I'd add a Fixes: tag for this, since it's user facing documentation.

Acked-by: Danilo Krummrich <dakr@kernel.org>
