Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B7917B506
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 04:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777177636; cv=none; b=Z6ahZLNuCro9SitZDvYsCUBzYNFoVb0v/nwM/o+J1i0pFtH2OkK+7cPxy9uc6M5sznDbDZLBX0QqHMbJremb4ik/Ap5EwrIfRqyxTWA0C93xHCerKyX1OlOddVsBM+JHoheOXlbhGNcF0SL/+WPNhnE/hDEnHbMWePUI+eq9qTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777177636; c=relaxed/simple;
	bh=jJGAwmQme3o9dcTR0SGe+/pKr8+BKDjVoScVnGSDGcs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXIQcAJAyXnLaG0MzNgrtvyzXjz9XQrgRcCf4RbFDWYxT76LNKMqojUQKCYsqd8triCHWgE/wosOzm3DXSaS3tIXHEBGTyLe5g0BXsUvFPwudbw/9DAGCyqEVzr1vSiWcwys/Hb0gogGntS2VnWZU0wqrWu+0RCA8O/ZcBTGl3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmPn4wvC; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmPn4wvC"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso5651621b3a.1
        for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 21:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777177635; x=1777782435; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o14l6wvbB2rYN5Qvuc5/uE6ZCaC/NesnRMWMWXFwCDg=;
        b=QmPn4wvCvoMqiGwWLTlYpxb5cBiHag6QsMDOHUaviUWWRCI5qv7IHBS30djltec4dO
         9n4IdRT7eov/S7HkfM/8smve2A5dU7BT5xHtrZfE5g1jmPG3A7Ejks4XPi4SDQ9kPWCq
         Itf5HnuESsBGQrcan78dlWZjXM9oXnNdiaXOc0mIltvsch2rdXdZJ1eQUufSRwQRn/Wa
         PqRqxXuF3mospvk2PT9yMTIpybY+uAUETtOpSmHnODHkwroX7ijewTibpLYkh/+ee8hI
         kQ0mpP5t64taBA1ByJMA2dzbDxHao2YM9nr7h5Two7tess9kXccpG/BCgpz2EhWqYamY
         KIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777177635; x=1777782435;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o14l6wvbB2rYN5Qvuc5/uE6ZCaC/NesnRMWMWXFwCDg=;
        b=ggBR6h6Ryuf5TCygROTX7fmNVL34Cqoyjhw2vDkHFRkNHhbWcIVjoQCuzV24PfhsLN
         xZLrORayYH+LTcgXHzKzQ5SFdf1FQ40jrV6k7I3a24vxPxnWZ0ChqeQ3kIWUUEUpvCXf
         N7bwljsNDHbnmZ2CeNmFcT+plPcXgwPrZfLVYkCeH1kKT1JJ8g39F+6dkwatXdHoOwV7
         OEoguggLXJWT/hNtZpYrFG72auh7JYO7ygfu7C60zfLksPReh8yWnQGW4XztnbIpI95+
         +2SDmq2c1LIwsvONhKyuNXODw0dBQQnq5xvN70T8f88F039hL8D+99X0pah5vWDokiov
         Yo0A==
X-Forwarded-Encrypted: i=1; AFNElJ8SbzhFHxJ4JzHc5NxV8pqggfFIWezZ+HPO+W192OJRr/uIgtPWWzDKkGGM7nKAtlzLHnCEG9FJLaUt4guL5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOSpKcbVeYsRs2Zi0jW+WfggY/OXHGGF5yzdSqcDX4mciV0ljP
	+GvjcFgwK46CtWC3tdL0Xnhhxb/WaTLhIg/F4MtvW0VjjK9ScfFiw9FR
X-Gm-Gg: AeBDiesRuFSqqfCMWLFptgQ+jMCOxNcSfAuYq3+le7ss4ldTtw9Id4RBWXSrUiWfWBe
	EVeiSBpy36K2aDWha9eQbyW9i9VTqBGtKGl1QtI/CFUiyCPgKRv4zWvm/0D7N5q5iGpOrWMG0Ln
	Uc1uJZmyfV4vjOsNcOK6bhFSkP62/lc0h72WGeAOLLF1IqcforTQ3jcxGFyaOKDwfhl/kyK3oQp
	M5+LV4dobX3bm8JoPkD/15sRF2xI9BAjMxEJzNpGM00ORFl14rh/8KqazOIGTqW+2Z3frOcrHDe
	gwX5kwalwWgSElJghPG3Dai0Pa/Rt0q88SO/sFGnXhkoEW1zl8V17Aq8LuU/PHFQIiepPgfJL/O
	JTIiQaU+gTU2idpTwmkMuWBHnmSZTS/rBV45JUdSFy+g0ZIIkeYo30Di6A34Qu2jSBVOLsUjeSI
	QrHFa3awneci6A1XsZLHFlAc9TKyKGzcQTXQj6ozeoo68EAKA=
X-Received: by 2002:a05:6a00:230a:b0:829:7a62:6a with SMTP id d2e1a72fcca58-82f8b577c41mr31499802b3a.22.1777177634959;
        Sat, 25 Apr 2026 21:27:14 -0700 (PDT)
Received: from yuwhisper-pc. ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981a0asm29065930b3a.3.2026.04.25.21.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 21:27:14 -0700 (PDT)
Message-ID: <69ed9422.a70a0220.2a0a5f.f624@mx.google.com>
X-Google-Original-Message-ID: <ae2UHz1oDe7hnfv9@yuwhisper-pc.>
Date: Sun, 26 Apr 2026 12:27:11 +0800
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Hsiu Che Yu <yu.whisper.personal@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
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
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: add doc test for `Vec::from_elem`
Mail-Followup-To: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
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
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260426-doctest-alloc-kvec-from_elem-v1-1-e364341a759b@gmail.com>
 <DI2SFMAZZBUI.3W0BML3IG81Y8@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DI2SFMAZZBUI.3W0BML3IG81Y8@nvidia.com>

On Sun, Apr 26, 2026 at 01:05:36PM +0900, Alexandre Courbot wrote:
>Received just as I had finished testing your other series. :) So while
>I'm at it:

On Sun, Apr 26, 2026 at 01:00:06PM +0900, Alexandre Courbot wrote:
>Looking good - just one thing, when sending a new revision of a
>patchset, please start a new thread instead of replying to the previous
>one. Otherwise things can get pretty hard to follow once we arrive at,
>say, v10. :)

I just realized — should I have grouped the tests targeting the same 
module into a single patch series (like the one that was split into
two recently)?
Would that make the review process easier? If so, I'll start batching
small doc-test patches together before sending.

Also, as you pointed out in your other reply, 
I had confused `link:` and `in-reply-to`. 
I'll make sure to use `link:` to reference context for v2 onwards.

Thanks,
Hsiu
