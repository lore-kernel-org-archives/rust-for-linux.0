Received: from outbound.mr.icloud.com (p-west2-cluster4-host3-snip4-5.eps.apple.com [57.103.69.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1795282F2C
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 22:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783464566; cv=none; b=UsTnolBGwWwyicDldevLgUJiQ7Q4hMsBZiG19pFMhr8T0Ey8WX5AXvQCkSFJ/2bK47uvZYCesE3ViFPmI1xyFHGW4xC+j1+0xdVt9G38Gb6+Id919p4Mhg0MvpYAIggpXLOjHaWj+bYQuMP+ugfqr2Sa/Qa96MXDxr5vM6IohVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783464566; c=relaxed/simple;
	bh=pJswPxQK4GoFtanf6LQF40HIE/Rn1sF205aBTjTyvkg=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=K/QjsRCIeDSWlrAxxVseDCAKp/CMJIzi6/HK9a5+hPG2ift2crGm1frSRElqNEjMhFPH/lmO7vdyzCeZ3GC5qNJSMx5SadH04R2eITMYyxw0aq3WynPk5ffBj7sgQpBBXC2CITQO/hVrNzGdSb63yUxBwfkXcWzI1pYYNMa/iRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=aiNdaczR; arc=none smtp.client-ip=57.103.69.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="aiNdaczR"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPS id 54FDB18013C7;
	Tue, 07 Jul 2026 22:49:20 +0000 (UTC)
X-ICL-RepId: 019f3ec5-865d-76fc-aa13-3c13fb832ab6
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhNAEMFXwBeC0oCQwZfBlBcHA4ZWAZdMFgUWgxEAlwXFxZWGRcNVk1YFFoMRAJcFxcWVhkXGVFNCE8TBVIHXU1WDUcPWB5cFBcVQUNeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVSAV4KQRlXHx0DUh8SHVAcDlEFWwBGCU8DVRlbBUQBTQpDD10FRwBOC1oBWAJHAEgCWgVZHBZMEloZVitQFVxGExlOG1dNWg1AGVgGbRRWFVIEWQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1783464564; x=1786056564; bh=CojGPE+pWz5DeeFKd0Z8T55EL4EDpPCo362pHe/6qjc=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=aiNdaczRMo2yIFvEHohMEnHdMqvl4wE9TDJpD1kkm9fmHgAgUvALNystK8S6Row3pmF8igqZjM6XTLED8183+pMyQNEU1m89743phR9gfWrysLfqNK3S3ZWoaRJ6yMbooe7aPqndV7cXQzDnW8+1eoiER6O65KALZryfK668bkwq4E/r0vNbRJM2e8uZb/2koiyHWaRo2XTnZmz+Kbb2fyyYROIgsqjY0W3sGS+nJ8H+eD8w5YGd1c7I3wwBA4rlGTvaJHpvSk0MbQ7pg8ApMph08r/WFRVT2G/sM0crvKEzrtlB3oFl7xQCys9Y+4bzV6x2wZUfrjBe2moyBznEng==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPSA id 420B61800125;
	Tue, 07 Jul 2026 22:49:17 +0000 (UTC)
Date: Wed, 08 Jul 2026 07:48:59 +0900 (JST)
Message-Id: <20260708.074859.867796876307901722.fujita@bee>
To: gregkh@linuxfoundation.org
Cc: dakr@kernel.org, tomo@aliasing.net, ojeda@kernel.org,
 a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
 bjorn3_gh@protonmail.com, boqun@kernel.org, daniel.almeida@collabora.com,
 gary@garyguo.net, lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] rust: bug: Add bug_on macro
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <2026070746-roulette-catfish-57d6@gregkh>
References: <20260707143026.2774023-1-tomo@aliasing.net>
	<DJSF9IBYP207.2UQXDE9IVSRUF@kernel.org>
	<2026070746-roulette-catfish-57d6@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyNCBTYWx0ZWRfXy+komLkWodvS
 mZcYRnFf9jZ0GzmDRrbCdFGheIQ+2D2JPE3y6YTMfCCo/rEEmJRFwWRPdcBip+OJLy3zKSik6GZ
 cpS6553jEH5bxFhyF3/hO4QmThKk04nj21WAZ0trmVHw0iL8yyTrzJ7jdRVI4tnSwkJq/HBzaCr
 gP/v/ye4BSIexaJmQlozkePbyqCXBDK9ZqQ6k150UpUsmGiPyQ86bJq97C7gsx0sSX4ipp/Yiba
 +BPaYLgv88jAN2C8lxu1/W0eH0EZ7HvYN4YgUzRpzQ2Q32zwaWWWfKd8wtKOpSEN7HPjh+gzXEl
 imteNgsnQgQ720xyLfL
X-Proofpoint-GUID: ezgPb0GASfyEu9uX6ZgXd1sxHoeBx4ZG
X-Proofpoint-ORIG-GUID: ezgPb0GASfyEu9uX6ZgXd1sxHoeBx4ZG

On Tue, 7 Jul 2026 17:20:10 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Tue, Jul 07, 2026 at 04:51:40PM +0200, Danilo Krummrich wrote:
>> On Tue Jul 7, 2026 at 4:30 PM CEST, FUJITA Tomonori wrote:
>> > Use of this macro is heavily discouraged. Prefer warn_on() macro with
>> > recovery code where feasible. See the documentation for C's BUG_ON()
>> > for guidance on when it is rarely justified.
>> 
>> Given that, can you please spell out the motivation for this patch?
> 
> I agree, this should probably NOT be added unless there is a real user
> for it that requires it and we all agree that crashing the system is the
> only way out.

bindings::BUG() is already in use today, indirectly, from the kernel
crate itself and from drivers such as binder and nova-core, via
panic!()/.exepct().unwrap() on invariants that "can't happen". All of
those funnel through panic() in kernel/lib.rs (#[panic_handler]),
which itself calls BUG().

The motivation for this patch is narrow: replace that bindings::BUG()
call in lib.rs's panic() with bug_on!(), for a somewhat better
trace. It isn't adding a new decision to crash the system -- that
decision is already made at each of the existing panic!()/.expect()
call sites.

Separately, calling bug_on!() directly at a call site, instead of going
through panic!()/.expect(), gives an accurate trace, since the location
is captured at the actual check rather than inside the shared panic
handler.

How about marking the macro #[doc(hidden)], to make it clear it isn't
meant to be called directly by driver authors?
