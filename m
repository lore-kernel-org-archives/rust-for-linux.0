Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625681EE00F;
	Tue,  7 Jan 2025 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736252775; cv=none; b=sBKp8ZkXtjj6Kn9+lqn81WH9Ry8jAAgdPI0wWmYeor7DuiWXRUk2ek1IBAkmD+DNt6+I0cTczyY5Bv/68KNfEK2G9v4+YgxKeB/bcDMPfzWePZ9pnCLm9IIS/L50fDPtZwFD1wGCZeCLPULN8l5UnQaZmPGsPI3WBKrtoSpgGxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736252775; c=relaxed/simple;
	bh=ffUyqgFQ5MRPmsbvXm/+fMwCqR67L4eJLXA0PP5lTos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=moqPuyZFpL8j/BBnPNEeo7ak4ym6PQvKu1XuiO9T8yiHJjOZTUg64RTn/vKGdG6Lt9fUf8WETZYlBqTFljzEwOrHknAHuFSd1lingMcOTvv1kNGWT7aevHjrTKvkn4LvSRN6Yck9ia1X2ou6I9KQzJQr64rMKwQBXJQU5qfX568=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sboMOtnP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sboMOtnP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22356C4CED6;
	Tue,  7 Jan 2025 12:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736252775;
	bh=ffUyqgFQ5MRPmsbvXm/+fMwCqR67L4eJLXA0PP5lTos=;
	h=From:To:Cc:Subject:Date:From;
	b=sboMOtnPQPeNV/poWGvEu2OP1oFtRouLcIFFC9XSJvLaMkMUC5O6uz/YZcgs1Lv0l
	 IfyQ+qUWrqlQgy5z9UjtzVVd4Il+BWXpQCy+rAVTHpsdab6N7RxOMVYMjTERs8+yBZ
	 bU64xsNixhgsPKbWqD1Lb49NH9xrCf4YB10Mk4b/IPUnSmmB5ABp4iPoq9TCRltS8h
	 22npiYW00ndYEGoWiphcEapB3Z82cnfbVZ0HgN4zbkVvj/IfinnzwLGlGdnxjDyDH8
	 CvKAONb0XLJOYEmhYGSnCmT9PvlPLI9V52vHr247wJjHlhIUW7GLYQkA9YswDUVHYb
	 HDEf/J2YPN24Q==
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
Subject: [PATCH v2 1/2] devres: add devm_remove_action_nowarn()
Date: Tue,  7 Jan 2025 13:25:10 +0100
Message-ID: <20250107122609.8135-1-dakr@kernel.org>
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
v2: clarify area of use of devm_remove_action_nowarn()
---
 drivers/base/devres.c  | 23 ++++++++++++++++++-----
 include/linux/device.h | 18 +++++++++++++++++-
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 2152eec0c135..93e7779ef21e 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -750,25 +750,38 @@ int __devm_add_action(struct device *dev, void (*action)(void *), void *data, co
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
+ * This should only be used if the action is contained in an object with
+ * independent lifetime management, e.g. the Devres rust abstraction.
+ *
+ * Causing the warning from regular driver code most likely indicates an abuse
+ * of the devres API.
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

