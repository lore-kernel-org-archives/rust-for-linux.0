Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179550;
	b=LukIF7eFvom3EESzyX9gbIrZczoUZKsNSuRf6XoOG9o/ydMWjDLYXe6N44ETyvELLsh5
	 A4ossX6yhR35nqU93Amj/I0ztnVN5EQj6JJMJ0pT4TXrUjKcyHREnqij0geZ4x1a1rbhQ
	 Hr21rJD4Bf/lqjuLFhxg2dVT+pH3+MMPnHcTMrXjx6j/HmBKfDHzVTvgXRAkbKFvHyj02
	 +Vj1PoUnTTUPBprrre1CFbUzYKLpI36R4xUOtH3WoyQ+UYKckbSieVGkcRLNa4sz3S4dq
	 i6JQMDEvjXKfTlS6SwteqwzCwrM7E1Vdw30dQmw1RzzIrDi6HXMswDuJU/UuBS6yt4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179550;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YMO9m5Uz9betsP7lTdUimYmX1l9F/muHlqW8BtH9R6A=;
	b=vLKweRervXiuRBHFLjCfsT4QCx0BZHwRIT5OdCOZqGqmfw+7HLqziolnrcr+QWOzKMdO
	 tmvLuylqwx2VrhkCB4fuCAOOFulH+E8TTabhYxomVN67dVZoERVg4b//HdqSfkMp7vrT0
	 YT86y6AvI8jKudkU/GtFWPY/RNVa3uxZp+N3p3/V/GjwaZx+YhCdpoMK+tRpoFoc7iV1U
	 ttO2KajPLU+bZLN+tRbdIb0/3g3R8JOIVJ0vk7s+2YqPYkXBEOxPrjlhj3ANP9hxclzQ5
	 mtX+F/bvVMo6+yb7HV8JIDLx/pAJdHupY+UmSF9mekx7d0saIr47G9LdTZJjcoAzZfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=les-mercier.fr;
	spf=pass smtp.mailfrom=les-mercier.fr;
	dkim=pass header.d=les-mercier.fr header.i=@les-mercier.fr header.a=rsa-sha256 header.s=protonmail2 header.b=kvlMe344;
	arc=none smtp.remote-ip=109.224.244.106
Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39D4606A32A
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 12:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C39D4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=les-mercier.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=les-mercier.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=les-mercier.fr header.i=@les-mercier.fr header.a=rsa-sha256 header.s=protonmail2 header.b=kvlMe344
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=les-mercier.fr;
	s=protonmail2; t=1795179545; x=1795438745;
	bh=YMO9m5Uz9betsP7lTdUimYmX1l9F/muHlqW8BtH9R6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kvlMe344uGRdVM4aipkxm7CIWdb+89iV35wQX0N39wCp5Fn2NDbcZsRdmmHbWhEUV
	 JEvDPMmfDwJc/ADxsWMaJVClicJLu1qCNvKOI3L9yx61KLk3fIBFt+MR+PpiraVsTt
	 en/h45S3FLbNWDjuv9KvpXLnqMlBquf23+9DHMOZyJ/u908bre3wU5Dxqv09s2FN8l
	 Iaz2yStzc80OODkyoPBp9GAzljDUExQciadIzKw1983MUhjfn8eqGevmIewYkZ/2Su
	 X0ucBUi/ep6iryl2cUZYp/p2Lv1CIktfV833Jzjk1fX6Pz29do0yMygVMHvINxISVo
	 OY2ZvZpvqsvoQ==
X-Pm-Submission-Id: 4jWFlW3xC2z2ScQJ
From: Jules Mercier <jules@les-mercier.fr>
To: Peder Bergan <peder.bergan@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>,
	Carlos Llamas <cmllamas@google.com>
Subject: Re: [PATCH] rust: bindgen: Preserve sched_statistics alignment
Date: Fri, 20 Nov 2026 13:57:06 +0100
Message-ID: <20261120125706.7526-1-jules@les-mercier.fr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119-fix-schedstats-bindgen-layout-v1-1-0599dd230ffd@gmail.com>
References: <20261119-fix-schedstats-bindgen-layout-v1-1-0599dd230ffd@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 19, 2026 at 08:33:07PM +0100, Peder Bergan wrote:
> With CONFIG_SCHEDSTATS disabled, struct sched_statistics is empty but
> still cache-line aligned. Bindgen emits the empty definition without
> that alignment. On affected builds this misplaces fields following
> stats in the generated task_struct. In the reported arm64 build, Rust
> Binder reads the wrong pointer via CurrentTask::mm() and rejects mmap()
> with -EINVAL.
>
> Make sched_statistics opaque so bindgen uses the C size and alignment.
> Rust has no callers that access the fields of this type.

Tested on a OnePlus 6T (sdm845, arm64), kernel based on next-20261102,
LLVM=1, bindgen 0.73.2, with CONFIG_SCHEDSTATS=n.

Without this patch, mmap() of the binder devices fails with -EINVAL as
described in the issue, and Waydroid cannot start. With it, binder
works and Waydroid boots.

Tested-by: Jules Mercier <jules@les-mercier.fr>

Thanks!
