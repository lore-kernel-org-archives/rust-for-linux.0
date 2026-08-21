Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0350C35E1B8;
	Fri, 21 Aug 2026 17:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787331676; cv=none; b=lUmEEd+OXAsrSrwqCR5hccgqbYFqus9PcqeBWN9HKuZrYD5avt+u4uFG/14DT+OWQpmgrdBioaf3/lJxiubzJ2G9SEHHQZEMOi0K+AlYjgD7EQUx4EYEbJBK3dwVwgPQ0yvB92WnQFv0p80xm6eUNljTpJn+IO95MqYo0LGycgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787331676; c=relaxed/simple;
	bh=MOuZQE0b3k67jh8IFAGpgYdjTH5jTDtXmiUcWGfKd3Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=PpixgFxkEwublAymZJZdlcuLLBURwL8WrBpZfQE174QpcQVKm3K/NOXatdgwDI+Oha3e8K4XwDKjQKK6km099uS6tZQX2PFNTrWtOF9Yvw/1zolXmhiJzcF+9DyUCUJf9i/zUKHpLMt/3fGGRnBcd1EfLPDU7I1B/7hYIV+iiNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VY7+3yus; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VY7+3yus"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1615C1F000E9;
	Fri, 21 Aug 2026 17:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787331674;
	bh=MOuZQE0b3k67jh8IFAGpgYdjTH5jTDtXmiUcWGfKd3Y=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=VY7+3yusO6O23frGFmZF31V+soeqnRDUfz+xGV2oHkj8ttryclH6wUKYELX96aTd/
	 VgovXOASkUkCJ1yVAtwXGeQDwsVAEnUa1ENsqAcjAJlTl44ZHLblxIeZBbJOmviHSH
	 mXTaccKoU8oDhHPOCLaE3zHVKpNntOa3u/KNELEZ3WQmQJ5wyV5oFBMRCRt/uaGVN9
	 VnIj39Ui9YuGvn6/aEfkdPDoKoSE4uxcIQCOdzzdVVmxNnBT4iCc7XyZA/BqtGKFS2
	 8YtJ22G5OEk6I6bNE+FLwgpTO4N94Q+cwWv4vGCDEetAFtz1R6iKAR+CPwu0saffHw
	 an0e+6YRYy4zQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Aug 2026 19:01:10 +0200
Message-Id: <DKUS768JV9RM.36WFW7QI27WKK@kernel.org>
Subject: Re: [PATCH v6 2/3] drm/tyr: add GPU reset infrastructure
Cc: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <aliceryhl@google.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260819-tyr-reset-impl-v6-0-7b4e1e041fe5@onurozkan.dev>
 <20260819-tyr-reset-impl-v6-2-7b4e1e041fe5@onurozkan.dev>
 <653D47F5-0AF3-44B5-9896-F0AA81F67B61@collabora.com>
 <20260821155814.980146-1-work@onurozkan.dev>
 <2AD43D0D-2B01-47E3-AACB-32032B3358C9@collabora.com>
In-Reply-To: <2AD43D0D-2B01-47E3-AACB-32032B3358C9@collabora.com>

On Fri Aug 21, 2026 at 6:39 PM CEST, Daniel Almeida wrote:
> My point is that resetting the GPU should not be a =E2=80=9Cdebug=E2=80=
=9D trace, but rather
> something that should hit dmesg unconditionally. Of all things that are
> printed on a driver, a =E2=80=9Chey the GPU is being reset because someth=
ing crashed=E2=80=9D
> is something that should always show up IMHO.

Please see my reply in [1]. If something crashed, please feel free to add a
dev_warn() or dev_err() print about the exact error condition. But please d=
o not
add dev_info() prints about things that were successful and just bloat dmes=
g.

In this specific case you want the caller of ResetHandle::schedule() to pri=
nt
about *why* the reset work was scheduled. You also already have a dev_err()
print when the GPU reset failed. So, at this point you're good already.

Additional prints about when exactly the reset work starts and when it comp=
letes
is stuff for dev_dbg().

[1] https://lore.kernel.org/all/DKUR5TGKTJT1.3VR0LSG4WWXJJ@kernel.org/
