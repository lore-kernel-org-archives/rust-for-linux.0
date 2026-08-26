Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DC246AA79
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762092; cv=none; b=WiMUMfbnSxDZ9EcGAGR0ytF99jZV7Eq6oHFAAB/vgL7PywGZKrkMd7YuhICij3e/qLeiNI0IM0SPiJObx4ybTJ8Fa34y+CcaR00CGxz0XuNFK1ZOZEDuCHpmBmJn1dFHWsKLhef/OjT2AyckIJh7DdRsoXLYFDJ7Eoi3Ggf+pZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762092; c=relaxed/simple;
	bh=pBwD4hpTA2I4ntppMh0+YHRQQVpa9nO3hinYzYrnGK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9kzRapM4unQjN7fTPgUwG40ewYVoO/6fI4BJozCVdyyBicJxzE/OsiDsNWOykVxqyRa+MRfRj4tiGAeDiHykS1svi66B3JS6prc+KZ4oYwL7nXcEjgjgrcBuv41qi8Tzk6RD3foIuBcJjTLejnCZ7/cwZD+K4T2g8OqEms68G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=dg3mppEu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="dg3mppEu"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49954b88fffso9792315e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762084; x=1788366884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7iMM34EcFPmhnGpJzLucaa/0lRT/oiuDhD8v2Q+RQs=;
        b=dg3mppEuBkHY4YMkHJSbcHGYNiBnUJ0vnlMypFdphJByeFekR2ji02U0n2OCDbrFO1
         DIMFSL1klKXyvmoBAzpbj3l5pQoXKnBc6TGNrGeSTwYfsMfwEZfhiFhLx2W6fp3hCxlj
         oNUmnZT1IfOqVczbSwKno0BRsqDAEBkHSKUTjmthrEkPQ0eF+R5t9kHqqLrHq0anNhT2
         SXMQj2RryngzKgCb+A/LveTKgKAZjc/s6SlVqsrVta2faMosf8y77cXkLqnTAXReI6Ed
         WiqY/3k7rh87dEC2tph28/c5Ffmw7AHCezcnbhZfIA9/QnuOo/pmhA6W7se5h99ZEN+u
         tKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762084; x=1788366884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7iMM34EcFPmhnGpJzLucaa/0lRT/oiuDhD8v2Q+RQs=;
        b=W34bTmipZUUpoY8Cfc0fzVvV7GLDAp1OOFMAp6hK0HTDPDinhIRKFPmmZcINkzG7J6
         WvU6ExtPqyIeXqWQQgJegnR1oByBD1ye/QmX8bAFys7Riwz/TDX6mZgeAicU689M1Kig
         bpsxfovx8AAkuNl7B4hg8yOmVmyOlJbLlm8zY/smAUrdhXnNj1EXsix25QSeXTlY8EVS
         DeUujlT0O9t2FcbOIH2/IIPokIq03YqhOw4t4vA5YkLL37NPrrSOBh3oS6wMzYrSvR6r
         oILRlITdlouugUX4h118Y353wTgWN8zxe89PZ5uirHr84Ynnp9L1/uWsVCyYgzyo7oqn
         sOww==
X-Forwarded-Encrypted: i=1; AHgh+Rq3e2u2VP6Mo+fCrItJ72DGK7io8JeI3+/VDT530b6X+fiu7k+0+Vh7ahYx6TXQ0v6k6Q1P6JyVIdWRFxmhtw==@vger.kernel.org
X-Gm-Message-State: AFuF++lQuJyy1ILmO9X4igg/Wtx/IoxuLsL9Ns9sMW+VIJyksSF7aEib
	MRQif+hWAhIKSHlntGtuvUhJ3md0Ca/fEgRIcsPfiYHFMi9+NwnCQHK6TZ9EsfeYPQ==
X-Gm-Gg: AR+sD10dGiax2w+rJJJyd0aBskGJtmBsOYpNtqfboWX8dOlf4dB1M6D99w2xhzXfAM8
	xBIEEfkMwelTnvyxx+HMptwmOBXacIKNHtgeoVCU8prRnBGmaxx6GFbnQ4oGJTzFKl7zzs72DsI
	1gAdfcfe7JBWjvzgDvGsS0QhdFIs46U+pcNWTBu09GAc4Mk+dnl/c4jv/hR54Y7nE3lN1KewEn3
	O8HDsWw2B9mn7YijQF1BQrxBK/sH/kdqClhYXBaNNN2L+fqDKhbO+L6+SMf+WBPgdcJEcQ0jtsE
	nQsoQGRyQ9vQf36r+MsyreSX3U9AgH18Y97LHv/rjUkLL7Pey10qiFTX3cTDmIkR6J6DvmVexY+
	TpEVuefFwbLym9PdOB+Ygb9x6vAXMWPta4jRQuRxc1Q1w6KBHoqBByh9kxY33dNyA2LbfDCL/Vd
	npRlWKMgdNFyTLUQ5N5TTZ9rvY93OyRVQ2ORnv+1xFo1wFVdnjqCxY+joJoSIy9DiVmc17hHf9B
	4uPeahgCEmNVneAl3smuotDQrn2uuQFFUwwuxZKHJIQySI=
X-Received: by 2002:a05:600c:c87:b0:495:7888:281c with SMTP id 5b1f17b1804b1-499dc693e38mr69082575e9.0.1787762084591;
        Wed, 26 Aug 2026 09:34:44 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:34:43 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/23] rust: drm: kms: constrain connector encoder attachment
Date: Wed, 26 Aug 2026 17:31:34 +0100
Message-ID: <20260826163359.4998-4-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163359.4998-1-mike@fireburn.co.uk>
References: <20260826163359.4998-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_connector_attach_encoder() requires both objects to belong to the same
DRM device. The safe wrapper previously accepted any AsRawEncoder,
including an encoder from another driver or device.

Accept only an UnregisteredEncoder from the same KMS driver and reject a
different device instance before entering C.

Fixes: 322a9b8d699b ("rust: drm/kms: Add UnregisteredConnector::attach_encoder()")

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms/connector.rs | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index 78b08b94587b..b36d138ae950 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -404,11 +404,22 @@ pub fn new<'a>(
 
     /// Attach an encoder to this [`Connector`].
     #[must_use]
-    pub fn attach_encoder(&self, encoder: &impl AsRawEncoder) -> Result {
+    pub fn attach_encoder<E>(&self, encoder: &UnregisteredEncoder<E>) -> Result
+    where
+        E: DriverEncoder<Driver = T::Driver>,
+    {
+        // SAFETY: Both unregistered objects have been initialized, so their parent device
+        // pointers are valid and invariant for their lifetimes.
+        let same_device = unsafe { (*self.as_raw()).dev == (*encoder.as_raw()).dev };
+        if !same_device {
+            return Err(EINVAL);
+        }
+
         // SAFETY:
-        // - Both as_raw() calls are guaranteed to return a valid pointer
-        // - We're guaranteed this connector is not registered via our type invariants, thus this
-        //   function is safe to call
+        // - Both `as_raw()` calls return valid pointers.
+        // - The generic bound and check above prove that both objects belong to the same driver
+        //   and device.
+        // - `self` is unregistered, as required by the C API.
         to_result(unsafe {
             bindings::drm_connector_attach_encoder(self.as_raw(), encoder.as_raw())
         })
