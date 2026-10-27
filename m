Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123302;
	b=dKuMZs51G/ifuqz4d76i7jx5SNZk88I0BdP4BmlaSGUSXST1lZFBOA+R9MHrqQMr+2No
	 Dl12JnF1i+QtX6B36PTyGvBYKayW0PzeXamvc7KqjWwEhe6E3786nVKLtHjUWlL4HErkO
	 ewIINg/GcA0/+qkuSkhKg+GBnSEWeoOfhj0N1oaz1ioiDUJ5V9FtbUApChVklx06KzTkv
	 bV1PG3U3AMIWDIHsEwFfSvAlKexXhREDO/q2Q+FfMCasbME8mm4AuwcCVY4gGuqFcMWfO
	 Vpw6NmhbPB/mAUFhvgd4l4V5RqzGsUQXcaK+hgV8pdd/IUepHgevGpaemAg5E66l0fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=coF5c02vssZCkeB6rjzbpbOB68XCpWmc7Y8D46czGV8=;
	b=B/A2Y1NqzlQ5zXLJZkVMDK8IenwF4E8fH3WgroX439Zydxq4ukvUgKYmabumPmfYM9y/
	 xzxspYwo9HbThQLXDSi0ofaxBEuLEmKMQ9kiu91NbaEtv25jO6PlqEWio1HBDdsUDdCqb
	 WNFb/tvp2u/BSTDY4LNSsNPLLFxFEp/y9mqBqz95xWv1EUnHXC6YYp5YgToYIQgeg9GyJ
	 VljdzzMOezLh2a8jV5p033uHjCLgx34ty9Fw02wRMQY2wx3gxzdukou55WKknBZBgc59x
	 mSgpp4cN4TXGRintEvVBkU+PqgfIOQvm9uStTkyfe1vyxV3RMbFGs76j+0aGjQloQNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uci.edu;
	spf=pass smtp.mailfrom=uci.edu;
	dkim=pass header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=lP8wCUsI;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6719606A31D
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 17:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6719606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=lP8wCUsI
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-185fd3a4ca3so100034c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 10:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1793123301; x=1793728101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coF5c02vssZCkeB6rjzbpbOB68XCpWmc7Y8D46czGV8=;
        b=lP8wCUsIWhx5fqJS9oomwy93MlNLeqmr8+SybpK+ExxIx9NplsZURaEu+DEdrFZeMT
         JmiNvL7cjR5In3/7rZqrlBDPOsZ6vjljzxFsAvTt2SYnkSNIwl7S6gjDOGdhmAgGCEMm
         WvefG2453Exs3zqIRUVxS+rT7RbxKhEU+I/gD9t3JNzjYcKHYHRiODwdsxRUKNOB6YUa
         qCKJmVlhnLH5Kh5rN5FwGmSHJ70nyYf8CHHi8U4QkIf8nV8fu7ISPgX+Ox7lw2SZrm82
         uEpDXaYWvti2ZUI7lvBqOIasNbAkFbyy6nAIA3vYNFOkrSJI8U7qQOWQYtur1qsAdtB7
         1G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123301; x=1793728101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=coF5c02vssZCkeB6rjzbpbOB68XCpWmc7Y8D46czGV8=;
        b=Bd5+4tDu7aM6jkH2P5mndZAeSHDzH3+0C72An8625ou9bHkDo6M48XGXSVn+OtDgIJ
         89RXY0j5UMJSSfrH38oglvDYHqc5Q9Oe8GFjnipKanz9EJxiJ/a3+wiB7LF2TCOgZN9J
         fo/6CXNA4pKPhQt8bxukPcvabOpSdDhjTjZCNPK9RZP72zQ1L9eSx9YeZDyXDRCfDjoP
         cZYNzfZOrFRMhpXQWevEoFJPUgOtd80DuX9HnUwXerh3wk58oh4P8gV6N/1+p2pwu59i
         5kryvWqIc24G2Ylx68ke/2zLODvpBkjfWFA1g1vVVS5GCJO0bnOd6/DIPXdZ2hd/PAn3
         7FTg==
X-Forwarded-Encrypted: i=1; AKwUvBzCbdUioEG5PtSzJdj/CrB4h/Eqf6dmYrrsSCtb9T6q55ZJzemTb3dvr5oeW1CyOkF2Yx67YzigD4BcSxrLbQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIRra71wzSN+w24GKyIdYjd5qWxTS81q35O1as1gg6tQdkbCxoY
	NCgOu9K3V6JvuJp0QYvWXCQkOuzhYOZ9j6XrH51QYPAKnhyWEoucbGh6KgcnB4JbJPA=
X-Gm-Gg: AYBFou3lCZ/FuOct+vjqyJoXlZr5D1179e2GBbO5+cppj88jclaMYN08mxMjyVZjuTQ
	qYZwoyNF/uhdGX1F+FHzEF8Zhl9o/TgFEamKIkSPGRgqh5fQAu0w86qzjtCkUO4gK/0POLDYYhD
	M4Z1ZTK+yVmqR0YgcFs9/aEHdxemGl4zKBErVvrd0xMWs42b8pVxzhSBPF2T+xDfo3A7FpCmGN8
	lbtLiOekxE8IelJyO78pxi3twns7Ff6tSyMimO1Ub6VYzVMp+xLivE14dZ2q/mlmA33e27wmfzz
	kXdUxKCUzDpo/GOSzDXVJu11qtoT0VOA1TvKuRWiKsin1AIaZHcKfGO7frYW65frihjlcliXC8r
	2GPIx/Aujf+YTW5QDSznWcdLX3dPx9Pi2KKUorU76AYZTN4hvWNWke6kesenacUgZOxgVdoAIIZ
	PjI/ZvEwhSEzfMFze98jURDq5ALD5IW+P8DN74ZkFvshNzP30xRZKSvgukotXe4uW1prvuHOF0l
	YyN0haXHMxGKTa5mGA/rdkNU8Wt8AZesD+yAF1d27Y0uqoqqD7rpPqMBsln/3wOiE3GedrWk6j7
	GemhLQ9K8rj3d42u
X-Received: by 2002:a05:7022:3b8b:b0:169:9f67:a91b with SMTP id a92af1059eb24-1993505df87mr17730994c88.12.1793123300700;
        Tue, 27 Oct 2026 10:48:20 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm35486813c88.14.2026.10.27.10.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:48:19 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	mmaurer@google.com,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 1/1] rust: soc: avoid dangling attributes when SoC bus is unavailable
Date: Tue, 27 Oct 2026 17:48:10 +0000
Message-Id: <b527648762a76e485b8302835daf3fe26a232e60.1792628232.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792628232.git.pgovind2@uci.edu>
References: <cover.1792628232.git.pgovind2@uci.edu>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`Registration::new()` calls the C function `soc_device_register()` 
to register a SoC device with the SoC core. It passes a pointer to the 
`soc_device_attribute` object of its pinned `BuiltAttributes` object. 
In `soc_device_register()`, if the SoC bus is not registered, this pointer 
argument is saved in a global variable `early_soc_dev_attr` for deferred 
registration and NULL is returned.

If `Registration::new()` receives a NULL pointer, it produces `EINVAL`, 
causing the `BuiltAttributes` object to be dropped. This frees the memory 
containing the attribute data, which is still referenced by 
`early_soc_dev_attr`. A later call to `soc_device_match()` will dereference
this dangling pointer, resulting in a use-after-free bug.

The SoC bus is normally registered by a core initcall before loadable 
modules run, but the condition is reachable if that initcall fails or 
is skipped, as demonstrated using initcall_blacklist=soc_bus_register 
kernel command line argument.

Fix this by adding a new function `soc_device_register_nodefer` which 
never returns NULL. When the SoC bus is not registered,
it returns `ERR_PTR(-EPROBE_DEFER)` and does not retain a pointer 
to the attribute data.
Make the Rust interface in `Registration::new()` call this new function.
The interface remains unchanged for other users of the existing 
`soc_device_register` function.

Fixes: 057d44b05775 ("rust: Add soc_device support")
Reported-by: Dylan Zueck <dzueck@uci.edu>
Assisted-by: LLM
Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
---
 drivers/base/soc.c      | 19 ++++++++++++++++++-
 include/linux/sys_soc.h | 18 ++++++++++++++++++
 rust/kernel/soc.rs      |  7 ++++---
 3 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index af7d71393774..dc9072281427 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -122,12 +122,17 @@ EXPORT_SYMBOL_GPL(soc_attr_read_machine);
 
 static struct soc_device_attribute *early_soc_dev_attr;
 
-struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr)
+static struct soc_device *
+__soc_device_register(struct soc_device_attribute *soc_dev_attr,
+		      bool allow_defer)
 {
 	struct soc_device *soc_dev;
 	const struct attribute_group **soc_attr_groups;
 	int ret;
 
+	if (!soc_bus_registered && !allow_defer)
+		return ERR_PTR(-EPROBE_DEFER);
+
 	soc_attr_read_machine(soc_dev_attr);
 
 	if (!soc_bus_registered) {
@@ -179,8 +184,20 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
 out1:
 	return ERR_PTR(ret);
 }
+
+struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr)
+{
+	return __soc_device_register(soc_dev_attr, true);
+}
 EXPORT_SYMBOL_GPL(soc_device_register);
 
+struct soc_device *
+soc_device_register_nodefer(struct soc_device_attribute *soc_dev_attr)
+{
+	return __soc_device_register(soc_dev_attr, false);
+}
+EXPORT_SYMBOL_GPL(soc_device_register_nodefer);
+
 /* Ensure soc_dev->attr is freed after calling soc_device_unregister. */
 void soc_device_unregister(struct soc_device *soc_dev)
 {
diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
index cedabf177f47..4bd9ee43be74 100644
--- a/include/linux/sys_soc.h
+++ b/include/linux/sys_soc.h
@@ -26,10 +26,28 @@ struct soc_device_attribute {
  * - %NULL if the SoC bus is not yet registered;
  * - on success, the newly allocated &struct soc_device pointer;
  * - on failure, a negative error code as an ERR_PTR().
+ *
+ * If this function returns %NULL, it retains @soc_plat_dev_attr for deferred
+ * registration. The caller must keep it and all data it points to valid.
  */
 struct soc_device *soc_device_register(
 	struct soc_device_attribute *soc_plat_dev_attr);
 
+/**
+ * soc_device_register_nodefer - register SoC as a device without deferring
+ * @soc_plat_dev_attr: Attributes passed from platform to be attributed to a SoC
+ *
+ * Unlike soc_device_register(), this function never returns %NULL. It retains
+ * @soc_plat_dev_attr only when it returns a valid &struct soc_device pointer.
+ *
+ * Returns:
+ * - on success, the newly allocated &struct soc_device pointer;
+ * - if the SoC bus is unavailable, ERR_PTR(-EPROBE_DEFER);
+ * - on other failures, a negative error code as an ERR_PTR().
+ */
+struct soc_device *soc_device_register_nodefer(
+	struct soc_device_attribute *soc_plat_dev_attr);
+
 /**
  * soc_device_unregister - unregister SoC device
  * @soc_dev: SoC device to be unregistered
diff --git a/rust/kernel/soc.rs b/rust/kernel/soc.rs
index 0d6a36c83cb6..39659dbd31f8 100644
--- a/rust/kernel/soc.rs
+++ b/rust/kernel/soc.rs
@@ -122,10 +122,11 @@ pub fn new(attr: Attributes) -> impl PinInit<Self, Error> {
                 // * The struct provided through attr is backed by pinned data next to it,
                 //   so as long as attr lives, the strings pointed to by the struct will too.
                 // * `attr` is pinned, so the pinned data won't move.
-                // * If it returns a device, and so others may try to read this data, by
-                //   caller invariant, `attr` won't be released until the device is.
+                // * `soc_device_register_nodefer` only retains the attribute pointer when it
+                //   returns a device. By caller invariant, `attr` won't be released until that
+                //   device is unregistered.
                 let raw_soc = error::from_err_ptr(unsafe {
-                    bindings::soc_device_register(attr.as_mut_ptr())
+                    bindings::soc_device_register_nodefer(attr.as_mut_ptr())
                 })?;
 
                 NonNull::new(raw_soc).ok_or(EINVAL)?
-- 
2.34.1

