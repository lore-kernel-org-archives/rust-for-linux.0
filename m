Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D735D145FE0;
	Thu, 19 Feb 2026 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771498993; cv=none; b=nZSq2VNsOsSfsrgmLs9IC5olBZTu3mD8M0HqAtb3B7ToRdFWbGv6y0LAH2oiCeXOQWytRyoex+NFsqcnA0apDZbex8mk06rRh8qMDwoMMLgMM2tSaTFwkCRO2yOBWVTz8s1/nHcKqsSsZ1+FVkg1GNVVyTZhP0szbxwo6fykpLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771498993; c=relaxed/simple;
	bh=GW7hYKR+tWg10PQQuw02bKCnAv3jDBU3q18FavQQHPg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dwR4jyZPC95b1UiNp1+lu8LNc5VlUSMoQ+9R1+Hj1mVf6OsaQPffWP+AjdkejTmA1z7adyj6UHPTsaBfxTfkyqwobRnGlnh+MjqGA+1WP6QWDJDNsAAkEMFj7DS/fwc5pdPJhiqiUaKtXECfVFdBnJdBEiTkh95Bi1fpT+s9e6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FAn623vS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FAn623vS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AFAC4CEF7;
	Thu, 19 Feb 2026 11:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771498993;
	bh=GW7hYKR+tWg10PQQuw02bKCnAv3jDBU3q18FavQQHPg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FAn623vS9yB9uR+Vy0bo4opC+kgk0qJ9Rx6ogx+VvX+K4GgMAC7gs26lOhmWGE1XN
	 CE6hKNZjyQP/4N+0UrGlInzvK5vfV809/+9qxILeHtT6Gt/JsaOC9D+HrM1MvDVAVh
	 8wmjlJXLb4GetHQO3sG3w4oeE+YZb73hmYLFBdckqLww5FHeYjY6BpLlenWTamSIEE
	 XFGtPY5aW+HwKMCg3nq7kagwlUQBnkXZe8efn9afX61dryQ0a56Ml9rCDrbu7ItRfk
	 HlH29SM/Kr4d0HCHHQyyIsw6vQ76xT2oa3vdd7RAzpZj+Bm8lBAa97MnndOKgrm/Fr
	 tJyqhEg9Tivxw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, dirk.behme@de.bosch.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, lyude@redhat.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, lossin@kernel.org, sboyd@kernel.org,
 tglx@linutronix.de, tmgross@umich.edu, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] rust: hrtimer: Restrict expires() to safe contexts
In-Reply-To: <20260119.205816.296364426219257330.fujita.tomonori@gmail.com>
References: <20260110115838.3109895-1-fujita.tomonori@gmail.com>
 <d817b1db-7f49-4220-ba82-1c8a750c84f1@de.bosch.com>
 <20260119.205816.296364426219257330.fujita.tomonori@gmail.com>
Date: Thu, 19 Feb 2026 12:02:59 +0100
Message-ID: <87tsvd9esc.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <fujita.tomonori@gmail.com> writes:

<cut>

>
> Andreas, do you like me to send v2?

Yes please, let's get this in for v7.21.


Best regards,
Andreas Hindborg


