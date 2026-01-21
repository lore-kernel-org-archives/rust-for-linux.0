Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E584BCACF
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 14:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006884; cv=none; b=AYxnx1+JEpC7gKbVfrOhJnWMxl2dCTRVHdGEKi8h9QvN1BeQ+bCzteav6Kms5ftajfPICwj519sXWpLnlRYAiDapXlv65rW9xveGXVMn3LOwemgxjESTfY4CNrhdlTQZeNje+EF3SFcsb5fbmuUxrrF1BNWngFeL+YEBSq0UFhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006884; c=relaxed/simple;
	bh=NzcfMBr3JrcpsexdWmpitwRcjnTdxYq2hWl4+SBB4rY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n9l9zeegMnUG1ra/BwY09WuHHXbFEOxURkZVBKTvdMZi58CAV99r3Q/LqI4MjrIzlGWa+7h0Pl0fxUTyX9aj5EEyWp11Ul9pBhk7vySgxIn3Snyd9GGv9nM1/wBXCR8yj0+ogWD4NNVAvS446JoCZzXwPdVyY6yYDrcwl6yGx+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=K5vuPz4j; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="K5vuPz4j"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-45c89ea958dso3608512b6e.2
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 06:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1769006880; x=1769611680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFKCyvW85iHWqKrrX36PYYwKkM/aUx2UIziOvrJQIi0=;
        b=K5vuPz4jOLpUgJQrjMpI6xEZY0GpqoUQqeJ9hqZxcC612ePIwTprQwJqTT8ywXd7I8
         im01gkmEIaCo4ReAoIs0p2NG+Gup0Hn/X2nHghBqbvmy5X/zXAKqZC+HE8Vf0aqrns2Q
         xYj4JAjHD1x1J5KHaTN9UnI78DglUFjm4j/gnWa0phkH56y49CaJv08NzeoSU3VZ5aGx
         u9yh97fSGRI8OUKTSTUEMqOjOJDrTJNwLuZAw6jnzfOF8IPlT2bUC4gQ1bama4nwpiD0
         zMGockHWC4oY3HZ1q5XjlUuMD/lYnCyJluwYPELc+u2mHVC7qDC6ZRH37uA0cn2tkzde
         9IXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769006880; x=1769611680;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yFKCyvW85iHWqKrrX36PYYwKkM/aUx2UIziOvrJQIi0=;
        b=Q2BqN30j20xv+J0LQKLUNdESaLbgSakWlzd0b6dwOB97pojSVbGhGN6cQRD1BPU2QJ
         86wXby7KdGM+xBgIRqo9a0kB65Cz3OQ6gb0daSzYnK5957Y33MckPvHSmQwwxfy0oy0W
         3gDCwl4Sfj0cyojFhUHTj7pn1vWbPdQzZEYmlUwMT6ppPkPEMRoq6U1se8TxYsI6dkLg
         uk8gBWZryVo0Bm98tFNY6u47NN84CbKkMnZa1AVB95ohkbpgZ1tGQrAhlciEX9d2uvFV
         mpX/3aVfWWinOZ2pvZhiMAMiJ7cbarGLdbot7BAkcMEVlFsN0n6ECvc49CzXqLXiXMr+
         o/WA==
X-Gm-Message-State: AOJu0YxHRoQIVgItYDvLURUpru4JFrAU4EasKwIGXJJv3xBrK/dlOtPm
	g5faS4ld4TF1riCDIXMxK8tl05FYl4oBKYUWi2lJtTiJ5UVaZs4HW/9DBm0BpKNaLrQ=
X-Gm-Gg: AZuq6aI3iyMKUzXODsG01J8qDmEu2QKz1VrBOZbqxomL8cMyyfSUPyZmYHNmsUY9JYr
	GxfE8xxc+gnrQ+oTVc321MsHlqSBfLb+bwO+qw+3ULK8wk6WNdK/Fa3ntRNyOH4nkYv81Zvl58y
	4aDd/D1b6RQWPVFMSBeLYMLID3aqTXX6PuN+diu53gDVTzvpjz3W2DviC/fWZh4csn/Oc09Wleq
	boo6gap2ew83s6XUstKkUPRbGq3FxefluN8EEkgeFKRT0YdR79MZcQmh+MRSNZNkQhOnmhkw3mt
	dSmrTlNwZeSK6vC1ObodXn3brkhDJsePx65KaUBCpkKod4w3Dg4ZSc2PhN68fxU39Q1QLZlnxLL
	d0NYWqodkFd4yJSEroT4m1s+L9/FVSHECgI1yVRXtBwt48V3DKJ+XvCOtffVJb3L7h4bsCvwkCe
	RaC4CYeehbLE80ueaClYAJd4QdpdXFCZVo/XK8MMv4QGWFuhjoqi+E8UqhY7HMBeI=
X-Received: by 2002:a05:6808:80a9:b0:44f:e61d:1893 with SMTP id 5614622812f47-45c9c1acd3emr7737773b6e.63.1769006880387;
        Wed, 21 Jan 2026 06:48:00 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9e03e82esm8760513b6e.15.2026.01.21.06.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:47:59 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20260120083824.477339-1-sunke@kylinos.cn>
References: <20260120083824.477339-1-sunke@kylinos.cn>
Subject: Re: (subset) [PATCH v2 0/7] rust: Replace unsafe
 core::mem::zeroed() with pin_init::zeroed()
Message-Id: <176900687943.9724.14786712604002245962.b4-ty@kernel.dk>
Date: Wed, 21 Jan 2026 07:47:59 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 20 Jan 2026 16:38:16 +0800, Ke Sun wrote:
> This patch series replaces unsafe core::mem::zeroed() calls with
> pin_init::zeroed() across multiple kernel modules.
> 

Applied, thanks!

[2/7] rust: block: mq: use pin_init::zeroed() for queue_limits
      commit: d7a4693a250ee2f185ce5c878e74252e533ac4b9
[3/7] rust: block: mq: use pin_init::zeroed() for tag_set
      commit: 880528eaa67fc6446a0b5c16757f0d6a2639ccda

Best regards,
-- 
Jens Axboe



