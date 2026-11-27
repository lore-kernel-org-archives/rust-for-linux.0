Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795802537;
	b=TLlRUhBeVZudSQYlhBMvEm6OReAPrAGXnESHqBrnZvjLJ7PzlXxg6GAjDPH0Rrc+vc1X
	 CHZXylQAlp9s2Z49RTPuzeHxFItw33/EBmXS2LFFDU4u/ZIF4WAcxzgjZm13ikw90zZOP
	 wgZuVbsOoa5pxlm4Bpuqn0S2tP9YN8FHl/xljexbDk74SeEppQ+ZHpKe6f0edGaz8IXQ/
	 FkfsTez+sTjSjgGu4q/mLJh1I815qdiZ/bP464gzhp+ex2fT5IU0ql1/P38vLBOtuM1OG
	 +D/RxtOEuPHIXqi/YTNB/2o3LdXpFG6Gq4rhQi3kiXBExZ/m0YnrufQ+Ad6B3IHjitw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802537;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=JOci3XBjqkZQ45MKD1LOdR/IG7uuNzL5T/MmP8noq+E=;
	b=eUjaYCuyCPS70T2pmzmUGUhSATCqu9MwWZABKa8hjFT4P3ZzCd7ijzI1t2JpeJH9r9vj
	 F8XMs6qPZTahTNV5P1PuRNbZh0X1IPZRZlSnNnywdID5fCe4PQ4BM6FrTOfd19DcQq298
	 pC9IE+ROFPQCqiW+KKXc1g6cwucAbqEAkwkEGhF1LmPpR0yR6rButIAIA9TAIXTkeza4u
	 LLQgVfTkLKvd/pUb0NCUM+wGVy/vFKJu2MnPeie2TEMF2qA2ZSBQOicXesBZSO69wYqhR
	 HR5+sP5IO15zq37X2323wy/kjN/Jqyg44tMkGikSgFiHvJ2tAzrYXF/Raco6Pfp70UQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=BM1OA2UD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC3B606A323;
	Fri, 27 Nov 2026 18:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC3B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=BM1OA2UD
ARC-Seal: i=1; a=rsa-sha256; t=1795802513; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XPcwBfAiPTvmyQLADH7eDsn5Fng/lUqNdtifNxdI5ljVnbLKKFOaBpoVdalwfW2tKpxR5v08vdhikGWxjN/ONlZXRXllGO3tSWQWbycX0wy0tiVvsWc/+QLvDIp7PdLPfciJTmMdcG5lzCT3JcRPgPTs0VcJWQW66VWNKiSEUTo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795802513; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JOci3XBjqkZQ45MKD1LOdR/IG7uuNzL5T/MmP8noq+E=; 
	b=V7t2Ue19u8vLs5rOq4FHcewvizTFwvPPSwV79Oa1E8/y2nFS8v5QDLy5ojePzNIQqDt2ED8BSXeJj4j+H/86OkSApL6toc87hYKaPL8dEEKq6QKemqdl3s5rzZ/peaYCfGy7terjz2ppe3fueUszuxLMMLE9j7MPjYM0ULsxSf8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=BM1OA2UD0ztPXCZkgWirIEkFsi0uLYhLjJZbdhblQJOEgf4CVjnhID7ptaEGkcOMhLP7SW39Pd9xRn4skUFtikxwmWsnwVAe7b3K3d0kpQ0qV32Ogl9E4zzQx8LkPCf3pCnnofnpKUTTOydFYnvNTQyKcOCJrmu2q8gA5GYvIJg=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=JOci3XBjqkZQ45MKD1LOdR/IG7uuNzL5T/MmP8noq+E=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795802510880415.4357816413576;
	Fri, 27 Nov 2026 10:01:50 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 27 Nov 2026 15:01:39 -0300
Subject: [PATCH RESEND 3/3] drm/tyr: reject firmware sections with
 oversized data
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-tyr-fw-parser-v1-3-8aab2a711f9b@collabora.com>
References: <20261127-tyr-fw-parser-v1-0-8aab2a711f9b@collabora.com>
In-Reply-To: <20261127-tyr-fw-parser-v1-0-8aab2a711f9b@collabora.com>
To: dakr@kernel.org, simona@ffwll.ch, airlied@gmail.com, 
 aliceryhl@google.com
Cc: Sami Tolvanen <samitolvanen@google.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

Firmware::new() creates a BO of the size of a section's VA range and
copies the section's data into it. Data larger than the range is only
caught at the copy, after the BO is created and mapped, and the data of
a section with an empty VA range is dropped without a message.

Reject both in FwParser::parse_section_entry(), as panthor does, and add
a test for each case.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/fw/parser.rs | 44 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/tyr/fw/parser.rs b/drivers/gpu/drm/tyr/fw/parser.rs
index 133b63c5cff1..43e7599f6622 100644
--- a/drivers/gpu/drm/tyr/fw/parser.rs
+++ b/drivers/gpu/drm/tyr/fw/parser.rs
@@ -374,6 +374,14 @@ fn parse_section_entry(
             return Err(EINVAL);
         }
 
+        if section_hdr.data.len() > section_hdr.va.len() {
+            dev_err!(
+                entry_cursor.dev,
+                "Firmware corrupted, section data exceeds section size"
+            );
+            return Err(EINVAL);
+        }
+
         if section_hdr.va.is_empty() {
             return Ok(None);
         }
@@ -859,6 +867,8 @@ fn section_va_end_before_start() {
         let mut image = Image::new();
         // The VA range ends at 0x1000.
         image.entries[0].va.start = 0x2000;
+        // Without data, the VA range is the section's only defect.
+        image.entries[0].data.end = 68;
         assert_eq!(image.parse().err(), Some(EINVAL));
     }
 
@@ -920,4 +930,38 @@ fn overlapping_sections() {
         image.entries[1].va = second..second + 0x3000;
         assert_eq!(image.parse().err(), Some(EINVAL));
     }
+
+    /// Section data that is larger than the VA range of the section is rejected.
+    #[test]
+    fn section_data_larger_than_va_range() {
+        let mut image = Image::new();
+        // The first section spans one page and its data starts at byte 68. The file holds one page
+        // and one byte of data.
+        image.data_size = 0x1001;
+
+        // One page of data fits.
+        image.entries[0].data.end = 68 + 0x1000;
+        assert!(image.parse().is_ok());
+
+        // One more byte does not.
+        image.entries[0].data.end = 68 + 0x1001;
+        assert_eq!(image.parse().err(), Some(EINVAL));
+    }
+
+    /// Section data in a section with an empty VA range is rejected.
+    #[test]
+    fn section_data_in_empty_va_range() -> Result {
+        let mut image = Image::new();
+        image.entries[0].va.end = 0x0;
+
+        // Without data, the section is skipped.
+        image.entries[0].data.end = 68;
+        assert_eq!(image.parse()?.len(), 1);
+
+        // With 4 bytes of data, it is rejected.
+        image.entries[0].data.end = 72;
+        assert_eq!(image.parse().err(), Some(EINVAL));
+
+        Ok(())
+    }
 }

-- 
2.56.0

