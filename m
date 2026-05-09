Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B45238552C
	for <rust-for-linux@vger.kernel.org>; Sat,  9 May 2026 08:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778314124; cv=none; b=bJiBSm8TrAEgA0RxuxxVxRuhwiA7sZnSSFvUKp61v6pXwLCU5a+JPZZCASLbaKYs2eI0X4yXgBLy1Ofvk6qON08HWG7sVKZtsvt5gCZelkYMVAvFcvp6IQxuDh9GUBUtvV8HqtP6X2KOM13duwksNEcCM4pUUGP4IcIlWhbeLV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778314124; c=relaxed/simple;
	bh=BPPhkmuShdMGlpLm8k505f3kdNXR53LF4rwfodaYLvQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O9niViaO6heYOyALovoQDWS7EuJCY04hTdIGbQ53GhIK/8W6nwquXzyXUhikecbWFzRnxwxgNERsbteZvDWCHeURLL+0/TNRJxQbZ6ZPT41Jbdc3TVIvwnAmyb/U+hOJtIP9izbTEZA23teN2zYet7rXG5oT0+SP+8QGdFV45vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lx2+dvod; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lx2+dvod"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7ADEC2BCB2;
	Sat,  9 May 2026 08:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778314123;
	bh=BPPhkmuShdMGlpLm8k505f3kdNXR53LF4rwfodaYLvQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lx2+dvodqavW1WjiJOZn0N4y5Ia80JEaysjy51kl6rmR7tnO6vE0ore4SCSqeXa2w
	 q9QW7VT7++lzWSgqxk1x4V9qXNndgjYZYqcFUqiyV2buYqlaR2gLJYekVvTX2rJmZ5
	 BrjuD3cquEDfR5vyQ76cNJKsNQTdFDRBGkFAgTbb7hFZhUxXX8Jc9MbowFOgC5YC3j
	 HIWfQXV9F4Tj788skiq0Zp9buTORiEXTr7ikry5gdsK26gvsGA9qhVgDfYIK3x1MCu
	 9IKOIpaSBXTTQRu5caGUXxMHhSUmMcvGdbOBlBNFhVyIrFiphCWEGJmBjLTWeMZJ+z
	 24rfXeQPqBqsQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>, boqun@kernel.org,
 fujita.tomonori@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org
Cc: rust-for-linux@vger.kernel.org, Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: Re: [PATCH] rust: time: add debug assertions for out-of-range input
 in fsleep()
In-Reply-To: <20260508173827.1123011-1-ekffu200098@gmail.com>
References: <qBPUAToMpl5CvVd22lUrJOgsVSuqVYKsjEHpbs1UK-VTO-vN8UFOa35fFMsYOHoBuUp9HcP65ljAxmLQMcGS9w==@protonmail.internalid>
 <20260508173827.1123011-1-ekffu200098@gmail.com>
Date: Sat, 09 May 2026 10:08:35 +0200
Message-ID: <87a4u96m4c.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Sang-Heon Jeon" <ekffu200098@gmail.com> writes:

> fsleep() documents out-of-range input as a bug but does not check
> it, unlike udelay(). Add `debug_assert!` calls to catch it in
> debug builds.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
> Hello,
>
> I found this small inconsistency while reading the code. The same
> check was applied to udelay() [1] but does not seem to have been
> extended to fsleep(). Please let me know if I have misunderstood
> anything.
>
> [1] https://lore.kernel.org/all/20251103112958.2961517-2-fujita.tomonori@gmail.com
>
> Best Regards,
> Sang-Heon Jeon

Looks good to me. Could you add the warn_once and remove the todo as
well? And add the warn_once to udelay as well, so both functions have
same shape.

Thanks,
Andreas

