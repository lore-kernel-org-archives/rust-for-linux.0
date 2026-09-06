Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4313D3537FD
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Sep 2026 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788708148; cv=none; b=iCqfPfeeP9fa3cziUJI1x25N4RPI1Kb2ofopGJdpDTE6qFi3GcnDNkE6BurFiSGfKAGL16Jev/UC1chPfLjyLK14jbxzfng9JVo8JVAb0kPTMeF90QQlytdKj5xFNpPEXUwvkcRuFWkFpcjyDnPYOEslO7F6lvD3ZGIQ5abkqbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788708148; c=relaxed/simple;
	bh=2RuwsSOghu+1sW6+flmIsf2dgGKOVqUcim+HV99LCPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbMtSJ5Wk5cUWZdWx+1krP+7LUhg6ZQaCc4uZTzrgzaKLnqxcBcSgsZeJ958eCtzJXp6J6fAiWBkcv0d7jJXarITC+tp3KJLW9mOu4hKwak4l7NMaGa0n1aygQudBNJIJ49zMBjhP0V7+U9Zal3uqHkzzyKFjNP6nCeJNUzYO6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0/w3IiX; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0/w3IiX"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48431648f33so2675646f8f.0
        for <rust-for-linux@vger.kernel.org>; Sun, 06 Sep 2026 08:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788708144; x=1789312944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQBEKZMfj7YKELN51p7vaiO9vxhxgKuR+dj6LxJhir8=;
        b=G0/w3IiXLP3dBYLWCeC24tkdTF63Z7WvkbX9KAYvLDm4s0hQnBlnVtBu+sQHytwOFH
         VDIvxZhSj1eT0Cb+jhVf9IWUlTSQux2v8b6uIHNMAvu7qga2u0e+zQ6K8M6izvGijvS9
         RZp8EfEoIZ1qbPbsEiV5khJ2JX5OO909c9kvzmdug26zqj9lpw+KyMx12LwPLKbLACWY
         j47jIJdF/kiB7l7Pc6yVv7Ggdx4VAZNN0TvOWeuIXT42inHQ0qLQbGZbfw/fYHclasKJ
         HplOM9vb9fEao9Nl57BNTBnY3rSNOoLd6VgzxdnN1r119k2AXMRDHMvWj+/e6rDVWAQe
         qWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788708144; x=1789312944;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mQBEKZMfj7YKELN51p7vaiO9vxhxgKuR+dj6LxJhir8=;
        b=VMuduOKhuk521wrkSs2tjz+M5toDm/hOTFDyYDiYsOLjxK32mY6UAIxvMjdIv95g3+
         VzaKiW+xXNYvbCE8Egr8vTN2HVoDSoc5656Ed3PV4ltUTp7TcIBExybnZclQ8jLVFVv6
         oUl36zAzUcxQtGEmFD1I1VrBIJ448GcBue+/67qKQyGCpkLn/x0xHWEDOx8ruHq5L94Z
         WUfHqPo5zuzx6yKdF2z5ZgK5mvg/oJSGh7yHkR/UhiNgSTnL48KKM/VtCYVjAGTSnh+p
         PsvR3Ilmzzw5lu5KsRKFjnjXrqZlzryGmkz3LXOIgOmFDPS1AW9Cn5NKQYafGbm1C/tg
         4Qnw==
X-Forwarded-Encrypted: i=1; AKwUvBxYqjaR5yHeaHFjJfCFsueIwMTlLAe5XTxsEUaURYKCtYSapevSGEi5TZcmjQqJKMu+ldJHFR6MepFuiDHsHA==@vger.kernel.org
X-Gm-Message-State: AFuF++nSD/wpIsnV3/5YxVYGoCMIuCOyKfi1KFiJgDzuQ8gds2xTNY/a
	1D9Y3PBnzL0AV2jvMHsP12tgqtmHO4Jjj289CKzQ+GicCZ4vhCeyUHKI
X-Gm-Gg: AYBFou0KMaDlwE7BywteR70VyPfcVtoUxcJiNT3/Im8fi8GldPv+zoatgy/YSoRunpl
	d/ZxWBIQI+IHmnBN05iXOSFOKlIWnssVgSaM7nldovRQPP7/3bn9/TmOir4WqIqJ4+EH+vrSct7
	Y2lpB51iVP3xDvS4lkSeoKaMsbkl7+sdGtlt6FHe2e+PZazOVRZkTU7ACT86WXeQd4Cr+V1K8bb
	JgMdFk9xs7mklha3HULbahF3cwL9zhC3YlAE04YeJUXd2W+lp06RzZQAWHMSaN0VKXrWxm56MjG
	CnTFFJkgl0w5uRAs1Tj0ZbvIfuoT2OCCvxHURYmAk2ZMpw7/CxFTuAYjdK1myY3rw8GSoGSSQsr
	R5CHmnwdlFf0CBVXfmm48gZ0/oMpwTRblVt2WMF41zS2oUgabf9ZXPx4QKgDT9tFkujh+lpAJ1P
	u9TRK2tyGBa39LBXIIxWGsLp+rlswMl4MjNE1V9YqeU2Ercvv75hj2P9NdvxTVGa2z01z1K2D/6
	6+ziLeDeLxRzQVbCcaeBK4Jkgcg4CICgJk8PLGjUSgLqsyyaT8rDvIZwMyvjCq3cCA=
X-Received: by 2002:a05:600c:5247:b0:49c:ee3b:723d with SMTP id 5b1f17b1804b1-49cf81f69ddmr163847855e9.0.1788708144138;
        Sun, 06 Sep 2026 08:22:24 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d0656e7bbsm137239825e9.10.2026.09.06.08.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 08:22:23 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <4bdaab67-87d7-4c5c-8cb5-ac0f9add4d97@gmail.com>
Date: Sun, 6 Sep 2026 16:22:21 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] add kconfirm
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, ojeda@kernel.org, akpm@linux-foundation.org,
 jani.nikula@linux.intel.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 arnd@arndb.de, ljs@kernel.org, andrew.jones@linux.dev, masahiroy@kernel.org,
 corbet@lwn.net, qingfang.deng@linux.dev, demiobenour@gmail.com, ej@inai.de,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260727001623.2794156-1-julianbraha@gmail.com>
 <51ade68e-7a0c-454e-a48a-4c72f7a730ac@gmail.com>
 <20260904220559.GB2787252@ax162>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260904220559.GB2787252@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/4/26 23:05, Nathan Chancellor wrote:

> My apologies for not getting to this sooner, I have been busy with some
> other projects. I will try to play around with this from a usability
> perspective (which is what I am most concerned with at this point). If a
> v5 is mostly prepared, I would not mind seeing it even if we want to go
> the in-tree interpreter checks. One option is to take kconfirm into the
> tree, fix up the warnings it generates, then moving the checks into the
> interpreter directly while dropping them from kconfirm (since the tree
> should be clean at that point). I am open to opinions on that though.
> 

Your strategy makes sense to me. I'll send v5 then, but I'd also like to
make sure that Nicolas is onboard with this idea.

- Julian Braha
