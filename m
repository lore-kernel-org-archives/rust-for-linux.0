Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1784F381AF6
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Mar 2026 20:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654845; cv=none; b=D5P1f+WnBKSNKrAS6gAanDDFYDpCuCmcYIV91yzp0jFEUE5Y33XPDEufvQzJkk+mhKcC3qDq23cRdXM0Slvl2Ebh5Gdy8YgZ79VgzScBwPtyQe2GnBT3zDZeO6g9j+MFP6zYRXicspgEyKXP2nGhH3TpA/lWk/Gf1ht7iIv+ofc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654845; c=relaxed/simple;
	bh=EoYle/6JOsVNqnXQzbomRgDTXDfhqKNgorkD6gNFOcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KX57Vu52R0icQtQ+SVsDGGmKxdsO6xvrJZIJEIgMcjRS1iV8rpxFDnk0RzRsGZVY0Ct/VJPg1zo/Alkmzf/ZvaA8R2z7aGfKQgaghJTsntX402onRmkjk7swpbe4NbRMBOlh0F4HsAODJcpIhtf5UG1tF3hgvs6vMxYzwqDFq9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAANFyTl; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAANFyTl"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4837584120eso54597665e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Mar 2026 12:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654842; x=1773259642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiNPyYsvz+QyWtSc/HtTaNZa5g2oofeCtGK50tm8P1E=;
        b=UAANFyTlM6t14vrvIP709sxq71AF1N3tPyKlaj/UQQM/HCE2+zA2N+Gixc96yN1wa2
         16o3oDXFn0YYgp3LN+hFyvqjkL9oTbq9kOnX8r/CobD7M9PLAVmAz6PdrcgZ3fqvEeWA
         AGiNd5oc5EY2wNaNB6WdQkj4KIKtBc8bvS4Kdy8ER8/rciQ0Dhpmr0xmZ6HP+Xo9t2jK
         nBgNb1tvw8R5EGPC0LIZmNy5Mts+zizrTlAWqzwIGNxrAchaTVMmang9dWfx8YBHdnDC
         +dvwYjoQSuqWXg1vJoEMC3KNwBITsztxgXFAZOQSKhK0DpNSEjFyqojY5qZO7/9OafkK
         nFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654842; x=1773259642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZiNPyYsvz+QyWtSc/HtTaNZa5g2oofeCtGK50tm8P1E=;
        b=qBKYAYa/i29fAUp8KUsDO9wQEqEGAcccHwowByxJamEGn4yW5bjrHlinXnC5fTWJYy
         +WkONOTIT5hb8PmxHBZ44l8gdSY6dzPZ5SsgW0W0YFDwfdOzBCHmgmUxR7sw1FUlv/c6
         z8cTY0tIwHuvUCnJBLqsLXSFbfuu25hfwyFqRa9on/0vyqlYlHPf03aZb82n/y2lZonf
         oSLhp9PFZLu1Lypa+Q3YoA4SDGWy6XWXf7wzrpUofYVrDd4PquAEQ2HmSErg+8FyBgDA
         AUmVi9CNctI8Af0WlUrGki5c8z+LI3ufHx0sfmyAm/IAgxJp38wWaAEYMZT/UR8uQ/3y
         3DrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrz43or9766o3irzYZzpfJCltyRMPQxmTDwbcmasi8zrDEfroA6978R9Z5hoDCuHuMMIwG9VbgE0oOP47Log==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEV0vKbWohftdzgz6J4nKKK7WRS42RsWCYk/Oapp7r/hfzD8hU
	d/TWMZClvF+s9gGlSOw3h9keyfK/qskZQJ87LAXgIKhRAVlFuMv+pq+lphip7OGlwIo=
X-Gm-Gg: ATEYQzzC1hV0VbBRysJA+TbY+zXGhFAlaCFweLwSv485DBOsucShHU34DiI6TDuIQ6e
	/PwWRd1Jy/iotGj5NX2VrsMz4veXM9ILnkkfWWjVRev4NEpbUUpE8/XsRFdJEW9oGU8ghVcFStH
	FMuNnOhcyXyIl9hGvd2NyLI6MLiT/dvh2UDLi1znfof7LBMFpyETBTncAGmbxfHVXE388sb9UO9
	WSsGmhVB46OB75zRnbrhJkYxj8jBk1ybki/BYugSKMYluQk14z7Tfo/y71Zm3bkBvVwfMkaFv7+
	plN7WADzKIhtbJZuPKS1BN+jlu7No9bL5nsg8nPGh7V9SYw6o+5CfL0otX/qD3X8D9fBUbhVlGv
	twZVjlBCKXjw2cfaow6XT4CzjtXNocUDx+CxnYRwsXBhjqZo1bNRd02xp8zDSPbNjB3CjobzI4y
	UxzmuMizdF6JpH3/nnMyEHG4nt6yiUS+Q0nOwvB9l5N8+Zhv3qkvQ3PK+nNx7/mMTBT6D88+HTZ
	NR1QKvmfhc0qsCSC/osjOFC7NUfplTqD19jowx4g2x/UUc=
X-Received: by 2002:a05:600c:1c26:b0:483:71f7:2796 with SMTP id 5b1f17b1804b1-4851982e8bcmr55862335e9.10.1772654842178;
        Wed, 04 Mar 2026 12:07:22 -0800 (PST)
Received: from localhost.localdomain ([80.233.57.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851881224csm68872885e9.13.2026.03.04.12.07.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Mar 2026 12:07:21 -0800 (PST)
From: Edwin Toribio <edwin.toribio.j@gmail.com>
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: carlos.bilbao@kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Edwin Toribio <edwin.toribio.j@gmail.com>
Subject: [PATCH v2 0/3] docs: sp_SP: Add Rust documentation section
Date: Wed,  4 Mar 2026 20:07:10 +0000
Message-ID: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series provides the Spanish translation for the Rust documentation
section in the Linux kernel, including the quick-start guide, general 
information, and coding guidelines.

In this second version, all documents have been unified and updated to
comply with the feedback provided regarding style and technical accuracy.

Changes in v2:
- Added new translations: coding-guidelines.rst and index.rst.
- Standardized the use of "p. ej." abbreviation throughout all files.
- Fixed the Hacking section truncation in quick-start.rst.

Edwin Toribio (3):
  docs: sp_SP: Add Spanish translation for Rust quick-start
  docs: sp_SP: Add Spanish translation for Rust general information
  docs: sp_SP: Add Spanish translation for Rust coding guidelines

 .../sp_SP/rust/coding-guidelines.rst          | 543 ++++++++++++++++++
 .../sp_SP/rust/general-information.rst        | 178 ++++++
 .../translations/sp_SP/rust/index.rst         |  45 ++
 .../translations/sp_SP/rust/quick-start.rst   | 384 +++++++++++++
 4 files changed, 1150 insertions(+)
 create mode 100644 Documentation/translations/sp_SP/rust/coding-guidelines.rst
 create mode 100644 Documentation/translations/sp_SP/rust/general-information.rst
 create mode 100644 Documentation/translations/sp_SP/rust/index.rst
 create mode 100644 Documentation/translations/sp_SP/rust/quick-start.rst

-- 
2.53.0

