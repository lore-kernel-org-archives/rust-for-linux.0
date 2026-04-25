Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFD130499A
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 09:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777107652; cv=none; b=ewPkPiNucBw9ZD76ZsBtrNxSFQ4eCHLstuhCUlTinU6aEtoKwzF5r+9JHNtELLJVCmUDzzpgyq2qRsjw68y/ydTEKVgSx/HznRdJsFnMi8YNPuT8DjLFichMOIoekb32uuQBUqXSysPnyNRtJdzVsYvCmN/ANJcBFGXGJWwL5mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777107652; c=relaxed/simple;
	bh=NPbO+K97eUxLid2O4nSOULUU7QCYAyWkuP0SItSBYe8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W02yJwywiYq/E6dFRlkuBSVXFa1/g3ut/fqxiFoPoU7dt+WjUKf86z0WawfNr6++NJxBMKd7Rkguu29sLqgzn9v3r6bkkCvEv4j9tgHJjxM/mfpJCLTAyfDnCv63eMbsGx9y7UN3SqftW0DT0iohGB511d2mvW69DrMAa3SCYdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a894YkNI; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a894YkNI"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c76b9efc299so3538049a12.0
        for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 02:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777107650; x=1777712450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:subject:cc:to:from:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPbO+K97eUxLid2O4nSOULUU7QCYAyWkuP0SItSBYe8=;
        b=a894YkNIqYnrSNIjtMCK6WPCUwhDccP3xpGJnFXQoSiMlg7H99ElQ9WEbI+KmM1u7F
         ueAjyTgNjo+nludB/stXl5WAxG/60wdJBUYwPo2oksJ9umcAGpRFoTguPTV5ZLngPTri
         Sskwi4Yiqdm9C5eBsXsVt1TAygY3gWYb8XtPljy9pCynbgL17F3PcEANqAdzSjncqXdJ
         0uKU62R3mxQQTRLzGulOYqsjClcQvOaUWxq2WmM57cs6s4xD+717rwkVW9JzP3gkU8EU
         o2KW285j5FOoZpLSQQuhw5zJQkAgPjCY1LClQk8vWRshKYpU3e7ESMcHM7NlEvWjcYjF
         BgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777107650; x=1777712450;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NPbO+K97eUxLid2O4nSOULUU7QCYAyWkuP0SItSBYe8=;
        b=eKO7+yBByszvnZT/tlxQNz+eFt6GO0dzfYQw9ed/JoGo/Li1zBJQ+yE8z+kx00xmek
         amWhEaIIjqLZ4BGxAxbid6QN41jwNw89xJwsmRN4Zi82psjE1grJh85Adp2tUlqBtz3J
         NBjMfTfVeki+q5BhUp2olKhUM8+JgvO3dsPP/gFmUs3IpxSRRIUpmS+Ufnc6/0H1IWf7
         1HqNkf+zB4HuohgbENX2Xy05dMiEi3+EqdQ2m38SSx7Pa8nZw7p4qhDm+mT5j0NVHQVZ
         5sUX1sg6xuMkI0wnbDZIrEXsSjrxNUOwJSPhXzwPRn8kpuJdXUoIJqLZJI1bOi9VEyyg
         OFPg==
X-Forwarded-Encrypted: i=1; AFNElJ9YGTWmkeKR8ts6e+T7BzEyAEVzbHIPF3Chc/6lGxY0eqm2Xlr4OAhNOaxzVvRrIKdWT+aym/lBEMIdmvuHZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1iGkBpZGL1ZVWgc6WZxuINiqTflv6p0aqTMuRmFy4JlnXeSVN
	cs9po/IiKBD9CPWqJIFg/VMEiiiRWkZAUpJdU5vV1Y6NlTV+BUi1GhyD
X-Gm-Gg: AeBDievom+4h1DqRVh05FmXPGtZFO44M+7JeZmqBqS7RVhSdAgv43qCqoW01YkE/EaT
	bw8QWioafAJgpIqnxI17JEBv+N4qt53fYuYeg4yLjjhoMDzA5ystCErGE/k2Xwjc6s+qy0lhV8u
	BKaYhYPcKTPn0vLpVuNEXYO61v19T+7XJEcXicmJ4FF2D+ot8WjetKlaX09VZqXE0XWnaVqoogR
	ebXcYdd9Kr8ovoXLUaaXgfaenSUVAaTMWYK4eex0wPIVQ8HwYQYSn4jAfmrpIFa7rvW/753T9AZ
	F4sB+LIaewdcdpbt6dh+nxqdAdMQvoUk9XFgNTN+I4nKdYmk1gpZ06CVDyd/GcT2+1Yg5ewi1Hh
	LDZDtSW/9QYvSUINPEan822xyfar2okZ+0ayiwpGyMRrpfO0lvfdCjhQG+2kiZbqeFA2td5DJbs
	zzFfv74HHD94ts62MdRlZxoJGt6UcvPBApuqON9nYAhkPxwKI=
X-Received: by 2002:a17:902:aa06:b0:2b4:6664:97d4 with SMTP id d9443c01a7336-2b5f9f83295mr250831765ad.24.1777107650220;
        Sat, 25 Apr 2026 02:00:50 -0700 (PDT)
Received: from yuwhisper-pc. ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9fef42sm237084325ad.16.2026.04.25.02.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 02:00:49 -0700 (PDT)
Message-ID: <69ec82c1.170a0220.2ca0e0.9e4b@mx.google.com>
X-Google-Original-Message-ID: <aeyCvTbCcB6gS9jA@yuwhisper-pc.>
Date: Sat, 25 Apr 2026 17:00:45 +0800
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Hsiu Che Yu <yu.whisper.personal@gmail.com>,
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: alloc: add doc test for `Vec::extend_with` and fix
 comment
Mail-Followup-To: Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	open list <linux-kernel@vger.kernel.org>
References: <20260425060823.76175-1-yu.whisper.personal@gmail.com>
 <DI20XVTPLERK.CQ95NC4Y3QXN@nvidia.com>
 <69ec6506.170a0220.b79b6.7d25@mx.google.com>
 <DI21Y6U4OZWW.1VLZV52OCSW3R@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <DI21Y6U4OZWW.1VLZV52OCSW3R@nvidia.com>

On Sat, Apr 25, 2026 at 04:20:22PM +0900, Alexandre Courbot wrote:
>A v2 sounds appropriate since this it is the same work, only rearranged a bit.

Got it. I will send out v2 shortly.

thanks,
Hsiu
