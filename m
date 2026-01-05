Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B1430E83F
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 21:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767649082; cv=none; b=la9+pVqPr8ea0Fy3g/CV94pxSMtujzBpMAvUJkb3W7qispC/O+a2l7ncNEC33veoHMIYgByTzsH721KYYjKPRlIdvZemsODvqffX17nFW3NaSVpX+E2PaKhanBRFTQNWuoai9jmDYAIvJjtHy1E02Y8Ab5C3Fm1rGSBdOpZgXtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767649082; c=relaxed/simple;
	bh=3VvKwjncE+fi9dt3jmAeaAVa0VgbTIvjNM+szL3TTHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLAaAGna8n44DtVGu072ZDK8yghjya4MsCpFkSb4P4n45YWvNK8hrOnC1Ca97nnRezs2eghXtSUDa5FdIBbweRxOot8y1n7zDc80+p+s0V4YYY7Y70ex6T6jvWaDC/gPlfnjSp8Qh3csKtSZfm+cQ66JY+42oa8Qgg5VvYwbj60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info; spf=pass smtp.mailfrom=markoturk.info; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=markoturk.info
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so450725a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 13:38:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767649079; x=1768253879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVGhBLas13Sdkp9EBZQEtNUtaw958v3jSwy9njwz9xM=;
        b=k/Ap8OqGiIJWSRuR0yrctC0Yl/dYB5ZzHfHGBQH73Y/hZPbg1Yav1BgXbD3m/OqkA5
         S9q7CvXHgyY5hIRTbOodd6Jr+uze/V8f9NvCrKy6yN4TfM2LchAvylxk5uj9RrFGNXh2
         6n4WRPgfAc5jDnPsV1owhvFGgHWhFbMgD2VCIrCwk/MA990FgJT97uCwse5M06lZFEWm
         yUrUqsV9Es+eqIFoQqS6gcxGooRNiOxeb0tKVgR+w1kOQeHpgHBapwPfV/HkRTHCR969
         L69wr3Cim7rtcqXvQvq08EY98Bp3ch11WACukNZzu7uXLpPBCvr+8xsbQ/cgoUtN3yPz
         4epQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq7jEb0kffIGU1udpgoTjYMuBuqWtSFms+uHr1smSy+S2marqBG7ozjx75SKhDMkAV9LClKbBWnJu5nRSCEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA0MAuCRQl/nMCf17o6oadNWrV+gVybkDMaLB8HxkAVYY39VpC
	GY21hZcrzA4P4r8XOB8RPE1Mo1MJyD9tz5S/T1j8VpH4SFkTQzBrrkF9ds+we2GSr10=
X-Gm-Gg: AY/fxX5m2joht1YayEUOzS6HwsgZvKDnRvfqc6FS4LYMbH8HliJG1mjkI96cTo+QxGR
	YvHAgoc1i+YneA2H17iXvbR78ls4yxqC9IXyL//tG6/fhBpqHjBCPnlHjR+NVGPu/f/LUD4T8RZ
	YOGmWNcjbJ3Q7RuVozQ6YL6Fwx84pb+0En1YPDNcAMKHj1uhRoCR9RCtGkkNWFdplrC/bi8X0xz
	hmfOJ1R9KJB3Ly0VOqC2EmTAw/1fYiDrjRSRIz3TOhQ2nDiygSjb7cYYC54tDzZNybzEIpeNQ7w
	tAXkK1AzEIM/ZMbocHpWDeR4tHhQcMWRPZRF9Xwyjq4+7r66py0JQu2YKB+mgKkNhDTwdEXjy5y
	IS4E9BSgIro5Wc6R+494bw7Pt9M4Bw6TVKD2+BHEDpOOgEg7SrZ+9tTwzxPs8wEukLx9FOFGgpw
	/CUotLWw3Z8cg=
X-Google-Smtp-Source: AGHT+IE7l7WtiE+uRHtEnaDDT+H8lvK5cKT1MXIQsQUNDiS4uD4MKy8ZfA8QmvMTwSezMWz92pqwZg==
X-Received: by 2002:a17:906:c143:b0:b73:5e4d:fae0 with SMTP id a640c23a62f3a-b8426a7fa3bmr94121466b.23.1767649078733;
        Mon, 05 Jan 2026 13:37:58 -0800 (PST)
Received: from vps.markoturk.info ([109.60.4.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d3831sm35034466b.44.2026.01.05.13.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 13:37:58 -0800 (PST)
Date: Mon, 5 Jan 2026 22:37:57 +0100
From: Marko Turk <mt@markoturk.info>
To: dakr@kernel.org, dirk.behme@de.bosch.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	mt@markoturk.info
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Marko Turk <mt@markoturk.info>
Subject: [PATCH v2 2/2] rust: pci: fix typos in Bar struct's comments
Message-ID: <20260105213726.73000-2-mt@markoturk.info>
References: <20260105213726.73000-1-mt@markoturk.info>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105213726.73000-1-mt@markoturk.info>
X-Mailer: git-send-email 2.51.0

Fix a typo in the doc-comment of the Bar structure: 'inststance ->
instance'.

Add also 'is' to the comment inside Bar's `new()` function (suggested
by Dirk):
// `pdev` is valid by the invariants of `Device`.

Fixes: bf9651f84b4e ("rust: pci: implement I/O mappable `pci::Bar`")
Suggested-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Marko Turk <mt@markoturk.info>
---
Changes since v1:
  - updated commit msg
  - added Fixes: tag
  - fixed another typo as suggested by Dirk

Link to v1: https://lore.kernel.org/lkml/20260103143119.96095-1-mt@markoturk.info/

 rust/kernel/pci/io.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/pci/io.rs b/rust/kernel/pci/io.rs
index 0d55c3139b6f..82a4f1eba2f5 100644
--- a/rust/kernel/pci/io.rs
+++ b/rust/kernel/pci/io.rs
@@ -20,7 +20,7 @@
 ///
 /// # Invariants
 ///
-/// `Bar` always holds an `IoRaw` inststance that holds a valid pointer to the start of the I/O
+/// `Bar` always holds an `IoRaw` instance that holds a valid pointer to the start of the I/O
 /// memory mapped PCI BAR and its size.
 pub struct Bar<const SIZE: usize = 0> {
     pdev: ARef<Device>,
@@ -54,7 +54,7 @@ pub(super) fn new(pdev: &Device, num: u32, name: &CStr) -> Result<Self> {
         let ioptr: usize = unsafe { bindings::pci_iomap(pdev.as_raw(), num, 0) } as usize;
         if ioptr == 0 {
             // SAFETY:
-            // `pdev` valid by the invariants of `Device`.
+            // `pdev` is valid by the invariants of `Device`.
             // `num` is checked for validity by a previous call to `Device::resource_len`.
             unsafe { bindings::pci_release_region(pdev.as_raw(), num) };
             return Err(ENOMEM);
-- 
2.51.0

