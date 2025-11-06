Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9484D221545
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 01:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762392279; cv=none; b=rLbxjUKf4VDwGf7t/MJ0Dd+PKYktWtq9XAXwo245idXSwO+iSv/Ze2JyodjT6stiE9VSedl/9Zc8jgZZir66HYER5VqlBkS5kXR0gJaaWAKzdEw6+6UWr0RB/AOOlTd/XLmVZjOtVG4CWgRbkixD1N8akwvHp33pUh+qKXKN6o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762392279; c=relaxed/simple;
	bh=YuqAP9iw5m0k8yqDCbNn6GdbDJxLVkg7prdjTg/+whc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Qk67BS3QFlgndxeuvM4QPe1aybNNr6Uz2sE79EC2fJfUe/hdnKqvBZiWjSJFCNgK7Nk+yyzS+P1ZohWcr8YxNGCTGbd1IzSAM4IO6xMXtxn/iObbATz57r4XkXxBUs9Kblem+gUPyrQ8dvosgIxgJl1gf1tvMgHMeB+QtXtGkSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=hnWn1rcW; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="hnWn1rcW"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-880576ebe38so5178306d6.2
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 17:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1762392276; x=1762997076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciojNVrmV7+Z0WHPv+m6AyJCXXR4qy2RoeHAXQm3Zwg=;
        b=hnWn1rcWiEvK+/8nGBH4voib+NAhkQMsQwYHlxXZhCot0+xsfB+pR/bZN2DmSjxBx1
         cs9XbK7vCiqpeJG0kW+Natq/4emg2wySJpLdmcIA8JE8JD2MTAo4K7OkIPc9yGoJnaTu
         kR5u+bt3LK1aiXklebnSquDuV6Oal+KAKtmoAPHZAL2JoB7JqhGylKelb9u1ZRVvuOPC
         rsSOdYxCEZf03cZMp8Omn2wqMDcO/a4lEUoL87udBflbnvcZYxnDSW9i3j/Qhrucko+D
         cGwacZZR2/srFAtxqWNMej7Z8h1Qhi4uYzlwJa39rapMpYGzefpzvFvhoyjFX3Vfdp7z
         gSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762392276; x=1762997076;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ciojNVrmV7+Z0WHPv+m6AyJCXXR4qy2RoeHAXQm3Zwg=;
        b=XnRfPzGzbC4IRqkDZqCAQ77OwjPrdxLt7veEQyqrEmuGfO46oBXALh+7m38m5n4m8j
         RwSbM9q1bt55TYNXY8Q6jUlkBVOuDcqzIdlLqNWWbda3KY/bDfakmuww9i3QEK4FtHq3
         uVnmoy8cwe/AJjtN1aBnOyNLEKkdtNAb5p8vRKxqhNDzvOjiEHSNakaqw1TwVwC6eAyY
         UuXR08h+xkvEEmWXqv5clAEfzeIKWmYLi/Az8UUSYDXmTrT3P9hLk3oCCrn+iyFc5Y8q
         9MwP0wq9yMgdWaZ1+aAfmugA4ppK3js8YaIh6qDzZG+TEeiHbGDmYagFH+s0xBZw057E
         ODsg==
X-Forwarded-Encrypted: i=1; AJvYcCVh+f8QL1LV3Td1/CeS0OtUaNd+2MS7PZkIk793SqqdxEB45hVRqArT/X1HiWQY9wttZESCpoTXOCQwOEbKzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIJgk0msPCbT9x7MUbVf+sCQlTStp7BKnbiiDpXiRujFK1juM7
	0GG+bKJMTYkKDh/Xtb4ofstjDPzh18KDMlBEaWNjzm5gO9fSqNkHW1ZQAc6iq1XAXFc=
X-Gm-Gg: ASbGnctx/iD6dSdnObJZMw+bZ+m+HJlLiQFFvLG5rH0Rn/Hk3AiUwTqK/+J6g3zl0Be
	u/MbL5aL+kZKQwffEwbSGkmQVP8XVUXghaixZQmbKXv1rgwj6RBo+Khjdj9y95+99w9HtiOKBfs
	8+qtQfZ6PSbCq68Eno0DpiOkQPvo1WUqVEio2dZhOrpeUEUtWNE8GOQtBQd+XqJANxX68fDSUi+
	XlGE9Pl7vI6yvJ7cS6PV762K5Wwk3M6TsvXy39pCgXuo30PbU//vHHNoIQDszeHCM0D7spk65ww
	swCnPWBHBNQhySRnyhkETLnis9Jdn+EQtHbPs5gH9ibz3A/JcCwrI5M6rq7tg71xwXx+oy2aA9u
	IfwRDlx+LX8KWRAIg3KCW+dZnmPqDOuRTxCKhMVIez8DzAO+CRf8E6VJqvxFRegCVUkS9ZKQ=
X-Google-Smtp-Source: AGHT+IGW8dMBI8W38mAKSfcpKPv42jStcm1Jq3Lm9nyg1mPUQx9NVElx9coA94cKj7jGyUgQKJ01ow==
X-Received: by 2002:a05:6214:20c6:b0:880:638f:1a1e with SMTP id 6a1803df08f44-88071188e82mr86814876d6.46.1762392276316;
        Wed, 05 Nov 2025 17:24:36 -0800 (PST)
Received: from [127.0.0.1] ([216.235.231.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8808290ca3csm9180786d6.25.2025.11.05.17.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 17:24:35 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Andreas Hindborg <a.hindborg@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Shankari Anand <shankari.ak0208@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20251012142012.166230-1-shankari.ak0208@gmail.com>
References: <20251012142012.166230-1-shankari.ak0208@gmail.com>
Subject: Re: [PATCH v2] rust: block: update ARef and AlwaysRefCounted
 imports from sync::aref
Message-Id: <176239227492.265257.9458847625438366848.b4-ty@kernel.dk>
Date: Wed, 05 Nov 2025 18:24:34 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 12 Oct 2025 19:50:12 +0530, Shankari Anand wrote:
> Update call sites in the block subsystem to import `ARef` and
> `AlwaysRefCounted` from `sync::aref` instead of `types`.
> 
> This aligns with the ongoing effort to move `ARef` and
> `AlwaysRefCounted` to sync.
> 
> 
> [...]

Applied, thanks!

[1/1] rust: block: update ARef and AlwaysRefCounted imports from sync::aref
      commit: ba13710ddd1f47884701213a3b6a5e470f6bc81e

Best regards,
-- 
Jens Axboe



