Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2342C1487D5
	for <rust-for-linux@vger.kernel.org>; Sat, 12 Oct 2024 07:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728719628; cv=none; b=DRNh/6GiprEBF+k1LINFph31DdJYVwaKyhTx8Wy9DKEFGiXcFhvMfPyLOuQ2Cfx2j006eZzE7Y2xa9ijz1CpTNXjT1zkRNGEchD59kKzMrEBVdbnw8NnVpwOXTptUaADXLj0PQGpqeISWExCsTJ5CI7/CriLkXj/gPe8+Xz/O4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728719628; c=relaxed/simple;
	bh=gbikignNfcyO9N17/uEhv6cdA15stRyBji9fRqv57v4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JFHDsk9HMwOX0M/16i0zMla8FQEafBS7GjZuUeyyRcPx3YHzIbX+uuDuLK5feoF0YKTyWEzJvY0OqC4FAmVR2+kVYrSI01tqT6JRe/ROCHjjpqlUTIsy0dCjRO5tbmJM0BfU0HSfKm8biHiRfQfFjMNDdnvp+bIpYRCCQmTl1QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiredspace.de; spf=pass smtp.mailfrom=wiredspace.de; dkim=pass (1024-bit key) header.d=wiredspace.de header.i=@wiredspace.de header.b=WIV9G0mc; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiredspace.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiredspace.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wiredspace.de header.i=@wiredspace.de header.b="WIV9G0mc"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiredspace.de;
	s=key1; t=1728719624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZRWIQXRuVvKosWGjoxiUObcCyY85PNZoQ61rWpn3Vs8=;
	b=WIV9G0mc6uYDw252BjlwLuTkC/qG3i9HAGX3VDlL0ikUou5AHPSWpmRu9nCGwEVTH/3D1H
	cciAx86I7ZKLdhaGpd7yoAg5Tfd3HVPpfOuIwyKlEhFYxex+LV5l9R+X9+JQ48WStFnkXm
	0Q+/vE0iXP+rsDMD6JPmrWXWR4aLUbg=
From: =?UTF-8?q?Thomas=20B=C3=B6hler?= <witcher@wiredspace.de>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Jocelyn Falempe <jfalempe@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Thomas=20B=C3=B6hler?= <witcher@wiredspace.de>
Subject: [PATCH 4/7] drm/panic: remove redundant field when assigning value
Date: Sat, 12 Oct 2024 09:52:47 +0200
Message-ID: <20241012075312.16342-4-witcher@wiredspace.de>
In-Reply-To: <20241012075312.16342-1-witcher@wiredspace.de>
References: <20241012075312.16342-1-witcher@wiredspace.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Rust allows initializing fields of a struct without specifying the
attribute that is assigned if the variable has the same name. In this
instance this is done for all other attributes of the struct except for
`data`.
Remove the redundant `data` in the assignment to be consistent.

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1123
Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
---
 drivers/gpu/drm/drm_panic_qr.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 767a8eb0acec..5b2386a515fa 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -489,7 +489,7 @@ fn new<'a>(segments: &[&Segment<'_>], data: &'a mut [u8]) -> Option<EncodedMsg<'
         data.fill(0);
 
         let mut em = EncodedMsg {
-            data: data,
+            data,
             ec_size,
             g1_blocks,
             g2_blocks,
-- 
2.46.2

