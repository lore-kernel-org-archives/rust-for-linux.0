Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE8BC2FF;
	Thu, 19 Feb 2026 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771503628; cv=none; b=NklQ2GTuAu1V/XQUJPeiiMZN21skScjRS/x8kbaYr2PVSNkPZ9MXFML5/ZZVo4uEvaBseeORxQ7EtthsE7xnlejPBBNHbWELnFfTvkOb1uhJIyiJLvDDsrPjjAUH69JCqVzwoP9poC+RggGrgOo2BtfKAjJfIMGu0hXTYLP9FwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771503628; c=relaxed/simple;
	bh=mHjte9lI5Gmt5svDvvLUdn3v9tmesGbyfiXJVcu7nx8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SoZqlBsePHjLxvvmWItIaZrvTyh2A07ES717oExNRze+KxYWOtZAj/D8qowchQhQPaR4UFIFofos02NQEjwOTxmX8G3eMoEENN28G/zynFpoLMjBddwhFywJ60V1PX+qm48JsmXJMPphsoPUJFExy+tV26coW1r28XDQOMAeq+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgXt+Fol; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgXt+Fol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4614EC19423;
	Thu, 19 Feb 2026 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771503628;
	bh=mHjte9lI5Gmt5svDvvLUdn3v9tmesGbyfiXJVcu7nx8=;
	h=From:Subject:Date:To:Cc:From;
	b=WgXt+FolFY56d4AoFRxfEnxWdHK87lswl1eBTpC49d372bcr/9c9k2y2qx9iChvJd
	 JXscfMM5xgh2aP56tqpMkb5ryjKuR2QZbYWkcLDkLLcFimPFApkXiLlhHarX/epFEc
	 WPFsJzhA1WxitjBA3RBzPu4paXrs77ni40L6D3lgvzc9UlH90FwG+o1ARYNlOp8ro2
	 Gr7PEgdUGoqCWb214IKydprmfxs1Ht4m3UMnwinIzXBMv5fbPNS27GL3f2jgYwOEN6
	 Si5bzGILiXUYR/2TOoguAVR77Hj3eacBIn8LMzPHn5ft5IIdXJ5xGaobShU/n726dR
	 eo/t0HOTlZ3Bw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v2 0/2] rust: atomic: add `fetch_sub` and update docs
Date: Thu, 19 Feb 2026 13:20:08 +0100
Message-Id: <20260219-atomic-sub-v2-0-8bd99cadf26d@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPj/lmkC/23MQQ7CIBCF4as0sxYDk4jVlfcwXQAd2okKBirRN
 Nxd7Nrl/5L3rZApMWU4dyskKpw5hha468DNJkwkeGwNKFFLhb0wS3ywE/llBXqvDieNo1cI7fB
 M5Pm9Ydeh9cx5iemz2UX91r9MUUIJ3zttrLNW6uPlRinQfR/TBEOt9QvoAop0pQAAAA==
X-Change-ID: 20260128-atomic-sub-2ff15962df12
To: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=799; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=mHjte9lI5Gmt5svDvvLUdn3v9tmesGbyfiXJVcu7nx8=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBplv/59QGJ9XXls+uSYvdXjXhgKAkC/T6ykOz5C
 KH2hH1X4RSJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZb/+QAKCRDhuBo+eShj
 d/mnD/9LGkYpCl7MehQj6MbpwOnj+Jv/facRew8W8o+4BDUv5ZIZm+VN5em416/Q+WXlIUwe4BD
 Pd1un/mf3UdwkPNOPxpvV/IoZn3Uto3jCloNqBtrNZ+48/2u51g6R4TWhOZvuNwenCkiWYXnHoZ
 9blIGam2RrAEYMTey8N2z/s7q3Ls4jD3E7DvzcvayNI8ilV2576m+Oanbg9b9BEL9frdQDOc6zs
 JHQhVbN1LB2LyZJs7bRHQiRw3hLCYBtXQjZUlGRKIZabtvecRTRqXi83tPsWokSXcMGdIqYDOBa
 sE3beFnFDst+U0l9iaBqOsne4YF48fN+d6YW9mrTytB5oc3OVO9wQQOc1iGkLzPhm7xZ5ZvXlpV
 ytjrt6D4xqWqRW/cF0e0a+NIrTmVQ938yDT0qa8w8I9L/BlMSFlbmYVM7eGVb0W10fev19Vd0iB
 SihE8faYRJ94KWJ9U0L19FTMal8PH5trUG6hRmv5BSst1Otki6S8lIGNRtNAjJjAcvVTeCbHZ2V
 43rAQLkfuS8FIeWGtbWlEQMtSAMbLAltlITHznvXr5LQR0l9NxcigNSI8fDrflgF+GxZb1jPuaY
 DIfMIRsO6L+1IaSCr0VG9pWPsgziNUUklC4MmtO2YejI1d0ubNozbbqmlr2Ucn9tVKIhjcmrq77
 2FTT7nneqke/L4w==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add `fetch_sub` and improve documentation of `fetch_add`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v2:
- Update example to be more clear.
- Add a patch that updates documentation for `fetch_add`.
- Link to v1: https://lore.kernel.org/r/20260128-atomic-sub-v1-1-f8c6abcbb067@kernel.org

---
Andreas Hindborg (2):
      rust: atomic: add fetch_sub
      rust: atomic: update documentation for `fetch_add`

 rust/kernel/sync/atomic.rs          | 52 +++++++++++++++++++++++++++++++++----
 rust/kernel/sync/atomic/internal.rs |  5 ++++
 2 files changed, 52 insertions(+), 5 deletions(-)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260128-atomic-sub-2ff15962df12

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


