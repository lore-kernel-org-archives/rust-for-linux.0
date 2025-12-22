Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B10F306B11
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 22:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766443013; cv=none; b=IVgPom6pEAYMr+JB7++65wcp+vLMGwM/ivk3uXMPPdqsn6TuCkVPpp0GDjY5RJ2mGzYDIqKjSCpXsXPUDS2fcxf5LLXeQYeEJb27XrC2vgoqaxEV3vveo2RqioMb9192vktpkohZ3LuSgBrkA5bbR/RBfOH0JFFbcOubKfUGo6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766443013; c=relaxed/simple;
	bh=cWyWlUsLYllq3YZ4msN52forJMD/NsrPEK6kchRMkGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K0jwD/kc2Jb/2UqeRjpVDaRcPO3eb+0xEAz57uL1tT4rugijYDGE7MvMnWsoX6UhqcWjzVZeQwBGpQvnNPBjNhhYiNC5mNkb23flvQ+BphgGhxAVClAZORrWFY8fsoIk2N5ugz7XWmpubkPW+CXyxV7X963yCEtei+WSxzN2EQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=WD4PQxki; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="WD4PQxki"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45066bee74aso1333319b6e.2
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 14:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1766443011; x=1767047811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmjF1Yz7+VNQI57L5AJ7F1hJYsU7UkH3gMgWynG2IEI=;
        b=WD4PQxkiVlV2tOB9S3jnObq/pCKrp6RZNNMVF5qyg7TkacrhOSHzoSE4rwpQeknIXE
         Z+Rhw0aLnXNM9V7bzWJzGqrohzczTlRJgOfHy1HQevKRa3piiWmTP7zCGfZBpBvn1Iap
         k+E79FLaAwBxbIQs1QUDhbN78IRK9Pli/l8Zu3YHuw7DQbcw6xxcepFztqJofhdpDO4H
         xF/Vpt+BtM1oXSlamFy4O/nY/vSy0Br99RTY84WOpxhiynEFuVGrMFna1pNp9P3zZEGj
         jkJC2MSVjLhRU2pJZ0wLiv/oOK8kd4l1SdQamgb2KAXXLQXOAVyz/FfKYYYziovH0/RT
         JA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766443011; x=1767047811;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XmjF1Yz7+VNQI57L5AJ7F1hJYsU7UkH3gMgWynG2IEI=;
        b=fLh2UNwRBvHI796kHzHp0X22RYnTUreQvZ7tGbfM6NB++6RInhLAse8tJOfJL2kIif
         +nrMZXZWyWcRMqPU8ip7ha6yxowschf80rqQDUZiXOvwNOViJLkOfw1vLX2mCfoZ83ai
         AASezYwGxNINaZ1XLiGD91HwDPxQGbkSF60Izt1EgcYGYnKh9L6RZvV0xWmnoWw4pqKo
         Ish0xGkdE6AhpI2j2YbPZ0SLrSOHSEihVGXlaBDTafTBBO9ndYbWFhL03ADVG4mG3kem
         B2sUaVoOGObGb+lYsFWBZ5iWWnVsCKp/cYpbxhzxbVchTxkaHbcwdV1GQHGXVj8lJQHh
         zHxQ==
X-Forwarded-Encrypted: i=1; AJvYcCULYZAvGGR0tkgbvKMGn4sOP1zG59c4HjEh8F9ZUQ3gpC14so7H5Ayi29KGqlOzujNKD6OoSMrvriRDBxdjrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxabcmu+DpqG5UV2rwu48ans8iAgP1dXwqif8GFVBT1oqRaH/de
	EDkE1pqjkuUmltL5zymyDHFfqfcbT7FyIuICDgQj/2HQiVtjLrgW14SqOJuI3mMPjRw=
X-Gm-Gg: AY/fxX6+tSpCrd9K3BbwgoR/o58uhodtQKRrJ0vvZB9AfSA+3Rt1ERGqLLZZqt3t+NB
	qhjwyCi5WhTD7HQDguLWIiR1XP9b/Ebo7qQrYCNMi4REANxUXzkXG80nlYaPOvPJCgboBWkaP2z
	o+Q60LG90JDeke4bw+QrCSVQau0agtqIWofysD6YNR2T1HyNnBYZbbMhn1RGKvvbKYC7fWxzYMA
	vn3E2THukoSwn5/Dx61A04/tG634x4Z11CccjszKbwJbhPmwS84kkK0YN90AWTLXOPBTEc2+8Ko
	mCwAp0QspzF5CYMSPtopryinlP2l4tc7+3eeXLlF4whI7gTzwRuIXf6zKGxqyv5RKAevMSI6b0p
	JLCZ4YXOeS+s6kFErOWhTJ/ggnkWceFg9oAZAfInYzqMVWRGHnhNAcEnlTEBST4t58YBl0iQImV
	SrnKs=
X-Google-Smtp-Source: AGHT+IEqBel0YPq6m99gxBhje8Md2Mqo035DW9xaZaFQGZFDl8fJiehFCEVApn5UvOcZujiXkJbDEg==
X-Received: by 2002:a05:6808:d4e:b0:455:ee1f:e1c3 with SMTP id 5614622812f47-457b20f4d44mr5505716b6e.13.1766443011126;
        Mon, 22 Dec 2025 14:36:51 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-457b3ba440asm5976331b6e.5.2025.12.22.14.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 14:36:50 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Andreas Hindborg <a.hindborg@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>
Cc: linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
In-Reply-To: <20251222-cstr-block-v1-1-fdab28bb7367@gmail.com>
References: <20251222-cstr-block-v1-1-fdab28bb7367@gmail.com>
Subject: Re: [PATCH] rnull: replace `kernel::c_str!` with C-Strings
Message-Id: <176644300894.8131.14864599190051951570.b4-ty@kernel.dk>
Date: Mon, 22 Dec 2025 15:36:48 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 22 Dec 2025 13:26:19 +0100, Tamir Duberstein wrote:
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
> 
> 

Applied, thanks!

[1/1] rnull: replace `kernel::c_str!` with C-Strings
      commit: 8818fa7010a53af03d2584a2b80772aeeeeba209

Best regards,
-- 
Jens Axboe



