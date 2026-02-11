Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5151A1BBBE5;
	Wed, 11 Feb 2026 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800233; cv=none; b=IfPAsyOh3OcHvucfOaF0TKa3Ml1LLBQIK1cYZEO2zedekFfRb5f9Lsf1S8Q6V5bcuSHd98+RNajm3n+pv1mJznpinPX8InWJNYJsr4KBFvS/mh3JEShpcliR1oeCrAQoBhMGdsOsJIgT5TARSbJeDhmAUVW8t+Q9otcxMSMSTgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800233; c=relaxed/simple;
	bh=Lpr7mHVLPqi7ZhTCmGZjyHCoNOXFZOGegRUnq9MfowI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=SRiq734lyVAxyt6H/cZLQKXHtDj4aQqOJTJ9cCroelfG5Vb85Vqi1BCfdabITjnUDmP3z98piCR21WxW7KwLq9WGGGrusKixocqm2OhRK2PAGWCDuw5AmLNzyt3nM5CE97TCdQE543C33t2H4ZS2QSxFexi+J81+XFWze/uSNP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4dsld15; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4dsld15"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A807C4CEF7;
	Wed, 11 Feb 2026 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770800232;
	bh=Lpr7mHVLPqi7ZhTCmGZjyHCoNOXFZOGegRUnq9MfowI=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=p4dsld15Kfh1+9uBaflQPx0iAhipZZrh2Lq1UmArN3HLuI2N03dRRFJse9Kqw+pli
	 WO5q1rPa0nosfxRrMYIzPHIQ6of7QRNxU1kh5PWF2C/MDVaFRYek2gEbwECeGFn0LY
	 /C2L0oC3is4QYuG8EQCLg08wxVPg62naHlmbpRc16zbTS5iMaQVhm2NCz+8z6IGN0v
	 9IXcNtzxcP4Du1EAq1l5pwpn0uauZzuyBX9w+b/edi31Q++74qHdmnCsTyx8MeoHGq
	 DHPq4vJ2+yci+yYoXnb2KAhgywJ7X1+rHu+CdBIXsodroxxlkpB49Z/YSMKD/wsZES
	 laQ00s+hm2jkA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 09:57:10 +0100
Message-Id: <DGC0AJ9L0ZP1.20IV8O6FT1PTD@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Shivam Kalra" <shivamkalra98@zohomail.in>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 0/4] rust: alloc: add Vec shrinking methods
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
 <0d336a3f-f317-4a70-942a-d87a3faa3a89@gmail.com>
 <aYs5L1aG5S34teKT@google.com> <DGBDHMI9Z4JK.3QHCOS1O8WGLB@kernel.org>
 <CAH5fLghy3_J_in-o=y8yh94+RLn6XihNOTzTiT2kk9DkXBMPVA@mail.gmail.com>
 <DGBKOL8Y6OH8.1X5RHNGCQAMC4@kernel.org>
 <DGBKWSS3PEGY.20YKV5CO7DCKT@kernel.org>
 <CAH5fLgg9sDW+MCK15yVyZ59BzXind+1vRj+PQ2xHQ8Bg7sxLRA@mail.gmail.com>
 <DGBLALCUGY7N.383JKRKNCRDW5@kernel.org>
 <1312bba9-442b-410a-9cb4-fe67879d2dcb@gmail.com>
 <CAH5fLgjwWQSHydyM6AMPiziBQjeO4rcNaOzuNV=CrHxRvYuaVw@mail.gmail.com>
 <af90cbe5-dcfa-46da-83b3-e903134c7f93@zohomail.in>
In-Reply-To: <af90cbe5-dcfa-46da-83b3-e903134c7f93@zohomail.in>

On Wed Feb 11, 2026 at 9:41 AM CET, Shivam Kalra wrote:
> Thanks Alice. I'll go with the standalone helper function approach
> with separate impl blocks for Vec<T, Vmalloc> and Vec<T, KVmalloc>.

If it's only needed for KVmalloc, which apparently is the case, let's just =
add
it for KVVec only.

Also, please make sure to add a TODO comment mentioning why this workaround
exists and what it should be replaced with, i.e. a generic shrink_to() that
calls into A::realloc().
