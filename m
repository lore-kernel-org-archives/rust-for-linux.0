Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDC21DE4FB
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 23:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765494122; cv=none; b=ISa1SL3icj/sIsib+36hb2lF+p0TfReglMS0dMKd0Yr3mA/KR9ajaWXnrVpygLVHeePj271Bnu2EDJE5GAlNURvxHN/eOFlWNZnmFStajhJpcov5ojQD/8vom3O3hQxUKULkRObiu3dKIWlTRIWySrIgnpDGBDRHVGDT3pBbD6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765494122; c=relaxed/simple;
	bh=e4z1xzqRYkztWl0S/+6xyF2grf4uDBQhJH7pHolos/U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j6kOxybj7XnyN1Q81PM3SE1SoFri9t3u46ThzkB8aGBB+NEce7iRGQrpvEvzYLJ94/6wPXiLqjuSx+zi4G3wOzULxsn21y9LIyDqzN2raI8JNGucO9H7Ydv3Qq2FqB55u6dFv71+G4Y8ybmILe/4iM2ZiF3S0CbS5FbC0HsIZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAxiSxOJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAxiSxOJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD54C4CEF7;
	Thu, 11 Dec 2025 23:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765494121;
	bh=e4z1xzqRYkztWl0S/+6xyF2grf4uDBQhJH7pHolos/U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UAxiSxOJuYQ6DbVgPnouN6Ng/zcUIJG+vQRiNMDCKfzwm1bkKYgsh9xLKxIJc+LWD
	 sgaak6gVZKCyZzxQDeANJwbAuTmtKc/lsA1TROhOlTzcMh1qNeTtg1MbY9OpiJpAjS
	 +wvOX1APTogrK8VZHyES1OpRyC+Q73C2n/ftd4dnN4fPDmEhT6i7glIIHSfzcPCVdR
	 mEM/uaeicG5XLK75eZGiCE/g15ZlfnRRHOEyAWF49YTkMldFY9pmYfmlWA/eXIt3Je
	 KNnD0fIs4XF3EXcafu6J9Bz+BjLAvkxqd8jR0CyN+GfhJc59eh9eYiI12eW8gCR1ER
	 iu6JiOLO4Mh7Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org
Cc: aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tglx@linutronix.de,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] rust: time: Add missing hrtimer example
In-Reply-To: <20251211213608.1302051-1-fujita.tomonori@gmail.com>
References: <vwF1DgikCzOFxKOUW--87jAok307D0NdFE8P-ptynDYfy5hV8Ucjr-xB2C8zXHzIcT4lPV4vhaL6YhKylxm3SQ==@protonmail.internalid>
 <20251211213608.1302051-1-fujita.tomonori@gmail.com>
Date: Fri, 12 Dec 2025 00:01:52 +0100
Message-ID: <87345gwrkv.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> The impl_has_hr_timer macro docs says that "see module documentation
> for an example" but there wasn't one. This adds an example usage of
> the macro.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Thanks for producing the example.

I have examples for all of hrtimer sitting in my queue. We dropped them
from the original hrtimer series due to missing atomics at the time.
I'll be sure to send them soon.


Best regards,
Andreas Hindborg


