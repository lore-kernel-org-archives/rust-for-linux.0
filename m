Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F973AC0E4
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 05:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155397; cv=none; b=P4hv78RmIZHPNYTjFAb6zhWaQeKKGY7PkzGabiE6CifMUZjm1iqnQOt2zt294RnAsk6JarPycaaVoV+l4q2dopUnQ+i7qVb0gpQkvaducAYwckoSUu8RVMKWKl2iDQoj7vIkJJlAkKJ3ZT3A65P0oNccXSmfcTvL07CIaCx9A6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155397; c=relaxed/simple;
	bh=MUkgAux14xDdRdEbHCqY3xhMBjSgdm6CfZUlSD4YZgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQvS5n7nC3z+tO+AiJo29Ms9h630YNwE6hFgOFApICyEvb4IYeHwHR88ddWa4pMUpTUTGeqxrJ1AgeWx6ijmlGgdANxu1Cm5SubMgLzI3rjWIB1f3m78vHaN+Us3gJq9c9+0M85TKvCvRqbHMzMNEvBAEe6pNYxMB+MAHmwl5fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ptxu0t1A; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ptxu0t1A"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso33229725e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 30 Aug 2026 22:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788155395; x=1788760195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QPxIjq0s+Nq97Wec2MiBtymMp8nx1ssSvVChht0+Jc0=;
        b=Ptxu0t1A2LU3JKtcJkb4/SMNhRg0IKoTQ+eVafbDteyNgUvZbZzvOEe/kLjBSHeY7C
         cRnwe0ocLWBGUq50/rtEvgCpWJzwPkKTakVOhfLkJy9BlYCc8W1QrFo/swwoALOGvMa8
         PzRQY8GtgzVzudJwQa/bem7uNAiO0PPTq1b73rA1euCKkvQS9eUqn2GxDSHqM87pmYHr
         MWdFYHLXvS3gCfTLB5mDzKoDx0y+Y6n4RAaPlhFUgg3BiMKYeElU0eRjQVrIOxCi1lf2
         pJGfmont1tWb0GD40wkqzuiZH6qU8t0YK7UxeEryBDsYkJ08GxSCr+VGFAS3+jSBNKJC
         smhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788155395; x=1788760195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPxIjq0s+Nq97Wec2MiBtymMp8nx1ssSvVChht0+Jc0=;
        b=G6LF9jRpAIIkLQlqSDsveiOUT3ji56N3CQMY/PTJLWJG4e65ZXo6ohuK2aB9S1sjY/
         cCCvAZicAjsy8FM+q10cPY/axcP/VVpVnNqgYl4t9Dst7MXv7E4wqHz7YY4/d6mYQAMr
         waCR3738PJLIzBpySBIoXBSZ0AhbCOLl2j+iFUlArMXUNdaaH2n/KaqfZDWLt5newIAI
         AwNF1DJiylZrx8MJk4b2IEO3s5JDKgtrkk5WHBb/RpED+2pl38AiEYGOlUDB0gPMqTeW
         HaQbfUYZUaZrzYXUEA0kLbS2EznpuOHCxspAxETMSJlC/MYwsO0B8xbUrA0quAxP6vYa
         sRnQ==
X-Gm-Message-State: AFuF++ll5C2qcMn2ON+iKazLE/8uWiAorpezsxzR1gbwNsNAudsWmZcE
	hfiqohMirbRgLF6DpYGRDlRme4TfQzcscbcnrXtJwDr5Rl3FvzogAnGe6Nt51tiWK20=
X-Gm-Gg: AR+sD10dv4au3SJe8e7F8ZYz3Qty6xFcZk1M+o/MYQY1vzOjG38VwdacAl5pGF72Bch
	CVoP+DsvPYfe48auqIjfDZt0fqZXQFwfhK2fU67e8NY8H370mdfUTGoBL5cUPKffwnaNJ5NMg+X
	hpKAhAyPh+U5WoXF6CGImNuQSHPwuG8cuHhwlIijInwzUL3rczLTUcqcGuAcDvJk2x4mD4oG4ie
	6hrD5IQG+BASonz9vtqLSr6hYEDLac9yCQ9gH0XFXpe9qRmyHrwwZ2nnHkKd6dG5DxHGBIDtYRL
	jWHwsFOTu8shVgMLRLFJ6ERnytJ0ejXgjxX8VXVdPY1L/nwKrhU4z/+SEzBTbBMyC9LR0Pbi45K
	rX7zd5cX42ldxYj16wXepwC4Mov2lyWJ5sDrzEWjv6OmAsqCWLp3PJpWNucDSWrTdp+XR6TRYyr
	bIHo6XuPeYXggBJjeDZWrazlXbZS+httge7KIRCoSIgdPmVSw5ZrXKz8KKpbrbWNnIhj2ncjMNy
	W7NBnZMXQ==
X-Received: by 2002:a05:600c:c172:b0:499:dbba:9859 with SMTP id 5b1f17b1804b1-49cd948532emr13747205e9.5.1788155394504;
        Sun, 30 Aug 2026 22:49:54 -0700 (PDT)
Received: from DESKTOP-OL07BOP.localdomain ([87.116.179.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b926874fdsm258647025e9.4.2026.08.30.22.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:49:54 -0700 (PDT)
From: nenkov2004@gmail.com
To: rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org,
	Hristos Nenkov <nenkov2004@gmail.com>
Subject: [PATCH v2] rust: binder: Use lower bound for node debug lookup
Date: Mon, 31 Aug 2026 07:49:20 +0200
Message-ID: <20260831054920.42550-1-nenkov2004@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831052635.42417-1-nenkov2004@gmail.com>
References: <20260831052635.42417-1-nenkov2004@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hristos Nenkov <nenkov2004@gmail.com>

The Binder node debug lookup currently walks the process node RBTree
from the beginning until it finds the first node pointer greater than
the requested pointer.

Use RBTree::cursor_lower_bound() to start the lookup at the relevant
tree position instead. When the lower-bound key is equal to the
requested pointer, inspect the next node to preserve the existing
strictly-greater-than semantics.

This changes the tree lookup from a linear scan to an O(log n) search
without changing the returned node semantics.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1249
Signed-off-by: Hristos Nenkov <nenkov2004@gmail.com>
---
 drivers/android/binder/process.rs | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 5372bfbd9..8e7218ee0 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1208,10 +1208,14 @@ fn get_node_debug_info(&self, data: UserSlice) -> Result {
 
         {
             let inner = self.inner.lock();
-            for (node_ptr, node) in &inner.nodes {
+
+            if let Some(cursor) = inner.nodes.cursor_lower_bound(&ptr) {
+                let (node_ptr, node) = cursor.current();
+
                 if *node_ptr > ptr {
                     node.populate_debug_info(&mut out, &inner);
-                    break;
+                } else if let Some((_, node)) = cursor.peek_next() {
+                    node.populate_debug_info(&mut out, &inner);
                 }
             }
         }

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

