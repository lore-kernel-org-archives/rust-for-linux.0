Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C32F5038EE;
	Tue, 29 Sep 2026 10:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677305; cv=none; b=o8MJOCVZv6d751G71kQgT6tNvhLaJVg95OhuV1brZXR6Z22EgyIyl2usrbQH6WeIwz1xsRlBUlLvMdYGKC5sLZ1IEdhk4IwB2hnAAlX7zRgBya+zhjADRwlgTZzVWgxpOFHQFX6x8vR3gtPEP25xHDLThBsNq24MrKMvHBrHq6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677305; c=relaxed/simple;
	bh=f3fxMJS66zfUcTaqRFBNJ2iet291cxlBypuaP6GXvqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NpiuDwKG3LE4Tr3Rz+yNvJU5x3hhTFqJV7pV9tg9Oa7gG3ayZiTNaBACuRm4wVjAVeQeWRjCtaW7f9Iq5nC1ZPMhLPNinmNks9su2b1AAqjmi9JcRg2qtIh0wWaMnc+TuucatlaSHMCglelH7H3Q6jxsLe5dbSEVhuNm3nwLYC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2ERrnnB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2ERrnnB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEA31F00898;
	Tue, 29 Sep 2026 10:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790677304;
	bh=d+fzyq/9w+XODYd38fNzwAFfAcoYAA1OwowKdAA/cVE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=l2ERrnnBMrxioJ9zJ6bqc3aFAE9zAZGAewEtTPMtqeEJmQQ5n2kfB7bDyayGxJWGy
	 QvRw0k23X5NgCp2s7FANcG37Cvjy8ROMNxDRgkwlDvcImjwAuYrCmO2Kvi9VUIDJ8j
	 8xlz73E2Cq8iT+JqJMu+ZFUC8riX2mJ1gAX160zCqjDy1uzzcwftKOcrH0GUkS7zSb
	 1Yaj+0si6onHrrKvlptb3obvN/W0uct0HCxLNSlDU1q9X2FHf3Ny7oNpX2eduOT2UX
	 Qe4Cg2Sfbr3hRSdMoDEVDb8OnwGhBBUE1aHynzeSAug2uLHI/N0EjYOsVVl9u0tZmk
	 E33EYkQefX/VA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Breno Leitao <leitao@debian.org>, rust-for-linux@vger.kernel.org, 
 Yilin Chen <1479826151@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <tencent_9FAFC60382D724C608F0F6BFABFC63BB6707@qq.com>
References: <tencent_9FAFC60382D724C608F0F6BFABFC63BB6707@qq.com>
Subject: Re: [PATCH v2] rust: configfs: fix release safety documentation
Message-Id: <179067728847.2045768.15220224494391872700.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:21:28 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Wed, 08 Jul 2026 07:21:06 +0000, Yilin Chen wrote:
> ItemOperationsVTable<Group<Data>, Data>::release() receives a pointer
> to a config_item, not a config_group.
> 
> The old Safety docs described the pointer as a config_group embedded in
> Group<Parent>. Update them to state that the pointer must be the cg_item
> field of a config_group embedded in a valid Group<Data>.
> 
> [...]

Applied, thanks!

[1/1] rust: configfs: fix release safety documentation
      commit: 17ca0bc06bb246d9488556f3f16ad6f37a4fc5ad

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


