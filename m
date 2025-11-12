Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBBE329C72
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762953451; cv=none; b=H+Hwf2xg6cdL3DxtUPLxXfFUsJV5d7ZwtNhxu0CqtcjKAdfXkvaLpiOnIEp2I9PRHoMcVCi3H4y7sFXe0+fTaJm4eJbk8xsd0G8TU2R1QzBktGKlsCDqepYtM5mSnnbb4VqUBnPXd4wSuupmV8AEzajc6e9nNGe89JFtBsNaO3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762953451; c=relaxed/simple;
	bh=vSJxWa577zgmNEwL/Y08iTu78hCMUkXnq93AGdovAcY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BfWMOUuCC+HoKDW+5MbMIEHudC6jPlHr8battDszBrJsCEv60dKJV+TSPNLbeRcNGgwb/f5gByJo5OlG1+8qFCoVcwcr1NV3otkpuj8hGFev29L6jiLxQS1xJreZfTL+wenyoIyLKRgjt0G9f4EvPYzr9epqAbJPstNDtR7h70w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvOM05NA; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvOM05NA"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-298144fb9bcso8620405ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 05:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762953449; x=1763558249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSJxWa577zgmNEwL/Y08iTu78hCMUkXnq93AGdovAcY=;
        b=OvOM05NAcMn2uxoBA5QlL3zjPqbKB63O66H2GFja3qcZEX2p/ubc1os+FICuAZwLLr
         D1NbzeMLhUlGRfH3vmjbLrf0SFwzGi4VT/uM/HVOBEt1GJ/vKN4tdbqFINB4UjE429lt
         +nBq1RVM3nUSEGqXbsdzFXbivtPMp8qW/WSF8XKT5tKfJe/P217QO4i38JgTZ+kNKOGW
         DI9tT6bu4PAzB2JvG+U6gtO++QxJfDQc83F8J4fbtgLUxnxxbBWIbgBRyaYQFnR/jBQA
         gY28BRxDng3iO7DlP2bU0fg4sdt4Tl/nv/9b0Fnx1p/RaUvzgYAYtonZWpnFTrzNwmv3
         QHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762953449; x=1763558249;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSJxWa577zgmNEwL/Y08iTu78hCMUkXnq93AGdovAcY=;
        b=mlwcmVkpLEZTOPoFIfLiBs7z59AlVayU/nZXUZ0XE4A/hWnjA8mhfpp2TE6g6W4PAj
         snlTHyR+LYQ2EAbJvVB8JK1q5IEcjfY2PWy3lIKtdFpoogIgd4rDdQJ0z4l/qWRuZ/u4
         dFh8BAPd2HB8GcVc8HKpp0AUNa4OZAazfdQ+C6NBPu4vwtVnn5ScdTAnw9c8XG6WetIp
         D/B5Va6H3SuYSRh37iftH02mglsG3a1Wa9oDwGohL6sYiydSTgVvq++ynPojKFsaUYPc
         +ZLUcLaJOkK6hm3btbLiV3K3wsJfVLVW8SQARVJ7B6RHGFRKBhE7I+zuio0QQBj8cW3a
         CFyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC+Fa4bnABjSXA1Yu74zeprJK7AWeQapazoOJNf/KkVWagTRo29c52VJIogFOMWNiqpl41LWZzTO0LAvQ+sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3YXp+8X2NUtwTkqhrX1sTBP//I4xmAFioKxTXm6mK/opO4clY
	O6bEvKdiFJ/cXo384JuOXrK7RfL4g3msG+x7ajXP5oQNSf7HY9k3R3eb
X-Gm-Gg: ASbGncsPbVuK9qWUxHwOYBOl2wz4C5s5Fm07kdlmL3bCGLbcXc1JfXWIx45H1LVEVtx
	OyU1pnLZqXc95LZlRKblx/KlnRgsMchmeADOnjkQu8V050pGg6tiWlMFUoVDDehYvv4I7OsLZF5
	NsQCQx2NmVdXcWivibaz98fjtndM1B8XlwnmbSqOOsOTE3UfNhAY9Yo5+OPXCcnsfBti4cY8sJY
	u22DSjy6HYasg75vwrMELvyyvdzjNMBRMNlXaCA34LFippY1MNs3oaKMpDHFlvdzZ9TwmhCDhaL
	Yat24WkrK0peunBwT2Zs2TXE+3E5JyPZesYyGu55MS3Et+F+0P/Jai5HOA+xSL7kE6Hx28+gAxV
	ThT4P9/kyUgzIDeWHAG6GW7DQ7/R7z7cQkLhKrLTE1qZIbTogjvbej/plnZ9TN5YLuSMP+kThrR
	7cpQq3ukRHA+hlFfUJz6aepQQFehJFZuzy1eacmpsp78XR3Ft/aUH8kQ==
X-Google-Smtp-Source: AGHT+IF7o9fP4zxNxVGnhrArJZsBW0WxBv8cQcOOH8NWTsqKtmdkcFvb0QpLsfwQjnriR8l/xBIBGw==
X-Received: by 2002:a17:903:28c:b0:295:5da6:5ff3 with SMTP id d9443c01a7336-2984ec8bdd8mr38468875ad.0.1762953449505;
        Wed, 12 Nov 2025 05:17:29 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dccab77sm31788385ad.76.2025.11.12.05.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:17:29 -0800 (PST)
Date: Wed, 12 Nov 2025 22:17:24 +0900 (JST)
Message-Id: <20251112.221724.1567060411658309434.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, a.hindborg@kernel.org, aliceryhl@google.com,
 ojeda@kernel.org, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function
 exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aRPjNS9jIsyHGAPl@tardis.local>
References: <aRLG1Ofr5QpJGFaB@tardis.local>
	<20251112.064349.598094996228184902.fujita.tomonori@gmail.com>
	<aRPjNS9jIsyHGAPl@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 11 Nov 2025 17:30:29 -0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> So yes, SetOnce may not be a good fit for OnceLite, but still OnceLite
> should be in kernel::sync.

I'm glad we reached consensus. I've just sent v2.

