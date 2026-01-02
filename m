Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9C62586C2
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 22:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767392997; cv=none; b=KAS92l6Q0K4503sHgSCiN40d/gxnM2kBdDHjt5If5vf3FMa3iXb3ug2BDF8NUUTlqXxb/ancHAmjOEsVEnKZojU67WrxeJjnKh/d++GHz5pRlCSVQio09Ipz758rxp7xGMq8TNeuYBB6V/+vf3Fofjt7A4McEwClu11znRnB3j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767392997; c=relaxed/simple;
	bh=P6CLUaoBrZVe2iO8pEgsU/Uckoe2bn/GpAIG7klU3Cg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sG3ypqRFHX+nQdnHG4hV14I6Kr+naFwSPSsPzA+R284HauDwE1a/W/4OYGYwSeHxDnt1dbCw8WYpLbMZANGgrqz29NzOucKwVIOfiEhrFIUJwpwoGa7rVhzrlELJ6aykB6dV71rAAUuA36eIkeoK+27V8G5XWiysp36Et4o00j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7Wuhd0g; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7Wuhd0g"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-55b09f54e98so3588748e0c.1
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 14:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767392995; x=1767997795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzPkPBTdxo+DXDsLhg4MqCszafnvLPi7c5YcRPd0+SY=;
        b=b7Wuhd0gZw1RgwglPVDf90PNspi362ic3cOF8uMaA3f2ngrefCwpC4Pnvy+ctTV+v6
         0rZXDRS7kW/fD5m6fS5gS4MKGcvgMQhN/ZBMgKdvnfbMm63fzqIh7ruF41huCa6z1F/3
         9OcZYQCRanEPfFVDab8ebSzPCGt6ymH1Br4ukRsjgVRRof+AeconkliREgoKG5qEUEHf
         PUj4B47OZc6WmN7yFbEAJS9VAz1+NAx2LI9U09sUmTQeNY0h45TjGs2JG3IctD2urwMp
         aZeyuBibJvAkMPREwgeJMIkPTsbtfNVlkyb5faPyJtfpEIsI082fd+YaJ2MD5uv5b0tq
         07Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767392995; x=1767997795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JzPkPBTdxo+DXDsLhg4MqCszafnvLPi7c5YcRPd0+SY=;
        b=p7F9H9JufaRCaScdIHVjQxneSyZwiTVuVLR1tBBoT+3hBOmNv/v0A9QMJjxsfna4bv
         1MIiXLcW6AYY+97V15pG7uxsSZEd5xZ/p9YCo61Fz/cw9JLwcTp6e+3wiqygJzua2bgN
         BqMA5+g38cBjzrb6S0FePZKZCSKooF5Xpwo7eFshWIWMeUTTp/O+P6A80hj/KQgK50My
         gjXETA9O3KcaIuA0xMR3HmPzDVzgeoHTVnXKYumHI6bzPsf8Q/GAsZhcQ3kDHJZtspb3
         5HQf6f5gpyw93zAnaAvh/82c6ddynl9wG/W8Z6mzmOhnHnBYI1MqTX/eDpt35JlMWj1I
         Pcog==
X-Forwarded-Encrypted: i=1; AJvYcCWZYb2cOtuiNC2pOw+I3ZsGcgcNkNU7Uv4y/fnELmd0FUYyz3hRxUccVA3CXyRieJa2VnXEG4EdUz3Sc7KKdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy84foDaV30ePeGCUEu/kB3iA73XLRRZgPtDDpUzdSoSOdSgROG
	aTXFnNxAMW/JSqv2T1byH+qVh3n62h0PaQkON47KPriwjo212WQO/m6uda7u9w==
X-Gm-Gg: AY/fxX79JpRD6nfboNw13XK/EuB84z97XrxbJcZO58idnomnXKKimRMMv4TAUl9UUKU
	Oj8yCGqzCztwmq4qvdDZggW0khe1r58tk0UeUI3V1t4RSKzP0cfkLHmmF04crFTU2ZS9syerP5I
	okcBoBhVWQWZp9GyhESeBK+mploJCCC3w5zB81HQLquhPJhp1tO7A+JQuQDFq7JsfXhZBKAZTCc
	LGBS28uVYQVOZadHoFSO+K/W5mn/cU73UEVcRpq6oBtg4COyInEeytmK9xTRyWxy5mfC8SdO3xy
	klPnKesihHH6TzGDqIrXLS/3mDwBo7tG1xXVTYft38nU+8dp9+EzYfpGCglRdZPuB1z9oeusP3Q
	OKYjXsiqOlmecHe7eeAMwOtDQIFVvSEiQ/VAA0lNfsAyj98FsaswMOMnAW6wq/8u2HT02OsLnsb
	5FmyywLAIYKWTKZ9PFf83GP64HK4poXg==
X-Google-Smtp-Source: AGHT+IF4APWzwwkb10zobyqhGIJZ2eP3tKaurfLiy7XUMDZZ04iDnnZUmDwz0Vjazspcx/YcTYZDag==
X-Received: by 2002:a05:6a00:a882:b0:7f7:26fe:c92f with SMTP id d2e1a72fcca58-7ff64cd5fcbmr35797857b3a.29.1767385679728;
        Fri, 02 Jan 2026 12:27:59 -0800 (PST)
Received: from shankari-IdeaPad.. ([2409:40f2:2123:b1fb:b93b:b5b4:2357:c53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cd71sm41163964b3a.64.2026.01.02.12.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 12:27:58 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	"Todd Kjos" <tkjos@android.com>,
	"Martijn Coenen" <maco@android.com>,
	"Joel Fernandes" <joelagnelf@nvidia.com>,
	"Christian Brauner" <brauner@kernel.org>,
	"Carlos Llamas" <cmllamas@google.com>,
	"Suren Baghdasaryan" <surenb@google.com>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Alexandre Courbot" <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Alex Gaynor" <alex.gaynor@gmail.com>,
	"Igor Korotin" <igor.korotin.linux@gmail.com>,
	"Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Trevor Gross" <tmgross@umich.edu>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	"Abdiel Janulgue" <abdiel.janulgue@gmail.com>,
	"Robin Murphy" <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH v2 1/4] drivers: android: binder: Update ARef imports from sync::aref
Date: Sat,  3 Jan 2026 01:57:11 +0530
Message-Id: <20260102202714.184223-2-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260102202714.184223-1-shankari.ak0208@gmail.com>
References: <20260102202714.184223-1-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update call sites in binder files to import `ARef`
from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
Acked-by: Alice Ryhl <aliceryhl@google.com>
---
No change from v1 -> v2. Carry-forwarded the acked-by.

Link of v1: https://lore.kernel.org/all/20251123092438.182251-2-shankari.ak0208@gmail.com/

---
 drivers/android/binder/process.rs | 2 +-
 drivers/android/binder/thread.rs  | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 132055b4790f..db25307b5a4a 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -28,11 +28,11 @@
     seq_print,
     sync::poll::PollTable,
     sync::{
+        aref::ARef,
         lock::{spinlock::SpinLockBackend, Guard},
         Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
     },
     task::Task,
-    types::ARef,
     uaccess::{UserSlice, UserSliceReader},
     uapi,
     workqueue::{self, Work},
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 1a8e6fdc0dc4..6a5c90547844 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -16,9 +16,8 @@
     seq_file::SeqFile,
     seq_print,
     sync::poll::{PollCondVar, PollTable},
-    sync::{Arc, SpinLock},
+    sync::{aref::ARef, Arc, SpinLock},
     task::Task,
-    types::ARef,
     uaccess::UserSlice,
     uapi,
 };
-- 
2.34.1

