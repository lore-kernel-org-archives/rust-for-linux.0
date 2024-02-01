Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4733363083
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Feb 2024 17:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706808299; cv=none; b=fb4euo1GJ3GBhqxSTN99T9svBqUYYviqSW2bxlqjpoxuqPYOYC/CRKb7fOdgmB40OQWIJZrlLP3TO2tczgQtkbrLxzmFDAlH7n51Xgr8u5AOAsZDxIzIBh95aC6dE11j2mtwBA27AGI0bE1O208K9w6SHjxLkVpnKFd5EJXTU2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706808299; c=relaxed/simple;
	bh=tUT5eUuE15s4mQW5Eqc2UL0FWajOfvBqXa17uCRXgdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOUDPvA7j7IVFo4lm3u8hXYmbqkKp8pficqf9pxMg1wEMvSHR8eI1IB5x6LnUqg2zedGalYJFstsw2mFRGbF1t56IeL7VmAu4wscDyGmGJTXKAiwYYLu6AjZh4jX7bjDwKYqrx4KOpmXgdy5cRHOvHA3S4xsPceh93sgd0h1Ssw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdyYb6fL; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdyYb6fL"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d8ef977f1eso9191055ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Feb 2024 09:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706808297; x=1707413097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eg89cElHPtXrTUhW320LKCTRF9xkkRqlWJR1HbBd4bo=;
        b=DdyYb6fLd78QTW627U/GdrErPyEKpLlS3HyZ5dVqTWFwUJj4fM5voOP/OvtUlda3gW
         mYG7B6ayvd9S/vnFn8f5Uf2McsCsRf0QKwKZuP+GZH572WEIJgL6KbomDZPPnoZIyrii
         NtHhigEhzI35jOZp34z4yXK4hmUpfy13sQNilo/LyfoYUaJT2jNRnuI2ErwJ17EsYLsF
         AnQucPeekYOC6znzYp8PV5h6tLWw823pRTCsZUJt6BhwYOhbj3h0I14Go5F14jIuQkbp
         avttr/7Jt/W/gBjYRuSizGF5g0vFMVlDjshxq/ZW1YiuL+ldLJwPxRTJQm9KzX2lGt7/
         d/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706808297; x=1707413097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eg89cElHPtXrTUhW320LKCTRF9xkkRqlWJR1HbBd4bo=;
        b=EOuoNYqjpZfFTT7MAYRjq7u4gc2EDjkqNN/AsPIgeZr6juQIerEr7zpOeC7QLykLqT
         ECWOCoq4cIlEKC4yovsrRTe+m9/9pm37/1A3EfPDj9NK9JNZtx6AyQOPMeIIAvufTvbl
         bjHMVuAKzDFo83l3i2GLJXun6EcaNAh54fJ7bXr8HVFpxfDTtRHEGqco6SU5OjbNYjBP
         LP9oBaefE+cLRBozoqu0jDMNnTz7Vd6pGXv/xblWb44x4J103I2eo5s2oCXLtkmb2WE7
         buXxUScF5XOuSB82adFmbK+DkWoW6JxzeqgEJJH64GHXIQwOf0TkL9VrDFVpKopbaJKN
         149A==
X-Gm-Message-State: AOJu0YzzfKOqj3K2Py0EQi81U48GI3PwKENCOMxt/vmpCgcp2ZwNDse4
	YvdzoulXrcBJuAOFGrtvI5+yX3jSC9Y0VCeG4GKr75+YBK4IY1Pl
X-Google-Smtp-Source: AGHT+IGmgAPXBbCBiG/LkBeMkR/+a1xTD17Crewg5zDDod6+LDzHwKyRHmHtlagj2Us8pvNVerOYSA==
X-Received: by 2002:a05:6a20:e104:b0:19c:8c44:83f7 with SMTP id kr4-20020a056a20e10400b0019c8c4483f7mr6392024pzb.44.1706808297492;
        Thu, 01 Feb 2024 09:24:57 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX6l2+jLF8rkT01kgTpPGgg8c5fQVj2T+C0k2zMyPlye7cZxPqkzxywQnO7FMFE8bns9+9K/FuzMW9w2HwU9/e55XzAid6ouSK0dWqcv0/Qkcfz/fyiIKhdoDD262lNvj0=
Received: from localhost (dhcp-141-239-144-21.hawaiiantel.net. [141.239.144.21])
        by smtp.gmail.com with ESMTPSA id h9-20020a656389000000b005ca0ae17983sm38191pgv.8.2024.02.01.09.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 09:24:57 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Thu, 1 Feb 2024 07:24:55 -1000
From: Tejun Heo <tj@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: linux-next: workqueue + rust build fix
Message-ID: <ZbvT58zFeGoxIiHM@slm.duckdns.org>
References: <CANiq72=9PZ89bCAVX0ZV4cqrYSLoZWyn-d_K4KpBMHjwUMdC3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=9PZ89bCAVX0ZV4cqrYSLoZWyn-d_K4KpBMHjwUMdC3A@mail.gmail.com>

Hello,

On Mon, Jan 29, 2024 at 01:22:04PM +0100, Miguel Ojeda wrote:
> Tejun: please feel free to fixup-it into your existing commit (diff
> likely mangled, sorry -- let me know if you prefer a formal patch
> instead).

I missed your email. My apologies. Can you please send a signed-off patch so
that I can apply to wq/for-6.9?

Thank you.

-- 
tejun
