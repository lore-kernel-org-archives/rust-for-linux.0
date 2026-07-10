Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDC025B0B7
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 02:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783650267; cv=none; b=gMg9lVuiU7J+NWcVpZEdLDaAGViysBV+s3lZI8DfZvl4P24Mz2DSldcoQSRrSBxgfocFYgVRIdU1A2ZtFt2M9sAJ4RtrQ3KrzM+GQ4RdxiuIjiGVZmG/qkGg/8UL4gHbwOm8sBfoAyjmKMztuoMjMkrkKpMLS+pD0HO+hBLrUDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783650267; c=relaxed/simple;
	bh=K5Jmk4MLismimT91XqVIyzZsrXHM0gd702jDILnLGME=;
	h=Subject:References:Content-Type:In-Reply-To:To:Cc:Date:Message-Id:
	 From:Mime-Version; b=Fe3kTeN3PucK5gzD8Dzftc/Uq3K8In2VWcWGCUXvpdrqxpCYL8S8dPq2vQr3BVTlym8QR4ak4Ax4z06Imcf/S+xynEjWriwwGZbHVytMg+dMoH7Oa73V1MLAU+04qrBRpRGdQFHPY4Gq3ROnIDe/epFDLcVmUDQg7D/ABcsPfkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=n9vJCuDN; arc=none smtp.client-ip=209.127.231.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="n9vJCuDN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1783650255;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=K5Jmk4MLismimT91XqVIyzZsrXHM0gd702jDILnLGME=;
 b=n9vJCuDNsNjiae3orJhTtmtXHKAV3OPxYRC61ehp/Jtkw5GZJRbpC3lgukh/Q6AKiSsFYb
 h8RpQUjvZ/63Z9UhkHlsYQdDDF0lSgH/hoGIn8O3POmkvs51Nd5eV0G6vf1bOeoZKiKolq
 i3PVdR9/7eei1uF1Oq3YSg4pfZFNngGpkwEsx0dRCzSsUoE2CGwSdvtibuzAQSOwytoQ6D
 WtnML4VUaJz6doH/HKQ/5sdCroWkTizJiacc0349ahpDKRzxA7gu/q0mAm9Dl+zuH8trUS
 faRvVEWQmFOpiI/remz1ZAg4aUYGn8DABmceikyJj8fO3zILOJA9b7u8zw0Y3A==
Subject: Re: [PATCH 2/4] docs/zh_CN: Update rust/general-information.rst translation
References: <cover.1783480076.git.ben.guo@openatom.club> <9104e9b6a59f06ec514010e61aa240c343bead2a.1783480076.git.ben.guo@openatom.club> <DJT65VLXQ3HI.1D3T4VTAWU4XA@garyguo.net>
X-Lms-Return-Path: <lba+26a5057cd+c3f5ba+vger.kernel.org+ben.guo@openatom.club>
User-Agent: Mozilla Thunderbird
Content-Type: text/plain; charset=UTF-8
Received: from [198.18.0.1] ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Fri, 10 Jul 2026 10:24:11 +0800
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <DJT65VLXQ3HI.1D3T4VTAWU4XA@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Alex Shi" <alexs@kernel.org>, 
	"Yanteng Si" <si.yanteng@linux.dev>, "Dongliang Mu" <dzm91@hust.edu.cn>, 
	"Jonathan Corbet" <corbet@lwn.net>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
Date: Fri, 10 Jul 2026 10:24:06 +0800
Message-Id: <2f9675be-b541-4137-9e71-0f5a6f488408@openatom.club>
Autocrypt: addr=ben.guo@openatom.club; keydata= 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
From: "Ben Guo" <ben.guo@openatom.club>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Ben Guo <ben.guo@openatom.club>

On 7/8/26 7:56 PM, Gary Guo wrote:
> sound should be translated to "=E5=8F=AF=E9=9D=A0".
>=20
> Best,
> Gary
Hi Gary,

Thanks for the review.

I'll update it in v2.

Thanks,
Ben
