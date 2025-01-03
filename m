Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9740559B71;
	Fri,  3 Jan 2025 16:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735922690; cv=none; b=F2iUG2OSpm1atS4PL3/SsRZnYkHHRqTKfSW0iv+lKd8emwk+mPndTaIoWkB87jc6pB/+6yOXbM+pEAt7pWqpCOZT6hOeA6qjM5/b3l7aVb+si8MrOCjpJ4dH/DEQ7el1Ruwj5A/zg1JVvGqpFUHkCSKw4ujtlPYWAqCV0XCB97c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735922690; c=relaxed/simple;
	bh=mM6M2n/XvzJx+DelvfRYyLa7H4UKjUM+Ow/bdnD/UpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GvyDuOzpHj9HELxTNpqV1w2xJR43jI0NAIVflNOJetaep0sryr3BjsB9BCFTbxb4C4VGpXjQYst3yOidxOw9Tr91S00m9SNSSn30wi6YO0a6CrqfZHEbFN+7chdIRKXMyTArG+14dAbdZEtlUyTuYZS1//foJ3iZ+0ojQy35c4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feHq1LXz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feHq1LXz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BE3C4CECE;
	Fri,  3 Jan 2025 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735922690;
	bh=mM6M2n/XvzJx+DelvfRYyLa7H4UKjUM+Ow/bdnD/UpQ=;
	h=From:To:Cc:Subject:Date:From;
	b=feHq1LXzvjzudiKX7L1G/scZWIXBqS6Hx+x3CGtZ6qe5Nhp3N4qAuo3BnDS6vn3AG
	 /D3D5T8EDXa1ovdnoM090EooMlQQaCNbTHmM77FRWqBbhC3k2sjr694uDt+CTqCU7P
	 k4i4SNE+1qeUokQbu65CG8igVpF2RoSEyDTkOu+Q4tGBKl6y431tH/lMbuWAWBAmWE
	 2c8I+gdzeqXQA174aS0+gPOwXcfDh0s7CBR0FTFdoyabHx4wZyEGtA6OOKb1KVFdcT
	 UEQDlDu/CRA7MXo6RK4/kqRgLRydwGbrkqTNhEG1P4IGHLc3S5Pn/99NTUOg2roike
	 cq5MuOxknh27A==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] devres: add devm_remove_action_nowarn()
Date: Fri,  3 Jan 2025 17:44:30 +0100
Message-ID: <20250103164436.96449-1-dakr@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_remove_action() warns if the action to remove does not exist
(anymore).

The Rust devres abstraction, however, has a use-case to call
devm_remove_action() at a point where it can't be guaranteed that the
corresponding action hasn't been released yet.

In particular, an instance of `Devres<T>` may be dropped after the
action has been released. So far, `Devres<T>` worked around this by
keeping the inner type alive.

Hence, add devm_remove_action_nowarn(), which returns an error code if
the action has been removed already.

A subsequent patch uses devm_remove_action_nowarn() to remove the action
when `Devres<T>` is dropped.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/devres.c  | 17 ++++++++++++-----
 include/linux/device.h | 18 +++++++++++++++++-
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 2152eec0c135..d59b8078fc33 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -750,25 +750,32 @@ int __devm_add_action(struct device *dev, void (*action)(void *), void *data, co
 EXPORT_SYMBOL_GPL(__devm_add_action);
 
 /**
- * devm_remove_action() - removes previously added custom action
+ * devm_remove_action_nowarn() - removes previously added custom action
  * @dev: Device that owns the action
  * @action: Function implementing the action
  * @data: Pointer to data passed to @action implementation
  *
  * Removes instance of @action previously added by devm_add_action().
  * Both action and data should match one of the existing entries.
+ *
+ * In contrast to devm_remove_action(), this function does not WARN() if no
+ * entry could have been found.
+ *
+ * Returns: 0 on success, -ENOENT if no entry could have been found.
  */
-void devm_remove_action(struct device *dev, void (*action)(void *), void *data)
+int devm_remove_action_nowarn(struct device *dev,
+			      void (*action)(void *),
+			      void *data)
 {
 	struct action_devres devres = {
 		.data = data,
 		.action = action,
 	};
 
-	WARN_ON(devres_destroy(dev, devm_action_release, devm_action_match,
-			       &devres));
+	return devres_destroy(dev, devm_action_release, devm_action_match,
+			      &devres);
 }
-EXPORT_SYMBOL_GPL(devm_remove_action);
+EXPORT_SYMBOL_GPL(devm_remove_action_nowarn);
 
 /**
  * devm_release_action() - release previously added custom action
diff --git a/include/linux/device.h b/include/linux/device.h
index 667cb6db9019..6879d5e8ac3d 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -399,7 +399,23 @@ void __iomem *devm_of_iomap(struct device *dev,
 #endif
 
 /* allows to add/remove a custom action to devres stack */
-void devm_remove_action(struct device *dev, void (*action)(void *), void *data);
+int devm_remove_action_nowarn(struct device *dev, void (*action)(void *), void *data);
+
+/**
+ * devm_remove_action() - removes previously added custom action
+ * @dev: Device that owns the action
+ * @action: Function implementing the action
+ * @data: Pointer to data passed to @action implementation
+ *
+ * Removes instance of @action previously added by devm_add_action().
+ * Both action and data should match one of the existing entries.
+ */
+static inline
+void devm_remove_action(struct device *dev, void (*action)(void *), void *data)
+{
+	WARN_ON(devm_remove_action_nowarn(dev, action, data));
+}
+
 void devm_release_action(struct device *dev, void (*action)(void *), void *data);
 
 int __devm_add_action(struct device *dev, void (*action)(void *), void *data, const char *name);

base-commit: 06e843bbbf2107463249ea6f6b1a736f5647e24a
-- 
2.47.1

