Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D592327202;
	Mon, 22 Dec 2025 06:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766384900; cv=none; b=GJ+jBbdVhghc7gAosWzU9Bp+W+Dy6jOE/p7ocUanTtIOqP1Nu+XcWZtY5EbBeRPuugiQqrekRfqximR3MQvCgRvg9NbQ9BYL9Kdgmwe356YkGn4qr1t24gV+WsNYKz+aacGVdXjMOxBnq8n597XUHF4+bGGWfRphLqVlZW0tV3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766384900; c=relaxed/simple;
	bh=qTE6iTdUnxWBm0oirVqOQb0G6arcg5L6d26+IiMynRU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ZnvhPJ0iDtXYEVr4eGyDZ6OHa7lIWkdGj8gD7ETsGFbQ4ZlronbvH9dy133usZFtFvks1OPnimrSDtcSfXSLG+nwff/9xaOxqwdU7Hc/zogDs6NweX1zWqRogbU7AF936LCSnu8oFSVvvkg6Nlx5KvZYy3A5OrRj7rX/HQ4jGkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MxKyKLLg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MxKyKLLg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101EAC4CEF1;
	Mon, 22 Dec 2025 06:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766384899;
	bh=qTE6iTdUnxWBm0oirVqOQb0G6arcg5L6d26+IiMynRU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=MxKyKLLg/Rma1EKW2U2ILI7sVjDd9mJryGZ2SHQIG1FS8opOcLuakGe5TvjWAlw65
	 VTgRwID3GEBuD5lJQMGAvOlcACzzjqlUSJ+IH4YUHm30Bywb7w3TOkt+Or3EQWXNRf
	 qIJ3t0jXBfUe7XtTQ02OX+bUPXoRbb6cDfmobtpVociIVgZsh8P6nVm2GSLiAltzJv
	 ghQQ2Q2jvIkbwp7TsEKF1by/oNyEWL10W6uEnhGmTh+/3BzYTi1B6nUuDe5xP/+9Og
	 rSMimL8CxoHYJy6ikgbW2shLiAQZ8UTd6U+3cYwTBzd/XhDiG2QLAmW3LpcyWce7/6
	 nrtDJq210+HRA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 07:28:14 +0100
Message-Id: <DF4J6Q6YVQ51.11ERBEYH4SA4G@kernel.org>
Subject: Re: [PATCH v16 13/17] rust: sync: Add a lifetime parameter to
 lock::global::GlobalGuard
From: "Benno Lossin" <lossin@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Waiman Long" <longman@redhat.com>
X-Mailer: aerc 0.21.0
References: <20251215175806.102713-1-lyude@redhat.com>
 <20251215175806.102713-14-lyude@redhat.com>
In-Reply-To: <20251215175806.102713-14-lyude@redhat.com>

On Mon Dec 15, 2025 at 6:58 PM CET, Lyude Paul wrote:
> While a GlobalLock is always going to be static, in the case of locks wit=
h
> explicit backend contexts the GlobalGuard will not be 'static and will
> instead share the lifetime of the context. So, add a lifetime parameter t=
o
> GlobalGuard to allow for this so we can implement GlobalGuard support for
> SpinlockIrq.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
>  rust/kernel/sync/lock/global.rs | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
