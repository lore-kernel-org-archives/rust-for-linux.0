Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAAC47D937
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 09:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768988679; cv=none; b=ZJxs+JDSWCSQm+xD/+X0av+DBgLcekhqmzhG/gUOk7gBJlDWuhqYD99Nrsz8pgK2zlAPz7XaArjU0tPuTWRkLKihZJxTg2voVaTi5LDYcwGBdxS5gj76q4q8/a2HB0MBcd3ske6SiDHMdbfsmtHJqlgCARrn1VWxPTiOw+kmSb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768988679; c=relaxed/simple;
	bh=GX7QwWNWhd00agjukYBB0bTu/e+hRKcTScMs6ZUP1q0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SCJkJjbnVpKHWGHyvm9V9vW+FHieGCjQZ+0J7+bNiGGCVZKNweg+9buee57kCblRfRoaIkTDnt8iLY0Fa98HAY/hE2tgLu9ChpPvI0lM8kocDW92Of2yUgXedWxEXd7fquHphR2aeXhVTlcyt5L2kmY8fmmpiyLWQR1bCyxi10A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgExzfuD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgExzfuD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DFFC116D0;
	Wed, 21 Jan 2026 09:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768988679;
	bh=GX7QwWNWhd00agjukYBB0bTu/e+hRKcTScMs6ZUP1q0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GgExzfuDhsuv2vPsY6q1lTttCvOqP+LOC+WwGmkzCudAHo7hq4UHd5BbvOoS8QWPa
	 tKuE1DAT47B2m/F7pIf+qaDAHeWndj8UWmFLKsNxBlNLHCkN/L2+D+mHGAJ7h2zVhH
	 mYlQRoFlApeBN3OIGUDOI/2A2kI8LM8eQCZ+JaIr1aldkhm+IJFdu1rvPpuRQl2mYa
	 LVWyHuK4qFPUu23+MEPDQn7xeoj3hW0SSmqA6AYFe7+a5HG7LVTItelKXkhH23Kptz
	 Fh/TC3D8Mk77QCEOLaGJsa4rpF09CxaWnBU4p+r+M0Kr6sY9bFUepdONmHpd15X3DV
	 iy+8WBQDRXmpA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org
Cc: aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] rust: time: Add Delta range constants for time units
In-Reply-To: <20260119233621.3465304-1-fujita.tomonori@gmail.com>
References: <YKKZvIw7SzSYCjReL0UwEf0b7rYym_kxevkBbNio-15j9ulsqgJRV_U_q7UIA5lQpwCBnDk2T_NUVMg6LqW4tA==@protonmail.internalid>
 <20260119233621.3465304-1-fujita.tomonori@gmail.com>
Date: Wed, 21 Jan 2026 10:44:27 +0100
Message-ID: <87pl73ti4k.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> Add MIN_*/MAX_* constants for Delta::from_micros(), from_millis(), and
> from_secs() constructors, and update their documentation to reference
> these constants instead of integer literals.
>
> This improves documentation readability and makes the valid ranges
> reusable.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



