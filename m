Received: from va-2-29.ptr.blmpb.com (va-2-29.ptr.blmpb.com [209.127.231.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F01351C04
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 16:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775667264; cv=none; b=ihoVKAfKhQU8R239MB9A8fAei+ckNTDAY1zQl/ZM7HurVGWw6jfPsUDwBQMvvomCuUWLKKpHBaYij8EFIddBhAFR3Y/sYUUVIw2QT6+7YL9LA72teMmvdbR60ptfupzrc8sGsqfD1jTCDlJrZYPJDEt8u9OZP+CHVcEVB4nEpGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775667264; c=relaxed/simple;
	bh=SAQeHdYyvmiv7NTxUi68AabsIbobFtO7B06eTOW7J5w=;
	h=Content-Type:Cc:Subject:Date:References:Mime-Version:In-Reply-To:
	 To:From:Message-Id; b=WKqNrozWSiYApO2Q3H+w2Qt+2zF0TrktnwRpSuiAfoj0uHfsrwuOu+FMNZxtAvwhxhHYtHBzHu0b7ZL/FHYQmrNuOCRXKLzvZxYtK+tWBKQQMZRAS+Oe+iBjlbPrb+5o0gl22c2UtHpinjtwR2cg69uxySUYP1zDMSgRRXgx3k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=M7d2+HNB; arc=none smtp.client-ip=209.127.231.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="M7d2+HNB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1775667253;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=SAQeHdYyvmiv7NTxUi68AabsIbobFtO7B06eTOW7J5w=;
 b=M7d2+HNBdPOVui6vk1jKtEPAoJkNfdhZDPUMjA6XK8foRcDgUsQIhzzQbaWISZRzVSAQDL
 C+qlkwGAmtsgyTV/qvBEI7ddbtDJtIW1kvJGqNz4IA4x1HMxkHhjQVe0ZcTCK/Jg3v3l9l
 suq/cMBzjmRV7lN7be6FLSYTuy7wlxzfNPcwrLIWmCLwFxJcYCBgXe7MHJF+wxmJoN50DH
 ookBt9Aa/6RyRIPnkVfxUPW4FyxKypC6ptq2Oy9viALqHvvZv4+KDVG6x3toylpvpCK02V
 4ukuzbUvCLYJODhv6a69YhUCexykxtrBowx+bQ0pmjLyEUZKu9pQmsLKIFe2xw==
X-Lms-Return-Path: <lba+269d68833+16b577+vger.kernel.org+ben.guo@openatom.club>
Autocrypt: addr=ben.guo@openatom.club; keydata= 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 0/4] docs/zh_CN: update rust/ subsystem translations
Date: Thu, 9 Apr 2026 00:54:08 +0800
References: <cover.1775619061.git.ben.guo@openatom.club> <8dd6239f-eac6-4e81-a1b5-a4e6c45d07fd@hust.edu.cn>
X-Original-From: Ben Guo <ben.guo@openatom.club>
User-Agent: Mozilla Thunderbird
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from [198.18.0.1] ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Thu, 09 Apr 2026 00:54:10 +0800
In-Reply-To: <8dd6239f-eac6-4e81-a1b5-a4e6c45d07fd@hust.edu.cn>
To: "Dongliang Mu" <dzm91@hust.edu.cn>, "Alex Shi" <alexs@kernel.org>, 
	"Yanteng Si" <si.yanteng@linux.dev>, "Jonathan Corbet" <corbet@lwn.net>
From: "Ben Guo" <ben.guo@openatom.club>
Message-Id: <34e73fc0-97d8-4bba-8083-84b932525789@openatom.club>

On 4/8/26 7:44 PM, Dongliang Mu wrote:
> Hi Guo,
>=20
> I found an issue in this patchset: please do not directly include my=20
> review tag from the internal mailing list [1].
>=20
> After you submit it to the linux=E2=80=91doc mailing list, I will add my =
review=20
> tag at that time. Including it now would look inappropriate.
>=20
> Our internal review is only intended to maintain patch quality for our=20
> open=E2=80=91source club.

Hi Dongliang,

Thanks for pointing this out.

I will remove your Reviewed-by from all patches and resend as v2.

Thanks,
Ben
