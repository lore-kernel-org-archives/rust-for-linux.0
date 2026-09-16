Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C874B826D
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Sep 2026 16:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577184; cv=none; b=l78c/Vuqf05aw7onvVNrPf0XF8gG8gLiK0gOMlRL57uC2u9m8pnB57CFNVV5sF03RpMuslVgNI9IjmlzqADIXjIAosPRZvWuXj9aT2ThB/s+usgXHC8LFWDX4PcSxwtrncDhU3SlzXqtMQi4oHYJA7hkklnxNokx5tlmzX0TUVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577184; c=relaxed/simple;
	bh=1fs5/9PJdlbuBhTs0ZxkDNW+v2WItpOPk3QzGFWOdbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jpu/vNOSbzqqr2mdd2toRyFkio5yA2jnBO/yCquqOvB6Lo/KAfNs3prw5bIq2Ar69Qia1+hwg+39z3Lb6gvjHMWcARWij31upUpoynbjyCel53ors4UvyEvur/xDKfqFWXVu6mj1EhPESiuAu+3C+blLZdTNyiBSI2zEhEWDdq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMSLSCTc; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMSLSCTc"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so1082999a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Sep 2026 09:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789577171; x=1790181971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1fs5/9PJdlbuBhTs0ZxkDNW+v2WItpOPk3QzGFWOdbk=;
        b=QMSLSCTcLtJ+AiMJ6XECO+C16YHQOAZXJqddh+1hwfr5SVCU4HFWiTSJa1dhNOAfge
         pfYOyTxgh+G7+nYzG29DcTK0mbanmL4Ki5CnnFA1nBDvUO6vmqKWePAB+FZ5FpUy7ybf
         NvpmQd8hmW1D58fLfNxQ2IO4hTT5eo54DBnXZzh2iajCO69bt2cf5NtANoLSgFqyO5/A
         9LEmXnDntVcj3+khqajRkChzL+EBb5PV7pHymXnMoVk6pz3eKRz4jysRegqRDLaw73Fi
         qXC75IwpNB6FudUN9Cqwzv40xMcW2rJfnS4fRbIUZsdSRYywhbx5SH4WUeYfZTSmmPUN
         0lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577171; x=1790181971;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fs5/9PJdlbuBhTs0ZxkDNW+v2WItpOPk3QzGFWOdbk=;
        b=Mdkvi5I665tW6vmCQXCl9Kypu0dX24CBO8HskekXpGuWc8zlfkVjBv6KAxwGqfuRji
         v3ZVZqa8kADcOdhxxIsgd25XCHhJY1Li59fHgp1yBBEfheLur+nDFl3AMQ7OQWHYr1eK
         opYqFRkgqYB9EFnJViMpOZq77lbbfbwRR9FHRYIy7xxvHMvt9XOu5EHEDN3XoHVFutwe
         LV/mZ/WHry7BcOSQp0IHiKhsp/AEJvpQ5McUrOiDuE0TiF84vMJJ7TMW4NcOY33DvIKu
         raMftpnkBY/5rlugAqMEjVskssgjySIVAuu8EGWcXRHDr45ankUGsXFxBDbj0hWMNR3C
         1Hig==
X-Forwarded-Encrypted: i=1; AKwUvBx2JbIgGsfRwSjqEseXQqGmf0JcJEuDt1R5dsUyzubGonufSZnvKRdOVv8knX1F4jUc8UBPaO0Ka3zFP1bSHg==@vger.kernel.org
X-Gm-Message-State: AFuF++mlzI7Ob7KJf2u9++/dUgHnXNMxpDmiVqPwdYmRoRVhbItHxD0O
	F383oA7YtQE1FsnG6dFZIMej4CKxruZ8Q7kmRM6VozNAaiWwzeipT5fq
X-Gm-Gg: AYBFou2GaBkffYUKengP4vpzNW3s83mQ65tTu+zJZ4BrfP7JQ6fptP0fZvjNcqiUddY
	f8JwC85zIaev7V5kazMqXQ0P3TXIN4qi6PXxHNkli5lAfaqEjoz93E8MXb33GI1Fkn6GQNH9vzK
	kJ5iA75aCX06fnARmzwvD1KWYkFLiSTQGCVveUTiMImEiaeouX/c/0SaDGrQQ0gZyiB9M76pGQ0
	Gf0mdNroeGdXwrAxCfGj/A+mPUMcOL0wGzQb0d68fpOsZOQIRberp0XqYG+9bVoSoHfgab4PNA9
	C6twmxAh823F8VZGGeqVa/ILbLp/iWzKyuRukKXkY5zk6xbeSO4zZy+iS9RZa7sGPNbJuBu9bY1
	Vqf7/IxdMHk1Q8E3XRbysm3gdS9pO0SWQvpicVIz7uFvP1CC9ZGZRb/vC3EOmz7rKB/iAA+PT3H
	Foo6izU0Cb65eVT/GXxn5pO68ydODdgQQcSHg7wvhm2RhSEyASbO+zsjTo1i3j6UK4sQ==
X-Received: by 2002:a17:90b:560d:b0:39b:3109:10ce with SMTP id 98e67ed59e1d1-39e1e45cbaemr7258907a91.16.1789577170531;
        Wed, 16 Sep 2026 09:46:10 -0700 (PDT)
Received: from jm-X870 ([2001:e60:20dd:7c28:de1c:fff7:d3a4:d8c7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm292100a91.9.2026.09.16.09.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:46:09 -0700 (PDT)
From: Jaemyung Lee <ldc.jml@gmail.com>
X-Google-Original-From: Jaemyung Lee <jaemyung.lee@samsung.com>
To: Bean Huo <beanhuo@iokpp.de>
Cc: Jaemyung Lee <jaemyung.lee@samsung.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	work@onurozkan.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RFC] drivers/rufs: add Rust UFS host controller driver
Date: Thu, 17 Sep 2026 01:46:01 +0900
Message-ID: <20260916164601.2562349-1-jaemyung.lee@samsung.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <4c38f13af8f75020fefc35827463e9bc643b99f4.camel@iokpp.de>
References: <20260912-rufs-private-v1-1-716db733e655@samsung.com> <4c38f13af8f75020fefc35827463e9bc643b99f4.camel@iokpp.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 2026-09-11 at 23:44 +0200, Bean Huo wrote:
> You still use scsi everywhere in your implementation protocol/scsi.rs
> builds READ_10/16, WRITE_10/16, SYNCHRONIZE_CACHE and UNMAP CDB, so
> "decouple UFS from SCSI" really means "copy a small part of sd and the
> SCSI error handling into a UFS driver." while JEDEC defines the UFS
> application layer as SCSI, the SCSI work doesn't go away, you just move
> somewhere else, and it has to be written again.

I agree. By "decouple" I meant independence from the Linux SCSI mid-layer,
not removal of the SCSI command set from UFS.

The current RFC has CDB construction and only a small part of completion
disposition. It does not yet implement enough sense, retry, recovery, and
disk behavior to show that the complete UFS-specific version is smaller or
simpler. The cover letter stated that conclusion too early.

> The "friction" claim is weak. SCSI has already been changed to fit UFS.
> Two examples: UFS now uses SCSI simple copy, group number in scsi write
> command.
>
> I doubt how far this can go. do we really need to pay effort for a new
> RUST UFS driver, I am not very confident, unless SCSI is removed from the
> UFS spec and JEDEC defines native UFS commands, or we talk to the device
> directly with UPIU. please name the JEDEC feature that the SCSI midlayer
> really blocked, or that was historial issue which has been fixed.

Also fair. I cannot currently name a public JEDEC feature that was
shown to be impossible to implement because of the SCSI mid-layer.

One of my main motivations was the amount of cross-layer reasoning needed
for product EH and PM problems. In product work, I often had to follow UFS
state, generic SCSI recovery state, block queue state, and device-PM state
together. That experience is a reason to investigate another design, but
private product experience is not proof that the upstream architecture is
wrong.

> I would also like to see the heavy and hard parts, because they are the
> parts that decide if this design worrks:
>
> 1, error handling: abort, LU reset, retries with limits, sense decoding,
> this is the very hard part of UFS driver.
>
> 2, user-space tools interface: SG_IO and bsg (sg3_utils, ufs-utils, FFU
> with WRITE BUFFER), and the UFS sysfs tree..

I agree. These are architecture requirements, not small follow-up features.
Before claiming that standalone is useful, the design needs to cover
timeout, abort, LU and host recovery, bounded retries, sense and Unit
Attention, late completion, DMA safety, PM-aware recovery, and request
disposition.

I think the next step should be to document these responsibilities and
compare the standalone design with improving `ufshcd` before completing a
second implementation. If RUFS only reproduces the same behavior and
complexity, the standalone design would need to be reconsidered.

> Did any AI tool help write this code? If so, please add the Assisted-by:
> tag.

Yes. An LLM helped during reviewing, testing and preparation of the
submission. I will add the tag required by the current kernel documentation
in the next revision:

Assisted-by: LLM

Regards,
Jaemyung
