Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A515118BBAE
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 14:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767450696; cv=none; b=gBuY2tPNdZ224zUBZutW5HJS3c4SD35oZVqgjsVDNnC/HR66GvkfHlVY58T5TIUE0KQq4VsvVjRalXIS3lBC9v1r3Z6PMKy3Kw/2AyHRR8nFNWSczQ5sZI2Yn92RQSqwjzy1un5VyLNKvpgY9z15cX1QJrAP6eGU8lyyz01XWsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767450696; c=relaxed/simple;
	bh=OjJEHZbX9DUZYNV7p8GKg1sdBCh5/HJWJkWeJDu+dDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tyWQRTaIwvpGc98k2nYjqwg5swUCRjgbEK4rRKbIi82rlRTAB/VHcaf9nHQtJMSzY0Jm1sgodl1hjmrAxI4pkbw0+vEXAGjEv7ytdhT1+FT4Py2WU7irhM66feBpbMOP3sgiWJYTmk80X3NYY38kP9XaWQ9cQcWuFketQSzJeSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info; spf=pass smtp.mailfrom=markoturk.info; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=markoturk.info
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7eff205947so1795170366b.1
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 06:31:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767450693; x=1768055493;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+AYUNRl9rbLXc2HwT5sVlUQnauM+p95hRATJcoDG+eg=;
        b=qCxwQJa2qx9FTRmKzusk4n9/KqDtK6AH5dZB6+U+/OdosPIXRtOQSAVADfPPj7xePc
         8YDfYSLsLvnmFV8Fyh346tihOI+3IWlCMg/dhHg9NAj1Hq4Y+v1eD2v7dNN7fi2ZYLvc
         EvaAIYjsxEw1OI4UkzVkeFmV4Cy9mKETcYrmg/fG+Fa5oN5dBQcNbAX3lbctkTehnLtR
         fUFMBgm0/JAbHkGHmD01DZuxAgMPiItV7mKhhiLonN9YswIsiCmJ00cFnluvxvK61pbL
         cdR/8TK24STrd4jRcT02vnPs1ZOabn0hzomg/PBx9FTLGcFa10FayO43sZMJonNlcNfA
         qFtg==
X-Forwarded-Encrypted: i=1; AJvYcCU8DYnNRy49SDZX6UJeEYfMLIpQgxfP9lbf9tFWVS5iTLWnzC7481VVVprxygNRZbInaEEj6xxhWWhDbElyjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRt+k/CANt2r+fWGSQx6cnIJZKzZ121jQ6e/RINd0WzwC810/g
	E8+alSVvO8bgUOSQdhB2igb5JBIkX4WTyuOPZmtyhE1zXTnEWChVb8oqWjF3XYAqEYIiVXgP1hf
	1VWiN
X-Gm-Gg: AY/fxX736eV6wlK62jMaMD8/EdatVOD/njuPB9ryEL6RWBjK3YcVO0X/xvWKrPvwpxT
	DWZ4GLa10a055BTm6jAenfK8FHM1biPkPlgEF+zf+MkmbD1fwmfVVKNEmy3KW4eZHeL+D7XN0Cw
	KEUbj6vKCNsOdZvEOIkrsVywAZ/Bz5hsk81WW3JwplZVnTG9BRGNUOlfET0/M1tPsqPoKGMAwtW
	kCji3RWMv6wZZ1vHRF6Yt478OqnfoVC7/3b3iB0NcxeeeRu5YM8s4ls1KHDcrBmudW6w/olMBbH
	babKTWCa8rOL0dEn6et9PIdRGzgDxV32/E5qiwWtOQRPdzUZy0lIZM6SeKg0pPZXD7sILz0EjJO
	HokL6P/bgUfqi9ASbHi3cv9xU9EDupO6wn00tICNyXHlVy7y5N02iEhTucamCkBswYzuqix2LRq
	PG1GyqngOOOLIdJWoy7guYYw==
X-Google-Smtp-Source: AGHT+IEZpVXonSoNsNw9e1t4FvmQEeUM7GlEnGV5J/HtRKd9w8z0N4bgG9lfpaveMKQWaK8M1hT5WA==
X-Received: by 2002:a17:907:6094:b0:b73:9368:ad5e with SMTP id a640c23a62f3a-b8037051288mr4580991066b.34.1767450692708;
        Sat, 03 Jan 2026 06:31:32 -0800 (PST)
Received: from vps.markoturk.info ([109.60.4.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad83dasm5130254766b.25.2026.01.03.06.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 06:31:32 -0800 (PST)
Date: Sat, 3 Jan 2026 15:31:30 +0100
From: Marko Turk <mt@markoturk.info>
To: dakr@kernel.org, dirk.behme@de.bosch.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	mt@markoturk.info
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Marko Turk <mt@markoturk.info>
Subject: [PATCH 1/2] rust: io: fix Bar reference in Io struct's comment
Message-ID: <20260103143119.96095-1-mt@markoturk.info>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.0

Bar was moved to a separate pci::io module, update the reference to it.

Signed-off-by: Marko Turk <mt@markoturk.info>
---
 rust/kernel/io.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 98e8b84e68d1..08853f32dae6 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -87,7 +87,7 @@ pub fn maxsize(&self) -> usize {
 /// };
 /// use core::ops::Deref;
 ///
-/// // See also [`pci::Bar`] for a real example.
+/// // See also [`pci::io::Bar`] for a real example.
 /// struct IoMem<const SIZE: usize>(IoRaw<SIZE>);
 ///
 /// impl<const SIZE: usize> IoMem<SIZE> {
-- 
2.51.0

