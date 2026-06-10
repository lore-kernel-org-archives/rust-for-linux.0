Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8A440BCA3
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 13:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098375; cv=none; b=ZhG+ulE1HQ09pCez9uuNQIc8QDDPn029PnrE6m4KWThzIc+/KlnJSL9Ky7e1z/4pBm9pzQFicKjhbjxm9d2quoTXIaNmqHGEBaEFywd1HwO1D8nvNVh35cY9mol2gt1VVWtw0JwiPDbsrLnCg9Ak6AupYw/UTbsN+SNwrkw8Uck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098375; c=relaxed/simple;
	bh=mKO4+pMSnUn4LXQfagcMkJ7EOTitZI87d9DurDcfb6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oEyTWlRaVhXq5FJK7tnXQykHFwHJyjvVV+yLM02qqT5Fbi7mXLS0AcNAaozCWU7XhreBtz8CYY6AF4g6bRGhTUJzwA1yZ9x488ekMgUM97NaT22/h1au4MgPVwQw8jGw99V+8FNtTCIb3B9Y7lAOtxSP2CQkOWaJSkLGgZww3dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0RszrRD; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0RszrRD"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7efd2dc350cso29012917b3.1
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 06:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781098369; x=1781703169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vo5T7HQqAhkyu5MsuX4WasN5jGo0pizZk7WsqffsFEc=;
        b=A0RszrRDlob8QK4nko2jtglEPbd4Hkm3DIA3mdOh2xFqscanv3MVE2z7WbuoUFOIVM
         KpYQaiwd2xUIaCUvhxgYMeA64iVIwH8ZomosmK4XAubW4mDtmLneSPAKfS22GSHQzfuE
         d/+pSYdP0MUkDxywB0U4SDN22D3D+Z9bEkh1yf5zqxJJQ98Dh1Cpl3jkDoGJWsxezadk
         RRjWDCmjZ10Uvsm5yg/PKlGwsQ4kNwBhgyAok/ruxvXJ1scx7NGR/hv5uGzlsgrOE+Te
         Zt0wY4IaipvRBMnwPljlaM87XpZDMyHGllwxxw3h88Pm+Bg49kZYGXYeVLgnPlGiMRwX
         R61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098369; x=1781703169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vo5T7HQqAhkyu5MsuX4WasN5jGo0pizZk7WsqffsFEc=;
        b=AMaCPmeiPO68/QYMoboYnzsYoum4zq/zFGdSoBS9qNeeAnL2ZYsFT1oQZ9TO2oB+vU
         O6tbC7gwjY6z7vC3zyCZFQwHyai+PGfKb/U7Nf9Idd3C2KM5SP66DEX0nyXofHk4Xpba
         dC5piiJ2ELFrBVmy0IDuvVy0QXWGQ46KeypOTH9/zYTl0Spzt+nyENUVKstwweu6P5vg
         VqMal+SQl66sGHa8SzHawiWgzOimIOVORAXYEIhmt7F7J0Jd/4LPJTWTMtEXlF3MIyKm
         GX3yZnPW7gG7F3IHYMDGNZpojur80jX3ODjHvZhvAbkihWmOw4CSUnU7p4juBR59D+O5
         1GaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+n37knsf717FewpLtVyQc3tAVFQr6mNZTGyV6OT+pPF4LRzMv0O8CL/D9oBSMTJxXwWDAOxncYwfE7QMl6sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzDOjX7j68crzGpS/KT4GtgGbq/I4YZycK9Icmuo4oOUoErpym
	g8l12mE86DH7SjUK/V2J8T0cZiXWQ1hZlDEyW9PnfTq0tI8ErsVi3iUD
X-Gm-Gg: Acq92OGg1l11lYOVoB/hr/IrhhusOowJHP/WcZlP8mWSsiBfjWHozeLfAs4CQTM/VMG
	czAuUGW/cU+fH/c0RLHZYfOmYIVpp21u1pxJVOgbVHQ/Cb8Hsi+WTxtJsF0JnI5B5aCZmcVqhFW
	+en0Sl/+dWIxLGDj6SgnJDOzPZNZkiRUj4d6orFSb1DuDh/LEoo4pLhi7yk4/QunSsH1PhRmL1T
	XYLofYEjozDIVpwhHlhMMi1wlLRZRiHrUSwtBZ0OV65JkvW4af7V7JuAD6zHa3CRQeb4kB+fsFt
	tcm1q/aTKqUuPX56TnSNaqVwgBCR2hIHFHsT2PMffNDBKcKiNnDXKpxmSs3k9SQE2ZiQWcMvUnI
	i0dOSQT2Ew55yvWqG0Zr7A4goZzBFF1/44HMlXG9Fr16yz9jp/yeF3Ad/Vg5V42+gP+DQZs0Qca
	p2bEZ3CAFz3buWSf4RlFDDOJqE3ljhkHoQ
X-Received: by 2002:a05:690c:64c9:b0:7ed:737a:d193 with SMTP id 00721157ae682-7f2b4bbadf3mr70784697b3.3.1781098369203;
        Wed, 10 Jun 2026 06:32:49 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea2358b61bsm109030387b3.28.2026.06.10.06.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:32:47 -0700 (PDT)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [PATCH v2] rust_binder: add ownership assertion to Node::add_death
Date: Wed, 10 Jun 2026 09:32:39 -0400
Message-ID: <20260610133241.374115-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610035544.3333022-1-georgeandrout13@gmail.com>
References: <20260610035544.3333022-1-georgeandrout13@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The `// SAFETY:` comment in NodeDeath::set_cleared assumes that a
NodeDeath is never inserted into the death list of any Node other than
its owner. However, this invariant is not enforced by the safe function
Node::add_death, which inserts NodeDeath into the death list without
checking that death.node == self, leaving a risk for future code that
may miss this implicit invariant and cause undefined behavior.

Add an assertion to make this precondition explicit and catch potential
violations early.

Link: https://github.com/Rust-for-Linux/linux/issues/1237

Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
Changes in v2:
- Replace assert!() with pr_warn() + debug_assert() following
  feedback from Onur Özkan and Miguel Ojeda.

Link to v1: https://lore.kernel.org/rust-for-linux/20260610035544.3333022-1-georgeandrout13@gmail.com/
---
 drivers/android/binder/node.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index 69f757ff7461..425076405e1e 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -333,6 +333,11 @@ pub(crate) fn add_death(
         death: ListArc<DTRWrap<NodeDeath>, 1>,
         guard: &mut Guard<'_, ProcessInner, SpinLockBackend>,
     ) {
+        let is_valid = core::ptr::eq(self, &**death.node);
+        if !is_valid {
+            pr_warn!("attempt to add NodeDeath to the wrong death list\n");
+        }
+        debug_assert!(is_valid);
         self.inner.access_mut(guard).death_list.push_back(death);
     }
 

base-commit: 287afdc7671a03081f48f3407bc59862c202bd4b
-- 
2.47.3

