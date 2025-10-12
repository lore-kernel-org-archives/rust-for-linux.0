Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630A22773D1
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Oct 2025 14:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760277902; cv=none; b=JoItEw8ifiq7jE1se4Zsdy22Q8Cc7LKNbMVIFNWcr/6QrKw9ufqsgfjPUE/eFshwvPVEpmpgSohqu0/s8GaZaB14iSTPhP8wxNBACsAYAukmNnT+QPSY4lc4JnHYDMoT6OgmXrNDYfW5A4ZOol+Q2yAnw1VgZftBI4oAphekqt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760277902; c=relaxed/simple;
	bh=SUCKplIlV9GbXZf1FJNwlR6/8RVMJUgrM/szCfbpnQI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sM+/IA1pvcIN52dnNHCFZQlzi+9B2MRklYn0ugT0yjSxwS/QIv80K726d+s/CCxM3TTRIKy6cKwcd7JADh4OorZ+D0ge1F/BiqfdZP/0HRpkDrKE6Ns/CPa8m77HwcAx+Ch/Jdb3pev27cnrsv+o3yH/dYeKEKofU70ae8I1vpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzAvT7MF; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzAvT7MF"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b57bffc0248so2454782a12.0
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Oct 2025 07:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760277901; x=1760882701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi4T0TH8A0fKPF3Zs0o2a/X6S5Z36f1SXjrYZd4ibpk=;
        b=QzAvT7MFQDWnd6+ebDn9P8mvAQlhCqGZCgvF/XfWUwXBjJRGE28M++c+1qQy07cX/l
         8HCZJTHSvBUvSEqQDb1j5ebax03wetg8ZF8oqQnEKm4cWYXuzD0zGqh91giWFS+zmayq
         dGpmKlz1Cv7v4/RwhgYTDckXhD/715PfCqsNXTuDLmyBLh31887P1EcRNM8cw7LpSJhI
         DmhU1a9JQB2fblefacXZoj2ftFmgMMSjVlafx+0QdeaVQ7UwM9mGp4DJUWYblhYF+Esl
         teVbvddceYsFKPX+OAbyDyTAVczHEGoMotrJrzv8Eb8bSVl6Lj3rijROdoocazGiPoWW
         XUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760277901; x=1760882701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wi4T0TH8A0fKPF3Zs0o2a/X6S5Z36f1SXjrYZd4ibpk=;
        b=lpU7EFNhZWeEOjEd3lt74WCDrjXCbaABgPzdRhcbTBVuyTOf2zERRdjcddMLax5UYQ
         Jt32v2YWZoYKtqiNhfNu8ej9kDw7Qqo/gmHo9k5CcmkeE+WA+ugN5v3+a8DsAkab2jCe
         6sMrlQytelI/pQ85o3jK5yT4uT6s/DvitJ8dLq2HmtpPlhuDjFgoLHJuaU42y73baLo1
         JvWa8bQlhsHZSDyit1IG0nWFJ7c8DRsJ28Z1Ra4Ib4tH4EoHRhbwZmMjEheU9QqLTkTm
         uf8opryYLMZVsUFfo7wB695BkinsZDpmZV9rA4ZWHpiJ2tq0SbEPkhvRLby6BHU4Z+lE
         OT7g==
X-Forwarded-Encrypted: i=1; AJvYcCVaKsZJeY8yNst2Brm4yV0CgUXLolOG1zMKfkTdEZlsU9p+kmuMQpDPIb/FDqHR/d5NcWCEZL46gXFRuMmAJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdz2crE8gbB1+Lp7cJgyQMRd2p636Sc/6d6Y6Mts9kzstVYygs
	9qqBXMjpiViatenApmfLixWNfIg9Kww3dLDbrT2NuX3RGjh2h9e/JhfW
X-Gm-Gg: ASbGncvt0besRsYqU7Il2/H+UczebE4kdaYeJqTvu6x1V45fgmLqHQ6RnCCwL2DdOdm
	vubGlJ5aOwejtLK0Mq2PF99gO976Pfl/uIr052coq5MY5lMafg52ijAPy/VziX20jonGSZQZfsG
	BPHf22t3NT6IX5o5YtseVHx1ba6i3EyOhe8e2KJuyl5TBhRGggQZarzRg+5xb/rMP4B4tozieAq
	FHEoGq+7bp3y2g07cOHsqwky7Q8V46Om3Di+UDUJelsOWwkpFsNfZ9x3IxO3MIqo6cl0nFyNu8W
	cvaFKzr05f2ROkq6Q0511ejwd10F+LQnk4BiX0e+OT3wmHT5P+YcACOCamH8r+DhXE2TFE64utJ
	5wfOByJ4VJZ9utpVQUkTpDzrDuhH7FZLDL14AG3j0aLxX/MarKGfSceM+44D21yhcWtav
X-Google-Smtp-Source: AGHT+IGavuFKFawAItq7cPjSq7/3icbEiNsjEbDay5mb/KvWr80bnaNSCF+3IOgnuF8amEVi9WUINg==
X-Received: by 2002:a17:902:db09:b0:25c:43f7:7e40 with SMTP id d9443c01a7336-29027e788c9mr237734005ad.10.1760277900591;
        Sun, 12 Oct 2025 07:05:00 -0700 (PDT)
Received: from shankari-IdeaPad.. ([49.128.169.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e4930esm106828495ad.54.2025.10.12.07.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 07:04:59 -0700 (PDT)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: Re: [PATCH 1/7] rust: block: update ARef and AlwaysRefCounted imports from sync::aref
Date: Sun, 12 Oct 2025 19:34:51 +0530
Message-Id: <20251012140451.155219-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CANiq72=ox809CAhMijbvxvy_-tx4QgJ=pGbbWfCcZR8J8XFrkg@mail.gmail.com>
References: <CANiq72=ox809CAhMijbvxvy_-tx4QgJ=pGbbWfCcZR8J8XFrkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 30, 2025 at 06:00:41PM +0200, Miguel Ojeda wrote:
>  
> Thanks, that would be appreciated -- if you can, please rebase it and
> send it on top of -rc1 when it gets published in less than 2 weeks,
> then we can apply it soon after.
> 
> Cheers,
> Miguel

Hi Miguel,

I'll resend it on top of -rc1.

I also noticed that several files have received new commits using 
types::ARef or types::AlwaysRefCounted.
I wanted to check if it would make sense to update the documentation
to reflect their new file location.
Without clear documentation, it might become increasingly difficult
to remove the re-export as soon as possible, especially as more such commits are added.

Let me know what you think.

Best regards,
Shankari
