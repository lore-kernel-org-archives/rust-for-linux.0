Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B601BBBEA;
	Tue, 21 Jan 2025 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737449322; cv=none; b=u9rU+a5Jcczfb9M2eojEusjrlzOKB9NUhoGtopHwEMPMkVq/qLpbR18mCrI81PYgr0g/CcjTGnMLt1XBoCIXkG2YZp2nPWLFQTrsy3RRrjRRZum1JYNude0Zq43bVUlGXHmLE+Jx2bgUxn/nGm4WW51QNtT0x1DuN4LYwnwlmgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737449322; c=relaxed/simple;
	bh=ll0P9IfFa7p/1ScsbSL5ZIC9Tt28lrzdPJ+txKSWBpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uvos/Z6bZD+HnJXSrYaTQyPzLXDi0jXqPD2QbbTPGDERIO//qKMcmv0A6icjQYfSZ1HyCsPI8r+l7BQApJyS8tbRTQtz/yGfZkRRrcvLl3fW/lshlyXXXo4A7rH27+iB/LLA7XivbmkLJvwTJ+LrBSXD5MP/wPMkddN5mNOzfvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKDY+FTJ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKDY+FTJ"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-307325f2436so36291901fa.0;
        Tue, 21 Jan 2025 00:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737449318; x=1738054118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6t/NfctZQzCLSp1/vL00MczYX8ztZK8ZRUybzG+0jo8=;
        b=mKDY+FTJAH+VVSAV0Qe50bEYQ0jTsw+CcbjT87+DQh+3bZaU43JEF3c57UCxvo4dnA
         7rg4jRZv/n8Rvgwaxo/I54tEd81MWNwRVk4za/5B3cYahSiGie4sRVyzRtwJoqN1OhWr
         rqylT7WN5ddlYR52rm2O2VfXSHRheC0Qh6le85ipvbPUQhPFIUC3cVdsXLAGNOO0Q4hB
         kBpoRE830K3XAIzy6LyIs6pE+M1b3I9xQ0fkkIwtWyO3jF6C8Uy0HCpUF7vyqgf7iv57
         YYVFiS6l1hq9inwPcqw3zz7ti/YgtzPJmd4MSpPWB0TgkwJ+m1P6hGP357cdUqZPTMET
         paeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737449318; x=1738054118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6t/NfctZQzCLSp1/vL00MczYX8ztZK8ZRUybzG+0jo8=;
        b=DZV4jlj3G2V1KsqFeg+Y8bkQUSoVpJIBX9tYbR4hpLOTJ7s26Drmp+Ch1WYbyx6P/0
         cPrLOuEhlUjC9AFP5ic4yf5GEEFhR1hA8Jr3k96I4m7kTOijoH1/zVvcbYaxfz+Wzr0v
         KIby9OE4miYm8Co2G5fAYe7lPnDMgPlZiwM3N1v+UEvucZKyI2JmIs/yoEMXLrnUIFIS
         +0eLihBWLy5XL8+p/W/C1Oaf/OnD67MZ+r2RWHVBukHATm1Ie0oGDbl+3uGlFPOiywfg
         DtSJpo9KvL6rdi0SjjL1ykyFHyzh0HvMyz1bquVhWwyMlc5ru9glHKgzJUX+mk0MBVWA
         4aaA==
X-Forwarded-Encrypted: i=1; AJvYcCW6vvnH+fR1RXuuKfgo+liau+ZHV1UNeXCvq60QBG021yhdn95eJAvOWMdUx6tK8sYy2LBlH/Pl0eS2YFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg7DpPHFK4PCHEJ28qfPUvhSJw9uv+KVlO/5nmAQDsHRiQFPLQ
	yKXOWVgeYWlKVEL8irnbnSoP4hd3cYT63rlV8Cz2QkmNF6AKAS34UDQ4sQ==
X-Gm-Gg: ASbGnctozxpkX6ZAFZbwpqZ1/hXvJNAJnUb6hUNyipHloYG2r7THGjWyta9D6DIgAuX
	zbsxxLPe9pRKXngnjqqLV6fqAy3iPutVmqdui+qXDYRXAIl1lcSazOuYKYj+VR6VlO/jjIL4Wv7
	P0xo47bNZuASxeM8Rt0Glt04h/kQQOxNbZzUL7VM0Kt1hLmvD35t6t9UEPCoF909A9W3v5mJWf7
	6iIubAAFXG9F+C2T8yE8JLWimFo3S86qZXuTZKck08JjpqTnXW44ugXn6sTlJD4PGprJx1ePfBZ
	lAEc5Gsqprw26GqPILobrfRyT5C3/nF9ZwV+jiAM
X-Google-Smtp-Source: AGHT+IEO9HiGi43wrj6DPjuve1YnbSDtbMLQpjtAFXaxo39GOA22EUsPUeQtUvgAJad6Hc8blBYA0w==
X-Received: by 2002:a05:651c:993:b0:300:31db:a782 with SMTP id 38308e7fff4ca-3072ca5bccfmr59602761fa.6.1737449317996;
        Tue, 21 Jan 2025 00:48:37 -0800 (PST)
Received: from abj-NUC9VXQNX.. (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a4ed5c7sm21178651fa.82.2025.01.21.00.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 00:48:36 -0800 (PST)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: rust-for-linux@vger.kernel.org,
	daniel.almeida@collabora.com,
	dakr@kernel.org,
	robin.murphy@arm.com,
	daniel@sedlak.dev
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kernel@vger.kernel.org (open list),
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	airlied@redhat.com,
	iommu@lists.linux.dev (open list:DMA MAPPING HELPERS),
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH v9 1/3] rust: error: Add EOVERFLOW
Date: Tue, 21 Jan 2025 10:47:45 +0200
Message-ID: <20250121084756.1051758-2-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121084756.1051758-1-abdiel.janulgue@gmail.com>
References: <20250121084756.1051758-1-abdiel.janulgue@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trivial addition for missing EOVERFLOW error. This is used by a
subsequent patch that might require returning EOVERFLOW as a result
of `checked_mul`.

Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index f6ecf09cb65f..1e510181432c 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -64,6 +64,7 @@ macro_rules! declare_err {
     declare_err!(EPIPE, "Broken pipe.");
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
+    declare_err!(EOVERFLOW, "Value too large for defined data type.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");
-- 
2.43.0

